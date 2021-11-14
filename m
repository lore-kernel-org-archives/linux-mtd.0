Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53555C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Nov 2021 07:07:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CAED600D4
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Nov 2021 07:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CAED600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pzVKVz7XKcZ5v1y5B4W8T7d6AqTrefonSqqkNiAmEXQ=; b=FctjeZQfe4Aix3uzY+2OrVF/Xq
	mRewldRWPiMHtzjtEFQ2M+bdsEsthYxbEr48WscGXegBT/CiJa5BLDIIvKm+3WF0TFBuT0H2+N7rI
	U8OCECOwl4m9FPw444Oo4DL0RobOM7nNn4GeN5+cCx0o7EbNNac5hJIR24xlmibcHrbO9B8pXXvOU
	gh0uV5Djoo45DpJw/f8qOg71xYqutHEyO0Y+0nZBooVV+wpDR3+IiZcJ9cK8UDmrlKizLGTE+ZA66
	DsZEsz4vGH4l0gVGFCPnEjwjv95fD8mAtewl+cDuukuTLcYqpc3dbu/J0u/tWSgkQT628r7HnIIzE
	Yadb/Egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mm9am-00DP5j-7a; Sun, 14 Nov 2021 07:06:20 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mm9ah-00DP5G-92
 for linux-mtd@lists.infradead.org; Sun, 14 Nov 2021 07:06:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id w1so56653308edd.10
 for <linux-mtd@lists.infradead.org>; Sat, 13 Nov 2021 23:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lTAWwzCDf/mzTJzs3+RMQBARAQp9pv2hNSSRu5s7rGk=;
 b=NGPyaC4HyGyzJ1rKSXlYLIF3VYW8ANrzasd9imWyXZqYrXhBJ7DUUlveK95P0k2VYN
 P6IIViIwJUInUM9i0uuZFCtD/JGcYvtDsPeEUs2htU8GOq7tLuhx4WXXbIpXVTTPXITd
 UlxWBBACwBl4C//AQzbFtgJ2VZd22A29zTs+CrmeXKhtKOBinlr4oaFSlUvEsxYaMsE7
 dPkLTtufvXehyY4S/ac91T0E29V/PyoQh6Yesbf1jvhsH8vEwdmTH4soage/Vbg+8BNz
 ehINbCd8WTPOyqtHlqEIKQYYKvbJXkLNKjpc5xDruwC8WlGboho6HoMyPjadDbQ21nmx
 63zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lTAWwzCDf/mzTJzs3+RMQBARAQp9pv2hNSSRu5s7rGk=;
 b=UKsfTo2/SzmcqH9+p+7ygl3pdvJPigCAPGoNgwEPHPozjarSRXyMZ3QbpX8CgBAZ4c
 zFbtTnaER1Mp5g3M1ryQjJySGOUzh7Ij7cC06cD7KnuSW2mS15iD/cIAUF+bGzreF4pA
 fvmWYQknG0tW918n4jhhkz+QREeOGNW31ThTlLblQo4oP1xz6NigrmJLNxM1O+INR+kO
 dzY+ydoF4vS91+aDre0goPpxFkf1BlYizS/NGMuSJPxyn48PdV5mWTm9LLABzBXBVls2
 aVgHkV6Xc8gR0AWdJgg/8N3dzamOtWcLMQ6HovaIyx2ypFMWZ/9wTaU46abSx7cLWK5A
 6v2g==
X-Gm-Message-State: AOAM5308rMChSmKSjIjgyZ0ZOx60CO4VUHquOZxAyaC30FdJR2+LegkW
 EkktWjWvvzn4sXIVtNnptnYgUAJSKo1Y9b3jtDQ=
X-Google-Smtp-Source: ABdhPJz6F7eb7ZlPz+uZ1ryBjKV5MJY+6g8VTzYPNDQv8d/IMiyQJel1uICTBXlYxhNSBRKxb1cJsAgM4Rtiu1G511Y=
X-Received: by 2002:a17:906:b084:: with SMTP id
 x4mr35926642ejy.214.1636873572801; 
 Sat, 13 Nov 2021 23:06:12 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
 <CAOuPNLgquwOJg85kDcf67+4kTYP9N=45FvV+VDTJr6txYi5-wg@mail.gmail.com>
 <CAOuPNLjFtS7ftg=+-K3S+0ndyNYmUNqXo7SHkyV4zK4G9bZ4Og@mail.gmail.com>
 <CAOuPNLg_YwyhK6iPZZbRWe57Kkr1d8LjJaDniCvvOqk4t2-Sog@mail.gmail.com>
In-Reply-To: <CAOuPNLg_YwyhK6iPZZbRWe57Kkr1d8LjJaDniCvvOqk4t2-Sog@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Sun, 14 Nov 2021 12:36:01 +0530
Message-ID: <CAOuPNLgYhm=goOiABjUFsAvRW+s2NqHjHYdm5MA9PvoUAMxOpg@mail.gmail.com>
Subject: Re: Kernel-4.14: With ubuntu-18.04 building rootfs images and booting
 gives SQUASHFS error: xz decompression failed, data probably corrupt
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dm-devel@redhat.com, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 Mikulas Patocka <mpatocka@redhat.com>, 
 Richard Weinberger <richard@nod.at>, Florian Fainelli <f.fainelli@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Daniel Rosenberg <drosen@google.com>, astrachan@google.com,
 speed.eom@samsung.com, 
 Sami Tolvanen <samitolvanen@google.com>, snitzer@redhat.com, 
 squashfs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_230615_357982_6A62F0DC 
X-CRM114-Status: GOOD (  19.70  )
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

+ Adding squashfs-devel to get opinion from squashfs side.

On Fri, 12 Nov 2021 at 12:48, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi,
>
> On Tue, 9 Nov 2021 at 21:04, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> > > > We only get these squashfs errors flooded in the boot logs:
> > > > {{{
> > > > ....
> > > > [    5.153479] device-mapper: init: dm-0 is ready
> > > > [    5.334282] VFS: Mounted root (squashfs filesystem) readonly on device 253:0.
> > > > ....
> > > > [    8.954120] SQUASHFS error: xz decompression failed, data probably corrupt
> > > > [    8.954153] SQUASHFS error: squashfs_read_data failed to read block 0x1106
> > > > [    8.970316] SQUASHFS error: Unable to read data cache entry [1106]
> > > > [    8.970349] SQUASHFS error: Unable to read page, block 1106, size 776c
> > > > [    8.980298] SQUASHFS error: Unable to read data cache entry [1106]
> > > > [    8.981911] SQUASHFS error: Unable to read page, block 1106, size 776c
> > > > [    8.988280] SQUASHFS error: Unable to read data cache entry [1106]
> > > > ....
> > > > }}}
> > > >
>
> One more observation:
> When I disable FEC flag in bootloader, I see the below error:
> [    8.360791] device-mapper: verity: 253:0: data block 2 is corrupted
> [    8.361134] device-mapper: verity: 253:0: data block 3 is corrupted
> [    8.366016] SQUASHFS error: squashfs_read_data failed to read block 0x1106
> [    8.379652] SQUASHFS error: Unable to read data cache entry [1106]
> [    8.379680] SQUASHFS error: Unable to read page, block 1106, size 7770
>
> Also, now I see that the decompress error is gone, but the read error
> is still there.
>
> This seems to me that dm-verity detects some corrupted blocks but with
> FEC it auto corrects itself, how when dm-verity auto corrects itself,
> the squashfs decompression algorithm somehow could not understand it.
>
> So, it seems like there is some mis-match between the way FEC
> correction and the squashfs decompression happens ?
>
> Is this issue seen by anybody else here ?
>

The squashfs version used by Kernel:
[    0.355958] squashfs: version 4.0 (2009/01/31) Phillip Lougher

The squashfs version available on Ubuntu:
mksquashfs version 4.3-git (2014/06/09)

The squashfs version used by Yocto 2.6:
squashfs-tools/0001-squashfs-tools-Allow-setting-selinux-xattrs-through-.patch:61:
   printf("mksquashfs version 4.3-git (2014/09/12)\n");

We create dm-verity squashfs image using version 4.3 whereas, the
kernel uses 4.0 version to decompress it.
Is there something missing here?

When FEC (Forward Error Correction) comes into picture, then squashfs
decompress fails.
When we remove FEC flag from dm-verity then decompress works but read
error still occurs.
This seems as if something is missing either in FEC handling or either
in squashfs decompress logic.

Just wanted to know if there are any fixes already available in the
mainline for this ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
