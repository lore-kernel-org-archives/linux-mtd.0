Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407F1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 11:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE7B6117A
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 11:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FE7B6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H8iVe2X3x9WwxD29ltnbLV6tP5DVrpQSkUY0hbfEvYM=; b=mBkB0GJt3lFX+iHv9iBMEhqQXP
	T6cbZCl4dT6yK/Jmg5mNVE4OFRfix5EVzwVbBds5fUAWSa1bo0DjX7gls5WIbsCGit5DVk8wyIcFh
	AzctGufytVA3nT2WjDw4m623mEP9uLE2URUc9pY8xbmXFSNNxdiwLHm+CMrT2FfIAsuHj1RoQ7jpo
	8eui5zYhLotGW2mAzqIi1B0c28BBD2ixMEJ4a4QdQGE20ZqJcrH03kIfysGbGolOkXXGrrmlSSb0F
	AwrFT0ywXsQI8lHxtLA2tivpwik1OXAEX806Jma7D9Jrd7pnIzBVOUdpLJYKRkJP9icwxZyK2D0VV
	Kuk4cl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkP6o-001gez-LR; Tue, 09 Nov 2021 11:16:10 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkP6l-001gdr-PN
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 11:16:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id x15so44005881edv.1
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 03:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=rVsY0bOoMyeQFsYvQfJLYPtYkclxmkriKyxzCkOTXMg=;
 b=YahIOPb2qtFmAXmun3nR9l/ho8hUkKHZyHvVAvuE9kDrF6V7BoL2j4P054zaPHV3XF
 p1asyOuoleg4QJFUWzQN+pqmrBN0JgTdLYe5rsvsTmcmwk8pYX2VGq1MJAw9SbDXeazJ
 K2Ffx0HZfDzUGt/YnQJgM//hYH23/M6fChf+oDgj8WaYH5pa3HcAC9dxCtctC/mDUzMr
 BfwXx7nr8izK0LqATpJMRYvYAeUkZ//Tuo7SKdmwQGTK0jn54Sfv4I8dLzma8R0Pv85I
 hxTcsWLYnQ6UgfMlnN1sSfUxMHwfLtBppJSkaAEhxkH9RWzjRwDF7JCqogCwo4IjODqq
 HsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=rVsY0bOoMyeQFsYvQfJLYPtYkclxmkriKyxzCkOTXMg=;
 b=4RWXKCwixF3F540AqEq835Pbru2l9S8rIwtjfnWn+75l6MD1VNEbFkyasGCPLRs0Gg
 MVgxgFPSGbS+y3WZ0CiPqkC76di33U/lM/GFeh5IthWPms7IutpWE2s6PLlWgm+tZumh
 mABEE0zcV1HuPFx2Q6l5qL9pQiS3YaJK1UAQW1CUIBs0mcNM4+T6Ht1QQ/YiKk30/VTt
 kJQ8rI3mfb7DqeCILkgqfy8wzMEm2OH7s99grboE+ckSriAAOl2U1ZmvD43rKvk+OEmi
 565fwavp14KOOIckJglK7W1BHdo6QWddcLlpxXeRMho8HmXb/EqOVnuF3P5ilU51RqjS
 T/Cg==
X-Gm-Message-State: AOAM533ANymN5tl2Nzhq4ntcTBrv5d7g3W6ioUTWL8rE8jy2AHNAZpaj
 xKFTHpmItjUncn7mFAxgpkwbydurhkXqBjSsIHU=
X-Google-Smtp-Source: ABdhPJzQ1KrAe4zoA1w0iikZNSeX4IFNasgdzFgtAvBS7Sxn2unVRfdx+qvtVYnyIBY69xv5eswfCYx/TYLXEzzlvIk=
X-Received: by 2002:a17:906:2ad2:: with SMTP id
 m18mr8841239eje.64.1636456565939; 
 Tue, 09 Nov 2021 03:16:05 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
In-Reply-To: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 9 Nov 2021 16:45:54 +0530
Message-ID: <CAOuPNLgquwOJg85kDcf67+4kTYP9N=45FvV+VDTJr6txYi5-wg@mail.gmail.com>
Subject: Re: Kernel-4.14: With ubuntu-18.04 building rootfs images and booting
 gives SQUASHFS error: xz decompression failed, data probably corrupt
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dm-devel@redhat.com, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 Mikulas Patocka <mpatocka@redhat.com>, 
 Richard Weinberger <richard@nod.at>, Florian Fainelli <f.fainelli@gmail.com>,
 sumit.semwal@linaro.org, adriens@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_031607_847163_939FBD8D 
X-CRM114-Status: GOOD (  15.32  )
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

Hi,

On Mon, 8 Nov 2021 at 20:00, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi,
> Here are few details.
> * Linux Kernel: 4.14
> * Processor: Qualcomm Arm32 Cortex-A7
> * Storage: NAND 512MB
> * Platform: Simple busybox
> * Filesystem: UBIFS, Squashfs
> * Build system: Linux Ubuntu 18.04 with Yocto build system
> * Consists of nand raw partitions, squashfs ubi volumes.
>
> What we are trying to do:
> We are trying to boot dm-verity enabled rootfs on our system.
> The images for rootfs were generated on Ubuntu 18.04 machine using
> Yocto build system.
>
> Issue:
> Earlier, when we were using Ubuntu 16.04 to generate our images, the
> system was booting fine even with dm-verity enabled.
> Recently we switched to Ubuntu 18.04 build machine, and now with the
> same changes we are seeing the below squashfs error, just after the
> mount.
> Note: with 18.04 also our rootfs is mounting successfully and
> dm-verity is also working fine.
> We only get these squashfs errors flooded in the boot logs:
> {{{
> ....
> [    5.153479] device-mapper: init: dm-0 is ready
> [    5.334282] VFS: Mounted root (squashfs filesystem) readonly on device 253:0.
> ....
> [    8.954120] SQUASHFS error: xz decompression failed, data probably corrupt
> [    8.954153] SQUASHFS error: squashfs_read_data failed to read block 0x1106
> [    8.970316] SQUASHFS error: Unable to read data cache entry [1106]
> [    8.970349] SQUASHFS error: Unable to read page, block 1106, size 776c
> [    8.980298] SQUASHFS error: Unable to read data cache entry [1106]
> [    8.981911] SQUASHFS error: Unable to read page, block 1106, size 776c
> [    8.988280] SQUASHFS error: Unable to read data cache entry [1106]
> ....
> }}}
>
Just one question:
Is there any history about these squashfs errors while cross-compiling
images on Ubuntu 18.04 or higher ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
