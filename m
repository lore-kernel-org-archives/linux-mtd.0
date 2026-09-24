Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD1C9830E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AFtQ7yZJn2+JMtP8ta87na+r1kSsK+Y79ZoVav+QZbU=; b=OGjFqRG3bzwJz8
	JIiWAXnaEy6o5KzgZiks1yXPv0dK+Tr1TYcIivZnNsf5Enj/+ZEJJGBGKQYEFXjFqZLykYSD4hoGo
	SjbsBbGC+UW3ImLicybI7QvaNGgs45bGXi8p2r5MA5FMH8KkgPVfPmKzfyhWyewVNCsa5lqohAgLU
	srstacpGnPYJZ2WrlWkr3KsG9nP+fHZ4RH+G/5D9rLnX1HPmRkV/FPsNl27caKtCHRj+lisShBWBB
	ryaO8UULnVCeNx/vmp7QnwO5KqNBoJFYsOijKfRZTdsEkgFxOThU5Y0DbtTSbEWnKWa4GtpPCEJQl
	s0DD1fRaMFN8F2fBg5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgN-0000000C6E9-2BdZ;
	Thu, 24 Sep 2026 20:04:39 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgL-0000000C6Da-2LSg
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f635552aso129998f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280275; x=1790885075; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2R+nn9u8Zi1z83iJmw6e94KrJSKxHnyAo2dWuLxx3Y8=;
        b=qcSa8SQHTItkHMLXN1dV1aOOqA1x1jxOZnMyBu4z/lXBhrOKkpJgofqa+zRFX9tfDT
         i2VFVndjbby0ejemspam9JjnsQgWP3TE+1jcCMP3lmZP9WTsQYpAu1MXYDh+CfEPhRDU
         agXddJtUJiBsp4Hwm/Elx5HRsd2LMMiefDDNi32VjuGb9HUC+kL/XNt0i2PUqLijd8yN
         bbrub5RAD0Q/Qi/S0QezU5Albe8nuSDUsNmX7j9eKPuTw9XJGKlOdvLoep4u8OIYVScg
         I3FGd44PjTQO7/IeydoPcIAb1TkgpvJWhAE2mf4iVACO1wM8pnDLTNQV9Fc+a0jJQUrx
         K0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280275; x=1790885075;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2R+nn9u8Zi1z83iJmw6e94KrJSKxHnyAo2dWuLxx3Y8=;
        b=yapHx42Js6GbYkCXr4YFXAiNLMScrOts6OO099faa+rOsJpwqntynfeS9GU8fVMq9V
         6Yn3W9o4Nas4vgkSc7HfbRKMhJ1m1xNApKNOYWVKT91oPsNgCgjWe7ry+5a6UQsuIAcO
         OacUQkQB4/Dutu9Tg0PknTacnYZqzLguG0RDTPF6bv9KkTYMATAnJl04QL2Xv+PYCzEb
         Lwif3Xw+tqN7BWgfVhlwVor9YtDq9GH0eE4w1evz2hcYo9JRY4HunJYpfdnaQx+/ZxWA
         jLkIg5urcG2UM9ugLEifnHU6OhSsnKnCVOV0h3L8OCxizkS6A6FsKkYa7sWevrmpBU1j
         5m9A==
X-Forwarded-Encrypted: i=1; AKwUvByaA29Q9l1XD6dDI+91qjqv+zBfYKAHw1x0BHHzYLZg3shrZrVMwonZhXLp0QDA1n7pJX4KZQFUkQ0=@lists.infradead.org
X-Gm-Message-State: AFuF++lDwU0+wkJdyubleHBB3cBA8YNV1YEjycUQg/wYzou0b/gjK1mC
	D2IZC0gSb8tPZN4zedsZFFcdI22NQ7m3EMTsiys81YK0wI8m9Jdnvqta
X-Gm-Gg: AYBFou1E3vBWqz4Y49+9sQ3vlv8jWhlihKjL0H+gDKOmioNMt32POOKRPugsYagSUlg
	bYheuFd7a68bMzA269BGdIpmOZyxnBiWFU/neuG3s1gSntaN6RPiboqO2hzG4wmjQkDKIHsbkSB
	c6FZylN//NWfAIH2JJTyP3H9S0ByiIB+PKn9yVfmFE1Dd8l7BdqYH1ASiVSC23x5l9CQ9A3AthY
	TqmVnQRoiFOmBI+fDvNmodZqHGkBmBKC6Vrwrsh4Q0/JlBXNvczwhEKIKiGYgCNXqZyrpwHAB43
	iNHLtjElXsydeedkY9HQFf44dBgg7HO+zCmHYb1zL3jTy404oRJ6JsdbFmA8vfockl5c3DZbGhC
	TQxvLPn6F5yHsstgLY68BNxH4VVSwRNWPIf197CGM1VR2xX4WXBYRno8J3phMjMxahsAfqQ/OhB
	wBR6xezG6NvLv8sS0WkU2S+a6k8+r1/w7uHbw4/NS83Z8RxNACk3lml1ECMpjsUXx9vbTR8ZZGn
	SLS1jbAVu7Na5QY8T+GvLWInBee02Lla0D5Mw==
X-Received: by 2002:a05:6000:3cc:b0:487:b4d:8810 with SMTP id ffacd0b85a97d-48872ac72a0mr5781371f8f.39.1790280275102;
        Thu, 24 Sep 2026 13:04:35 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/8] mtd: rawnand: qcom: share more common code
Date: Thu, 24 Sep 2026 22:04:15 +0200
Message-Id: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDsQA4r1KiIlmfzWWZhoAiKId
 2/o5sG3eTcVZEWhsbkp49SiKVa0r4ZkdfEL1lBN1tjevK3lQ9L2iS4G4bK6DN5SjaQAXuC9GN9
 5N4DqYM9Y9PrPp/l5fk2hw31sAAAA
X-Change-ID: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130437_643646_65B9F732 
X-CRM114-Status: UNSURE (   9.99  )
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
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
