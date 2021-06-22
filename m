Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A951C2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 08:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B3896113D
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 08:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B3896113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KYepgTLzB3Vv7vtxaA6/e/RmdiYw2hUnZakbSsM0A1c=; b=eCtQ4Sq/Hcrel5cSuXQ8jkr6ul
	DZkLi9bLE+brPLuYIW2+5iAyE7IcB4f4K/uTRbSMGA+oMQHHGedG3PiMRrcpfdm7EYbOEcr7yel7g
	2ycf3X3kJHzKGmZ7MNXuDgCcARnNdGZaSymtef3LXBmJq7xsEkd9U38ury1WURJIk2w74j+ScG0me
	qO5QIbhrxzWpZNvG0m7mLtbgQOWe2Ic0R6VO+tXXVc7mSfCCUAWUWJiG0Nbk731y8gyVy9Y2mhcH7
	ltdyi6UkkL7hZ655gCsRAs4RiW/CqZB9Ecfwpfz/RE2mEnXZC4K1Qm11as4X6OxPM91h+x/VdJjJs
	4FBFEafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcBb-006JLh-4Q; Tue, 22 Jun 2021 08:55:11 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcBY-006JKz-0G
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 08:55:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id gt18so33251095ejc.11
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2021 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QNv8ctZHL3I0Bdx3jfIEMpEIo4PzBtM6ldvPOtODEsc=;
 b=Zlp6O7cHMai+Zxr953kkw/Q5oB73aktnr0pCVPE2jrHox9K/rha+/a33PjGASHV0Bo
 67baSeWKzP6XMjZAXFSLup+lRXOs2t+p2uV7tzKLNaELQcV2NvvLhrPz93p/pmJeZaZs
 CqGwgngsEb0EtnElgF/xA5tnkMIhhh2zJZNNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QNv8ctZHL3I0Bdx3jfIEMpEIo4PzBtM6ldvPOtODEsc=;
 b=R0xPPJkTmedbJxZW1WhhDYenWE1Re/AqKSicOlzT6Dzx1LYEiqrb4u8uhEcNS6QHzl
 rXNRAYaXE4H8AIZSMxll4+htqJ5rg2jQkvgd2Kmwh0vJxtgxRmjyZtAtB6oxzKHxqzWD
 CoWlbo9874v+T1b67ZquW1W9cETxxIkUGKZXSqkIk62N4br671S2n1HOt00v72HwZsO1
 VFnPqVEv3KQOcqdxiWriEMKyH6O5jHGKxzyHbACUUmxPsyPTjHfMnHxLKq1Pi8h6Qr80
 F0AKnb4Alglq8HJDD5bcqRkjtovIIZsvDZsdpQPJ6QiPiX3z5Sc+uhyGzxBQMtyzxaJS
 puNg==
X-Gm-Message-State: AOAM531Gfe5L4DNx0ziRiYWdUP9jl1o/BhPp0i4Bnkpu5Tcx5UUPX64G
 e1wrUfsopXEgniZ82y09uHNeKw==
X-Google-Smtp-Source: ABdhPJxBRq70yBv9Yg9ALotw2ABIGCn6WPamqtFqas0QX6t9fGtCxfyOXaWeblhAH9L5QWAaS0FPfA==
X-Received: by 2002:a17:907:2651:: with SMTP id
 ar17mr2852614ejc.135.1624352106079; 
 Tue, 22 Jun 2021 01:55:06 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id o20sm11676602eds.20.2021.06.22.01.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 01:55:05 -0700 (PDT)
Subject: Re: [RFC 0/3] mtd: spi-nor: dealing with reused JEDEC id c22016
To: linux-mtd@lists.infradead.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <590b0adb-612e-c20d-4c86-cb7dbb16d346@rasmusvillemoes.dk>
Date: Tue, 22 Jun 2021 10:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_015508_281455_9410BFBA 
X-CRM114-Status: GOOD (  23.96  )
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

On 21/06/2021 17.23, Rasmus Villemoes wrote:
> We use the Macronix chip mx25l3233f in a number of
> products.
> 
> Unfortunately, it has the same JEDEC id as another chip which is
> already listed in macronix_parts[]. Since that other one does not
> support SFDP, and its data sheet warns against issuing commands not
> explicitly listed, we can't just do RDSFDP anyway and decide that it's
> an mx25l3205d when the chip returns garbage.
> 
> For lack of better alternative, start allowing multiple entries with
> the same JEDEC id in the parts tables. That allows a correctly written
> device tree to specify the right chip, without being overruled by the
> "JEDEC knows better" heuristic, while being backwards-compatible (as
> long as new chips with recycled ids get added after the existing
> ones).
> 
> While a step forward, this isn't quite a complete solution for our case:
> 
> Some of our platforms are based on LS1021A, thus using the
> spi-fsl-qspi driver. Back in the 4.19 kernel, when the driver was
> fsl-quadspi, we couldn't get the flash recognized unless we
> monkey-patch-replaced the mx25l3205d entry with the mx25l3233f one
> (i.e. added the SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ bits) - we'd
> fail in spi_nor_select_read() because
> shared_hwcaps&SNOR_HWCAPS_READ_MASK would be empty. In contrast, with
> current master, the chip works with or without the third patch in this
> series, i.e. whether it is detected as a mx25l3205d or mx25l3233f. But
> the read performance is ~3 times worse than in our patched 4.19 - I
> haven't quite figured out why quad read doesn't seem to be used or
> work.

Sorry about that last part, that's a PEBKAC. Adding proper
spi-rx-bus-width = <4> properties to DT got the performance back to what
it used to be.

However, I still do need the flashes to be recognized as mx25l3233f and
not mx25l3205d.

Rasmus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
