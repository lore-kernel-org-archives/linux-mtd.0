Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7RAX-0007Wr-SG
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:49:39 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
Date: Tue, 13 Mar 2012 13:49:14 +0100
References: <cover.1331119143.git.vipin.kumar@st.com> <4F5F1931.7060602@st.com>
 <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
In-Reply-To: <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201203131349.16068.sr@denx.de>
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Armando Visconti <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Vipin KUMAR <vipin.kumar@st.com>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 13 March 2012 12:56:47 Linus Walleij wrote:
> On Tue, Mar 13, 2012 at 10:53 AM, Armando Visconti
> 
> <armando.visconti@st.com> wrote:
> > Actually I checked better and I can say that:
> > 
> >  1. We do have the provision to pass the partitions thru pdata and
> >     cmdline
> >  2. Nevertheless, we are not passing partitions thru pdata in none
> >     of our platforms.
> > 
> > I think we need to change this and pass partitions thru pdata.
> 
> This would be cleaner, actually I am using the same driver on the
> U300 (also for Nomadik the day I find some time to adopt it)
> and I get the default partitions from some SPEAr platform
> currently, I think I should rather get some warning message from
> the driver or MTD core like "you haven't defined any partitions".

I have a patch in my queue to add device-tree support to the FSMC driver. This 
will also add parsing partition via DT. As SPEAr currently doesn't support 
this driver in mainline, I suggest not to add pdata support to those SPEAr 
platforms, but move to DT directly.

Thanks,
Stefan
