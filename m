Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EB9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 15:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312C160EC0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 15:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 312C160EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KdsX5CwNg0Nlk88/q389qhECnYnU3p2i1nu1jsX5VE=; b=P5jbPlBlGCC09w
	hNVwNvSoqdeOcVc72AjdTD1JBgPSQTf17JqbAf9l+WcAqv/OHHYzCNM95i63VwIPyQbcPCNdgU3ic
	nAiunlfcdJX/1Im1VIP3G8l6Zv7rJvgdc95/PjA8C3DyqWlMUiVhiuxyakCuImnwXv4KJVAMHagx9
	yRqWaX/Uln2OxlSs3mf/0rAoN1ZGoXuZtk3n/kW1vPrqcwVB2VqjzsfNr/YK6lEzOW3V8QHfaob3m
	SiMFlueok07DW/iHt531tDnKmDQiRB1lGhDgQYHPe5kbCc2fe0v0J0jnPvxHCIb3GSkM1p5UPrI2m
	IZd3ifI1W3qXBswrnHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfNzZ-0026TZ-IR; Tue, 26 Oct 2021 15:03:57 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfNzW-0026Sk-Ov
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 15:03:56 +0000
Received: by mail-il1-x12e.google.com with SMTP id j10so14267531ilu.2
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tkcVniFj3EsSUAX6m/sspH5z9aXFixUQtCaiI8YxhYY=;
 b=RHirny+FHC/8Luklp3k8E2F00YXu87T539l/j4y4aya8hF2XauBihgUmdxurLi8p+H
 SmMSwaSh2AmP6Uq1GbVUUdhGsBlYlxOECxFclxKPT0Dpvy4RUWKhdikoNyl2e0WPGYc7
 9Kfg1rniBkkq3kdkgzPJoqgi2djnQN/iZFu36+gOkvEy5AV0uChpXXp4yBRX3myYMYbq
 DUkDwCSC3eN57waqyuMC//UWfQZgkaSDv6d1NtVnSlvdSiUEssVim6QCu703i+/YJ89p
 qI4qfhnKW5uNeoktWtHiHMBXMXPLwoQLtSy2kqbx/H5bleS0I4Kd12l5q2rkvpdh4aDr
 WJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tkcVniFj3EsSUAX6m/sspH5z9aXFixUQtCaiI8YxhYY=;
 b=2XRRiHCYEtXbS/g2+cUXF9ciaTro51NQwt9CPlpIp8PsW88uUPYTLgER2M7huoUAL0
 3JZXqhbevMMwpNpRTrLCnyP/hoZGx4l/8/vMdCILpdiW136lGyrmj4M4nAGvdLR8+uA+
 36n+hMpTtK1W+3/JGa1s9PJcv1ot980+CDZTE9EoctO3Z2qMEdxzNskYr8F0Bwli3DPS
 qPb9lUsh2hFK0svf1rWziEYIEQ/jN5cofn80nFpBOH1q/PDxLsJR1u4OL7NIEHYV8EIA
 JKg9j/IVQS9/9POz+x9YcXr+m4nSJP/rmltZSAsHt0y5oo2PkwUsGXGz/LmD0pmvX0PT
 DKGQ==
X-Gm-Message-State: AOAM530aYl246GNEqCR7NG3gYWruBD70Ew7KPzHXs1iB6JPencRs1ZRn
 IJdPlxJYfe0b7DZq6+9P4o8=
X-Google-Smtp-Source: ABdhPJyBqNQv71Q9LY5rTbgwLveZJl5ilP9ls3UmlNvE9vSCO8HFJ5UevngO734jaIj3ZdForRhVJg==
X-Received: by 2002:a92:c244:: with SMTP id k4mr8489638ilo.138.1635260633513; 
 Tue, 26 Oct 2021 08:03:53 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id k16sm10175244ior.50.2021.10.26.08.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:03:52 -0700 (PDT)
Date: Tue, 26 Oct 2021 11:03:50 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
Message-ID: <20211026150350.GA5136@localhost>
References: <20210801234509.18774-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801234509.18774-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_080354_857717_0FF7E3A3 
X-CRM114-Status: GOOD (  16.11  )
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

On Sun 2021-08-01 @ 08:45:02 PM, Ezequiel Garcia wrote:
> Hi Richard, and everyone else:
> 
> Browsing the internet for "JFFS2 mtd" results in tutorials, articles
> and github.gists0 that point to mtdblock.
> 
> In fact, even the MTD wiki mentions that JFFS2
> needs mtdblock to mount a rootfs:
> 
>   http://www.linux-mtd.infradead.org/faq/jffs2.html
> 
> Moreover, I suspect there may be lots of users
> that still believe mtdblock is somehow needed to
> mount SquashFS.
> 
> I've taken a verbose route and added a pr_warn
> warning if the devices are NAND. I don't think using
> NAND without UBI is too wise, and given the amount
> of outdated tutorials I believe some advertising
> will help.

Not all NAND partitions on a device will contain linux root filesystems. For a
linux root filesystem perhaps using UBI/UBIFS is preferred, yet these messages
print out for each and every NAND partition:

	[    0.900827] Creating 8 MTD partitions on "nxp_lpc3220_slc":
	[    0.906431] 0x000000000000-0x000000020000 : "bootrom"
	[    0.913523] mtdblock: MTD device 'bootrom' is NAND, please consider using UBI block devices instead.
	[    0.933334] 0x000000020000-0x000000080000 : "uboot"
	[    0.940439] mtdblock: MTD device 'uboot' is NAND, please consider using UBI block devices instead.
	[    0.963322] 0x000000080000-0x000000440000 : "fbkernel"
	[    0.970655] mtdblock: MTD device 'fbkernel' is NAND, please consider using UBI block devices instead.
	[    0.993361] 0x000000440000-0x000000920000 : "fbrootfs"
	[    1.000725] mtdblock: MTD device 'fbrootfs' is NAND, please consider using UBI block devices instead.
	[    1.023315] 0x000000920000-0x000000ce0000 : "c_kernel"
	[    1.030722] mtdblock: MTD device 'c_kernel' is NAND, please consider using UBI block devices instead.
	[    1.053444] 0x000000ce0000-0x000000d00000 : "c__atags"
	[    1.060742] mtdblock: MTD device 'c__atags' is NAND, please consider using UBI block devices instead.
	[    1.083349] 0x000000d00000-0x000001000000 : "c_rootfs"
	[    1.090702] mtdblock: MTD device 'c_rootfs' is NAND, please consider using UBI block devices instead.
	[    1.113335] 0x000001000000-0x000020000000 : "mender"
	[    1.131627] mtdblock: MTD device 'mender' is NAND, please consider using UBI block devices instead.

NAND tends to be something found on older devices, the firmware/bootloaders
of older devices couldn't possibly understand UBI/UBIFS so many of these
partitions need be "raw" partitions, or use something that predates UBI.

Ironically my "mender" partition contains a UBI (with multiple UBIFSes inside)
yet I got the same "please use UBI" message as all the others (lol)

I'm specifying my partitions in DT with:

partitions {
        compatible = "fixed-partitions";
        #address-cells = <1>;
        #size-cells = <1>;

        mtd0@0       { label = "bootrom";   reg = <0x00000000 0x00020000>; };
        mtd1@20000   { label = "uboot";     reg = <0x00020000 0x00060000>; };
        mtd2@80000   { label = "fbkernel";  reg = <0x00080000 0x003c0000>; };
        mtd3@440000  { label = "fbrootfs";  reg = <0x00440000 0x004e0000>; };
        mtd4@920000  { label = "c_kernel";  reg = <0x00920000 0x003c0000>; };
        mtd5@ce0000  { label = "c__atags";  reg = <0x00ce0000 0x00020000>; };
        mtd6@d00000  { label = "c_rootfs";  reg = <0x00d00000 0x00300000>; };
        mtd7@1000000 { label = "mender";    reg = <0x01000000 0x1f000000>; };
};

which is why, I assume, I'm getting these messages. Is there a UBI-friendly
way to define them to avoid these messages?

Best regards,
	Trevor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
