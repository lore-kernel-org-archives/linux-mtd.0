Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6617BC19F2C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Aug 2022 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/pOx9zBO2gBJuqUWZ5LeSf+NmRm7hQfyPFjX8LuSFx4=; b=yUB
	Fp8RUgsz0PP/IoimxhbQVHr02Fz8fNubym9NeSK0vCoqPGaQX73xV/plr8qmR4mGFhsaZFqkTQDbF
	N17AwGku4LOpupaeuz78iUPF/xPjkOUg6FTE9gn6LWC3DqAM1ktW2vy0H4sO5csBzcvGOkDbITm5f
	IAY14UQg9fTqoM1rdz5UOWQoCFx4g15B8kwnv4nAuP6Shy99KuzomHa3CONr5DSJVp3qn4PKYypVo
	GaruC+TflygBXgZzoiN9SWo5KbwSb7zWY7Po3XZo6EVDhrEFdB2llidSLjR6XM2DHmoY8qlnWetEW
	/Zx7hddMKp4TMrk0sz8AeDQa6lzQRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJIb5-0087ax-Rq; Wed, 03 Aug 2022 17:55:55 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJIar-0087TC-2F
	for linux-mtd@lists.infradead.org; Wed, 03 Aug 2022 17:55:44 +0000
Received: by mail-pg1-x535.google.com with SMTP id i71so10246571pge.9
        for <linux-mtd@lists.infradead.org>; Wed, 03 Aug 2022 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc;
        bh=LxYj3udRre62X5y+NXPo+OM3aAvBLEJYNY/b3eIFDy8=;
        b=DaJv1+QPyXTIl80SxWSVgwrKl2BeWf+SLSf+lu5NmXlOsC1WEKkub/wjLr8sJ+bMpd
         rb48f/9gQLsxsot3X/pqgG4khJrsnRxn7w+kGai56b2BP1gT/lB4E+YGSQDn6WlLJnfE
         GCE9QPyva8Ew5dV2/F3ZObREqVZf6lpWDyfrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc;
        bh=LxYj3udRre62X5y+NXPo+OM3aAvBLEJYNY/b3eIFDy8=;
        b=yM4iHz9zSQ2Xhi2nIJ+7JUnnrrGPcGdPML3JU3H1dTdTNFozoe64rMvHN1HyhfnYAO
         80TcF0/REmmJrV4iKwYB0O0mM3vWaecmTH8P25Fs+/t5CM5uCyMaV7ctmE89CtCOUDgi
         kolZlRFK5cqTQdqRFdgXjXqP+bOUjZOBIZN3TuF9CBcspJ7lXOX8JZa7Qg4J4PIYcquY
         UTwtytaaZsaf5ybL76XpQeyPrlWtoRNicDk77e8+yePt1I9lssn5D/Lc1hdtv5Jtgf5A
         icuslw0MhgDSArBmrNWT1g8Okg1xkYWpd1/yowlNq99RNHfvx6IBWc5QF9AkhUWeVmds
         41uw==
X-Gm-Message-State: AJIora+AyhcnBH0IBxfZumwL4YbzIIsULcFNyIhoYUU+UbU3v4DM3jcJ
	iR8as3yG5T748ihTx/vUKBV/dQ==
X-Google-Smtp-Source: AGRyM1vlkoaI20p/BpkCX3BLfVXJxUkwzNyyCPxrki36VpTCnSdv/zY6bmlRD4yqhoStLPiwAvTLKg==
X-Received: by 2002:a63:2bc4:0:b0:419:7b8c:210a with SMTP id r187-20020a632bc4000000b004197b8c210amr21830478pgr.439.1659549338018;
        Wed, 03 Aug 2022 10:55:38 -0700 (PDT)
Received: from ubuntu-22.localdomain ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b0016d150c6c6dsm2238639plb.45.2022.08.03.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 10:55:36 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	joel.peshkin@broadcom.com,
	dan.beygelman@broadcom.com,
	f.fainelli@gmail.com,
	krzysztof.kozlowski@linaro.org,
	rafal@milecki.pl,
	William Zhang <william.zhang@broadcom.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 0/9] arm64: bcmbca: Move BCM4908 SoC support under ARCH_BCMBCA
Date: Wed,  3 Aug 2022 10:54:46 -0700
Message-Id: <20220803175455.47638-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_105541_416557_DF544ABE 
X-CRM114-Status: GOOD (  15.28  )
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
Content-Type: multipart/mixed; boundary="===============2785605698403562990=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2785605698403562990==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000cdf0f905e559f06f"

--000000000000cdf0f905e559f06f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BCM4908 is one of the Broadcom Broadband origin WLAN Router/Access
Pointer SoCs. It was originally added by Rafał before Broadcom started
to upstream the support for broadband SoCs. All other ARM based Broadcom
Broadband SoCs are now supported under arch ARCH_BCMBCA. This patch
series migrate the BCM4908 support to ARCH_BCMBCA.

Changes in v3:
- Add Reviewed-by tag
- Add Acked-by tags
- Remove the dts break warning from commit message

Changes in v2:
- Add Acked-by tag
- Improve commit message with more details
- Insert the 4908 generic compatible string in alphabetical order

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


--000000000000cdf0f905e559f06f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQcAYJKoZIhvcNAQcCoIIQYTCCEF0CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDDbx5fpN++xs1+5IgzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMTAyMjIwODA1MjJaFw0yMjA5MDUwODEwMTZaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVdpbGxpYW0gWmhhbmcxKTAnBgkqhkiG9w0B
CQEWGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEA4fxIZbzNLvB+7yJE8mbojRaOoaK1uZy1/etc55NzisSJJfY36BAlb7LlMDsza2/BcjXh
lSACuzeOyI8sy2pKHGt5SZCMHeHaxP8q4ZNR6EGz7+5Lopw6ies8fkDoZ/XFIHpfU2eKcIYrxI25
bTaYAPDA50BHTPDFzPNkWEIIQaSBBkk55bndnMmB/pPR/IhKjLefDIhIsiWLrvQstTiSf7iUCwMf
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
SIMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIJi7Jochq0m9DJtt7E7KnJczdnMn
KTqhDwinhgdh42k+MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIy
MDgwMzE3NTUzOFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCfPwsDJOMs3Zes99X6w8tgi6Z+lxLFzWKzNNkJkTbAL5jm
RPKduRypa/oJBfkRhDkb0xYg9+o3EVEiZoddSG1U6Bh+ly3DmtKFPjKREkelem2lum0/nF9Rp/nQ
stG5r4gFNHmHEopwK7Kce8zs19TtAVCpXraWga6mRqmC7khj5yKEBF830BxDO0T3UGAUPJ8fagr6
jfaOUh0YqL9sQAE7XHfSaEYDt1dse+uU0grH1u2bNpPSvfQT7OaBBQc/CiIpIMVqoQf9UzsTQkY2
NpWb7tIjpcuB9EJhaD1IsXiXvQ5SbGCQK7pvhgIGRQX5OsT2tRxLcYEpaCr7IsVwfKgw
--000000000000cdf0f905e559f06f--


--===============2785605698403562990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2785605698403562990==--

