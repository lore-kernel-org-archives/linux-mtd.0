Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmO6G-0000ss-Gm
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 13:27:18 +0000
Date: Fri, 29 Nov 2013 14:26:53 +0100
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
Message-ID: <20131129132653.GA14204@amd.pavel.ucw.cz>
References: <20131122114509.GB2414@localhost> <5292A7E7.5060003@innofidei.com>
 <20131125101147.GA2408@localhost>
 <CACQ1gAi26WeiopptcZmBp6h0a5TacLo5mvVCOm6-H_1HtnwvXg@mail.gmail.com>
 <529334D9.2030204@innofidei.com> <20131125115238.GC2408@localhost>
 <1385381770.24518.18.camel@shinybook.infradead.org>
 <20131125123012.GE2408@localhost> <87fvqkldmh.fsf@dell.be.48ers.dk>
 <1385394419.24518.40.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385394419.24518.40.camel@shinybook.infradead.org>
Cc: Richard Genoud <richard.genoud@gmail.com>, zhouguangming@innofidei.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Hans Zhang <zhanghonghui@innofidei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> > Hi,
> > 
> >  > Thanks a lot for the insight. After reading this, I'm wondering what's
> >  > preventing us from killing MTD block support altogether. Artem, already
> >  > suggested it a while back...
> > 
> > People using squashfs/cramfs/readonly ext2/.. on a NOR flash?
> 
> And people who *still*, after all these years, don't realise that they
> don't actually need it to mount JFFS2. Even as the root file system
> (although they *do* need rootfstype=jffs2).

I must admit I'm such person...

I guess printk("...you don't really need mtdblock...") in jffs2's
mount code would probably improve that realisation...

This certainly does not help:

pavel@amd:/data/l/linux-n900$ grep -ri mtdblock  Documentation
Documentation/frv/booting.txt:	   exec -c "console=ttySM0,115200
ip=:::::dhcp root=/dev/mtdblock2 rw"
Documentation/frv/booting.txt:	 /dev/mtdblock3	Fourth RedBoot
partition on the System Flash
Documentation/arm/SA1100/Assabet:which is the third one.  Within
Linux, this correspond to /dev/mtdblock2.
Documentation/arm/SA1100/Assabet:	exec -b 0x100000 -l 0xc0000 -c
"root=/dev/mtdblock2"

(Should not mtdblock be at least in devices.txt file?)

BTW... is there documentation of mtdblock "translation layer"
somewhere? I realize it is very simple, but it does need to keep some
data?

I guess running jffs on regular block device (USB stick, SD card) is
not feasible?
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
