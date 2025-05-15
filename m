Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412CAC2D0CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d6U+hvJEa55e+KBh7ptGIPcisUJTV4rWS73CG8mSXmQ=; b=ISIcHjy/GEWOfK
	RgKdg24yRrSCQopDLvDXmGwSvB0PAviBlzMIw4ewsdUrYpFj8BKYvGDd7NrtA+Nw+gCRmrbbZh1MS
	f7ifqXgAnw6LLF9uDd0TNyozUXhBzDfVYFCuktUy84zC1kICuj7Tx2r9UdoTCRQXwDm2iahnN4zcE
	Ctay2RPlRwlCW8/ypiZn4wZvPtDevSWHWbKxrR0ZCRICIil4CRaKs+lAX9qSopRWKqJKsfFQUvvnv
	4p+vViPh5wxH8x/wpH13CL6Ufzup4CxLnPAam7mAS26U5LokDzVjFzahh8KxETFFTuzr4EH40U71r
	TVqCS/wMRd5Y2J3NDSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdx6-00000001e3X-1h2d;
	Thu, 15 May 2025 19:09:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdmm-00000001chd-0Etj
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 18:58:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so1077165f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 May 2025 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335506; x=1747940306; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAQgWK/HcHL5JZDomkBxGumchi4d3oKcZ0VquzyFHF0=;
        b=eIEkQ9zPRvsq4LcPK0Q/mCPK9OLxBe+ys8TP6McfTmhmbiBlZVixBYUtIWhbUzyeKU
         2LTcEoot/cvgHExmr2x7DJaoE7t40NiJArjSGq4WKlMUNPSS2AvEbqdLD+eOzta+l5yX
         TqcKzWCV3EZHl0nH7dGNLojv/anBgbU4Fs1tUQjVQ6CFMVVtQSQokW1tMp+f9S6D9gfZ
         MjnVks9PeVg4B2SHObz43unjWoEjsUc3FfsfcoF6djDL0QcFm4SVFU9NdlnKMG/aGpDO
         +5GmLs0UGbmLkYH2XlmrrtF6jP+gK5+7Vi8PUkzfQMmEeBeymzAfjbzfJSHvvoOMz4vd
         /eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335506; x=1747940306;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAQgWK/HcHL5JZDomkBxGumchi4d3oKcZ0VquzyFHF0=;
        b=v4YWJbxlZJm0IE6Dp/7/myB6P1ZXcD4Fzx2w5nX1BC4pC3hoW7yJPSHmVrFJjqp3/N
         fIWrEZLBLOJs8utPKCeAZhPfFocLkNK+l94wynaVWHbxxrwoSzsHMTKSDzfWfKi3y/oF
         u8A7uImZIdRTz5ANIr0+xujRZFQL6uZMklUprplNfyr/W2sgRKXWiP+kNzTbJb96UfNa
         qA7HGBUldLTDV6hyC6M5Xqe4cbOhX5tzCVF65Sf+BzqBIUHOzMYE/4eXeFdNQei/Qfq6
         YXeFKbT2HryFNraX35DWIl1+b2RQlqF2esSTQUtYkSCQMjRQiZZi8qYYkL5ILojPQegt
         cTjA==
X-Forwarded-Encrypted: i=1; AJvYcCVwyJRz2SL/t1hT2QqIZWnA6+QeZUQiVmKRhL3qfkD3jkmkbJbd99CxIDZ298xMc4gudH+OEtCtMaU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz6wmbety3Y680/1hLKP9F9cxKIxOfpIACLEo61our+ouNDInt
	hFcIU8KeXWsvbRtWbR+0HuT9aHAMWyAPYcBgvKsuMPUyxeDaSbkqrw767UM8tA==
X-Gm-Gg: ASbGncuktnw9y5PtuGcESPwsy9OLx+of3Sa7HlcdrPMe9lblwxrNRl0U3Q1kttHkKDp
	f845ZM1Do9MqaKxLlWc6PY/qVtSajREv0FRk1VXOlFcD062o8T5rhKxJ39lxU5neBj76VCnLAfp
	r2bfqXg9ohbgjIdDf29aEjiKuaLxcAjoWl6zEZryViJQYeJpfCV3jKKq+PDe9yxVe5o2zQAzQFz
	nPxFqFx6LSLIJq5tmJ5m/c4G9RcN8qQnxbCfEaaWqBjdXJvsL7CXxmPjKrG550Dk1PQqIMQP/K2
	eUc+ymmRtRnTUaOKT2G5ImkAwmzMV7dVC+8IyVY5/LWfvipuWPcewjbJV1F+kxIF1Ks91mbgRx2
	QovdCxf8624Hrgd0=
X-Google-Smtp-Source: AGHT+IGv5WT6iqGCzdtWMRw7/md5mqJ64SN/PDjAZ3l6FzfhMofC1/5lndV/1swytPL6rGhF8MzLKw==
X-Received: by 2002:a05:6000:2012:b0:3a1:4c72:9067 with SMTP id ffacd0b85a97d-3a35c8271b3mr867307f8f.13.1747335506177;
        Thu, 15 May 2025 11:58:26 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a857sm335778f8f.32.2025.05.15.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:58:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] spi: spi-qpic-snand: extend bitmasks usage
Date: Thu, 15 May 2025 20:58:04 +0200
Message-Id: <20250515-qpic-snand-use-bitmasks-v1-0-11729aeae73b@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADw5JmgC/x3MQQ5AMBBA0avIrE3SVrrgKmLR1mAiig4iEXfXW
 L7F/w8IJSaBpngg0cXCa8zQZQFhcnEk5D4bjDJWWW1x3zigRBd7PIXQ87E4mQWNqlTQtffka8j
 1lmjg+z+33ft+MGVDz2kAAAA=
X-Change-ID: 20250515-qpic-snand-use-bitmasks-2030c19bbeb9
To: Mark Brown <broonie@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115828_100716_BF84236D 
X-CRM114-Status: UNSURE (   6.63  )
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

The two patches in the series are extending the usage of FIELD_PREP()
macro and predefined bitmasks usage in the driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      spi: spi-qpic-snand: use CW_PER_PAGE_MASK bitmask
      spi: spi-qpic-snand: extend FIELD_PREP() macro usage

 drivers/spi/spi-qpic-snand.c | 45 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)
---
base-commit: 4614fd6342ab69feebb067d5db84a9bfb9aada9f
change-id: 20250515-qpic-snand-use-bitmasks-2030c19bbeb9

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
