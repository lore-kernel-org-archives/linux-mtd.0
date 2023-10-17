Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C6ACDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDe9fnYcayWM5fkv6WARrpNqkyAJ0yS2uTewW8qrW1g=; b=LmONh99g9eeGa1
	37eoVl5pLwLN5RojkWKxw4R24fKubFXgYrRXlrTk7UrOrjQRxFRYEje5f68xHN4wEXfq/v4/qHAkC
	Ky4NPp7en2pdt8uSqU7a2M7ajMysjyNrq9pfA+5BJquieuD9xC70WjkJAeQYRukf13U6BqaJePtVD
	4oIVkab2131t3+MRwS/Kk937nicFObo8/M6L3C+XUBUvQbvDcnMb4TriW5IQBEbaPvHPHvzlwxYji
	2WsoP0j/jHjuRZeyidXO6UAKpPH5xOsld0PRst73+FEZjZAKB8aGlFZCKsLS3vHE0srZwX7/YYHZ9
	ZsoNMxt/FQas/Ac4i6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsh4P-00Bwny-1C;
	Tue, 17 Oct 2023 10:13:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsh4M-00Bwko-1V
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 10:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A79D4CE1C7B;
	Tue, 17 Oct 2023 10:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CDBC433C8;
	Tue, 17 Oct 2023 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697537573;
	bh=Zlx2XnWkC2uDaFTgV31OZCFmZ49Wa11mGKzqbUEH9s8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ObXMhKfTd0oHvHv1oBhxOvYU18wRwO8tVkGurqZdsFBhsrILaWi23e0lL27H2e5o0
	 7IS0XfToFdn8yk6jDBci4M9/JpFli+51+Wg4zZLDfyqmEkSbnb5Z85rM4xurRp618F
	 Ns7GdRldhJMqHA+NT1FFF0neCPcjqucWhPV2AaUlLVb6NfNqDpl4QfeyDlhkHi3qlU
	 1Nz7FjNK+bIbhIwsrMNQm9r8r+WoGSaHvjpq6tK7aEkAr3WxWuNzquO4LLD4qCbFBk
	 9KSNpr2uTO6wxr4RdkTAuGz6cjHqg8hnexuCDikVg5k45hKj0oLiaEBE4+F3v8CRyP
	 7oeqW+ixrYVFA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: liao jaime <jaimeliao.tw@gmail.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org,  miquel.raynal@bootlin.com,
  leoyu@mxic.com.tw,  jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <8b19eae720f0e0a8285993f3627eeff7@walle.cc> (Michael Walle's
	message of "Fri, 13 Oct 2023 11:04:04 +0200")
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
	<20230908064304.27757-2-jaimeliao.tw@gmail.com>
	<b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
	<mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
	<54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org>
	<29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
	<b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
	<cdd8fb4d9261892345588388a5de262f@walle.cc>
	<CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
	<5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc>
	<CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
	<8ec055f3a5bb69e6d72d4f4c5c7946bf@walle.cc>
	<CAAQoYRnYQBXPX59u3y7_Omz1qW=XuqGi8dy6trzfJXGTA_QCqQ@mail.gmail.com>
	<8b19eae720f0e0a8285993f3627eeff7@walle.cc>
Date: Tue, 17 Oct 2023 12:12:51 +0200
Message-ID: <mafs0r0ltmuak.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_031258_701425_ECBC9603 
X-CRM114-Status: GOOD (  13.13  )
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

On Fri, Oct 13 2023, Michael Walle wrote:

> Hi,
>
> Am 2023-10-13 10:23, schrieb liao jaime:
[...]
>>> I'm wrong - the data strobe signal is optional.
>> As I know, data strobe signal is needed when 8D-8D-8D mode.
>> Infineon data strobe signal called "DS".
>> Macronix and Micron data strobe signal called "DQS"
>
> Maybe Pratyush can help here. But as far as I know, the data strobe
> is optional. E.g. on a layerscape ls1028 you can use an internal dummy
> strobe if it's not connected. The timing is then determined by pad
> delays.

Correct. The data strobe is optional and the controller does not have to
use it. Though for higher frequencies, it is usually needed to sample
the data lines at the right time -- given the time window to do so is
smaller and more precision is required.

For example, see my patch here [0] which enabled DQS sampling for PHY
reads since those are higher frequency. Since that patch has not yet
made it to mainline, currently the Cadence Quadspi driver does not use
DQS and still works fine with 8D-8D-8D mode. It does so based on its
hard-coded delays in device tree [1] (see cdns,read-delay).

[0] https://lore.kernel.org/linux-mtd/20210311191216.7363-5-p.yadav@ti.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
