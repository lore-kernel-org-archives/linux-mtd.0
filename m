Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA24C04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 19:52:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C1BE21734
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 19:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ToiTqxod";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxL1m2dX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C1BE21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzKBe0Fumxus2538nfHpug2/Adh4qXn5cWhext+4+Vw=; b=ToiTqxodyVX3uM
	MfiwgPq8uIynK0moYtoGn8gO71V0tbIC7mlTaFWS3Lw11mGJU8Bid/p8QmwN/Yr0aUvfeYrIBs/0K
	Pe0keE/4+idOOVQRoopyS9iYYuWl9d6sfZK/b8J4v7mHt2W23CXwFckk+JYvw7I9Cs9Eg5HPKzVnI
	CBlGXdLh6S6V0mR/1Bq8f2ac0TODinnBuJrHZwGzHHM/6BT52DP8sXc1fqvIARO+6bZ6sbOEcAewN
	6nc5zdKAjOpy8wPDKNR7U3CXa5vLAQ9PnloNy0yiq76KEswUBq/4mBjaMf4z8BsQIfv7DHf7b9ENG
	MtCaf6wsAjJFAJSIFGQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOScI-00066H-KI; Wed, 08 May 2019 19:52:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOScF-00063l-54
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 19:52:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id h11so105313wmb.5
 for <linux-mtd@lists.infradead.org>; Wed, 08 May 2019 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oB/1thJSvfpF3k9iHuEARtLHOAtpxWNWmfqQwy8beMc=;
 b=UxL1m2dXngyHSLotIi8ABvDNL9treD6WhO/8/YC9qIIOei8rz5HqfVY7AazjZotqLQ
 PSLP+b/M293D6jaUj+beXitvkgbC4Eg+mQKYLd6321lrVoBNFg+pyU6tbAE0mpZ6FhDK
 q/U1oKb3ep5x5Zikf32ZvP0tZ5X4zvo3wMNYnoMIMQz0kj5NH7JyLNcJ4lcsM74Y8roK
 uPgBlmS8vQR1JjxbtWlmEutP8FZGU0QLchRXNs7YzBl2A1uLMgdbKJu43V2lWYyjXBUX
 ccjP2GTb14LpBsfsfLKZKufjwhDJ9bNcdYHVpv5OKuVCV15idD8diWL52zZ1GYuZpOhx
 yZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oB/1thJSvfpF3k9iHuEARtLHOAtpxWNWmfqQwy8beMc=;
 b=mvql+5Xh5UmBsK7Rq/qdh9znUO/4G2zMT8aq21dly424aQ0M2uwBb500OspmtbIWJt
 cZg+LeZkQkixdWPZocQz3e9D802ccEAVqLzdchbZ+LYA6xCrczTBLGULJztggbukkWa4
 3mI8pgbU/5cuikZjZ1ngZtrokAu+Xo+eEFoP3QUgAxyqo292m5emH3bIdoZ54jfe6Yl9
 SUBwbNTydB/HuCNvpv3nXMWJ526S2YQlLV/lnfjrLyNejS5IgIXMO7QupZrStv52liPb
 rHqwTwQU4nlfmBkvtYn8whKvdo+9M++iy7V2SwVd6fbEB+hVkvAeKnnoHo8iULuaJKNK
 VXDw==
X-Gm-Message-State: APjAAAXGSH3Ahslez/1bl2EmQ0NpugO/ReBimSs8z95ingy14IpanOei
 tTZ0v6SHyY3vOlqQ157BLQawixI7ICZ3BiqdL5k=
X-Google-Smtp-Source: APXvYqwE5SgKy3KzwMaP+JL2avwu8RoCxmdrROcUd664E2XBGvOBHkeVwxPGLSrkgLhmIMcM4oEOrZvFoASSU8i58f4=
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr45309wmt.10.1557345150050;
 Wed, 08 May 2019 12:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK3Qp=Xr_XyDZMCoDL6fDAb58+e_Hi9ErgnT-yLbAmbSpzc8TA@mail.gmail.com>
In-Reply-To: <CAK3Qp=Xr_XyDZMCoDL6fDAb58+e_Hi9ErgnT-yLbAmbSpzc8TA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 8 May 2019 21:52:18 +0200
Message-ID: <CAFLxGvx2K8kTiUuqpWU2L2_Z6=C5Du8bM2F+YJ2Y4Y5K=pDjrA@mail.gmail.com>
Subject: Re: Question: Appending data to a file is optimally handled by UBIFS?
To: Fernando AE <fernando.ae2017@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_125235_192464_E1F2DFA1 
X-CRM114-Status: GOOD (  12.03  )
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

On Wed, May 8, 2019 at 6:28 PM Fernando AE <fernando.ae2017@gmail.com> wrote:
>
> Hello,
>
> I'm working with a UBI and UBIFS in a NAND flash with 2kB pages and
> 128 kB blocks.
>
> My app is periodically appending 16 bytes to a file. I'm wondering if
> UBIFS and/or underlying drivers will also append data to the same
> flash page or if a new page must be allocated every time.
>
> I'm aware that the kernel will buffer data in RAM before syncing to
> the flash. In any case, assume that a fsync happens after each append.

If you sync after every write, you make it hard for UBIFS, and yes it will
waste always at least one "min io" unit which is a page on NAND.
You also force UBIFS to write inodes and waste even more space by
syncing that often.

In theory UBIFS could try to write only sub-pages but that's usually
slower than writing
a whole page. But that depends a lot on your NAND and the NAND
controller you are using.
That's why UBI is using sub-pages only internally for EC and VID headers.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
