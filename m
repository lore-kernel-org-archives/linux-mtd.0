MIME-Version: 1.0
In-Reply-To: <4C7EC43B.2050903@bluewatersys.com>
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>
	<1283170469.12995.53.camel@brekeke> <4C7CA278.9040902@st.com>
	<1283297810.2018.67.camel@brekeke> <4C7DD2FD.1080501@st.com>
	<1283337939.1958.20.camel@brekeke> <4C7E3344.2020202@st.com>
	<4C7EC43B.2050903@bluewatersys.com>
Date: Wed, 1 Sep 2010 14:54:37 -0700
Message-ID: <AANLkTinmEck5413ZuCDMB1jyBjH63Uh=L+87q8V4Ek1X@mail.gmail.com>
Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
From: Kevin Cernekee <cernekee@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>, Ryan Mallon <ryan@bluewatersys.com>
Content-Type: text/plain; charset=UTF-8
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>,
	Armando VISCONTI <armando.visconti@st.com>,
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

On Wed, Sep 1, 2010 at 2:23 PM, Ryan Mallon <ryan@bluewatersys.com> wrote:
> However, we are interested in having a proper solution to this problem.

I would suggest using this patch as a starting point - could you
please review the changes and try it out?

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commitdiff/b6d6ae730be2750fac166ed9df11ee6ea54d9160

Thanks.
