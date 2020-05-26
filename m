Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B582C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 16:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D871620721
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 16:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FpfjwOmD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEQGA3yv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D871620721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXPJPJtTJI81S3+bAaJ7YhO1jPfAi0SqQmnUyHIMR2s=; b=FpfjwOmDIabPGN
	onFHjHUlJdl/t0siC98Z3eRv/RLMmSMIUzpgaq84or0Vclvx+K4kx5boqWtXtTZvD2Ko6KFN2kLGK
	WlJ//xhWb5uUGpQrAfdVfdafwXy8gVu7SJgfnGCC7BismNfoLqhz+nsQhlffxRxhrnmxmq/0QdHAd
	HhicAd/eTBEs6SyU0sxCzoQTbJidajqJqeIk4PJosnHi9OHf+C+EPPrBhjS+6jiCD6NAq4ZxR90zY
	5FyLQwnidG0H1XZN2BhlaZgPCh5RurYW0YYPR/ce8HtoifIdIDnil1mBIV4jie7T+6wlkivRMgQdJ
	O/KB9Xd0oHpbtF1kKdjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdc1M-00057I-BN; Tue, 26 May 2020 16:01:40 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdc1J-00056u-Cj
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 16:01:38 +0000
Received: by mail-qk1-x72f.google.com with SMTP id q8so4628296qkm.12
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2020 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBRnJF+ZnSsljJoVhks4mJNsFeSct/4BLWAsV9llw7o=;
 b=jEQGA3yv9+nhDVEpV9QDPE4CKOM3vVxk7reeEJYZ3reBM2Xfe0bQHTovWqAgXXw4fh
 MsShWgPznioMcc1qux5ph/LqBvkxHqB6F67fYLhJCnCcgH9F7tqWc8AGB9bWas5OJq99
 zkkuSTrViCBMYMflv1GUxjANGMHCriaV9PcQi2iN59QLasG4t10hYgrtPfeuI27UBRuA
 uMdxfUcEiEJwWN0t2sPz7/DDjXjOEnN9nID+rv5T0HiusuIXgmDXyPsHqp/XdWydTVEk
 QhJ5m3W5I/c0oc5zH0XvPKimzLAwImQBs3w3ERAjWp1cW2HU+RGNP/X92Lvm8kf9v+iO
 zTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBRnJF+ZnSsljJoVhks4mJNsFeSct/4BLWAsV9llw7o=;
 b=W1hoXCsFXe6nWVQHvH6VSxqJ5XNPdb1ER0u0TyIYDAkdvFsZzjaNMPPLE4LrPjrbus
 FQJqUKVJ1ElpOY45L2kK1lwGCV/UKV+V7JStJIQs3n5nyX4t1ytFZkMIyLowKImUiR53
 yHvcnxOoMpKORUs364WCC5rm27s563mfc4uS7euA8A8EB3m+w9Ij7raijRk5SMZC+diD
 DGDxruElP7xrxbTIwGYg/GVEFlyLkc8h1su/yixqJvy5F+Vppj6OQ5QEXHbtQRM/e+To
 8f6hRLKQQA1Gs0etrxQ6UTVkihoomRybY/tJCWLJvm8ZsQGeVMOv/P7N4UhynPnd3xj3
 HQoQ==
X-Gm-Message-State: AOAM531zM5XQ2769Pe5/EhlRIaIViZ/CVWT/y/wmnWIatKqby/ZUPng4
 PjKg+HGKQ+2jF+1+se//FufWZYUs/D+BaefDbgA=
X-Google-Smtp-Source: ABdhPJwroBH4wgnWUsyrXrt0g+NZ5KrSr/bKdn8gTsVlwWusJ1DHVvPFc89GRR7yIm4BFOHZUM1OOzhVjDhIeeq5Y3w=
X-Received: by 2002:a05:620a:218b:: with SMTP id
 g11mr2086694qka.251.1590508895176; 
 Tue, 26 May 2020 09:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_dkJBQJSY_Fg5H=OcFHvio1-FcDEfgbKwhRmc=KhvdcnNAVg@mail.gmail.com>
In-Reply-To: <CAF_dkJBQJSY_Fg5H=OcFHvio1-FcDEfgbKwhRmc=KhvdcnNAVg@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Tue, 26 May 2020 09:00:58 -0700
Message-ID: <CALLGbRK+4wNzMBnjWN3dar_WOSTR_UKDXRUZ03DHxQGZRuRvhQ@mail.gmail.com>
Subject: Re: Missing 2 blocks on my UBI partition
To: Patrick Doyle <wpdster@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_090137_436085_007BBF76 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 26, 2020 at 8:55 AM Patrick Doyle <wpdster@gmail.com> wrote:
>
> I'm curious to learn where 2 blocks went missing from my UBI NAND
> device... can anybody help me out:
>
> # ubinfo -a
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:57
> Present UBI devices:            ubi0
>
> ubi0
> Volumes count:                           8
> Logical eraseblock size:                 126976 bytes, 124.0 KiB
> Total amount of logical eraseblocks:     1024 (130023424 bytes, 124.0 MiB)
> Amount of available logical eraseblocks: 99 (12570624 bytes, 11.9 MiB)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       0
> Count of reserved physical eraseblocks:  20
> Current maximum erase counter value:     33
> Minimum input/output unit size:          2048 bytes
> Character device major/minor:            252:0
> Present volumes:                         0, 1, 2, 3, 4, 5, 6, 7
>
> Volume ID:   0 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        127 LEBs (16125952 bytes, 15.3 MiB)
> Data bytes:  16031744 bytes (15.2 MiB)
> State:       OK
> Name:        rootfs
> Character device major/minor: 252:1
> -----------------------------------
> Volume ID:   1 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        529 LEBs (67170304 bytes, 64.0 MiB)
> State:       OK
> Name:        persistent
> Character device major/minor: 252:2
> -----------------------------------
> Volume ID:   2 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        30 LEBs (3809280 bytes, 3.6 MiB)
> Data bytes:  3746638 bytes (3.5 MiB)
> State:       OK
> Name:        kernel
> Character device major/minor: 252:3
> -----------------------------------
> Volume ID:   3 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        143 LEBs (18157568 bytes, 17.3 MiB)
> Data bytes:  18145280 bytes (17.3 MiB)
> State:       OK
> Name:        old_rootfs
> Character device major/minor: 252:4
> -----------------------------------
> Volume ID:   4 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        30 LEBs (3809280 bytes, 3.6 MiB)
> Data bytes:  3745994 bytes (3.5 MiB)
> State:       OK
> Name:        old_kernel
> Character device major/minor: 252:5
> -----------------------------------
> Volume ID:   5 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        38 LEBs (4825088 bytes, 4.6 MiB)
> Data bytes:  4763648 bytes (4.5 MiB)
> State:       OK
> Name:        language
> Character device major/minor: 252:6
> -----------------------------------
> Volume ID:   6 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        1 LEBs (126976 bytes, 124.0 KiB)
> Data bytes:  65536 bytes (64.0 KiB)
> State:       OK
> Name:        crypto
> Character device major/minor: 252:7
> -----------------------------------
> Volume ID:   7 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        1 LEBs (126976 bytes, 124.0 KiB)
> Data bytes:  65536 bytes (64.0 KiB)
> State:       OK
> Name:        prev_crypto
> Character device major/minor: 252:8
>
> This shows that I have 8 UBI Volumes with sized as:
> Size:        127 LEBs (16125952 bytes, 15.3 MiB)
> Size:        529 LEBs (67170304 bytes, 64.0 MiB)
> Size:        30 LEBs (3809280 bytes, 3.6 MiB)
> Size:        143 LEBs (18157568 bytes, 17.3 MiB)
> Size:        30 LEBs (3809280 bytes, 3.6 MiB)
> Size:        38 LEBs (4825088 bytes, 4.6 MiB)
> Size:        1 LEBs (126976 bytes, 124.0 KiB)
> Size:        1 LEBs (126976 bytes, 124.0 KiB)
> Total: 899 LEBs
> There are 99 blocks free, 20 blocks reserved, and (according to the
> documentation, 4 blocks of UBI management overhead
>
> 899+99+20+4=1022
>
> But my NAND flash has 1024 blocks.  According to ubinfo, none of them
> are marked as bad.
>
> Where did the other 2 blocks go?
>
> What am I missing?
>

The last two blocks on the NAND are typically used as a Bad Block
Table by Linux.  I imagine this is likely where the last two blocks
"went". You should see a message about that in your dmesg.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
