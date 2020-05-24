Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89797C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 14:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5682F2075F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 14:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5DVkTxS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5682F2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxM4/izQPko7HAyqyoa7r1hGpJpDHnoZkzUdb0Lp0go=; b=i5DVkTxSQCmwXW
	bqXR9TU6pQETYh01YhwJ8hZplE2KBkbmMHE8PUDqGmApWd01Zu1hmIsJ/j97VDlhc/3bFRgMTnufT
	vgEawdqJfR5ybw8Da6/IoqkSFQVEOau9Pk+iosDgV9RcIEFNFDwMto2OB+K10oSLQdM49L12XyFyZ
	7pGhA0o8zOhqKtYWm7+xZr6JOAHntZS4CHDWh3gx6BFY6Yu6uVT9vFPXI5Ui3qXI2wDvQlk5+RO0c
	Wpf+uXuVNnqa9d85StDZ/srujXwwanFJuRfrXb7yl3O+tDPU0kbkmJaJbVmLqjeUYeChRPjbWM5QQ
	JqKXDgHmmur4x0NmdrfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcs2S-0002zJ-0U; Sun, 24 May 2020 14:55:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcs2M-0002ye-17
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 14:55:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2AA1B2A0BA2;
 Sun, 24 May 2020 15:55:33 +0100 (BST)
Date: Sun, 24 May 2020 16:55:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 00/19] mtd: rawnand: cafe: Convert to exec_op() (and
 more)
Message-ID: <20200524165530.2fb38d0c@collabora.com>
In-Reply-To: <20200524115246.GC2781@furthur.local>
References: <20200513191038.49a4fdf3@collabora.com>
 <20200515144703.GA1245784@furthur.local>
 <20200515192540.GB1245784@furthur.local>
 <20200516145650.GA1433661@furthur.local>
 <20200516210857.2b579ae4@collabora.com>
 <20200516221837.6559944c@collabora.com>
 <20200517164709.GA1651421@furthur.local>
 <20200518165024.4122351d@collabora.com>
 <20200520072331.GJ1695525@furthur.local>
 <20200520095511.73cfb7ee@collabora.com>
 <20200524115246.GC2781@furthur.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_075538_338235_087F1FBE 
X-CRM114-Status: GOOD (  44.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 24 May 2020 13:52:46 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> On Wed, May 20, 2020 at 09:55:11AM +0200, Boris Brezillon wrote:
> > On Wed, 20 May 2020 09:23:31 +0200
> > Lubomir Rintel <lkundrak@v3.sk> wrote:
> >   
> > > On Mon, May 18, 2020 at 04:50:24PM +0200, Boris Brezillon wrote:  
> > > > On Sun, 17 May 2020 18:47:09 +0200
> > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > >     
> > > > > On Sat, May 16, 2020 at 10:18:37PM +0200, Boris Brezillon wrote:    
> > > > > > On Sat, 16 May 2020 21:08:57 +0200
> > > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > > >       
> > > > > > > On Sat, 16 May 2020 16:56:50 +0200
> > > > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > > >       
> > > > > > > > On Fri, May 15, 2020 at 09:25:43PM +0200, Lubomir Rintel wrote:        
> > > > > > > > > On Fri, May 15, 2020 at 04:47:07PM +0200, Lubomir Rintel wrote:          
> > > > > > > > > > On Wed, May 13, 2020 at 07:10:38PM +0200, Boris Brezillon wrote:          
> > > > > > > > > > > Hi Lubomir,
> > > > > > > > > > > 
> > > > > > > > > > > On Tue, 12 May 2020 18:40:57 +0200
> > > > > > > > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > > > > > > >           
> > > > > > > > > > > > I don't really mind the patch; I was just not sure why you removed the
> > > > > > > > > > > > acks and re-set the mask and suspected that maybe it was not
> > > > > > > > > > > > intentional.
> > > > > > > > > > > > 
> > > > > > > > > > > > That said, I've now disabled the camera and mmc and did my usual test
> > > > > > > > > > > > of mounting the filesystem and I'm seeing zero interrupts.
> > > > > > > > > > > > 
> > > > > > > > > > > > I suppose it's safe to assume that contrary to what I was imagining,
> > > > > > > > > > > > the masking works well and the interrupts I was seeing are indeed from
> > > > > > > > > > > > elsewhere (I guess the MMC driver polling the controller or something).
> > > > > > > > > > > > 
> > > > > > > > > > > > Also, the re-set of the mask from the interrupt handler is not realy
> > > > > > > > > > > > necessary (but I certainly wouldn't complain if you keep it in place).          
> > > > > > > > > > > 
> > > > > > > > > > > I pushed a new version to my nand/cafe-nand-exec-op-debug branch. This
> > > > > > > > > > > time I get rid of the IRQ handler as it's not used anyway. Let me know
> > > > > > > > > > > if that keeps working an I'll send a v3.          
> > > > > > > > > > 
> > > > > > > > > > I can confirm that your branch (as of 12ef1918985f "mtd: rawnand: cafe: Get
> > > > > > > > > > rid of the last printk()") is working great here:
> > > > > > > > > > 
> > > > > > > > > >   bash-5.0# time mount -t jffs2 mtd0 /mnt
> > > > > > > > > >   jffs2: notice: (101) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) .
> > > > > > > > > >   
> > > > > > > > > >   real    0m7.319s
> > > > > > > > > >   user    0m0.000s
> > > > > > > > > >   sys     0m7.294s
> > > > > > > > > >   bash-5.0# uname -a
> > > > > > > > > >   Linux (none) 5.7.0-rc3-00097-g12ef1918985f #114 PREEMPT Fri May 15 16:35:01 CEST 2020 i586 GNU/Linux
> > > > > > > > > >   bash-5.0#           
> > > > > > > > > 
> > > > > > > > > Spoke too soon again. Seems like the writes don't make it to the device:
> > > > > > > > > 
> > > > > > > > >   bash-5.0# mount -t jffs2 /dev/mtdblock0 /mnt
> > > > > > > > >   jffs2: Empty flash at 0x045a5798 ends at 0x045a5800
> > > > > > > > >   jffs2: notice: (98) jffs2_build_xattr_subsystem: complete building xattr subsystem, 1 of xdatum (0 unchecked, 0 orphan) and 1 of xref (0 dead, 0 orphan) f.
> > > > > > > > >   bash-5.0# touch /mnt/meh
> > > > > > > > >   bash-5.0# sync 
> > > > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > > > >   bash-5.0# 
> > > > > > > > > 
> > > > > > > > > I'll follow up once I know more; with some traces or hopefully a fix.          
> > > > > > > > 
> > > > > > > > Hi again. Hope you're having a good weekend.
> > > > > > > > 
> > > > > > > > Some good news and some bad news. Good news is that now I got around to
> > > > > > > > building an image with mtd_debug and got around to making erase, write
> > > > > > > > adn read work, withut the hassle of dealing with jffs2 (and hassle of
> > > > > > > > dealing with corrupted image from eariler attempts).
> > > > > > > > 
> > > > > > > > The bad news is that I have very little idea about what I'm actually
> > > > > > > > doing. Here's the branch with changes I've done, with my notes in
> > > > > > > > the commit messages:
> > > > > > > > 
> > > > > > > >   git fetch git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux.git \
> > > > > > > >       lr/nand/cafe-nand-exec-op-debug
> > > > > > > > 
> > > > > > > > The relevant changes:
> > > > > > > > 
> > > > > > > >   6ee7e0d11e19 fixup! mtd: rawnand: cafe: Demistify register fields        
> > > > > > > 
> > > > > > > This one is valid.
> > > > > > >       
> > > > > > > >   565d5f126e86 fixup! mtd: rawnand: cafe: Demistify register fields        
> > > > > > > 
> > > > > > > Here it should be
> > > > > > > 
> > > > > > > #define CAFE_NAND_ECC_SYN_REG(x)		((((x) / 2) * 4) + 0x50)
> > > > > > > 
> > > > > > > but maybe the loop is no longer valid after that.
> > > > > > >       
> > > > > > > >   064d381b4615 fixup! mtd: rawnand: cafe: Demistify register fields        
> > > > > > > 
> > > > > > > This one looks good too.
> > > > > > >       
> > > > > > > > 
> > > > > > > >     During the test with JFFS2 filesystem, I was seeing a metric ton of ECC
> > > > > > > >     errors. I have no clue where they came from because they presumably happened
> > > > > > > >     on an asynchronous writeback, but they no longer happen and I believe
> > > > > > > >     some of the above was to blame. Unfortunely I didn't investigate
> > > > > > > >     further, because in my setup it is hugely inconvenient to beat the image
> > > > > > > >     back into shape.
> > > > > > > > 
> > > > > > > >   085a6ad43151 Revert "mtd: rawnand: cafe: Don't leave ECC enabled in the write path"
> > > > > > > > 
> > > > > > > >     This triggered a WARN_ON(). Probably not too important, because the
> > > > > > > >     code in question gets thrown out afterwards.        
> > > > > > > 
> > > > > > > Oops. Maybe I should move it after the exec_op() conversion then.
> > > > > > >       
> > > > > > > > 
> > > > > > > >   4a9d95bf6d6b fixup! mtd: rawnand: cafe: Add exec_op() support
> > > > > > > > 
> > > > > > > >     An straightforward fix for page write op.        
> > > > > > > 
> > > > > > > Yep, that one is valid, thanks for the fix.
> > > > > > >       
> > > > > > > > 
> > > > > > > >   6959a724994d XXX add address to CMD_STATUS
> > > > > > > > 
> > > > > > > >     Tricky, and I have no idea what's going on. Perhaps you'll have an
> > > > > > > >     idea how to either address this more reasonably. As usual, I'm happy
> > > > > > > >     to apply patches with extra tracing if necessary.        
> > > > > > > 
> > > > > > > Duh, that one is super weird. I wonder if it doesn't have to do with
> > > > > > > the fact we're using DMA. Can you try with the DMA disabled?      
> > > > > 
> > > > > Disabling DMA makes things work.    
> > > > 
> > > > Okay, I pushed a new version doing DMA only where there's at least one
> > > > address cycle.    
> > > 
> > > Ok, this is somewhat embarassing:
> > > 
> > > It doesn't work, but reverting disabling DMA altogether doesn't make it
> > > work now either. It might be that it doesn't behave deterministically,
> > > but more likely I just fucked up the testing and was testing a wrong
> > > tree.  
> > 
> > No worries. It might also be me messing up with one of your fixes (I've
> > slightly changed the one fixing the SYN_REG() macro, and if others
> > have been changed, it was not intentional). What are the symptoms?
> > Still failures in the write path?  
> 
> Yes.
> 
> Now, I've looked some more into it and consulted the data sheet, and it
> seems (as the data sheet suggests) that the STAUTS and READ_ID data
> doesn't go through the same port as the transfers from the NAND memory
> array go.
> 
> We need to use the "NON_MEM" register and appropriate length registers
> as well.
> 
> This also means that neither a mistake of mine nor any funny stuff having
> been smoked have been responsible for my test results. Whatever the read
> status operation returned has in fact been what has been left in the
> data register from the previous data transfer. Also, this explains why
> DMA is avoided on ID read.
> 
> The tree that works for me is here:
> 
>   git fetch git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.git \
>     lr/nand/cafe-nand-exec-op-debug
> 
> The two top commits are new and as before they're left for you to
> consider and integrate the changes.

I'd really like to avoid resorting to 'non-mem' reads if we can. Note
that 'mem' reads work just fine for READ_ID already, and I see nothing
on the controller HW interface that would explain why we need a
dedicated path for READ_STATUS either. If we really have to, because
'mem' read appear to only work when there's at least one address cycle
(as mentioned in the code), then we really want to define a new
CMD+DATA_IN(max_non_mem_data) pattern. Testing the opcode as done in
your proposal is not that great, since it doesn't cover other
operations with a CMD and DATA_IN instruction.

> 
> Below is the log from my attempt to grasp understanding of how does the
> status/id read work:
> 
>   Attempt to read 4 bytes off the status reg. The status byte ends up
>   repeated four times:
> 
>   # busybox devmem 0xfe020000 32 0x80800070                                                                                                        
>   # busybox devmem 0xfe020030
>   0xE0E0E0E0
>  
>   Read on byte of an ID: 
>   
>   # busybox devmem 0xfe020000 32 0x80100090
>   # busybox devmem 0xfe020030
>   0xE0E0E0AD
> 
>   Two bytes:
> 
>   # busybox devmem 0xfe020000 32 0x80400090                                                                                                          
>   # busybox devmem 0xfe020030
>   0xE0E0DCAD

Have you tried doing the same with a regular read
(CMD+DATA_IN(NO_DMA))? IOW, what do you get when you do:


# busybox devmem 0xfe020018 32 0x1
# busybox devmem 0xfe020040 32 0x0
# busybox devmem 0xfe020004 32 0x0
# busybox devmem 0xfe020000 32 0x84080000
# busybox devmem 0xfe021000

or

# busybox devmem 0xfe020018 32 0x4
# busybox devmem 0xfe020040 32 0x0
# busybox devmem 0xfe020004 32 0x0
# busybox devmem 0xfe020000 32 0x84080000
# busybox devmem 0xfe021000

(you can even try with more data to see if that makes a difference).

> 
> The testing I've done with this tree:
> 
>   # mtd_debug erase /dev/mtd0 0 131072                                                                                              
>   Erased 131072 bytes from address 0x00000000 in flash
>   # mtd_debug write /dev/mtd0 0 131072 xeb0                                                                                                          
>   Copied 131072 bytes from xeb0 to address 0x00000000 in flash
>   # mtd_debug read /dev/mtd0 0 131072 yeb0                                                                                                           
>   Copied 131072 bytes from address 0x00000000 in flash to yeb0
>   # md5sum xeb0 yeb0
>   8d4576a1fed8075a2f6c7a018d83e842  xeb0
>   8d4576a1fed8075a2f6c7a018d83e842  yeb0
>   # mount -t jffs2 mtd0 /mnt
>   jffs2: notice: (125) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) .
>   # touch /mnt/i-hate-computers
>   # umount /mnt
>   #
> 
> Thanks for your work and patience. Hope this helps.

Thanks for your help ;-).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
