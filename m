Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00474C369D3
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Apr 2025 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G7FAyXlOvCOBge1BXFhgK0fA1jVXMtTyyxRsJdUvEMU=; b=bcOqFWnHOZ0SzP
	kQm7KXPpoP7D1IgMeBKFoGDi3p64vnIsKVXCWwrvV87Jc+I4W4Ibk4b7l/oXTvPhVTpCeNp8tq3BC
	Bwc6WISS+1LQphM2TXI3Q1cl1abdKl8HUvBRR+aQ1bqLJXHxuISmHCVIfU36l7DlSVLYc3hJnDNnv
	3JT/YmA1xvqhw3tJtvIGxk5xmSO4ob5gzZykuLXB3HPi7kWKPpMdQVaohe3d9H+Bznwr2Bqe6MjOH
	FvoVcSwyWdg0FnQpCPN2gW8pe9byM49paW1ySHhH3KszJ8BIxvoFPhopTNBHsoSD7PHmP2/Hd2+oZ
	U4lyhGyeyMQoSRoNY/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JBY-00000005IQj-2rBG;
	Mon, 28 Apr 2025 07:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IxJ-00000005FqA-0fcB
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Apr 2025 07:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=4TbMRqWlbuD8Jk0c4g1z1Zqott/oeTMW5o8nGkLNa1I=; b=FCEuFAP+8KFjnvwWLEjK9C86Nd
	T2Dx7JyHmAC1A+rYaRoD7CmDqU4BL2pR53qqHnuOYIvGew1Ll1NdxXFXGvp6gWL5Y6Q0tGotKYGiQ
	xDpJkiEFQ7D25axe8FrxERBibmoYyjHEEk4wwSk66r7MM67ukNEgCooP26GerkiWgX9B+yQPUE/fK
	Vh6x7vSj9RTvsKC1K+pc9lTFgMiUdybqqgvsFYsCzz/Aki/68QkpV7B3UOamLYK6GsnXGHaBRQ5Mh
	ZoTzr36abx5tZpm91W0DP0WAVeRVFmc8eQVbOfaFv3HFAZoaLwMc9Lb3v2D7pjGSMfMiOvCzumlmQ
	iZzaeNWg==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9IxE-0000000CaDg-3Wdf
	for linux-mtd@lists.infradead.org;
	Mon, 28 Apr 2025 07:31:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so8249349a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2025 00:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745825461; x=1746430261; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TbMRqWlbuD8Jk0c4g1z1Zqott/oeTMW5o8nGkLNa1I=;
        b=QEJVeMTJPy71jgOPTtR3easE0DuGwK4cDgQ97CnlTKQFImJj6qr2LFWfKdwpaQc3+r
         dh+WlZDfMe12LwjrqX5qXnKYNXHHGmjJfdwaHiTUNrfSu2oUWUo6AWA0WyZSPsoOjPja
         /owhSq1y21Onst8pzEdrNV3V6HWsdf8kyQrWQt8xJtMi3zeZ7aX0RW4JwJn8r+HZaw/P
         u29Muyo8GeJakI0eeKlPRJWDwdKUyVhSUQX079f6JDKbik5BMGPFZDJSsSmMyF6Kf9X6
         GivXUFDadrCV1QlzOdGyA8pyuNFh7gbwhZfRdP8gJkbz7wDC95YZmA/2GmzfCXsCmsQy
         bfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825461; x=1746430261;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TbMRqWlbuD8Jk0c4g1z1Zqott/oeTMW5o8nGkLNa1I=;
        b=NySgTso9z9i5caonEXi0MWGRkMuUClqe3ZM748Xy4Bddw78IxGzHxU1bL2LOLJXVBr
         mNARobOZjwd3GelfWuw4sD4pjdVs0e6SeFdj/urfa8hHXIVGFJlxndpw5t6SbY1mY6Ws
         mofiA+1SrfS3pDqUg5SLk3isbpAdTl0mlEm2KmGEKbEJ3Amk11/OPkjB6LvM4fdVSzrr
         ASjnGQGtibx0oBs9zeBxEjA7NZbeqOe1v/Y8tm4LPbQe3EyIhkOpap6aJ/1/ae1hOPkD
         RWUwmsCGwgJff+SdBjWmzNXgERh+jTU8MNjLuQo032Tp4uldsx8tnHesHiwrVlj5Nkne
         jCfw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZxgLPaHAXuUNvr+4FqbDmfOJUGeBYQcqIGuD/rjAU8Et2eb6dJ1jB1bwjHVNJDOUB/iYFrnWiwA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyzoe2yCBGL9ArQhVFckOh3n9EIhWJi+uPoRBkgcqmq43QOzWA
	w/rVVtAIz/sr8bYgnh9T2XsszwYh0Oil8WRO5TsRkqxITw5ADVfzCyFvig==
X-Gm-Gg: ASbGncunRlIlhDOfWB9Z7no4y4VsDt18Vxpty56ZV0btr/uhDtmh39nt4fK6qX/Bbsh
	aU0+SKPNe5k5Swh8W70CBu98zRcmaiWORDWyQUg9bm4fX1Rqfe2PsOHy+NJK6OEma47PrOxui4y
	9N+SiknH/dKDLfU+EBDzQ4OyX4MDERZFvQihs3IF15AASVMP5etgRLytD3FPYZccWoBAxtxpoXG
	tzHcINavAGsMw3zG710tOcQP0tkeLLOTKgdX0jCxioYXlAOL0xBsnbzSOX7TQLXf21elxzo3Ak/
	cOw+sMmDll1Oe56yJqumTza6BDobfEL9m4tEmobRC9V/WyzTfK5qdwXqP/HcMDLlh48DrLDTDK3
	Wxoi27g==
X-Google-Smtp-Source: AGHT+IECkAD0RhKI699skwaAuKgZAu1ETRTnosTVuSJZ0BYUVLz8u5qyGONHw+yQVtW+1wfmwORi6g==
X-Received: by 2002:a50:858d:0:b0:5f8:215d:769f with SMTP id 4fb4d7f45d1cf-5f8215d76aamr95590a12.2.1745825460645;
        Mon, 28 Apr 2025 00:31:00 -0700 (PDT)
Received: from [192.168.20.124] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354638bsm5371527a12.63.2025.04.28.00.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:31:00 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Apr 2025 09:30:55 +0200
Subject: [PATCH] spi: spi-qpic-snand: fix NAND_READ_LOCATION_2 register
 handling
MIME-Version: 1.0
Message-Id: <20250428-qpic-snand-readloc2-fix-v1-1-50ce0877ff72@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK4uD2gC/x2MywqEMAwAf0VyNlDja9lfEQ81iRpYqtuCCOK/W
 zzOwMwFSaNpgm9xQdTDkm0hQ1UWwKsPi6JJZiBHrWvog//dGFPwQTCql9/GhLOdODGL63mmTmr
 I9R416/c8jPf9AIu5D79pAAAA
X-Change-ID: 20250428-qpic-snand-readloc2-fix-bccd07cf26d3
To: Mark Brown <broonie@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_083105_034642_8C6CF458 
X-CRM114-Status: GOOD (  12.08  )
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

The precomputed value for the NAND_READ_LOCATION_2 register should be
stored in 'snandc->regs->read_location2'.

Fix the qcom_spi_set_read_loc_first() function accordingly.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index ae32c452d0bcf852b69b76e595f3588ea7e1a670..94948c8781e83f30650e5fbac56897daf5eb3c2c 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -142,7 +142,7 @@ static void qcom_spi_set_read_loc_first(struct qcom_nand_controller *snandc,
 	else if (reg == NAND_READ_LOCATION_1)
 		snandc->regs->read_location1 = locreg_val;
 	else if (reg == NAND_READ_LOCATION_2)
-		snandc->regs->read_location1 = locreg_val;
+		snandc->regs->read_location2 = locreg_val;
 	else if (reg == NAND_READ_LOCATION_3)
 		snandc->regs->read_location3 = locreg_val;
 }

---
base-commit: 15cfe55ec58ace931a73e19e5367598734ceb074
change-id: 20250428-qpic-snand-readloc2-fix-bccd07cf26d3

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
