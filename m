Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26560C7EE45
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1jGb7pjb2p015M57TDeRb5pXuB0DNt337Ljo006Wco=; b=RzQrXs0iI9oFF4+Cs1+folUnpN
	owAzef9u/G2OcUAlz9MFcinTlOZxojSh6M+lCCI630OM5IHf6deW+SEOmVY3qB5IH4EGxzIv1YfYd
	Sb/TQs7pBG0QONxpvpCR/SO5ksu5SIPDcr4nj6dNjAdyqSxIkBmLXd71EMgIivRyq9q8c7sooXnBq
	gF2wmpA0wW3PwHLXXf++0dUyDOjvTAOzUQzWUFeMSaXvoaRCOyLVDBknDdDinMR91ZYdXwEii8XnB
	2Op0pjhMmI2qGyGlEKbTqHI4x5FtLKVj3BjQvt7H4i5r3c67DrhSIuYh7UXXrso9VLRove5EuzykB
	wb8phfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gR0-003gxO-1y;
	Tue, 06 Jun 2023 23:49:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gQy-003gwv-0D
	for linux-mtd@bombadil.infradead.org;
	Tue, 06 Jun 2023 23:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rqCnguMrTGKtQ2boBl7pm6a0EtK3iZvnp6krzET3ShI=; b=RzmtPbwvVgv4hSybKYvL8c8790
	y1GsnEjWjJ7Tz6kckM2j7uJ0yTJGm050Kp9AjaChhOszBU5cHwnXyGEuSqpAPgA9B5vYkxxpNtC4n
	EhDjlzKA4DUavDQJYMQiat/Wp9YGu6ij2yCjc+OFuIt79jtMEfvg8+kpa4ESyuQqAyoNQfGm1DR4J
	J9cU/J9Nt6h6Rk2votudV/aXyKn8ypIgXQfMZDTalt/ERuQ4GLUjOWdyAUhTjPUkzDKmc1QG1/YTv
	akLTgeyRKNR5gFRITZwROHi+oMs3nU+lWLW9PfygtiacvaUIq7+fUwGG+FkNvGNbXORl0FVsYHXZz
	JN0DaFwA==;
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fsV-004DAM-2R
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 23:16:07 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-75eba89e373so2194485a.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 16:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686093249; x=1688685249;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqCnguMrTGKtQ2boBl7pm6a0EtK3iZvnp6krzET3ShI=;
        b=Qp7su012nW/S+0glpELz3lXcE7psIPUWwS1MFfjuX69d5YcHM2Q/UzWMaOB2w1h8HY
         pamtAww2KfzBV060dnyI0z46ncE0NChV308qL2dQ12oUeAGQSLhJJgLAYGWL/u4EBNOw
         R67M13qkpCvJM9H1mTGt6fnbFu9VcoWvP2ayQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686093249; x=1688685249;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqCnguMrTGKtQ2boBl7pm6a0EtK3iZvnp6krzET3ShI=;
        b=Ky3sIQd/UAlegWrFNjGr+7W18w0PNm6RrrZnwiV3zrI2iKXhIzpIcFmJZEu9gzJQl2
         LD9WTK153AXfyxcODK+Qgt+E0r0k9Y7wP52x4L0Pf4a1X0Jr5SeFcTfNPBHnNds7rHOY
         f26cofXlQ//0X3SY87AB90YflpgSAZfpWJvU3Ego8SE7RdpV/Hk02sbK+AGxLOMUce2c
         ATax9iJaRLCGGiwtuUzWnbotIEJWMpktakrcjDcn/v5IigMP9u388iIlnuktFHJxqGZQ
         ygI9VY9m/YQG97+zlbTooYFpY0kdjkem1PEj93L+6DE7v9TJYDRcxFDlVZBvR3fywMij
         cvCg==
X-Gm-Message-State: AC+VfDwKcDwTn1FNOckWc/4yRH7nwlWgIbTwy2r+MspcBa3rnSgw4JtU
	3fox7tb+4V9cqkSl8v8eaEb6iA==
X-Google-Smtp-Source: ACHHUZ79wjt9rTqt4QZtEV5LWw/NgzV7fzn4PM1e7DeOiA1bfULBRCNghnKi7wo67EnwLgMmEzZVBA==
X-Received: by 2002:a05:620a:3a41:b0:75e:ca48:51c8 with SMTP id sk1-20020a05620a3a4100b0075eca4851c8mr99401qkn.4.1686093249233;
        Tue, 06 Jun 2023 16:14:09 -0700 (PDT)
Received: from ubuntu-22.localdomain ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id x9-20020ae9e909000000b0075b23e55640sm5221519qkf.123.2023.06.06.16.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 16:14:08 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: f.fainelli@gmail.com,
	rafal@milecki.pl,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH 02/12] mtd: rawnand: brcmnand: Fix potential false time out warning
Date: Tue,  6 Jun 2023 16:12:42 -0700
Message-Id: <20230606231252.94838-3-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606231252.94838-1-william.zhang@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_001420_064930_3DAA45F9 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: multipart/mixed; boundary="===============3276500151687225078=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3276500151687225078==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000031969705fd7e2d40"

--00000000000031969705fd7e2d40
Content-Transfer-Encoding: 8bit

If system is busy during the command status polling function, the driver
may not get the chance to poll the status register till the end of time
out and return the premature status.  Do a final check after time out
happens to ensure reading the correct status.

Fixes: 9d2ee0a60b8b ("mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program")
Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index b2cde1082b3b..b6346a8b9833 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1080,6 +1080,14 @@ static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
 		cpu_relax();
 	} while (time_after(limit, jiffies));
 
+	/*
+	 * do a final check after time out in case CPU is busy and driver does
+	 * not get the enough time to poll to avoid false alarm
+	 */
+	val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
+	if ((val & mask) == expected_val)
+		return 0;
+
 	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
 		 expected_val, val & mask);
 
-- 
2.37.3


--00000000000031969705fd7e2d40
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIHhd1OJb39+CkDygpL6+uiGAqKTP
JHr0v6z3mI9VAk2IMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYwNjIzMTQwOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQA3OUw6pFJ+Z0AAAaKK8MTdk7A6I40hviQML/ZQwxfNQGsR
J7Qbqpq1qzDvDOgW8L0AVPcbbroQNCMcXP2i7kbNWAm91lSG2K6M45UyYDZMTc45+gmvuHdgHD5/
ALq7fFZyHFNqpyt4NSp/VyZGHpus9OisUQDAY1RZvTjdcxhjNMmBnYNDA3BWm8t1R6s8TDSYa8XL
QRqYI0dx+a5Wig4j4CWcH0oVWnO8saFPBtNiFPCWlGWEjE9wffI6t1RTtj5MvexjmjDxXIrxYXi2
D+o6smVx2Yh+VtljjGTz51WX5gnvmcO/GO4tYPbH5Os1iq+uysxxbTfAIawui0j4Xguy
--00000000000031969705fd7e2d40--


--===============3276500151687225078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3276500151687225078==--

