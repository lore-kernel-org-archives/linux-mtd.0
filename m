Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNqhk-0007LI-Hu
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 19:52:01 +0000
Received: by mail-wg0-f49.google.com with SMTP id gg4so3241143wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2012 12:51:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <507794B6.2000107@st.com>
 <1350307104.4115.23.camel@sauron.fi.intel.com>
 <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
Date: Mon, 15 Oct 2012 21:51:59 +0200
Message-ID: <CACRpkdao_9TkH7=ia7kXB-KsQhNZQ7EfSS5B1X0wFPgg5OsuHA@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Linus Walleij <linus.walleij@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, Vinod Koul <vinod.koul@intel.com>,
 viresh kumar <viresh.kumar@linaro.org>, spear-devel <spear-devel@list.st.com>,
 Vipin Kumar <vipin.kumar@st.com>,
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

On Mon, Oct 15, 2012 at 6:27 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> I would prefer not building a solution that hopes kmalloc() can get a
> large contiguous buffer (remember, eraseblock sizes come as large as
> 2MB these days). A real solution like CMA or scatter-gather seems like
> a better idea.

+1 on that, and as I think I illustrated the MMC subsystem is using
the block layer helpers to form scatter-gather lists for it's requests.
I don't see why the MTD subsystem need to be very different?

Yours,
Linus Walleij
