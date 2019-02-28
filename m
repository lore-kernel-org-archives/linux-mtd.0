Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05886C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 18:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06532070B
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 18:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O9PVF7yG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06532070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2+jVErGlmss/IIGHzl/4P3scDHT6MmUb0nUw2IJO38=; b=O9PVF7yGDhT6bO
	VEdtRPoEu3HD1g+9a0ZsLDcESIWEG2kQUIsda0dU3HUiSWzTQwb3N0rKGB+AUbS33y6PEpK9LLX9D
	LQQeIam/U60ORkjF9lz5VNhMiYQMZ8CpGvgCn7Pt/VHTCFXctu8jH8d3BUOZKM1k0vdW7Ia6Z0DAD
	OKv3qk/31cZtG8L6oSWdOGR2OzlocvGAWdRC+LPDo6JsGi58Yn1ofMQxMHOanX8ZduT+gx1RgNTqI
	x7ifEt70zRYxnpv2/EUl5eaYm2rTwOzub7/dEOP4771u3+KkHTuWNeC0SycTlkN3b2OwHSk4jcgpn
	nhsrjLATYlovIYn/Uyug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzQM0-00013S-9f; Thu, 28 Feb 2019 18:24:20 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzQLr-0000v9-Vs; Thu, 28 Feb 2019 18:24:13 +0000
Received: by mail-ot1-f65.google.com with SMTP id t7so18529161otk.8;
 Thu, 28 Feb 2019 10:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ucn6HmMNAstPj8g03QkHR9PsQlpdzwekMb2Oly/4j8o=;
 b=tO9HARSYS7sveN82tnG/5Qyswr/L5WJleNMwxhAGWbbVEvoMHqkZ87B0NXw/ofLqxG
 qNS4pHfXiiT/DYkzfKiPgKM9UmJNtqSJZNMwup+PZDCuUx6bv51R2rux9rFdRI7iRy4S
 bERI4kcAjOrSLpsqWJV0O60g7E0LBvfwn7feyrWEWa8l3Vx7B099w5e+6u35F9HN3ZYs
 63Hn5loSN2GCQVZ3+Yi3dlTmlVfM4EqbCRfS1qUSjDk5TYy66GFmc3v9PMkq5d4cerwo
 VZzgmeCa6RVyGaEZYrhuKrlVRNnQ7QczD2jH1B+N0Be7henYvWCdjVYe9TNKoqBzfsCF
 Sk3w==
X-Gm-Message-State: APjAAAU+cfUc/5dv1r1+C2JErO3bII4iFtp3A2DGCuAGuGYbBTEPt9i4
 JgvHjdwtDdW96QlnLPbEvSnG8ac=
X-Google-Smtp-Source: APXvYqxH9zlN7A4Vy6xIJjVeQB8YBo8fveLpCXSu0uBo4yR5o+VI2zQr7NViKyJ6E0nA76uGKUi0Vg==
X-Received: by 2002:a9d:6a08:: with SMTP id g8mr668730otn.191.1551378251051;
 Thu, 28 Feb 2019 10:24:11 -0800 (PST)
Received: from localhost (ip-184-203-129-180.hstntx.spcsdns.net.
 [184.203.129.180])
 by smtp.gmail.com with ESMTPSA id q25sm7394305otl.15.2019.02.28.10.24.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 10:24:09 -0800 (PST)
Date: Thu, 28 Feb 2019 12:24:08 -0600
From: Rob Herring <robh@kernel.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH 03/11] dt-bindings: memory: atmel-ebi: add sam9x60
 compatible
Message-ID: <20190228182408.GA20310@bogus>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-4-tudor.ambarus@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_102412_020297_C0600675 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
 Tudor.Ambarus@microchip.com, Nicolas.Ferre@microchip.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, lee.jones@linaro.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 08:59:52 +0000, <Tudor.Ambarus@microchip.com> wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Add compatibility string for the sam9x60 EBI.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
