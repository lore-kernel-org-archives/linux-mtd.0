Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EE9C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 00:16:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE83F64DB1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 00:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE83F64DB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8VVt6h6OKdPLyu42P+oSYrR7/bXMn2Dzw/Ar8nxMtus=; b=VevmuMsgIL1m+YsSsJCm7iHcV
	Rh4ZE4jqo59OlaUVyTgQVrGpp+N/j7RUpTQ5vBeVEggvYSeDsGvO9pDpkc52CdeVWiERD0fFR1Qk0
	D8QX/8fuLh49YA4vcvjI9avHZhTgAKPGElCyfUANYGkf+osbxzR6rB69Z5BRtLi4RjKIh9P1xfqP3
	9BjGD5rBcD/Bu9Ung8xoLEyIQPy/whs8Id3KNs/qmHak4b/2OaP/GXyICqILd45s09+btDpBmw/I9
	YmIgFXXbyYzO+7ELSps0nTLRF8ayAby7DXLkxyiZzbw+jtzhipVzzj+Pm9kKTGbFR7ZeFznvKKlVF
	sodxeRP0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lELMS-00056W-IC; Tue, 23 Feb 2021 00:15:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lELMN-00055X-Cr; Tue, 23 Feb 2021 00:15:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D39A464E41;
 Tue, 23 Feb 2021 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614039325;
 bh=yuNOWr6epIq3Wlud5uP8xIKIBMjJK2yn5SDZKLuyorc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nrrOAOWhfAxrqBqW6zdUQ9AYIhXMj3+rx9v9TXWmfsANW/laPnDNqyAGxGTEZ98RN
 +AnwrVg8CwGgPxmGewY3V00oZ6sagoiACyRiUTbAKleHSpewk104VyuffC91Gx3KI+
 InO2coU3mvrT+Vb9pt+FMJuYz+TXXuTZ4IxvTiprbhlbHAf9VdjhSZ71muJhOg49x+
 KW1qwApz6TQAf7yId7JjVQdwgOFUURqz3JgkNQmBYODVCAIZhyR2DaoJ/xULqHaHDc
 FSaK/55HNWEbzWeCgQU8lXn0D72Htt62P/h7TWn/pqHr2/junFYpgUUl9+GE+31M0S
 H5ymCZqDOdQkQ==
Received: by mail-ed1-f46.google.com with SMTP id l12so24114646edt.3;
 Mon, 22 Feb 2021 16:15:24 -0800 (PST)
X-Gm-Message-State: AOAM532gcWobYkAS3xwxn3XkQdlUHTRFz+1cERkBxcoLzRUyj4Jt4JgN
 rmgBfhk8visV75VybasPlj9QPcLHV6tDcbc1Dw==
X-Google-Smtp-Source: ABdhPJxC1NKoxwxD2oa+gmcOFlIXozbx4BR9iOXurfi4O1cDdre+NLJfpRIzrex8warqlYx35YmdXAQJQ76fqo/y0Jc=
X-Received: by 2002:a05:6402:164e:: with SMTP id
 s14mr12469239edx.62.1614039323392; 
 Mon, 22 Feb 2021 16:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-6-sebastian.reichel@collabora.com>
In-Reply-To: <20210222171247.97609-6-sebastian.reichel@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 22 Feb 2021 18:15:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Message-ID: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Subject: Re: [PATCHv1 5/6] dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_191527_521025_CA2F1CFA 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
 Collabora Kernel ML <kernel@collabora.com>, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 11:13 AM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> The binding is already used by the driver. Update documentation
> accordingly.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)

This is now DT schema format. Landed in Linus' tree today.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
