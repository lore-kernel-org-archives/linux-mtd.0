Received: from mail.bluewatersys.com ([202.124.120.130]
	helo=hayes.bluewaternz.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OqvgJ-0006Zw-5T
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 22:21:24 +0000
Message-ID: <4C7ED1E9.4050208@bluewatersys.com>
Date: Thu, 02 Sep 2010 10:21:29 +1200
From: Ryan Mallon <ryan@bluewatersys.com>
MIME-Version: 1.0
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>	<1283170469.12995.53.camel@brekeke>	<4C7CA278.9040902@st.com>	<1283297810.2018.67.camel@brekeke>	<4C7DD2FD.1080501@st.com>	<1283337939.1958.20.camel@brekeke>	<4C7E3344.2020202@st.com>	<4C7EC43B.2050903@bluewatersys.com>
	<AANLkTinmEck5413ZuCDMB1jyBjH63Uh=L+87q8V4Ek1X@mail.gmail.com>
In-Reply-To: <AANLkTinmEck5413ZuCDMB1jyBjH63Uh=L+87q8V4Ek1X@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Vipin Kumar <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>,
	Brian Norris <computersforpeace@gmail.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/02/2010 09:54 AM, Kevin Cernekee wrote:
> On Wed, Sep 1, 2010 at 2:23 PM, Ryan Mallon <ryan@bluewatersys.com> wrote:
>> However, we are interested in having a proper solution to this problem.
> 
> I would suggest using this patch as a starting point - could you
> please review the changes and try it out?
> 
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commitdiff/b6d6ae730be2750fac166ed9df11ee6ea54d9160

That patch still breaks the ABI by renaming struct nand_ecclayout to
nand_ecclayout_user. Any application using the old names will have to be
rewritten to compile against a new kernel.

The old interface should remain unchanged in that include/mtd/mtd-abi.h.
If an application using the old interface calls any of the ecc ioctls
for a nand chip with > 64 bytes ecc it should return an error.

I still think the eccpos field should be a pointer, so that it can
allocate as much space as is needed for the ecc. This also means that
the kernel doesn't need to be changed every time a new NAND chips
appears with a bigger ecc size.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

Ryan Mallon         		5 Amuri Park, 404 Barbadoes St
ryan@bluewatersys.com         	PO Box 13 889, Christchurch 8013
http://www.bluewatersys.com	New Zealand
Phone: +64 3 3779127		Freecall: Australia 1800 148 751
Fax:   +64 3 3779135			  USA 1800 261 2934
