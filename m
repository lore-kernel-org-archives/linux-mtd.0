Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCECAC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 15:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E09C61462
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 15:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E09C61462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUPCm0rujbg8jCENpDst301mIyrEd8zOYxJDuG1rTMI=; b=ThX8BxsKw1F6e3
	eng+FLZLbChUzT26kFDdbya1qrdcVN67MyI3Anh4dL3JHnt+++WGNMGPzzR06y/pjLnEq1aFEE6Y/
	IwL3P9PoZPnOCpI9KaFiBj3HzypTkpWMLGdVU86Zsa3XvIbuzR0pxKwKFnMreiebdAC+2nnxzlipv
	zlZ6enYTIW4uhjHdBtMTADYq8GbR19nGoNIDux1UyI2TE52aUleK246o+vhsE20wBNHQ4tRlQWT9X
	GrlaZAOn2F5+HwrK+DvDt4vZGlO0Visr6oel1AHZ49P0WD827WoXXOJziJsCgCb6Yxkpo4xiJ3Hda
	l1/CmTEzUNabtHnQGAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVbUW-00BYjg-5x; Wed, 29 Sep 2021 15:27:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVbUS-00BYif-MT
 for linux-mtd@lists.infradead.org; Wed, 29 Sep 2021 15:27:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id u18so12329899lfd.12
 for <linux-mtd@lists.infradead.org>; Wed, 29 Sep 2021 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nVqIsPyF3tC/+bGnMl4lG19GDSvIwdpmhrqIO8QhAUI=;
 b=CXtmzn1+0ZjT+ApN75fLiRDWOjY/FvtwAFxZ1Mk0ytPul72PiKqlt9wab0bLzBT9UL
 4eIYGaCaUCXO+o+M0akyD6xyiXP0aSRVQdoI4sdmQCABHhkzexbjFdKRB0KzMADemUDZ
 jwjkeFJ58HE6/B3smebVOXwisjFCGf7SExNBHHL+3nnJUmVkq/8uHtp4/XCRo6DNLUrb
 onORUH3iQB6vOn91KOQXfeRWzYwo7EisOwZcR0AvNFvcSKQl6sBFNlWaiWxCJF89X9Y6
 ZLTLfNxg8x2M8X/A6cBZu6APELudXevUChoG1y3FBIH1eExTGLj1v48dYkWGVtlMQR5k
 mAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nVqIsPyF3tC/+bGnMl4lG19GDSvIwdpmhrqIO8QhAUI=;
 b=Javg5ajRN5uOtvXgyh9fVTad2mXfJ+RpDa5AMY+p/sNaR8QBKZTYnaGynvwqepwsLE
 ZXORKTG21Dj2/EoRg7hTNQSulz9G16G7BHUsjfxmfxDpZ8GbUOgoPv3WS6wKLDWF+CKD
 sSY8Sgj1q9ywf72BDRdJ0pTvj3lY0koC2WKj+sWuokjpijZGkVKabPIyj8eLaA2hKEM3
 294EH7bPEmLfbWjzdFWuZX/UthMT+dFshVpjiKButerIRK0lpE8xn2GBIu/19NbgZ6va
 WrZcf7BkRQun1wLpJPhx70wJ1zkda7wCmO15QhFPkE7Hx7D5tNL40dmYPuMDEPLdhWlZ
 hxeg==
X-Gm-Message-State: AOAM532DYdNErnt7CzeHTP+SbWrIa+pGBxjp802rxggMA6PApWyxgl1A
 fW18vTWueB8FQR3mc/51Ht4GSl9xI18=
X-Google-Smtp-Source: ABdhPJyC99ipj2bvZYh0a+3fLdjqfyFGpWyYv/HVSLTum7ffvjHt/nGGtBrRsXtsZ60CDgPaDOpQlA==
X-Received: by 2002:a19:e051:: with SMTP id g17mr255998lfj.519.1632929242169; 
 Wed, 29 Sep 2021 08:27:22 -0700 (PDT)
Received: from wbg (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id j13sm23687lfk.230.2021.09.29.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 08:27:21 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
Subject: Re: [RFC PATCH 1/1] mtd: block2mtd: add support for an optional
 custom MTD label
In-Reply-To: <20210928180521.4516405c@xps13>
References: <20210928154937.2668575-1-troglobit@gmail.com>
 <20210928180521.4516405c@xps13>
Date: Wed, 29 Sep 2021 17:27:20 +0200
Message-ID: <87h7e32yhz.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_082724_764337_1802A4C0 
X-CRM114-Status: GOOD (  21.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel!

On Tue, Sep 28, 2021 at 18:05, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Hi Joachim,
> troglobit@gmail.com wrote on Tue, 28 Sep 2021 17:49:38 +0200:
>> This patch adds support for an optional MTD label for mtd2block emulated
>> MTD devices.  Useful when, e.g. testing device images using Qemu.  The
>> following /etc/fstab line in can then be used to mount a file system
>> regardless of the actual MTD partition number:
>> 
>>     mtd:Config  /mnt    jffs2   noatime,nodiratime      0    0
>> 
>> Kernel command line syntax:
>> 
>>     block2mtd.block2mtd=/dev/sda,,Config
>> 
>> The ',,' is the optional erase_size, which like before this patch,
>> defaults to PAGE_SIZE when omitted.
> We already have a label property that can be added in the DT, isn't
> it enough?

Unless I'm missing something, no.  Sorry if if the description was a bit
unclear.  Let me try expanding on it a bit.

The block2mtd driver is used a lot when emulating proper MTDs, I'm sure
we are not alone in building system images that a flashed to an MTD
device, which we want to be able to test in Qemu before deploying.

So what we typically do is have a read-only rootfs (squashfs) on one
partition, and another for config data that uses overlayfs to get a
writable /etc, for instance.  This is a reduced example, and the order
of parititions sometimes differ, so we use parition labels. When we test
in Qemu there's only the automatic DTB from Qemu itself that's injected,
e.g.

  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic       \
	-kernel Image -initrd rootfs.img -append               \
          "root=/dev/ram block2mtd.block2mtd=/dev/vda"         \
        -drive file=config.img,if=none,format=raw,id=hd0       \
        -device virtio-blk-device,drive=hd0

With the default blockt2mtd args we convert the emulated disk to be
used as an MTD partition, but the name we get in Linux is not the
name we have in our /etc/fstab on a real target.

  # cat /proc/mtd 
  dev:    size   erasesize  name
  mtd0: 00f00000 00001000 "block2mtd: /dev/vda"

With the patch we can align the two cases; the embedded system and the
emulated one, by using the same paritition label.  I.e., with the patch
and the new argument to the kernel cmdline:

  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic       \
	-kernel Image -initrd rootfs.img -append               \
          "root=/dev/ram block2mtd.block2mtd=/dev/vda,,Config" \
        -drive file=config.img,if=none,format=raw,id=hd0       \
        -device virtio-blk-device,drive=hd0

Linux gives the emulated MTD the same partition name we use in the
real embedded system:

  # cat /proc/mtd 
  dev:    size   erasesize  name
  mtd0: 00f00000 00001000 "Config"


Best regards
 /Joachim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
