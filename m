Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C0DC33CAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 22:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA15820728
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 22:47:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+tJqJke";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfWmSxJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA15820728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQkXLiVnGls7GXsauj+b2EZzRvmTbtY10HednxyePyU=; b=Q+tJqJkeNhhp0R
	6zRksUKK+bXOpJ+z3NGaO4CEBSGyKms1ZYNeDQc56XBheCVE1X5amPGgdwHou8VAwX7teRb4wZYH6
	Vuh0l+/237V8Emwd0QLOpgEnHYU0gWioBSegHLm9UsBzwgR9pOaXnEWTiYWMXLNBnG5Nr0HeICCDL
	sjvjw7XWJCQlHgc5yrdKZsL1mS470FVfxX4kj9THtrgJaPLhQ5I5D98/aSVNiY7qi6WOC/A0AYANq
	JlkejJjatKLzBqqZqmW09UhZ7BxyFEroppZDdFBZ4moET8fBa+uj2RJ+GGe5L622QHZuRFjH0dd2x
	x+C68+la03xFILxdRQ7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isDv5-0008Qu-1q; Thu, 16 Jan 2020 22:47:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isDv2-0008QW-HZ
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 22:47:17 +0000
Received: by mail-wr1-x441.google.com with SMTP id y17so20842883wrh.5
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 14:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zz0v2Mo/daZYkZwGjb2xSqQ1lz9vMHmlSDOGKHldj+Q=;
 b=pfWmSxJlOau+G4lzYR0qQdksl5kLiV3NZgjFVaNi79FMAsGsNHNYKFHVEk1ZCkEnwJ
 OsMOXndSVH9wXc9bvMc8F1BNNWCfkr3eiCozpWzc+2NDtMKouv2sBlLUrx6G7hETgso1
 f8TublLo+iNwAQOxA7sskIJaxCF+qUJtC0Z/QPjvbGkxF7JXIk5hOEwqv55wLQalmiJl
 8Y4gidbVTFZ8K8oQeEVoGr4G1ZXhiI08NFuK/PDGvlfVT+rcXJn95vlTrHNEmjVvlJCA
 D9IWRrRO0ax/q5Txe4dYTBsyaK+y2YvCbfCVEfhNRs43MBMCM2NL3hOU2wVJ1UDtbP1o
 urqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zz0v2Mo/daZYkZwGjb2xSqQ1lz9vMHmlSDOGKHldj+Q=;
 b=aAC6TT5HyKrV+VySe3MmkYY/cuD6gvzBC/M+CO8bLppc1lwqjNwgfVDn6NtGFeBMIk
 K/HNGrQkvk5i7KD/37/Oe5a9WXExngH4iVsrTx+y+qcrKZAARZYf3CPx6UtqdQRurhhb
 XG5JlWvN1EbFmBwlVeG40IuZ1Dvay337Ud4TqxbQCkZxizH5oJx0GuNZXQ1akOp+okp8
 kxPAAthxSC09CyuzlM53P+Z/XmzhSmWOv/nZkDYfv0/EPBjXJcyzNIyT/KbpBbGfpuDs
 BApzzwjKGYRH23nTdimYIFkIRaCsKfnKzxOgWejPPkB6qH5WK7Z4T5Thvh0EzHkdpcgA
 TmDg==
X-Gm-Message-State: APjAAAU/CIn6ZZM/2Wlm0Qv0VhirE5yoAiMogsMXoFArCkSlwg9d9fgD
 q1sQM33MSS6j1sn/2XY9+2J7S2gRG8LQ60t6lxQ=
X-Google-Smtp-Source: APXvYqxEyiwgWRg2PdTKpSKjsE3Jpbm2McamfODiL0fmySi+CP0lnBCpevOuK8C6S+ih4FSkHlNJrZ5gP+JBOo2Y/D0=
X-Received: by 2002:a5d:6441:: with SMTP id d1mr5589794wrw.93.1579214835154;
 Thu, 16 Jan 2020 14:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20191204100958.19938-1-s.hauer@pengutronix.de>
In-Reply-To: <20191204100958.19938-1-s.hauer@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 16 Jan 2020 23:47:04 +0100
Message-ID: <CAFLxGvyv=OMOSQSymMo0NTWpgGq_xnhGZgjyaXHeGtDsrwsYFQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix wrong memory allocation
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_144716_606048_F356EB80 
X-CRM114-Status: GOOD (  10.51  )
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
 Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 4, 2019 at 11:10 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> In create_default_filesystem() when we allocate the idx node we must use
> the idx_node_size we calculated just one line before, not tmp, which
> contains completely other data.
>
> Fixes: c4de6d7e4319 ("ubifs: Refactor create_default_filesystem()")
> Cc: stable@vger.kernel.org # v4.20+
> Reported-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Tested-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  fs/ubifs/sb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thank you, Sascha!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
