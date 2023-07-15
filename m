Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A9DEB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkUlRwk1C7lLzKyhKpMIrCqRVp2sETE3LVDeaSc+nRw=; b=XhdQS3tCk5GXWc
	oGinBgu4d7Uez/YerM/bc/U1oXNwq8VKcTmIekcwuwqQQaRTGAO8m65f+JYRgDCwpRnKzj+8c2dfD
	9PAtfUsE31aWPpG6mPhSvKGItSZdqqGwyNNwWKB1C4OD/kUvRYhjiwQEBsxUVnKkTJPWfV0ot4ATd
	GzaYM/15/Hzff9dp6yJo5SYCO0ZaQ+SOmuPHZvpboSYVqt6fafmYR2ZOqwsC6uKA/4/TMhE4NZlWJ
	gW4GM2+PLWbTxJ5JZjRFG8F9VrTUPwMfhdbWzBKACoWcDKb0vuy8qD0a7YIcUnPJyvtIVFD5L7rPZ
	6X9X1AoMNYwkiA9dqIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKcq4-008QbF-13;
	Sat, 15 Jul 2023 10:49:24 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKcq1-008QYC-2k
	for linux-mtd@lists.infradead.org;
	Sat, 15 Jul 2023 10:49:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-993a37b79e2so383456866b.1
        for <linux-mtd@lists.infradead.org>; Sat, 15 Jul 2023 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689418159; x=1692010159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Msya+OeUKFjaaFNFKi9RZdmhf47ggR6awj7JcHGF44=;
        b=TXA2VCYmB6a4U/vUInFYKG7TlY+AVtTjKuD+KP3zKcgdrzlp759XldO4vhbWti9UWi
         /HJ1vqHtUbBIlFykt1kpf28dAcwALFxLGZOXiac+pqbqwiE3LFLQ3x7sNkhdRgHdH7rO
         Cnm0BKEiiIGUcpq8CgQY6QK0xMpLKJ0U1KclbjIaNTTEb1XvEfrlndufTkVjcqVP8hHI
         CiyYJ0kaZK02txAhkc12Sg1Zd/YY1REu/h8NishYTKioEKGcXwl71mutDjusNGeN5BaQ
         I2OxLKolJyNR/wtx4W3jupK7TxyR+qB9vAQK9YnPXMiDWZYFpCJvyiCK1aPLkuSatrhm
         JHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689418159; x=1692010159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Msya+OeUKFjaaFNFKi9RZdmhf47ggR6awj7JcHGF44=;
        b=TtbmSWOfuSnWi9Q0dYXaHzliIxSC/ztOPfDfA0GGAYwtAeGuKJ1IaavJ23kL2yFpM2
         shuFjmdQTVEnoQTk/rAn+VzMipWR4DhbMJO8hWDzrCUOyU7y57QIQ/x+i4ieq3AJBTNO
         KHpOX/ekoBz38J0pAPT/zxa/fdlmUh5kNQAlhkDn5gGXGeNeP0mCLC3cSBFEKI6J7UM4
         s1z3VQh4IeEHoVOtdd81r6iUQi6cuuD1HWWUEsjzmHJqCTAqKhCTt4xycM3BAFEqCIVR
         yzkwMgeXIDYw1BxKlM1sah4ONcYbRL55eIZwz/BPo3I/3piFqpIPPzoe2kwE8lhPQzVq
         sBPQ==
X-Gm-Message-State: ABy/qLZiqHW/hSjNsXFDI8p1V7w0BSGxEGBJz7WbbryVt05vFVwe3noC
	HXNw+G59B3aWS3OocwUx0wk=
X-Google-Smtp-Source: APBJJlE0jCxwHJaDfSipFXMCIjpsixSBRfEfBBeX6dxD3uNE4NTXk/pNOu6Sss9sA4LNV8RKWntj1w==
X-Received: by 2002:a17:907:2093:b0:991:b2a2:e424 with SMTP id pv19-20020a170907209300b00991b2a2e424mr6408079ejb.76.1689418159698;
        Sat, 15 Jul 2023 03:49:19 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090680cf00b0099251a40184sm6685749ejx.99.2023.07.15.03.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 03:49:19 -0700 (PDT)
Message-ID: <2b0dc481-562f-c8df-545e-dcf6548adb07@gmail.com>
Date: Sat, 15 Jul 2023 12:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/2] mtd: rawnand: add nand-skip-bbtscan and
 nand-no-bbm-quirk DT options
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
Content-Language: en-US
In-Reply-To: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_034921_890338_AE0D0A59 
X-CRM114-Status: GOOD (  10.79  )
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

A NAND chip can contain a different data format then the MTD framework
expects in the erase blocks for the Bad Block Table(BBT).
Result is a failed probe, while nothing wrong with the hardware.
Some MTD flags need to be set to gain access again.

Skip the automatic BBT scan with the NAND_SKIP_BBTSCAN option
so that the original content is unchanged during the driver probe.
The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
the nand_erase_nand() function and the flash_erase command.

Add nand-skip-bbtscan and nand-no-bbm-quirk Device Tree options,
so the user has the "freedom of choice" by neutral
access mode to read and write in whatever format is needed.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Previous discussion:
[PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add skipbbt option
https://lore.kernel.org/linux-mtd/1618382560.2326931.1689261435022.JavaMail.zimbra@nod.at/
---
 drivers/mtd/nand/raw/nand_base.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a6af521832aa..f0fa5c3519b1 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5521,6 +5521,12 @@ static int rawnand_dt_init(struct nand_chip *chip)
 	if (of_property_read_bool(dn, "nand-is-boot-medium"))
 		chip->options |= NAND_IS_BOOT_MEDIUM;

+	if (of_property_read_bool(dn, "nand-no-bbm-quirk"))
+		chip->options |= NAND_NO_BBM_QUIRK;
+
+	if (of_property_read_bool(dn, "nand-skip-bbtscan"))
+		chip->options |= NAND_SKIP_BBTSCAN;
+
 	if (of_property_read_bool(dn, "nand-on-flash-bbt"))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;

--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
