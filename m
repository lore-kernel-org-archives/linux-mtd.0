Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72BC9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sy8HfrQuY0iIbT05pi+naZde9LyMydhkDlWasQQsu1M=; b=47e8J8/We0WUru
	/FDnY5iH2QsV5fby2UmfealgtpnWEwAUaoGDdTd+FlPfWioDdGjgV6mltbU5rYd6l1GqTATR94gUE
	Qjws8OYDgInFDmNSOAFTRu8rxTm0nv6O8PVMEdI9nCM393B1dAJaqPyyGgjiaw2rAsUrpYvFwFG5D
	454XjrVu0iziyXNnilcy2OXhazpNw1KoX9mh6kGdgz9WvMbYEDKS4CzsLHY7CXqb6BzfrQ/BtzJAY
	9Q1sMiC70LSC8UacEg4RXkk45HiXK9Za3gPps8xl0fkxsgrDKsN1UU/fdqud7hEXjFUzXeGLF+XtJ
	UrC5ExhIJ37oV4VV4tWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFi-0000000EDXg-2Ugk;
	Fri, 25 Sep 2026 19:06:34 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFb-0000000EDVc-0Uyx
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:30 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48434392b02so996812f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363185; x=1790967985; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/VTim21cUbONkR5xr0XPo1pElUY4th2lja5IDVOCpg=;
        b=GdyZaL9ns290EVUtSvNDkyxTSwIIXgcDLJT+H7kEfjG9VCcJgxCAXhZXhzd9qO4Ot+
         U7yPFRqpbVUKVu0BsQEJNj0BhKFeQ1wwmTPRyRNIbFwf+J+DanYmciO/XSZ3753m84eg
         uSW/EG0TNNBbDT1EBUJVUkCStj2StKV8PJEurexyv6zJbRSLOl+4wk6yNNOVEoRj99HW
         LlM0Xvz6ngISZ7kjSNzyoogrM6R0bbjxlPfzV8Uqe0g83xNcurUS86+M/Zcs4lM9m+O5
         UmBFcJ1JPGNbriPL+x1sLqHJzcmOWEgO5Y9IY2O6rpy6hXY8hsY6TN3s7E4guUc94GKY
         yltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363185; x=1790967985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X/VTim21cUbONkR5xr0XPo1pElUY4th2lja5IDVOCpg=;
        b=xLR1L1eqvPtwhL+V2a9XczObJrKUFI3hu45iVlUWzQcvBfabyFrxzvjDDmDyBhm6eQ
         jISTXUdz+4SuuhhXyJme+YKijEXfAVNBZ9VXCE+iOTLpIj2xqOKglVGbfRHEhzA7XjuP
         7BpElueYvCDY9bsbFHNoC69BAZAjDLsA9/8urB1tc0k3Wq+vlOGP7/fcw4dfD3Gl8Zba
         UBh56ca3FLaFWwyq5qjL1fX/0y4hD8IDQj6MHrCrHD7WmhfXnI7Dj/K+PBmbCivt3AsB
         FMtgVBqla7ijAUHAZHomlrbIZCAn7dTtTNKUHiJjFrEfxAGnhuS8jKChB3wMeUWjkHDd
         JBCw==
X-Forwarded-Encrypted: i=1; AKwUvBzYMr00iVyz2S/XtZvYwDR6x9G6CFQi8Gv3KlcTMtGASLVnfG8ixtQs1ia8cugKq/KBa1U+z2jANnQ=@lists.infradead.org
X-Gm-Message-State: AFuF++kfaugus8sCu/ODDY4vlhbbCjJ+Tmtd/9VmQXqFUAZqvDNJiJKV
	w1Rc5Cfsj3a+xhrxizhASbg4BUJbpGPoWGCq9hCpBx8vlOw8NDijQsYvuC8VtQ==
X-Gm-Gg: AYBFou2+dPbZqFS+qoxrPDs9woBx3JCNEZLk3t4h+jwoTu6uTWlMvrnLv7pJC+LoBa8
	Shw2WV3SCOqIk3H8kNRlKFugcWibMEleNZ5yNNxz5fCsUkd6soi4HsiS/yNwCbGv5qazX1n/pg0
	ywMaVJsXUR2sxIMPsocPrkdl9sAb3HNbIc7gDwlke1sLsA7aKkOvQ0gX/srWuxQd9vhgapCF/zj
	tMEPmrbVXcxpiulExW2efIjfPoxZ7sLryQYLQmvgpA7xByYnxxHCsDhhBRc3wbK998zxYfD2H7P
	DJ0oip5/P3zXBaUjwt5IOkou7iyep28rETstOlo5ZC7zqcxZLQkkXEnqLKcOlWNepvd3m4FCQVV
	TTun/q5bVbXuqgguiaAGy4whSce1PsPBugg2YhMBY958pBDhyMUiWLg/vv/WR3pGFcDxOt4MDBQ
	GSZhxolV5trLLcYor+AxrkZCT18HO6nr27r3+jBTt9m03+UcRwGcMRN3llIlJkKSsAfv/gmCE8E
	b7ct0at86GyQbVjZb7WW9fyYTqM/C/GZGlNFpo=
X-Received: by 2002:a05:6000:41c9:b0:487:f31:8037 with SMTP id ffacd0b85a97d-488716c227cmr11887423f8f.14.1790363184973;
        Fri, 25 Sep 2026 12:06:24 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:24 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/8] mtd: rawnand: qcom: share more common code
Date: Fri, 25 Sep 2026 21:06:09 +0200
Message-Id: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQrCMBBEf6Xs2ZUkarGe/A8pkqSbdsEmmkhQS
 v7dWPDqZeANzJsFEkWmBKdmgUiZEwdfQW0asJP2IyEPlUEJ1YpOKXzYMF+99oPFNOlIOIcaNgy
 EjoyxwhyMPhJUwT2S49cqv/SVJ07PEN/rV5bf9qfd/9NmiQLdTkglu87IVp7HWfNtWxfQl1I+y
 pDnkMQAAAA=
X-Change-ID: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120629_111011_2E6B2AFF 
X-CRM114-Status: GOOD (  11.60  )
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

In commit fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")
lots of code has benn moved from the 'qcom_nandc' driver into
the 'qpic_common' module to allow using that also from the 
'spi-qpic-snand' driver. Yet, the 'qcom_nandc' driver contains
more code which could be used by the other driver. 

The patches in the series generalizes several functions and a
simple structure then moves the generalized code into the 
'qpic_common' module so it can be used by the two NAND drivers.

There should be no functional impact in regard to the 'qcom_nandc'
driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit messages of patches 1-6
    to match the actual code (spotted by sashiko-bot) 
  - Link to v1: https://lore.kernel.org/r/20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com

---
Gabor Juhos (8):
      mtd: rawnand: qcom: make check_flash_errors() more generic
      mtd: rawnand: qcom: make config_nand_page_read() more generic
      mtd: rawnand: qcom: make config_nand_page_write() more generic
      mtd: rawnand: qcom: make config_nand_cw_write() more generic
      mtd: rawnand: qcom: make nandc_set_read_loc_first() more generic
      mtd: rawnand: qcom: make nandc_set_read_loc_last() more generic
      mtd: rawnand: qcom: rename 'nand_stats' structure
      mtd: rawnand: qcom: move common code to the 'qpic_common' module

 drivers/mtd/nand/qpic_common.c       | 131 +++++++++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c    | 184 +++++------------------------------
 include/linux/mtd/nand-qpic-common.h |  17 ++++
 3 files changed, 172 insertions(+), 160 deletions(-)
---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
