Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMLYV-0007yB-CD
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 22:19:48 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Tue, 05 Dec 2017 23:19:17 +0100
Message-ID: <2824019.lNCXfte7Zg@blindfold>
In-Reply-To: <1695485.xO2l5BsRhR@blindfold>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <aa51fb6e-61c9-1133-b2cf-f931ee7e105a@colorfullife.com>
 <1695485.xO2l5BsRhR@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,

Am Dienstag, 5. Dezember 2017, 21:06:28 CET schrieb Richard Weinberger:
> Manfred,
> 
> Am Dienstag, 5. Dezember 2017, 20:11:20 CET schrieb Manfred Spraul:
> > > So, which file do I need to download to get the image that contains the
> > > first error as detected by chk_fs?
> > > 
> > > The mode of operation of your tool should be:
> > > 1. Mount UBIFS
> > > 2. Do various filesystem operations
> > > 3. Random power-cut (in software)
> > > 4. Dump the image to a file X
> > > 5. Set chk_fs to 1
> > > 6. Mount it again
> > > 7. If mount succeeds, drop X, umount and goto 1
> > > 
> > >     Else if, chk_fs finds a problem. Store file X.
> > > 
> > > I want file X. :-)
> > 
> > The tool is in release process, thus let's just wait a bit.
> > There is no "goto 1" in my flow.
> > 
> > Part 1: (done 5x, i.e. with xattr, without xattr, ...)
> > 
> > 0. create UBI image, create empty UBIFS image.
> > 1. Mount UBIFS
> > 2. Do various filesystem operations.
> > 
> >     In the background, record nand operations and store it in a trace.
> > 
> > Part 2: (done ~100.000 times)
> > 1. Create an image file X by replaying from the trace.
> > 2. Set chk_fs to 1
> > 3. Mount the image
> > 7. If mount succeeds: ignore the file X
> > 
> >     If mount fails: remember file X
> > 
> > Thus every image is a first error. No image has seen multiple unclean
> > unmounts.
> 
> Hmm, when does the power-cut occur in your setup?
> i.e image-168167.bin and image-168168.bin show different errors and none of
> them fails the chf_fs test. They fail because of other reasons.

Short update, the issue in image-168168.bin seems to be a garbage collector 
bug which is not at all related to xattrs.
Are you 100% sure that all your tests run fine when xattrs are not used?

Thanks,
//richard
