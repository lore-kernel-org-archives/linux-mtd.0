Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAF0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 13:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C23B60F55
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C23B60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YN/CQYluR0kNzBZcxUtQrk9liu2E9khAOL7dRBZYShw=; b=ViXLi72ZmsMM4g
	v2HeAKJSkfX4OuZXy28t7V7F7Z5N5heqKwaoES0USwuh+9/2KZ+GdProlX/hrbIZMfOR1HI9W3Nkc
	zIfcjGNQJ0a7hDmYBiq1ERTYvOblczWglWreI92bVTL40pxSRq60sval0yjCeTQBNMKqKVibTRCcL
	+GKFooz+Gtlfz53/vEo9tIRoZdCAvQOBCGimE4ASkBHwmeXPCPj10MlfEerHhtMsK6eU8cs8qYQzi
	9MGC18UYUs9+yZWQbvDp5yJiCRFgUjI0K5if0EgneEiBFheAgitEdBsRj9qFC5Pu9/QDBvrbgxcgD
	mURubTar79HYIxrkfs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlX13-00Afg7-7Q; Fri, 12 Nov 2021 13:54:53 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlX0z-00AfeO-Kb
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 13:54:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id m14so38351090edd.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2021 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XFbOW47p++5Cp7MSuv9aXwO4crIHKcrlkESq3jT8ocg=;
 b=Ur8+BeDCD+UMR8C8nKTwJEK15dxhz2iLjUphXEkjzZztJ6qPmHvwI70j32vyEM8lKi
 f6YfuZLkoGDclsn1UGjXTYVwDH47MZT7W6QAt2umrbdrhXunB3/eBjrX7hDBJFKdx+m0
 W4RBBbsRTJASpIDX65wR32iTHH0n09Sf6Exbi18kVWP8a93dnYDEYulI5mt8AEjA6C0/
 6aNOimPnL6NUpe4G8fHKuNWWs++GXjJoolIoUwMOYmZ5WEClrEE6Hcmaiww/pkcQ1mKO
 MLzZTZbuzE1UlRQcYGY/gV1EK5sYDADmKX1lI/IBrnfMfs/Z3VDMzDYUTH3hmJQ1V+nd
 fDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFbOW47p++5Cp7MSuv9aXwO4crIHKcrlkESq3jT8ocg=;
 b=fVDhwLu0ZqJVaItEm5kFtk16ho7ZOxY9+SyiIUmjINGN2QTjq6h7pkhDUy/+OeDhnO
 m2Ms1sMxcXKVWRp22t4MSGv2VSfdfFRG1tQWm6Xi0XDMvauZZah4s5nmyQcUXeahaacL
 TPjTQRUXqpIInc/+t6WhXlfxu2Kj+p9G37CxQuTAywtGWPxkvpuV3yCI0omF+Qa67QAW
 wtxl6DuYsg1ugP/XhAOldIGduTU9blHyi8rSfpts4ceJyhCpA8Zowx8JfgKLFNeA0QGd
 zrFfo4+qvQTdXJ18+hpBWNLN+uWLBqW/8earVFtOw00ai+fmutV+KA8KgKVq3CGYxobF
 Gysw==
X-Gm-Message-State: AOAM530R8bAORwgEzxsPTnFq8XVrME9HHf1l2KoQbCsrfJ/J9eA5+aPy
 lv0s/huBXcCx/v6glPFZaQkuHwJ9VKU1JN7vR7fBvC/aPow=
X-Google-Smtp-Source: ABdhPJzaqmsZEbM3GUit9fpvX2daP0NAhbrhk9sbziTXHiAWVmKZ+Cpzej44QCqyqBaTr7O7zaBkFNJyKFPxLr9tL7A=
X-Received: by 2002:a17:907:3f9d:: with SMTP id
 hr29mr19337115ejc.369.1636725287586; 
 Fri, 12 Nov 2021 05:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20210801234509.18774-1-ezequiel@collabora.com>
 <20211026150350.GA5136@localhost>
In-Reply-To: <20211026150350.GA5136@localhost>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 12 Nov 2021 10:54:36 -0300
Message-ID: <CAAEAJfD0ctKon7onbj5cCgN9OUnXpQ-gxG=DF6hXD9hW+Pw83A@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
To: Trevor Woerner <twoerner@gmail.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_055449_886943_F5BC16DF 
X-CRM114-Status: GOOD (  23.73  )
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

Hi Trevor,

I am not reachable at ezequiel at collabora.com, so I missed this
thread. Sorry about the delay, replying.

On Tue, 26 Oct 2021 at 12:05, Trevor Woerner <twoerner@gmail.com> wrote:
>
> On Sun 2021-08-01 @ 08:45:02 PM, Ezequiel Garcia wrote:
> > Hi Richard, and everyone else:
> >
> > Browsing the internet for "JFFS2 mtd" results in tutorials, articles
> > and github.gists0 that point to mtdblock.
> >
> > In fact, even the MTD wiki mentions that JFFS2
> > needs mtdblock to mount a rootfs:
> >
> >   http://www.linux-mtd.infradead.org/faq/jffs2.html
> >
> > Moreover, I suspect there may be lots of users
> > that still believe mtdblock is somehow needed to
> > mount SquashFS.
> >
> > I've taken a verbose route and added a pr_warn
> > warning if the devices are NAND. I don't think using
> > NAND without UBI is too wise, and given the amount
> > of outdated tutorials I believe some advertising
> > will help.
>
> Not all NAND partitions on a device will contain linux root filesystems. For a
> linux root filesystem perhaps using UBI/UBIFS is preferred, yet these messages
> print out for each and every NAND partition:
>
>         [    0.900827] Creating 8 MTD partitions on "nxp_lpc3220_slc":
>         [    0.906431] 0x000000000000-0x000000020000 : "bootrom"
>         [    0.913523] mtdblock: MTD device 'bootrom' is NAND, please consider using UBI block devices instead.
>         [    0.933334] 0x000000020000-0x000000080000 : "uboot"
>         [    0.940439] mtdblock: MTD device 'uboot' is NAND, please consider using UBI block devices instead.
>         [    0.963322] 0x000000080000-0x000000440000 : "fbkernel"
>         [    0.970655] mtdblock: MTD device 'fbkernel' is NAND, please consider using UBI block devices instead.
>         [    0.993361] 0x000000440000-0x000000920000 : "fbrootfs"
>         [    1.000725] mtdblock: MTD device 'fbrootfs' is NAND, please consider using UBI block devices instead.
>         [    1.023315] 0x000000920000-0x000000ce0000 : "c_kernel"
>         [    1.030722] mtdblock: MTD device 'c_kernel' is NAND, please consider using UBI block devices instead.
>         [    1.053444] 0x000000ce0000-0x000000d00000 : "c__atags"
>         [    1.060742] mtdblock: MTD device 'c__atags' is NAND, please consider using UBI block devices instead.
>         [    1.083349] 0x000000d00000-0x000001000000 : "c_rootfs"
>         [    1.090702] mtdblock: MTD device 'c_rootfs' is NAND, please consider using UBI block devices instead.
>         [    1.113335] 0x000001000000-0x000020000000 : "mender"
>         [    1.131627] mtdblock: MTD device 'mender' is NAND, please consider using UBI block devices instead.
>
> NAND tends to be something found on older devices, the firmware/bootloaders
> of older devices couldn't possibly understand UBI/UBIFS so many of these
> partitions need be "raw" partitions, or use something that predates UBI.
>
> Ironically my "mender" partition contains a UBI (with multiple UBIFSes inside)
> yet I got the same "please use UBI" message as all the others (lol)
>
> I'm specifying my partitions in DT with:
>
> partitions {
>         compatible = "fixed-partitions";
>         #address-cells = <1>;
>         #size-cells = <1>;
>
>         mtd0@0       { label = "bootrom";   reg = <0x00000000 0x00020000>; };
>         mtd1@20000   { label = "uboot";     reg = <0x00020000 0x00060000>; };
>         mtd2@80000   { label = "fbkernel";  reg = <0x00080000 0x003c0000>; };
>         mtd3@440000  { label = "fbrootfs";  reg = <0x00440000 0x004e0000>; };
>         mtd4@920000  { label = "c_kernel";  reg = <0x00920000 0x003c0000>; };
>         mtd5@ce0000  { label = "c__atags";  reg = <0x00ce0000 0x00020000>; };
>         mtd6@d00000  { label = "c_rootfs";  reg = <0x00d00000 0x00300000>; };
>         mtd7@1000000 { label = "mender";    reg = <0x01000000 0x1f000000>; };
> };
>
> which is why, I assume, I'm getting these messages. Is there a UBI-friendly
> way to define them to avoid these messages?
>

I feel the messages are actually helping you. You should not have mtdblock
on any of these MTD devices, if I understood correctly, since you are not
mounting a filesystem on any of them.

Just disable MTDBLOCK on your build and you will be good to go.

I am inclined to just leave the warnings, although they look spammy,
precisely to help catch this mis-setups.

Thanks,
Ezequiel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
