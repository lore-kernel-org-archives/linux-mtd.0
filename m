Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E98C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9cX1f/49EOaMooWa3uNIwlnZZ9zKXYulcOONXJGeqK8=; b=Va4
	aP/rbIhwDL25c11w/wwX/VvkYX3fPdEByiqmGe/uodTibUBFCoEDbDQm74SxqFSfrbyYbY2uydMdh
	Eh/hYGjrdySoDjlZWiJOtQq1o3ZU0w4TLN0SPR9WixgdV97G9v+8UORbDdriejHfLpEFt6y9gx/KI
	YzPNoB5Ldr1dqURAJTxfN8O0eG+abAtHlyDcavugOxeHyqxtB4tTfbppd3hL8APlGSPcSd37eYf+h
	6xR0qw++7uKC9iCwyL5nDzTYMK4SWJtZpMTSjps3RxBMWEYChiiWbCsE5woeONwsAHVZtpji8U7rV
	B7XCUjPPFlCKfendWYfPMVlJ/VEX9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEJiJ-00DdjM-OI; Thu, 21 Jul 2022 00:06:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEJiG-00DdhD-GC
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 00:06:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id bk6-20020a17090b080600b001f2138a2a7bso3245855pjb.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2022 17:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=ts7gABGfBkR0L7YpYu3+VeL9BxqvDnxv43aF9nJPe0o=;
        b=e+T2RfESzjW6JfBoDOC2ef5AtSBobl/5jZJp3lkT551gGbUdR6XNM2rnjunSFDcqN5
         CdcxTZf67W2Vw3RhKEmwT5pu57eJA1+bHI3UJOtqKQOj4RZQ1GmevYDfNhn6aqCGEwzu
         df2Svl2t51uWRYG5oPTjzP57sPbxLZQRc7NIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=ts7gABGfBkR0L7YpYu3+VeL9BxqvDnxv43aF9nJPe0o=;
        b=353VoRh2ouAMf4PBdVzTFb8Nq069GThbWFO7zhQoDqz5ZMoID36zZAx6qYHfvIUxAz
         /E+nf6+bqLy65FmmbXgXcPTISAElSPIh9/P3dzM17/9ivjvBDaPTcQqBytNXAFAEfZTH
         L91y2hWTYSjol0CSoF14bN6oobFzl3g+uX9B9hRVAuDwHKUScAtrl/8v4Cks420k87BC
         wVTlAyJ2kSoS2NvN1InEx4k5n3pI7kXYwWgUa0HzjXwQiEInA6wfMhT7Q8L+RM9iIWga
         BFNUS+yiw0HmYUMvYdfCf1RaSjuiLkVK75cOwppbn+pxmLwPZRDdT+n1z5LEQWuE5kbx
         4u9A==
X-Gm-Message-State: AJIora97zHLySHrchpaqx+g39MnpbJwPOOooEyqHzXguqZV1WpgTogMX
	5F8RP7XRocoWsSzyn+efwVATIw==
X-Google-Smtp-Source: AGRyM1u0pfjlvOfQG/fZbtae1cXoCkTg9u7dLv4a9PpBEtLwedD+dIsJxedrA7DY6nz9djCxTaZ56A==
X-Received: by 2002:a17:90b:3c49:b0:1f1:9213:e747 with SMTP id pm9-20020a17090b3c4900b001f19213e747mr8161849pjb.15.1658362003673;
        Wed, 20 Jul 2022 17:06:43 -0700 (PDT)
Received: from ubuntu-22.localdomain ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id w20-20020a1709029a9400b0016d13def559sm141586plp.141.2022.07.20.17.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 17:06:43 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: joel.peshkin@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
	linux-serial@vger.kernel.org (open list:SERIAL DRIVERS),
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 0/9] arm64: bcmbca: Move BCM4908 SoC support under ARCH_BCMBCA
Date: Wed, 20 Jul 2022 17:06:26 -0700
Message-Id: <20220721000626.29497-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_170644_575978_641738C4 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: multipart/mixed; boundary="===============7035413736120837695=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7035413736120837695==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000288a4805e4457e4c"

--000000000000288a4805e4457e4c
Content-Transfer-Encoding: 8bit

RESEND to include linux arm kernel mailing list.

Now that Broadcom Broadband arch ARCH_BCMBCA is in the kernel, this change
set migrates the existing broadband chip BCM4908 support to ARCH_BCMBCA.


William Zhang (9):
  dt-bindings: arm64: bcmbca: Merge BCM4908 into BCMBCA
  dt-bindings: arm64: bcmbca: Update BCM4908 description
  arm64: dts: bcmbca: update BCM4908 board dts files
  arm64: dts: Move BCM4908 dts to bcmbca folder
  arm64: dts: Add BCM4908 generic board dts
  arm64: bcmbca: Make BCM4908 drivers depend on ARCH_BCMBCA
  arm64: bcmbca: Merge ARCH_BCM4908 to ARCH_BCMBCA
  MAINTAINERS: Add BCM4908 maintainer to BCMBCA entry
  arm64: defconfig: remove BCM4908

 .../bindings/arm/bcm/brcm,bcm4908.yaml        | 42 -------------------
 .../bindings/arm/bcm/brcm,bcmbca.yaml         | 25 +++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm64/Kconfig.platforms                  | 10 +----
 arch/arm64/boot/dts/broadcom/Makefile         |  1 -
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile |  5 ---
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile  |  5 +++
 .../bcm4906-netgear-r8000p.dts                |  2 +-
 .../bcm4906-tplink-archer-c2300-v1.dts        |  2 +-
 .../broadcom/{bcm4908 => bcmbca}/bcm4906.dtsi |  0
 .../bcm4908-asus-gt-ac5300.dts                |  2 +-
 .../bcm4908-netgear-raxe500.dts               |  2 +-
 .../broadcom/{bcm4908 => bcmbca}/bcm4908.dtsi |  0
 .../boot/dts/broadcom/bcmbca/bcm94908.dts     | 30 +++++++++++++
 arch/arm64/configs/defconfig                  |  1 -
 drivers/i2c/busses/Kconfig                    |  4 +-
 drivers/mtd/parsers/Kconfig                   |  6 +--
 drivers/net/ethernet/broadcom/Kconfig         |  4 +-
 drivers/pci/controller/Kconfig                |  2 +-
 drivers/phy/broadcom/Kconfig                  |  4 +-
 drivers/pinctrl/bcm/Kconfig                   |  4 +-
 drivers/reset/Kconfig                         |  2 +-
 drivers/soc/bcm/bcm63xx/Kconfig               |  4 +-
 drivers/tty/serial/Kconfig                    |  4 +-
 drivers/watchdog/Kconfig                      |  2 +-
 25 files changed, 84 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4908.yaml
 delete mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/Makefile
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4906-netgear-r8000p.dts (96%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4906-tplink-archer-c2300-v1.dts (99%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4906.dtsi (100%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4908-asus-gt-ac5300.dts (97%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4908-netgear-raxe500.dts (89%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4908.dtsi (100%)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dts

-- 
2.34.1


--000000000000288a4805e4457e4c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
TltlrAeBKRJ1M9O/DY5v7L1Yrs//7XIRg/d2ZPAOSGBQzFYjYTFWwNBiR1s1zP0m2y56DPbS5gwj
fqAN/I4PJHIvTh3zUgHXNKadYoYRiPHXfaTWO9UhzysOpQIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUohM5GmNlGWe5wpzDxzIy
+EgzbRswDQYJKoZIhvcNAQELBQADggEBACKu9JSQAYTlmC+JTniO/C/UcXGonATI/muBjWTxtkHc
abZtz0uwzzrRrpV+mbHLGVFFeRbXSLvcEzqHp8VomXifEZlfsE9LajSehzaqhd+np+tmUPz1RlI/
ibZ7vW+1VF18lfoL+wHs2H0fsG6JfoqZldEWYXASXnUrs0iTLgXxvwaQj69cSMuzfFm1X5kWqWCP
W0KkR8025J0L5L4yXfkSO6psD/k4VcTsMJHLN4RfMuaXIT6EM0cNO6h3GypyTuPf1N1X+F6WQPKb
1u+rvdML63P9fX7e7mwwGt5klRnf8aK2VU7mIdYCcrFHaKDTW3fkG6kIgrE1wWSgiZYL400xggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgw28eX6TfvsbNfu
SIMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIG0+r7Kcv5tTgASvI/behN+/KUIn
7vxx1WJUS67pem6hMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIy
MDcyMTAwMDY0NFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAEyhdeKwcknJfaQPUQnmbHNAAznlYifXXvEhvgcy9ySbpD
2R0HjPrpaoYVN3H4NdJsj97niCA9eAdZoGiSMoAoQfFv09iaS507pn3UlUDncpjiouUAo2VIWyrb
vuKLFo1IQ68VtXgPYjT/wkmrrXrVmO80UOMhZpKhmCUJ8OjZ/BizY31RPDTN6Ycdr31NBP0oSQt6
R2M4hEnLr3SlDdpRdbBE6mJVsBjAlSCJ3Ksqzhi+g6lOVDDrpVbVQuqjmhnfWDEydrJxlkFh/PQs
jGhzx8wg8dzI2xgOrBsdHUg5jA/vKZ5xQcbYhUrz3Sb+fqLZcdyLerJdhuV8SPyTBx8E
--000000000000288a4805e4457e4c--


--===============7035413736120837695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7035413736120837695==--

