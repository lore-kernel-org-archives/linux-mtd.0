Message-ID: <4C7F4526.105@gmail.com>
Date: Wed, 01 Sep 2010 23:33:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Ryan Mallon <ryan@bluewatersys.com>
Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>	<1283170469.12995.53.camel@brekeke>	<4C7CA278.9040902@st.com>	<1283297810.2018.67.camel@brekeke>	<4C7DD2FD.1080501@st.com>	<1283337939.1958.20.camel@brekeke>	<4C7E3344.2020202@st.com>	<4C7EC43B.2050903@bluewatersys.com>
	<AANLkTinmEck5413ZuCDMB1jyBjH63Uh=L+87q8V4Ek1X@mail.gmail.com>
	<4C7ED1E9.4050208@bluewatersys.com>
In-Reply-To: <4C7ED1E9.4050208@bluewatersys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Kevin Cernekee <cernekee@gmail.com>, Vipin Kumar <vipin.kumar@st.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
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

On 9/1/2010 3:21 PM, Ryan Mallon wrote:
> On 09/02/2010 09:54 AM, Kevin Cernekee wrote:
>> On Wed, Sep 1, 2010 at 2:23 PM, Ryan Mallon <ryan@bluewatersys.com> wrote:
>> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commitdiff/b6d6ae730be2750fac166ed9df11ee6ea54d9160
> 
> That patch still breaks the ABI by renaming struct nand_ecclayout to
> nand_ecclayout_user. Any application using the old names will have to be
> rewritten to compile against a new kernel.

I don't know how exactly all user-space apps deal with this, but isn't
that what the following typedef is for? (include/mtd/mtd-user.h)
	typedef struct nand_ecclayout nand_ecclayout_t;
changed to:
	typedef struct nand_ecclayout_user nand_ecclayout_t;

So any app that properly used nand_ecclayout_t would not need changes
even when using the new headers. Again, I don't know who has been using
what in user-space.

> The old interface should remain unchanged in that include/mtd/mtd-abi.h.
> If an application using the old interface calls any of the ecc ioctls
> for a nand chip with > 64 bytes ecc it should return an error.
> 
> I still think the eccpos field should be a pointer, so that it can
> allocate as much space as is needed for the ecc. This also means that
> the kernel doesn't need to be changed every time a new NAND chips
> appears with a bigger ecc size.

Yes, dynamic allocation would probably make more sense in the future.
However, it seems difficult (or impossible?) to create an
arbitrary-sized ioctl; the size is hard-coded into the ioctl definition.

I'm curious how many applications actually need to have the ecclayout.
nandwrite doesn't actually use it, just oobinfo.
