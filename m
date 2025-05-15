Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4FFC3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i8IUEq0DjH9/uOORPCPSiFdy75iMIC/C4AEIm6DKetY=; b=tWkCuwyEbwzdpu
	3U35ale3YGqLaBO4NIgGJ9CeIoRHhVHnM/Fd9QxgsdaFTHxQcnhwM1l9s+axVsC+AfoeHjt0JvsTO
	fA5AGwOZCbB9T51jE00O3pf5G6045Rvy3YK5CBdZEC4M4Amhy8bmLT129JMfjL0r0mBiuk9EhlFVe
	NbyYwZB63qQCd4ht1CkT20rNq/atau6hPzMGzgnKBtFC5ioWSAlUMvp3ZHsKU2xcwKNF4QJ7kCsVA
	RiFPgKXSLJoopZ+boBgcy0xbCQPTvvpQQfIHA0QbZnpePwiB+BwL4nHUEhdP15tmWcSANO+U9ZQ5q
	yG0nnohIDBv7r99EVD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfA3-00000001nRB-229V;
	Thu, 15 May 2025 20:26:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFexV-00000001lnz-3jIk
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 20:13:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442f9043f56so6114155e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 May 2025 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747340016; x=1747944816; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuJGtF+v5v/zwiKXtg5bHQxWdc3nNCiHNpzHfrfyNeg=;
        b=VyYjONRK+L4jK7+ivqF+1d4wSYTYwYzNejlThNBaY5llC5ZmdT0/lolCl9ZjKzjhTk
         ReRstVCfuUdPAXoDM2Vik0631vpWAJl8zekf0wxLY9u2NV3TLWGv98CmlCoKw1E3du9Z
         dPQivco6FOl7lV7PCujvlA9HGn1C3ow83DgV6ZshlKCCvVy21ELQdK0Ivxn5YIQ1c8bQ
         FJ0MATpj1eIokWz3Xwy3ZJAMbN6I3h8f1Vfy/6Mc5Yb5EHczT61bBDZrIzYD99wvzncp
         GrGDMEjqsCjRXNjfih6aEEbIaqj60ig0ux/VQ/cQ82OsFm5OwxnOdqqqD0LjX3JFjxBG
         p+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747340016; x=1747944816;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuJGtF+v5v/zwiKXtg5bHQxWdc3nNCiHNpzHfrfyNeg=;
        b=ElWhA76uxp1u6cOyUxYUobY2JexBDpmrCkh0yhXKa+FW534oqxOozunwnd5Pu7ua+4
         u/m4JgsPFu6+CQBiTnYQNwnhjWK6GUqLv3S+aJEX+JLjT+4nVzjZ3Wqq/rtVHayRhl+v
         cFSBwV1Yb+4eU27CRAGRfQWWjwfdiA47IbMxgXWVmwDEweziDA4MTk2Yhk6OX/nkEDdj
         6IOcah5YpPeSeFFpfOo5SiNXAzK+UolQ+m6Y0LYoPpSMiMBscZ2v/cvU0oOXxuqakWY8
         y9im7ps3r7wduu3e52SYX1n5O6PHLzt+Zs45mIXPjz3ZuLc0qJzi6WKVv90IY+xJRGje
         bLEw==
X-Forwarded-Encrypted: i=1; AJvYcCXOEIyXbMTDtAtxrsh1lsw/WmrQHJ4047FxUqoRcs0H98SPS+Q2lBpb1WCzTsaMmyBSWYp7j/cNKrc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+M5CfidCz534hRR67dlEupfqBYSAHJXM0DjEBfU/yVR4VXgF0
	GeFQxcfmgy2rEPPzZ2azSbl0D6yKyPLYCQ4kAk8tFsvk/8R244ZWLwbV
X-Gm-Gg: ASbGnctlpbvf3IthlmIsGmiT9UKpvzT7i56hBrvES6HELP+mktmmAR/XbDctXKBfq9d
	OMmROnmTPcdGVP7oSu/xeZsuRTSIifepwICgAp6e2eh1pZygtZTotrp9GjtnWyfAtS7VMfdpKDE
	fe/6kf52QBBEZCXJRuaCXFdyK0d90jy9EVhIaUZRlafxS8c+ipDPAFF3IKH7wXbA95x1PO+RKdy
	A+GewdRM/JwHTItMNa4E6EGFalJ+5sklELLHZDJJORGaaN10zIBTK0blpkjirxtpBO1auTWq70a
	XAS4ExP0jTYv8bzYOK37rGOI3dFtLFxz6AKZnThErGTUidqE0f18KkqXP7JdzgfHGG9hufUyaKa
	bqpRJ
X-Google-Smtp-Source: AGHT+IHG6RNWwbRDay3N+hyQJzL+sBLOAagvHNHCy6oSlBzCgno6ceuyCOZJAL6IFJsmeYnHqoVwUA==
X-Received: by 2002:a05:600c:a378:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-442fd64dfb3mr10603535e9.16.1747340015618;
        Thu, 15 May 2025 13:13:35 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3369293sm83248585e9.6.2025.05.15.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 13:13:35 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 15 May 2025 22:13:29 +0200
Subject: [PATCH] spi: spi-qpic-snand: return early on error from
 qcom_spi_io_op()
MIME-Version: 1.0
Message-Id: <20250515-qpic-snand-early-error-v1-1-681c87611213@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOhKJmgC/x3MQQ5AMBBA0avIrE2ipYKriEXVYBIppomQxt01l
 m/xf4RAwhSgyyIIXRx49wkqz8Ct1i+EPCWDLrQpjDJ4HuwweOsnJCvbgySyCzZ16apR6drMLaT
 4EJr5/sf98L4fECVEOWgAAAA=
X-Change-ID: 20250515-qpic-snand-early-error-863c4b1265f9
To: Mark Brown <broonie@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_131337_931412_F6A3CEEB 
X-CRM114-Status: GOOD (  13.21  )
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

When submitting of the descriptors fails, it is quite likely that
the register read buffer contains no valid data. Even if the data
is valid the function returns with an error code anyway.

Change the code to return early if qcom_submit_descs() fails to
avoid superfluously copying possibly invalid data.

Also change the return statement at the end of the function to use
zero value to indicate success obviusly.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7207bbb57802ce53dfab4d9689113e7f9ba8f131..02b7e21479e5d5f663cd054b9241e6deb284b8ef 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1405,8 +1405,10 @@ static int qcom_spi_io_op(struct qcom_nand_controller *snandc, const struct spi_
 	}
 
 	ret = qcom_submit_descs(snandc);
-	if (ret)
+	if (ret) {
 		dev_err(snandc->dev, "failure in submitting descriptor for:%d\n", opcode);
+		return ret;
+	}
 
 	if (copy) {
 		qcom_nandc_dev_to_mem(snandc, true);
@@ -1420,7 +1422,7 @@ static int qcom_spi_io_op(struct qcom_nand_controller *snandc, const struct spi_
 		memcpy(op->data.buf.in, &val, snandc->buf_count);
 	}
 
-	return ret;
+	return 0;
 }
 
 static bool qcom_spi_is_page_op(const struct spi_mem_op *op)

---
base-commit: 4614fd6342ab69feebb067d5db84a9bfb9aada9f
change-id: 20250515-qpic-snand-early-error-863c4b1265f9

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
