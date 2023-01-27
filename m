Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69709C54EAA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H8rBMsvW9iy0P2bJv06q1HriBfvmhkYdVZlsaDkWP/s=; b=2gbnJCLLoPtvdl
	Qiw6lM2gAJwf0baTml8q3ofJoLJC2V8UaOpaGfH3L944GRvTUxirDfxBNlrVWny+YIXYdFJmNJfUl
	rLzV070TtlulgMDQ4lzXq6u8YcaaL3UCoP2VkMzcpE2QGAZNjO2Eg8kCtK9bdqAhytfMTcGiemrjh
	qOAU3dt7AeS7w7L19ZFgnTRIZ37GruYNy0aNdV0jYrG4LV5J/w724Y2RqPwvRzKz/f3LBIs056bGk
	M4x7k2xoSIcVjI45ehqqJyqvPvjbGZXRBfsZYNIZ/3SxJUnlZvEqRJ4uZkUeeJfn1Z3H3HjvqU/yC
	BSTgS4dksi+I137tBXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLL6u-00Dgb7-Tc; Fri, 27 Jan 2023 09:33:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLL5v-00DgDC-Rw
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 09:32:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id q8so2989962wmo.5
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+nr5yhr/+t2gpLfGOs+Jk9mqx4K88IomiY/057Wk89I=;
        b=afmjeNTvz+QfUYiPvDH9aI4+T3r6PKox0Z9VZNkm/tf4SrNrWhmAcU/fV+6GKjKun0
         eo9QyIGD2KagMefssAESDksaJXXFJRmKbfo1rmLaHPLpff+IelOR/8NStIUQfsWi55uS
         qA+Vkq6u2u9jqDXXsflTi3MrPmYzdeVqSMDTaSRU+kZaMs9USDTu2cP8vy0U7WTP9hWf
         NxrdpUjYK3tZ0pqfZrABbKlgk6Jg/0+eBZF8tzTept+x41W70ysQfVEoPC9ugQNzXPuM
         s+CCp3ROSLUim+9jHenXJtiPJrg6FHgFAKQW/3155i8iK7ZkRBShMo40/I7t/oUoTRlM
         kD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nr5yhr/+t2gpLfGOs+Jk9mqx4K88IomiY/057Wk89I=;
        b=BBVakfYWQga/QbTmpEIVd1cDpsTFkgrIuuYX/tGV86MOxQoGwq0Pyrc6WLQYdIqeE6
         xcigHK1jShEzQpQ8LyTw4e8da5lilfeVTuSg5fdg6n0MifeY8/WNDJtSmR6yWLswn4Vt
         Blm98no+JhkTW4OjMgWDwk4hBw5pZ9q7+wdTlh/PT41Mu9H0GWifbJgqApgMn6UKYUho
         6q+3wCPfE2W69PYpHW2E4ZM5enzijZQy64QDuT1Ij3yqA9ddNlmV07+52kjRMZi/AvOY
         /78Df2BGkkxCuHdQPAQSjH0UAaQRFsQmuNIVvT/NPGY8rSWUuEZI10YeQgVUv3ZRCnXV
         sNbw==
X-Gm-Message-State: AFqh2kqhpYLPSvHgwwC/bP2Kgarx7dszTAb37kpXVX0/V9llmSkXH8D2
	1YsYH2bUGwIHMdE/KDgb7ZyKEg==
X-Google-Smtp-Source: AMrXdXuMTQOCdCJ4CvxFABguPpRWFrI5npvRZDl6tCte99HXwtgK6k0OjDxljIq3pESdxDzl3Zcb6A==
X-Received: by 2002:a05:600c:1c1a:b0:3da:fbd2:a324 with SMTP id j26-20020a05600c1c1a00b003dafbd2a324mr38878286wms.36.1674811943923;
        Fri, 27 Jan 2023 01:32:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] dt-bindings: serial/mtd/mc/ata: use MC peripheral props
Date: Fri, 27 Jan 2023 10:32:14 +0100
Message-Id: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_013228_118986_DEE963D4 
X-CRM114-Status: GOOD (  11.19  )
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

Hi,

Dependencies
============
I think entire patchset should go via one tree (Rob's). Patch #2 depends on
patch #1.  Patch #3 could go separate tree as long as others are in the
linux-next.  However for simplicity let's push everything through Rob's DT
tree?

Changelog
=========
This is a v2 of this one patch:
https://lore.kernel.org/linux-devicetree/20230123151302.368277-11-krzysztof.kozlowski@linaro.org/

Changes since v1:
1. Add patches 1 and 2 to fix dt_binding_check and few dtbs_check warnings

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: intel,ixp4xx-expansion-bus: split out peripheral
    properties
  dt-bindings: reference MC peripheral properties in relevant devices
  dt-bindings: serial: restrict possible child node names

 .../ata/intel,ixp4xx-compact-flash.yaml       |  1 +
 ...intel,ixp4xx-expansion-bus-controller.yaml | 64 +--------------
 ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++
 .../mc-peripheral-props.yaml                  |  1 +
 .../devicetree/bindings/mtd/mtd-physmap.yaml  |  1 +
 .../devicetree/bindings/serial/8250.yaml      |  1 +
 .../devicetree/bindings/serial/serial.yaml    |  2 +-
 .../bindings/watchdog/maxim,max63xx.yaml      |  1 +
 8 files changed, 87 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
