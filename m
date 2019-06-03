Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF04C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8552628107
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMAbHz8x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tTYEqU4p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8552628107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgW5ypixbSzEHrpsz8x/gP5vy5+P5DAtipHqGVXUAl8=; b=uMAbHz8xGlHG0R
	zPubuCd2UNujuKqe3vyVZYZY208P1cShRKwNmYMKd7VyGWEXY1MunXACPu8gimYB7QB29Yppdeuyj
	uPKJ1JcVXflV3SWpuWwy+VveEi8PlFMU/WvujiZyL2i0sFm9RcA7iSdb0VXj0p7vsnEMeGRjLepIQ
	aq309nP+SvR4UmGFTg+5FjaM9TQKJbO25x2my+oE298XhPE6wNbDmJwkooP6gXRZVagvU2LDaM4lB
	UC6wNQpNKrvNiUD0KEyJLjs2w/2pZ0OgI2jBPST3uMTC7undNQk5kLo/QHV8LLoIast87Ue72MUq3
	AMXXenERvbTrX+K4C0NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXksq-00028m-Eh; Mon, 03 Jun 2019 11:12:08 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXksn-00028O-AP
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 11:12:07 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d23so8817242qto.2
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2019 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELVXp1eDlBRvxqhGjGPHKBiAR/+IASCt9mGCFmIQCEA=;
 b=tTYEqU4pEWONf0nX1WSISIkd83fJzINgGaNjC/Y4P4NINsYssBjMa2w/P5N4MhYb6C
 3Z9N8PqFCN409cu6OEmXhrNT9gObwAE+vs3IT3CKw8bSDdZAR4o/XIJ9yc6RrdYjee1x
 BjeTKfPw4yto6pAFffRf4OMpd/xw3/HpQ1TkRLJ0cbldDswEZyTrWh/jKOkYOwHJte8l
 Ft6r3ry6ppOEZJ++G6/hUkWilyokNMe6nYoXRVFjmdO2SEezhW7zXZ2LbFoCC3ZFlBgd
 v5bYLSthcZXrg2KFa/I8bhL4p7IfySPXc/yl69PB4pGgKVwBjKuk/iD8KuLN7gK85KnU
 TIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELVXp1eDlBRvxqhGjGPHKBiAR/+IASCt9mGCFmIQCEA=;
 b=Ad8jnnB7q3od/1wrYbCkkP34xmEaOp+NfR+2jCEAW19P6f+6Z6fuJWniC9STkPJI0G
 3geDBczNWvDinbYBl6ultjsbMJgEe5dqB1WD5tGtEqC0PRMWwtLsxkbXeKpL/2YVUqxm
 BxzM5kBp+GBJxhqU1FGPxkiwmp8OkTW7TfOeXWloxdv+ucr0UU5am21tgeJalsYanmYT
 J7jZqLQOhRqKu70eYXzZKZ8jLh0ojSKaVG3qY9930mn4EEp5tWOefmroxxhYMqcaUS9x
 SVuZyAX+xFQM/ziJqkooMxp5CiobjWH+JBywo03dhh5BDJvA56vihxAdhcEHzLlRI7Ak
 3fZw==
X-Gm-Message-State: APjAAAWdMzUW0D8zsbECrQKjNkqCLADtRm7Vma2idr5McfzbI6mvkWrU
 erUfhwRTpOdeYOzuxhW32GEaJny5EO0DfX9RxKk=
X-Google-Smtp-Source: APXvYqxYitoaq6rnEhOWjNqYqfu6GHPNTV3r1ZgqYJfxEo326KiYiZN0FeMRUoKcqBFU4EPD/ZTeqis6ZMYU5oa45IY=
X-Received: by 2002:ac8:7052:: with SMTP id y18mr21800742qtm.274.1559560323924; 
 Mon, 03 Jun 2019 04:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAM===sSAP-qRv7jxBs9KZDFyuL+Dx3wSkQfSOiSQtp8Z8FQcMw@mail.gmail.com>
 <CAFLxGvymOZbBM=wtK-fcgYOv7OOucpcZ1eZJ9GQmUH8h9Jcc+Q@mail.gmail.com>
 <CAM===sSzy4=joOnzLxbSDoC=4HgmXj7QF14vzFCKTWt8z-JLoA@mail.gmail.com>
In-Reply-To: <CAM===sSzy4=joOnzLxbSDoC=4HgmXj7QF14vzFCKTWt8z-JLoA@mail.gmail.com>
From: Leon Pollak <leon.pollak@gmail.com>
Date: Mon, 3 Jun 2019 14:11:52 +0300
Message-ID: <CAM===sQ3bn34HCajra=Fh6X-u_fTt19UTsKz_EntAcndSd++gw@mail.gmail.com>
Subject: Re: UBIFS on write-protected NAND
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_041205_589997_12786DAE 
X-CRM114-Status: GOOD (  28.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sorry, I think the full UBI log may be also useful:
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. sequence number:       85
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "File System"
UBI: MTD device size:            200 MiB
UBI: number of good PEBs:        1601
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1601
UBI: number of PEBs reserved for bad PEB handling: 16
UBI: max/mean erase counter: 2/0
UBI: image sequence number:  126133844
UBI: background thread "ubi_bgt0d" started, PID 42
UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   199225344 bytes (194556 KiB, 189 MiB, 1569 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
1600:2048, written 0 bytes
UBI: run torture test for PEB 1600
UBI error: do_sync_erase: cannot erase PEB 1600, error -5
UBI error: erase_worker: failed to erase PEB 1600, error -5
UBI: mark PEB 1600 as bad
UBI error: ubi_io_mark_bad: cannot mark PEB 1600 bad, error -30
UBI warning: ubi_ro_mode: switch to read-only mode
UBI error: do_work: work failed with error code -30
UBI error: ubi_thread: ubi_bgt0d: work failed with error code -30

And from here my rootfs is in ro mode only.

Thanks alot
Leon

On Mon, 3 Jun 2019 at 10:31, Leon Pollak <leon.pollak@gmail.com> wrote:
>
> Thank you, Richard.
>
> On Sun, 2 Jun 2019 at 23:02, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Sun, Jun 2, 2019 at 4:08 PM Leon Pollak <leon.pollak@gmail.com> wrote:
> > >
> > > I am sorry to disturb the list with the problem most probably already
> > > solved ion later versions...
> > >
> > > I am running Linux 2.6.32 from TI and my root FS is on NAND UBIFS.
> > > Linux boots with command line:
> > > root=ubi0:ubi_rootfs ro noinitrd ubi.mtd=4,2048 rootfstype=ubifs
> > > Please, note the "ro" in the command line.
> > > Also the HW write-protect line is always set to "protected" state.
> > > UBIFS stays most of the time in write protected HW state (system
> > > requirement) and RO mounted, except the very rare cases when some
> > > update is required.
> > >
> > > For this update purpose:
> > > - HW write-protect is removed in SW;
> > > - root FS is remounted to RW (mount -o remount,rw /);
> > > - the change is performed;
> > > - sync, sleep 3;
> > > - mount -o,remount,ro / ;
> > > - sleep 2, return HW write-protection;
> > > - reboot.
> > >
> > > For some unknown reason (may be you know?), sometimes something still
> > > remains in journal and on the next boot we receive a bundle of error
> > > messages with error codes -5 and -30. This happens despite the RO
> > More details please. Can you share a full back trace?
> This is an example:
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 1600:2048, written 0 bytes
> UBI: run torture test for PEB 1600
> UBI error: do_sync_erase: cannot erase PEB 1600, error -5
> UBI error: erase_worker: failed to erase PEB 1600, error -5
> UBI: mark PEB 1600 as bad
> UBI error: ubi_io_mark_bad: cannot mark PEB 1600 bad, error -30
> UBI warning: ubi_ro_mode: switch to read-only mode
> UBI error: do_work: work failed with error code -30
> UBI error: ubi_thread: ubi_bgt0d: work failed with error code -30
>
>
> > But in general a re-mount to ro does not guarantee a clean journal.
> > All it does is making sure that no new files can be opened in write-mode,
> > it is a VFS thing. UBIFS tries to be nice as possible and disables further
> > writes. Maybe your kernel has a bug, it is very old. Dunno...
> OK, I understand. Is there any way to flush ALL data?
> If "sync" and "ro" doesn't do the job, is there something more? Some IOCTL?...
> Solving this issue will be the best possible for us.
>
> > > state of the FS and effectively blocks all the system:
> > > - after these errors detection, UBIFS switches to read-only state,
> > > blocking any possible corrections/repairs.
> > > - we can't remove HW protection to allow it to finish desired work as
> > > it happens in the Linux boot, when initd is just starting.
> > >
> > > Now, I suppose that this issue (that everything is RO and shouldn't be
> > > tried to recover) is treated already in the new versions. My problem
> > > is that I can't move to newer Linux because of TI HW.
> > >
> > > So, my questions are:
> > > 1. Where in the code of UBI (UBIFS?) can I insert the HW write-protect
> > > removal in order to allow the UBI/UBIFS to do its desired work?
> > > 2. When can I put write-protection back?
> >
> > Using a write protected NAND is not recommend.
> > You basically remove the wear-leveling feature from UBI.
> > Blocks can gain bit-flips also in a read-only environment, consider
> > read disturb or other influences such as temperature changes.
> Well, as I said, these NAND is updated not more than 30-40 times in
> all its life.
> So, wear-leveling is not so relevant.
> May be this is relics of the NOR past, but our HW engineers always
> keep flashes write-protected to be on the safe side and avoid possible
> false writes/disturbances/problems at the power spikes.
> The main goal here is to keep the system bootable despite everything
> in the world, except nuclear explosion...:-)
>
> Thank you for your help!
>
> Leon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
