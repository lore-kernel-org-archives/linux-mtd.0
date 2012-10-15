MIME-Version: 1.0
In-Reply-To: <1350307104.4115.23.camel@sauron.fi.intel.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <507794B6.2000107@st.com>
 <1350307104.4115.23.camel@sauron.fi.intel.com>
Date: Mon, 15 Oct 2012 09:27:53 -0700
Message-ID: <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vinod Koul <vinod.koul@intel.com>, viresh kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>, Vipin Kumar <vipin.kumar@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 15, 2012 at 6:18 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> First thing which comes to mind is that in modern kernels memory
> fragmentation is not that big issue as it used to be. So may be
> kmalloc() the memory is not that bad nowadays? We have page migration,
> memory compaction, etc?
>
> I'd really prefer to just switch to kmalloc() everywhere instead of
> adding hacks like this to the drivers. Then if this is a problem for
> someone, he can fix it by either switching to smaller buffers (possible
> in many places), or by improving memory fragmentation issues on his
> system, or by just using CMA.

I think I can suggest that this is already a problem on real systems.
In bringing up a board on v3.3 kernel, I experienced a kernel memory
allocation error when trying to memdup_user() in eraseblock-size
regions. I believe I would experience more of these if all
eraseblock-sized buffers were kmalloc()'d.

See the commit description for the following commit in mtd-utils.git:

    commit 71c76e74661492b4f68f670514866cfc85f47089
    libmtd: fix mtd_write() issues for large data-only writes

> We can even have an mtd-wide funcion which will try kmalloc(), and if
> that fails, fall-back to CMA.

I would prefer not building a solution that hopes kmalloc() can get a
large contiguous buffer (remember, eraseblock sizes come as large as
2MB these days). A real solution like CMA or scatter-gather seems like
a better idea.

Brian
