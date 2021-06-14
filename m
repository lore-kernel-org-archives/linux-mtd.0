Return-Path: <SRS0=wcjI=LI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DA6C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jun 2021 22:24:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B89E6124B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jun 2021 22:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B89E6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7NVs5zSfDUj/ONJJfWSHhwHA/LQu4w48yIr4PrsBsj4=; b=d8XKp5y2bUKJJWsryj06f3E9m7
	NmBvpVy0zj4NPkwVNivX16kuYsnxlWBlxAJ9OF0yYoC1P6F9+t7oGQGpbXVZlh3W6XBqVxPKRk/md
	O2i+/rHAq5IUDRFWCWStFvJyBg0Ob4bDMJgTmsMlUT4u2RWD/i59PnGiiSd7R70C18Er58Dt2wqv4
	DOZy4M0eFs1Vsn6MfvCqlfTMvJVcnoJdjSyLA8D0zuZ/bpdGI1JvfQOkkGJmgSr8c2WSkq3EKgz5f
	OMfA4B1oy0bAX9SZY8fFM+v97a66i5fUYHNyblZj1+HE+rPIN0TX9A9dABWmbZXfCCS86vi06nOYZ
	euN+jeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsv00-00GOZU-V3; Mon, 14 Jun 2021 22:24:05 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsuzx-00GOZ9-WF
 for linux-mtd@lists.infradead.org; Mon, 14 Jun 2021 22:24:03 +0000
Received: by mail-pf1-f179.google.com with SMTP id h12so11719818pfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jun 2021 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Zy95WLjXytpC9PA0Bxhiy7YbVeAlOqBwSRRJi5/GujM=;
 b=ALA0aOO4zZ/Yj2B72JsrRI3+M+MYSKj13EqDlVPyLSQUWFdaA/VnpbK76WL2jKOiqP
 hYt52rVc99j0UMwW/g6MOGvC/HllLnTLXjGqXSzTQEIV1BcuHPStIZnOwutnryNWG7CU
 QqxeSXKIKoPRdLD98BhfXPh4WQRDpxupBY5+aLaAHj8qUeKfeaEkcCljWMkVdGD6g81m
 YfNWz45tYBbe95GLCSkWrkMBLiqdrhL0xy9Frg1cFBlTNi3Clb7MzbxbbO8HcdsIzxk4
 XdqO3tDR2rijzANi2X3FV1k6IXaKcwe25XSUBSqWANdPSyD3c5JXpTaQUN9xnt6LCbTg
 NQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zy95WLjXytpC9PA0Bxhiy7YbVeAlOqBwSRRJi5/GujM=;
 b=JxtEGggb1bpBlQRmS+5bbgko4+7ygZ7Y2Qp4meWuzoRDzmnpCWt1I5a1mskLlYCO1W
 L7rpN3/IzjCoTmhzXX3XPZE5v1BZr5OLTP7awQBWTQqubzVXrAGxs4KOdyP0kgWxuas3
 geDonCLTctsqX+aPYTD1N5QaRG5YnnwVPi2NCrMFdBMvNNkzPbBVcFtinWzXiG5HxUHr
 Zy3iOXsfDFW5U14iVTIcuFqa167vP2Ivwz18M0sZi7AWGqBQhn8hPlk8pnFnboe4aLK2
 QnDq9KunNOi/eUTftg3WGUCYy1eHKtU5D73fK8DQNCHyUbF0W0lcDJ54+wwolI5dq1Ir
 aRHw==
X-Gm-Message-State: AOAM533zlwk9R4rGRU1yQQ/C6oLjCpdcz08fih0Zjq+82LhjHb3q3Sr8
 1fRzuBLWFpWTyDOemtHxkK6/wFIDHsk=
X-Google-Smtp-Source: ABdhPJwUd6Nup08PI/tjLofl2mSwnNASXdMDiGciIRaq/f9u2R8lD0tO32rgpptldT+MPMBtmqJ++A==
X-Received: by 2002:a63:a50a:: with SMTP id n10mr19105289pgf.13.1623709380953; 
 Mon, 14 Jun 2021 15:23:00 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id i74sm14395769pgc.85.2021.06.14.15.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 15:23:00 -0700 (PDT)
Subject: Re: Kernel 4.14: SQUASHFS error: xz decompression failed, data
 probably corrupt
To: Pintu Agarwal <pintu.ping@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-fsdevel@kvack.org,
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>
References: <CAOuPNLi8_PDyxtt+=j8AsX9pwLWcT4LmVWKj+UcyFOnj4RDBzg@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <dacd3fd3-faf5-9795-1bf9-92b1a237626b@gmail.com>
Date: Mon, 14 Jun 2021 15:22:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAOuPNLi8_PDyxtt+=j8AsX9pwLWcT4LmVWKj+UcyFOnj4RDBzg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_152402_078310_EF3DEEA9 
X-CRM114-Status: GOOD (  22.44  )
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



On 6/14/2021 3:39 AM, Pintu Agarwal wrote:
> Hi All,
> 
> With Kernel 4.14 we are getting squashfs error during bootup resulting
> in kernel panic.
> The details are below:
> Device: ARM-32 board with Cortex-A7 (Single Core)
> Storage: NAND Flash 512MiB
> Kernel Version: 4.14.170 (maybe with some Linaro updates)
> File system: Simple busybox with systemd (without Android)
> File system type: UBIFS + SQUASHFS
> UBI Volumes supported: rootfs (ro), others (rw)
> -------------------
> 
> When we try to flash the UBI images and then try to boot the device,
> we observe the below errors:

Someone in The OpenWrt community seems to have run into this problem,
possibly on the exact same QCOM SoC than you and came up with the following:

https://forum.openwrt.org/t/patch-squashfs-data-probably-corrupt/70480

> {{{
> [    5.608810] SQUASHFS error: xz decompression failed, data probably corrupt
> [    5.608846] SQUASHFS error: squashfs_read_data failed to read block 0x4d7ffe
> [    5.614745] SQUASHFS error: Unable to read data cache entry [4d7ffe]
> [    5.621939] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
> [    5.628274] SQUASHFS error: Unable to read data cache entry [4d7ffe]
> [    5.634934] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
> [    5.641309] SQUASHFS error: Unable to read data cache entry [4d7ffe]
> [    5.647954] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
> [    5.654304] SQUASHFS error: Unable to read data cache entry [4d7ffe]
> [    5.660977] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
> [    5.667309] SQUASHFS error: Unable to read data cache entry [4d7ffe]
> [    5.673997] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
> [    5.680497] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x00007f00
> [....]
> }}}
> We also observed that some of our Yocto build images will work and
> boots fine, while sometimes the build images cause this issue.
> 
> So we wanted to know:
> a) What could be the root cause of this issue ?
> b) Is it related to squashfs ?
> c) If yes, are there any fixes available already in the latest mainline ?
>     Please share some references.
> 
> Please let us know if anybody encountered this similar issue with
> squashfs and how did you handle it ?
> 
> Note:
> Our current commit in fs/squashfs is pointing at:
> Squashfs: Compute expected length from inode size rather than block length
> 
> 
> Thanks,
> Pintu
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
