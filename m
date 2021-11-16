Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D47C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39ABF63217
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39ABF63217
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuNfm7Rug0pDD12fZ7292s9zvkbKYpFUcCqrx86mwxg=; b=thMvC9eE09kWdg
	P19H2+qXcdHx5pLMzNAsrRVNh4heb308/g06rHvuOzcJ44Oqm+6NRqmxZDk/vlitoCq5EPEqd1HYA
	pf7lWNDDMkjsgezgCNlvCZYMIk4dDaGOAY/MvITz8cqTmzQLZeDK3IrCxXGt0beIbbXcEPYw6QIq+
	99OUCfHLM6mfM5qMlforPO69StDyJZflBWnhwnb+iCOJRM6dk6nIqo7SnJQn7R5dRo2BpzZIVbtTB
	d6UQtB8wASYJvo36NO2GUPc9BWYfiwq/Y6rf7FCV8AL3BFk1AdiXpxMLaIQC94W0ktlglrHk4BRBK
	dGBHwTwiEEh0EAbJ+cPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvkx-001CrG-Gc; Tue, 16 Nov 2021 10:32:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvkf-001ClV-Kf
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 10:31:47 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 737E4405F4
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637058704;
 bh=ThaYp9G+64NxRqKzCKbRUdZxK0rHiWmTIO3o3cKe36Y=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=A6r6kRWFK0YOERvi8laq3D8GUWKmQKJNYM3p1da9II06kmNVoTkmvIaUrCZIyEUda
 VDl4/gXDt/K4JhN4d+1+h/178yZopCt0lG6RNneyT7y8VtkPAiUj7yXfEWxGETMtvW
 HYNahPFrV57tqZPErYdYKHRHVq7TurULZVWY6aoFAREybvSus41zGa2LEaq15s79dO
 A02pf60bvBEGEXrk0giqkVqzr7o6ERmq3SmLp4HIp29qJ05zUnHCsGgM2kA99sUPRn
 tHr/pFF1j2cwqXYe8rKJNbRQTWGDacJFg+g3W/BARMvBpTKBwos0Qo3bVEHQPCJx0I
 ZdS/LTLVRzO0g==
Received: by mail-lf1-f70.google.com with SMTP id
 x7-20020a056512130700b003fd1a7424a8so7975170lfu.5
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 02:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ThaYp9G+64NxRqKzCKbRUdZxK0rHiWmTIO3o3cKe36Y=;
 b=EVmfdeOWJU5BbgNYhGW/bxNjflLf3UigT8dTUoT1UUwn6gVbxUeXYHljJVM2r32nFp
 zsQWB1NQ05ncBn1mY0oeRfW+DDyQ4ly6oNEITA/lEMcKR6rS7N1Qolbf/H3D4na9/hh1
 Bjv6Bawk9v4MNRMKVH+gW9SpV7ySYhDl+wC0dMd6wzK6HzvCijTEmLyHbZEOgtZCtVvf
 qQvPJ8STAIFbgdMQdhCYNWmOX8jNd8zo0YdyeL9sRyUaY5CAZ5RZIlgDJnFKJo3yS5in
 /WzL0Vrx9DokP5h97nH1O5T47I44GUo+bsU1/pUoJ5Hzj5NfB1Ydld0Y/Ydbu+ehzCYu
 Mf7w==
X-Gm-Message-State: AOAM5302hYi0NsYgZQZ89tnIFVdSUHcCnjWWp10f1weyG2N3FerHRoAG
 oKvhaqiJPTWU6M+X9v4uue//ek/z5cLVgVmm5LgLzDU/e3642FpZSAIFyOpDem51Gb1e5ypHR62
 ho+MUnfCRvCmBiZfyVFJxfvdoTehTmT+hBhukejMVefw=
X-Received: by 2002:ac2:455c:: with SMTP id j28mr5675054lfm.582.1637058703892; 
 Tue, 16 Nov 2021 02:31:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0NdatstZNdLBhO99EKL6y8ayUMQay94r9rgDX+32tJqQpGp8oIkn6fRQLxpQq5x6dEdHicg==
X-Received: by 2002:ac2:455c:: with SMTP id j28mr5675035lfm.582.1637058703760; 
 Tue, 16 Nov 2021 02:31:43 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl.
 [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id j5sm1114418lfe.219.2021.11.16.02.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:31:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 2/7] dt-bindings: memory: renesas,
 rpc-if: Add optional interrupts property
Date: Tue, 16 Nov 2021 11:31:03 +0100
Message-Id: <163705866144.26823.12246673489129083312.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025205631.21151-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_023145_865248_9C1EAC7A 
X-CRM114-Status: UNSURE (   8.96  )
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

On Mon, 25 Oct 2021 21:56:26 +0100, Lad Prabhakar wrote:
> For completeness add optional interrupts property.
> 
> 

Applied, thanks!

[2/7] dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
      commit: 4b5a231ff617d5cdc9e99f39a7268ad491400195

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
