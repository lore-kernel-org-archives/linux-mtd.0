Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqHzJ-0005Yg-Iu
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 07:44:15 +0000
Received: by mail-pd0-f177.google.com with SMTP id q10so6721739pdj.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 23:43:52 -0800 (PST)
Date: Mon, 9 Dec 2013 23:43:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
Message-ID: <20131210074347.GB11489@norris.computersforpeace.net>
References: <5292A7E7.5060003@innofidei.com> <20131125101147.GA2408@localhost>
 <CACQ1gAi26WeiopptcZmBp6h0a5TacLo5mvVCOm6-H_1HtnwvXg@mail.gmail.com>
 <529334D9.2030204@innofidei.com> <20131125115238.GC2408@localhost>
 <1385381770.24518.18.camel@shinybook.infradead.org>
 <20131125123012.GE2408@localhost> <87fvqkldmh.fsf@dell.be.48ers.dk>
 <1385394419.24518.40.camel@shinybook.infradead.org>
 <20131129132653.GA14204@amd.pavel.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131129132653.GA14204@amd.pavel.ucw.cz>
Cc: Richard Genoud <richard.genoud@gmail.com>, zhouguangming@innofidei.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Hans Zhang <zhanghonghui@innofidei.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 02:26:53PM +0100, Pavel Machek wrote:
> > >  > Thanks a lot for the insight. After reading this, I'm wondering what's
> > >  > preventing us from killing MTD block support altogether. Artem, already
> > >  > suggested it a while back...
> > > 
> > > People using squashfs/cramfs/readonly ext2/.. on a NOR flash?
> > 
> > And people who *still*, after all these years, don't realise that they
> > don't actually need it to mount JFFS2. Even as the root file system
> > (although they *do* need rootfstype=jffs2).
> 
> I must admit I'm such person...

Even the Kconfig disagrees with David :)

config MTD_BLOCK
        tristate "Caching block device access to MTD devices"
...
          At the moment, it is also required for the Journalling Flash File
          System(s) to obtain a handle on the MTD device when it's mounted
          (although JFFS and JFFS2 don't actually use any of the functionality
          of the mtdblock device).

The website is more forthcoming, but it still says it's needed for the
rootfs:

  http://linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

So I suppose we really need to clean this up, eh?

...

> (Should not mtdblock be at least in devices.txt file?)

Probably.

> BTW... is there documentation of mtdblock "translation layer"
> somewhere? I realize it is very simple, but it does need to keep some
> data?

There's a bit scattered around the MTD website, but this FAQ has a
little:

  http://linux-mtd.infradead.org/faq/general.html#L_ext2_mtd

Really, the "translation" is truly dead simple; I believe it is simply
an identity mapping, where the mtd is mapped linearly to the mtdblock.
So address X in /dev/mtdY is address X in /dev/mtdblockY.

> I guess running jffs on regular block device (USB stick, SD card) is
> not feasible?

http://linux-mtd.infradead.org/faq/jffs2.html#L_stick_jffs2

Brian
