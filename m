Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C0DF557FA
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2026 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujHKOme7yF7QbqaKMfzSJR0Jf4R3sU2st5nANF23Vas=; b=aVRA9Y6GDtx+e8
	OmSUZchTKLdoN55QdPjTPiFAJopsFelojMmlnfl61Ta9r31i6rB+hi1w0ydrUpnV4JZ39NbdRfH8p
	sffFeSJOhPF2yX7D15G0k2Klh5OxlN7cu7twRCFD3j6EwjaDXicvl/NCLSauQHYWh9tHoHkITAT74
	YKHx84PZCjDnrpY4smq5P48SY8mLMAE/F1F/iWIq5OYhTdJg1DUvLokZaG/bNx2GXdS+wGRAkKPge
	ccdKQljG9gUFwtjUsvMin9kpulp7C9yOpk0ytTGbQeN7rzSE9swldU062drRxI4yEzwJYwUbeJOr0
	CJqK5Iw4X8I+qyMGSM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEl8x-00000006gu4-1IZ9;
	Mon, 20 Apr 2026 09:42:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEl8u-00000006gtX-0fg2
	for linux-mtd@lists.infradead.org;
	Mon, 20 Apr 2026 09:42:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so5369665e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2026 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776678129; x=1777282929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVj2E0kR9vgM3fFufU475XcX4Uh+G31rNfkdN/woTQg=;
        b=XAGIblxOHwn4MSQawThLhhbpT2UuYZai269czQThzlo/NR08TcYuVin6X0A/zBwwN4
         /VQfcL3UXttuMKZXZQkdwlkvf9MTILBDMIsZ3UV86NSAUgVYdpyRntATwDXGpdL8a3K+
         uuYfInxEI0Rgd0ut/PzWUXDVXCODj/Et9J6OPrEZfuNisPRcYHfgjlZ4GrelJvciaIne
         WmrFYmTX3N2CJiacLkyWVIshpXsvOXpSEAolMxIGLyV910rAH5xW4zimkZuT1F2HLq13
         usGzF3NjYbvcuImrmE+9Rg+ve8X2hfigd3h61RhJuZOU1Q7l8I1EmsujHmtE3SL9jWtm
         Lq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678129; x=1777282929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVj2E0kR9vgM3fFufU475XcX4Uh+G31rNfkdN/woTQg=;
        b=jKrsAXG2mcyC2FBImIFUHCsgNFsw60MO+h/7Cf6ET5Pv/DzwPtp7Bz3Qs800VwMTIY
         O1Fc2mHyfq+aE+tkRvxcx4x+u77g0IbtRNelG28nB94aB0RrwoPx4tahWFAiFTWIhpBN
         7L2P3Rxpk7gbLuUzA+oe4tIy6Qapl7tLF6iJZ8N4pq5udXX9hihGB5vGn6IF7OfbNHGp
         lJo5y5qdQK/GzXrsYwuX1gzXnYRNFj4aYSugqr98HzCCLmRr5nxIyfq2U75FQEckQG5L
         llC71PbzcQPYkMbMTdRM4Ze5GLiqAd/87fw+p3qZP7Iek3IFhemivuQtF4LlgtkmnE6v
         CO+A==
X-Forwarded-Encrypted: i=1; AFNElJ/ZpUYsvmAVCpunNwxYeFJ4TLpBNQeD98UT84yTZRBCAr/c1EpZCB53N9j/oAEHi3j1263DpGBZyF0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDjpsUj9Sl+6U4cbl37SYiDbrBVMraXGiz4t5pxKt+7O0ZUz6i
	/6aU1ecqHg791Y3jChTzLm8LY75Kdac5dACT21Y2HERHOppWf81o1gs6c1zsK8maTlU=
X-Gm-Gg: AeBDiet6bRWrS+2S4bPxigbm8rpxJVhiI6VNI0WONnIG2n1hBVW4SsXQQGjBIlXt5rM
	k/XNzLaKUlh82x42MrOtSDn3AQ1TX0Ik/jYe9PvksRa0R+mAMaowzHC1OfAXaU1ggMsSHG0Jf8q
	tIi6FLX0JUHNEIEmbxMGegtuLC/cjWSRAxv/cT6Xv1eRWPshWQ72ZjCpYcOUidyjUWs8TQd0gUa
	7bfkva8t1TVzpo4qgdwNNnKGLupO9UsEn4BJrC6NJ2ls/ZVb3kUMTfcT6Ljhkhn8GPYhqZOafg9
	v9BJVa2hPtQTvAwHLGAyx+bBQJa/K8oxkPcWMS++wZacHoFnpjgxM4p766fC2IQPM39UbIUYMNE
	bo45jU/URpU7p9cW4hcY/WdImoYWaGfo+nR04fVlsJrQStkFI9nmLCMKF1U7e17q2Uy3skGDIBq
	05PO75Jg3XqE1UhIPfFBmb1SE4Q/X29R5COk/E4AiqFw==
X-Received: by 2002:a05:600c:4895:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-488ffad67f4mr78373285e9.19.1776678129400;
        Mon, 20 Apr 2026 02:42:09 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm31101696f8f.37.2026.04.20.02.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:42:09 -0700 (PDT)
Message-ID: <19592fee-979e-4b94-89a1-76581c95b877@linaro.org>
Date: Mon, 20 Apr 2026 12:42:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for GD25LQ255E
To: Michael Walle <mwalle@kernel.org>,
 Weimin Wu <wuweimin@huaqin.corp-partner.google.com>,
 takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
 <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_024212_284205_F50D10E3 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
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



On 4/20/26 10:57 AM, Michael Walle wrote:
> +		/* gd25lb256 */
please clarify the name:

https://sashiko.dev/#/patchset/20260418084253.792395-1-wuweimin%40huaqin.corp-partner.google.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
