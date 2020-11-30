Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA7C64E8A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 01:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E5920757
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 01:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSKCK5+F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhQ93Mbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93E5920757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uGojeCB2waZNFPY1nGNFaqnHqItyERup76PfSKH766A=; b=XSKCK5+FUFzpOiMdB/6ZZnRAA
	4lQbQIUapr9XkAet5XXX4kyvaw9qcrjqMm+GBeM9nUvike7a+OquCzq8jCNuWB3fdHpKSyHfIybj5
	/6MB5JGkqBiEgaqFQyIGafKsqwp4QUtG3VpMQvFqccMVgYWcCRtK9iMy1uXLPOlE0jjD3J99bP895
	FbGguasaJg5IDBGyfexpq/RPLdWNsxTvQbR0r7nexqZ39XogSv0THN/871UlOxUPyisX54FAO8+k4
	z+cbYeH5qLMIWSp/DvdmUtlwMCHG4mBOKzJgsaPo/UXb7ZfdxwT4h4hOYtBPs1o89StWOSdxrDDdw
	fwedPVMJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjXff-0000Lv-Dz; Mon, 30 Nov 2020 01:08:03 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjXfc-0000LS-W6
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 01:08:01 +0000
Received: by mail-qk1-x744.google.com with SMTP id z188so9499561qke.9
 for <linux-mtd@lists.infradead.org>; Sun, 29 Nov 2020 17:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xjaJj/+V44rM5puGWKUGcQG9adY+YUNjT6YsqXFhits=;
 b=MhQ93MbbIB95Ftf3Fw6qW8TgoKtkwEMUNjig/ePmXaSdN1yotlCV8FzqEPpoFhu9st
 nAiLG94QllClf+OmHhg7gOSfx+caw8Ull/hC9axUmX4Pz4J68SQp1AfrRlLa3Slakst0
 QYHKZ6BuXLCClw7DcVBJO+2+SZUnhkTfpBBN5G2nRETobluXAcrjbGmFuwsNQ8ddR8y/
 6jXWV3R9V/DcPg9qZ/O7KyWwO5kD3tacJ0U0597WH8E3WC1GndfsNjxXbHQO910gjZhC
 SjDkNiSnPfJ5zf4UXCqTDIxuzGZkklPLzf3RsHgOSQ5eNqBnsVpJ8ySef/1gqSD0Fz2M
 xmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xjaJj/+V44rM5puGWKUGcQG9adY+YUNjT6YsqXFhits=;
 b=RtD8/VZg5/rWAcmNA+2f7IL2ar53SRcTGc4KgxmCn/9ZLo0f8YKED0x4mnQC/XPmEr
 ag3qOIXJeRXiZ6mpsPo4AD35Ak2T/hj2wkixc4DAN06ql2N/RqgKl/8ZMEOn5Vf2wpg6
 U9BRFlKdv07r33ueKOoS5DKeDfRNv4Q9tBK+8Yu1zyQEOg1vxQyQRyk16y/PIyZ7Slkt
 yA+H1LzHCkFa6wrEM/UlwEvjWF1VW38EmL4tdW/hBGifiLJTvyPuIRoAhyuboK3jCPn3
 Q24iDTmDy384i2Xiez23ArKx3TJxTazE//aWW2LY3FqNu254CIeknPfnfJd+9P1hACsv
 77kQ==
X-Gm-Message-State: AOAM531ApS/HSzRm2z5o8ZA+vRfkgezi4wWoSJ0o9Ek7eBDjZYfeFq+W
 cQcd4EZ4IRCr6cuf/1I+7SFdOLmM6VU=
X-Google-Smtp-Source: ABdhPJxSXTCmVLRGe0UbiAS4ttpe7U/JwCHvzDP8C2S2RTU9o7sJU0lkxTcESw9I76rU794R6Fa9zg==
X-Received: by 2002:a37:e20d:: with SMTP id g13mr20453257qki.325.1606698477548; 
 Sun, 29 Nov 2020 17:07:57 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id o8sm14006804qtm.9.2020.11.29.17.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 17:07:56 -0800 (PST)
Date: Sun, 29 Nov 2020 18:07:55 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 17/19] mtd: rawnand: r852: Move the ECC initialization to
 ->attach_chip()
Message-ID: <20201130010755.GA1956350@ubuntu-m3-large-x86>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
 <20201113123424.32233-18-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113123424.32233-18-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_200801_074047_4AE21908 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 01:34:22PM +0100, Miquel Raynal wrote:
> The probe function is only supposed to initialize the controller
> hardware but not the ECC engine. Indeed, we don't know anything about
> the NAND chip(s) at this stage. Let's move the logic initializing the
> ECC engine, even pretty simple, to the ->attach_chip() hook which gets
> called during nand_scan() routine, after the NAND chip discovery. As
> the previously mentioned logic is supposed to parse the DT for us, it
> is likely that the chip->ecc.* entries be overwritten. So let's avoid
> this by moving these lines to ->attach_chip().
> 
> Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>

Just as a heads up, this patch was applied to mtd/fixes as
commit 7ef969a04228 ("mtd: rawnand: r852: Move the ECC
initialization to ->attach_chip()") but it appears to also be applied to
nand/next as commit 0c2b69f55132 ("mtd: rawnand: r852: Move the ECC
initialization to ->attach_chip()"), where due to its mismerged nature,
it causes a clang warning:

../drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'dev' is uninitialized when used here [-Wuninitialized]
        nand_controller_init(&dev->controller);
                              ^~~
../drivers/mtd/nand/raw/r852.c:847:25: note: initialize the variable 'dev' to silence this warning
        struct r852_device *dev;
                               ^
                                = NULL
1 warning generated.

Cheers,
Nathan Chancellor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
