Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C07C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 16:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159246103A
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 16:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 159246103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncev+fAZHLRFB+csddi6CZgaXA8LzN7MHOCWd/efrII=; b=cUlxqHxBE5li5M
	boFY8siv+cxwZyZ/vjy3yj+IPJXMvc+kMeW8LeX/gsUzzJsf5rTK/v0bky8OMaSJU8+J29v0syJin
	gM5gVWw4ywoC6ha0IMmju43bLf7L0b7A82vV0fvyJA9rS3vdYlaIHnpeFkleYBngqNzhQHmiuKeHK
	+sns4psv45nmxZRhJiGstknLcOjRJPd8CJbOrzHHxrk9Ub+eYHu0T5g02+SLUXgC8r/QpRxeWiWhg
	chUs5DIxh0rmUwfhjL1j1hh12eHmc8154PBpEd+X/GI6AUsRsNP99SQfDOu+QEvu68FpInGDSCV3j
	eiOw7C2FWBS5TSDZGA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZnQ-00BGWn-Js; Fri, 12 Nov 2021 16:53:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZnO-00BGVw-5U
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 16:52:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72AFA61056
 for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2021 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636735977;
 bh=ayTNUIk6TIl82rv3BreaDM/dQMtYOu5c3Q5uMvQ1Wj4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZKFkyq5Kvpv0qMn1FFRSzygnvIzPCO3DpokqTfCTj7Xnm8UopINNasLX3UjpbSvyi
 fvrRCbd5kqO37d7d1LeuZ63g1SuIHXIV+DCjWuF6FlMAT/884AMV0PM/UsHkm7OIia
 iobR/QagUFeNpJasCy2bSNX3w1Zx927WmFH39namU94V58aQm7rapdkVyHeR0ycjtE
 Dujz4261khCp4I4Uya3FM+vQLaz460sjvYJanknUkHo2BEEPcBR9MryiVi6RQ3jiBz
 eBLOS5qMBYUWvzhuJfqc7n9RVfMB+MPOmc1NkMdcmD4gslDFMVBRXBZXdOGtdgahbH
 ajZWbxwUdt9qQ==
Received: by mail-qv1-f44.google.com with SMTP id s9so6651861qvk.12
 for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2021 08:52:57 -0800 (PST)
X-Gm-Message-State: AOAM531ltYPj14ddNZ4zfexi4Kg8w/UmbfZzZ9OxCMyeUz/XBOrsxaSb
 ShYdP0kOHC7VHKjZqv03cd796ogRDbhw5DO8rQ==
X-Google-Smtp-Source: ABdhPJx7hhG54lsgYFTa6wx9FXvUSqJOrNwO5HlpC6ZRJoQDR6e8SNqKYNbTXDnhkyu4QwsfydlynJjYeCqrG9t5T3U=
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr15926606qvb.5.1636735976586; 
 Fri, 12 Nov 2021 08:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211112152411.818321-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211112152411.818321-2-miquel.raynal@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 12 Nov 2021 10:52:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5A3RfvzRy+7+9OhyPv8sdU1ars2Jso-RyhDwrUqMb2A@mail.gmail.com>
Message-ID: <CAL_JsqL5A3RfvzRy+7+9OhyPv8sdU1ars2Jso-RyhDwrUqMb2A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] spi: dt-bindings: Allow describing flashes with
 two CS
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_085258_259727_CF2B0D43 
X-CRM114-Status: GOOD (  21.74  )
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

On Fri, Nov 12, 2021 at 9:24 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> The Xilinx QSPI controller has two advanced modes which allow the
> controller to behave differently and consider two flashes as one single
> storage.
>
> One of these two modes is quite complex to support from a binding point
> of view and is the dual parallel memories. In this mode, each byte of
> data is stored in both devices: the even bits in one, the odd bits in
> the other. The split is automatically handled by the QSPI controller and
> is transparent for the user.
>
> The other mode is simpler to support, it is called dual stacked
> memories. The controller shares the same SPI bus but each of the devices
> contain half of the data. Once in this mode, the controller does not
> follow CS requests but instead internally wires the two CSlevels with
> the value of the most significant address bit.
>
> Supporting these two modes will involve core changes which include the
> possibility of providing two CS for a single SPI device.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/spi/spi-controller.yaml          |  6 ++---

Needs to go to dt list...

>  scripts/dtc/checks.c                          | 24 ++++++++++++-------

We don't take changes to dtc in the kernel. It must go to upstream
first and then we sync it.

>  2 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 8246891602e7..51877b637bfe 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -20,7 +20,7 @@ properties:
>      pattern: "^spi(@.*|-[0-9a-f])*$"
>
>    "#address-cells":
> -    enum: [0, 1]
> +    enum: [0, 1, 2]

A single 'device' with 2 chip-selects would be 2 'reg' entries, not 2
address cells. 2 address cells would be a chip-select plus some other
data needed to access the device. Sounds like your case is the former.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
