Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22382C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 07:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC227207FB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 07:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MulOR6b7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC227207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9QBxRIjE03kayTHIuKw0Tx9w7Xf9bs83C4HRyc6VbM=; b=MulOR6b7W5wvvA
	91R99XdaFe7XKMT8lo2RTtmVUejZLYOJaJuGiPaT2xfeukLghgff48WsNRZteQ5mahrEQdC3w8WU9
	kk9VYtYRZrq5n13bP7fZY46tcpnk20I+Rf/Vy2tzgK05XK6gbLOL5ArsRkuw2q+WWCyXI//pIf6gf
	9EApYTFY8JyfcG8PJWJAaH65d4R2L9s0Nv5d4H3EqonXFyhtnZcLNLC7b/P7YZJ9Amkfo9NItU6Ty
	tayW7wRXq6JfCnzbvm1hjKlZ72wOoc8rXfaAjgZCOqgBra9PgOOAOHUrkBlEvqZoRBycSiH6MWFVH
	sFXYuny7aKCphZDxCcdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbJZS-0002zg-TR; Wed, 20 May 2020 07:55:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbJZN-0002zD-At
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 07:55:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A71032A077E;
 Wed, 20 May 2020 08:55:14 +0100 (BST)
Date: Wed, 20 May 2020 09:55:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 00/19] mtd: rawnand: cafe: Convert to exec_op() (and
 more)
Message-ID: <20200520095511.73cfb7ee@collabora.com>
In-Reply-To: <20200520072331.GJ1695525@furthur.local>
References: <20200511102305.7d843fbc@collabora.com>
 <20200512164057.GC604838@furthur.local>
 <20200513191038.49a4fdf3@collabora.com>
 <20200515144703.GA1245784@furthur.local>
 <20200515192540.GB1245784@furthur.local>
 <20200516145650.GA1433661@furthur.local>
 <20200516210857.2b579ae4@collabora.com>
 <20200516221837.6559944c@collabora.com>
 <20200517164709.GA1651421@furthur.local>
 <20200518165024.4122351d@collabora.com>
 <20200520072331.GJ1695525@furthur.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_005517_636245_B01496C2 
X-CRM114-Status: GOOD (  35.72  )
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

On Wed, 20 May 2020 09:23:31 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> On Mon, May 18, 2020 at 04:50:24PM +0200, Boris Brezillon wrote:
> > On Sun, 17 May 2020 18:47:09 +0200
> > Lubomir Rintel <lkundrak@v3.sk> wrote:
> >   
> > > On Sat, May 16, 2020 at 10:18:37PM +0200, Boris Brezillon wrote:  
> > > > On Sat, 16 May 2020 21:08:57 +0200
> > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > >     
> > > > > On Sat, 16 May 2020 16:56:50 +0200
> > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > >     
> > > > > > On Fri, May 15, 2020 at 09:25:43PM +0200, Lubomir Rintel wrote:      
> > > > > > > On Fri, May 15, 2020 at 04:47:07PM +0200, Lubomir Rintel wrote:        
> > > > > > > > On Wed, May 13, 2020 at 07:10:38PM +0200, Boris Brezillon wrote:        
> > > > > > > > > Hi Lubomir,
> > > > > > > > > 
> > > > > > > > > On Tue, 12 May 2020 18:40:57 +0200
> > > > > > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > > > > >         
> > > > > > > > > > I don't really mind the patch; I was just not sure why you removed the
> > > > > > > > > > acks and re-set the mask and suspected that maybe it was not
> > > > > > > > > > intentional.
> > > > > > > > > > 
> > > > > > > > > > That said, I've now disabled the camera and mmc and did my usual test
> > > > > > > > > > of mounting the filesystem and I'm seeing zero interrupts.
> > > > > > > > > > 
> > > > > > > > > > I suppose it's safe to assume that contrary to what I was imagining,
> > > > > > > > > > the masking works well and the interrupts I was seeing are indeed from
> > > > > > > > > > elsewhere (I guess the MMC driver polling the controller or something).
> > > > > > > > > > 
> > > > > > > > > > Also, the re-set of the mask from the interrupt handler is not realy
> > > > > > > > > > necessary (but I certainly wouldn't complain if you keep it in place).        
> > > > > > > > > 
> > > > > > > > > I pushed a new version to my nand/cafe-nand-exec-op-debug branch. This
> > > > > > > > > time I get rid of the IRQ handler as it's not used anyway. Let me know
> > > > > > > > > if that keeps working an I'll send a v3.        
> > > > > > > > 
> > > > > > > > I can confirm that your branch (as of 12ef1918985f "mtd: rawnand: cafe: Get
> > > > > > > > rid of the last printk()") is working great here:
> > > > > > > > 
> > > > > > > >   bash-5.0# time mount -t jffs2 mtd0 /mnt
> > > > > > > >   jffs2: notice: (101) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) .
> > > > > > > >   
> > > > > > > >   real    0m7.319s
> > > > > > > >   user    0m0.000s
> > > > > > > >   sys     0m7.294s
> > > > > > > >   bash-5.0# uname -a
> > > > > > > >   Linux (none) 5.7.0-rc3-00097-g12ef1918985f #114 PREEMPT Fri May 15 16:35:01 CEST 2020 i586 GNU/Linux
> > > > > > > >   bash-5.0#         
> > > > > > > 
> > > > > > > Spoke too soon again. Seems like the writes don't make it to the device:
> > > > > > > 
> > > > > > >   bash-5.0# mount -t jffs2 /dev/mtdblock0 /mnt
> > > > > > >   jffs2: Empty flash at 0x045a5798 ends at 0x045a5800
> > > > > > >   jffs2: notice: (98) jffs2_build_xattr_subsystem: complete building xattr subsystem, 1 of xdatum (0 unchecked, 0 orphan) and 1 of xref (0 dead, 0 orphan) f.
> > > > > > >   bash-5.0# touch /mnt/meh
> > > > > > >   bash-5.0# sync 
> > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > >   jffs2: jffs2_flush_wbuf(): Write failed with -5
> > > > > > >   bash-5.0# 
> > > > > > > 
> > > > > > > I'll follow up once I know more; with some traces or hopefully a fix.        
> > > > > > 
> > > > > > Hi again. Hope you're having a good weekend.
> > > > > > 
> > > > > > Some good news and some bad news. Good news is that now I got around to
> > > > > > building an image with mtd_debug and got around to making erase, write
> > > > > > adn read work, withut the hassle of dealing with jffs2 (and hassle of
> > > > > > dealing with corrupted image from eariler attempts).
> > > > > > 
> > > > > > The bad news is that I have very little idea about what I'm actually
> > > > > > doing. Here's the branch with changes I've done, with my notes in
> > > > > > the commit messages:
> > > > > > 
> > > > > >   git fetch git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux.git \
> > > > > >       lr/nand/cafe-nand-exec-op-debug
> > > > > > 
> > > > > > The relevant changes:
> > > > > > 
> > > > > >   6ee7e0d11e19 fixup! mtd: rawnand: cafe: Demistify register fields      
> > > > > 
> > > > > This one is valid.
> > > > >     
> > > > > >   565d5f126e86 fixup! mtd: rawnand: cafe: Demistify register fields      
> > > > > 
> > > > > Here it should be
> > > > > 
> > > > > #define CAFE_NAND_ECC_SYN_REG(x)		((((x) / 2) * 4) + 0x50)
> > > > > 
> > > > > but maybe the loop is no longer valid after that.
> > > > >     
> > > > > >   064d381b4615 fixup! mtd: rawnand: cafe: Demistify register fields      
> > > > > 
> > > > > This one looks good too.
> > > > >     
> > > > > > 
> > > > > >     During the test with JFFS2 filesystem, I was seeing a metric ton of ECC
> > > > > >     errors. I have no clue where they came from because they presumably happened
> > > > > >     on an asynchronous writeback, but they no longer happen and I believe
> > > > > >     some of the above was to blame. Unfortunely I didn't investigate
> > > > > >     further, because in my setup it is hugely inconvenient to beat the image
> > > > > >     back into shape.
> > > > > > 
> > > > > >   085a6ad43151 Revert "mtd: rawnand: cafe: Don't leave ECC enabled in the write path"
> > > > > > 
> > > > > >     This triggered a WARN_ON(). Probably not too important, because the
> > > > > >     code in question gets thrown out afterwards.      
> > > > > 
> > > > > Oops. Maybe I should move it after the exec_op() conversion then.
> > > > >     
> > > > > > 
> > > > > >   4a9d95bf6d6b fixup! mtd: rawnand: cafe: Add exec_op() support
> > > > > > 
> > > > > >     An straightforward fix for page write op.      
> > > > > 
> > > > > Yep, that one is valid, thanks for the fix.
> > > > >     
> > > > > > 
> > > > > >   6959a724994d XXX add address to CMD_STATUS
> > > > > > 
> > > > > >     Tricky, and I have no idea what's going on. Perhaps you'll have an
> > > > > >     idea how to either address this more reasonably. As usual, I'm happy
> > > > > >     to apply patches with extra tracing if necessary.      
> > > > > 
> > > > > Duh, that one is super weird. I wonder if it doesn't have to do with
> > > > > the fact we're using DMA. Can you try with the DMA disabled?    
> > > 
> > > Disabling DMA makes things work.  
> > 
> > Okay, I pushed a new version doing DMA only where there's at least one
> > address cycle.  
> 
> Ok, this is somewhat embarassing:
> 
> It doesn't work, but reverting disabling DMA altogether doesn't make it
> work now either. It might be that it doesn't behave deterministically,
> but more likely I just fucked up the testing and was testing a wrong
> tree.

No worries. It might also be me messing up with one of your fixes (I've
slightly changed the one fixing the SYN_REG() macro, and if others
have been changed, it was not intentional). What are the symptoms?
Still failures in the write path?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
