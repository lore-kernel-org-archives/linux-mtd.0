Return-Path: <SRS0=WWUw=ZN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA77C432C0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2019 19:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089CC20672
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2019 19:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C5Yvk1qA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 089CC20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofQ7czjOgdgFrYubaGi765Ze4l6FwTf4RrEpDeKINwk=; b=C5Yvk1qAFiZc9S
	BVOX/yeouSx45PxUvyGqptUVcpS9pT+bqoIJJkU1YMsA+0tURpy6uFqz1k3cX3ge9rBjN4rWWvT7Z
	vIaor1zppi0Toe12uxP21FPdIIXbKmNoBk/47yhU+oy5qpQADzD/NvZTrSZw+Yr9BB+834KxBGWBJ
	3neSMWfAm4hKTtm+/gEm+oOsIIKDs24uJGD9cQCPSRyN6vDHxh21A8SOU8eNGM9T+8lXtB2WCsYNg
	YmoQvYlhXgTekQb7CDdnwjjAAKiDd9puxZkULtDsH8s9ZzYPN+aL1EH6yxLyZMnyo4pTKZjVX1XOf
	aO8euSBcMZz0XolT2ugA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXsH8-0002Az-8A; Thu, 21 Nov 2019 19:37:58 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXsGx-00021r-Ka; Thu, 21 Nov 2019 19:37:48 +0000
Received: by mail-oi1-f196.google.com with SMTP id m193so4342251oig.0;
 Thu, 21 Nov 2019 11:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tMER4MOHixp2wY9ZjS4RrN2RrDNX7H+o1z/zXkM48ZU=;
 b=XaUzvB4OBBh6WGpG1rsulZ6wBvYE0BZSYrU9epoToS0VrT8rZBKZRr96px5Tuk0Cw8
 Y6UMQjg/UQzNSr2SfjNnkEGclyTGyv9m1c8r4ITbmmlQ8/xv8JpX5PqLg+aSiHnGK1WF
 Yw+Vr52c9G6b1MOWbNGIH7hb+dYM3bWqSUDarIQfBp0Oz+ZfR26Ng+NSiPuiz44Q79d6
 aIJiD3xukhVvh2FVjJmkJSAyG2DxsgTdkR5Hum6atTlBpv6yWgpv3A5T3UHszYCvIrZV
 nULjvWu4kMtYg4VI3JfBBafuHw/THOZ75Zwyq8t9I0Yek94SCssovo4CJMvkvh2EPlZS
 ZB1w==
X-Gm-Message-State: APjAAAUWxkrRhbFum0vFtnsO4jgMQ2wSRj8hWTcynDW60aVFCn7q0Nip
 Pdjd++I59UGHD6Pqe+YRSQ==
X-Google-Smtp-Source: APXvYqxz3r1XfhG46Xqzohy//cfJAs84lDW7vsquvPUXB2FPHrRH/1ETgZRryOu7acvqdws+X02tgA==
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr8823046oia.148.1574365065094; 
 Thu, 21 Nov 2019 11:37:45 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e88sm1305777ote.39.2019.11.21.11.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 11:37:44 -0800 (PST)
Date: Thu, 21 Nov 2019 13:37:43 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] dt-bindings: mtd: Convert stm32 fmc2-nand bindings to
 json-schema
Message-ID: <20191121193743.GA3627@bogus>
References: <20191121130615.13007-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121130615.13007-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_113747_672297_FDCA1817 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Benjamin Gaignard <benjamin.gaignard@st.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Nov 2019 14:06:15 +0100, Benjamin Gaignard wrote:
> Convert the STM32 fmc2-nand binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> CC: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../bindings/mtd/st,stm32-fmc2-nand.yaml           | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 --------------
>  2 files changed, 98 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> 

Applied, thanks.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
