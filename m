Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E52CA0FF2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Sep 2025 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WPDGXhlUmkhn0WKTgmnVDYD8QxKEfQYBgYDe0IZ9hRg=; b=Bj42yZ6N+BnDH+
	lj/Nd3spKvaVPc42L1jHMGubxIRGjPcX2oF4cg8X/uLnfUSm+GH2kiaRN5EzVLeDcZCdpZs7rjSzV
	+IULGw8yH3/x6VEVEcU+9tkbNs2vbfZTzp0JZENtIPCR0ww0YnxwMR6TFRQptZNs2aADVMM0dNPHn
	YjnU2xpwKgT54O3Prj2Gkklq/yMd7VFH3GKKHldLkXeW8NmgxOTJ1YErA251wHEAYcGl8oZp8ZYHt
	qE7Y8FEbk+K5eSTgkE8rmyH/6sio5djgC4PzN20STBoBoK2Br4KHwJFUmCCuhbkD2tpBw6putZEhD
	Mb6h07109cV7bBINee8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnIk-00000006XWm-2qyZ;
	Wed, 03 Sep 2025 13:13:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmRC-00000006Mbf-3wOD
	for linux-mtd@lists.infradead.org;
	Wed, 03 Sep 2025 12:18:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77238a3101fso2844848b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 03 Sep 2025 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901886; x=1757506686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AgtFd2zd49CBSr/rWNwpzPccn2qZ7bpb6f3yzM2Jf8c=;
        b=cpRg7UdjRvrWBtbIjIkpVkNpsanaVw8zjbLCRsbMbVawNCV2TgJ679mvfztDPBbrN1
         QbFWTPqTzM5/G79s4NnMIuAgeVp/09CkGx9gzCv5KGCfzpAFWMB+8dtSYK4wvtDZ9hdd
         Fnp8dPGLFPbQxXiUmXzWPz02Y6mB/cLsEWLH/Yei3Uk1dy6X5uhKquqPT2Yh8ptRFUT9
         XJ86fxLbqVvv/HyWyb/XCr43//6NSFuk2GkIzTLOSQEdaHleztReg4LGoZwmSXU1v44E
         HU+RMQ/jr3B2KM93PgP6QiDil5CObBf1o7OFtdkCGrfRJ1Ot1keRVAUVzxDvSHWgArQH
         ch9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901886; x=1757506686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgtFd2zd49CBSr/rWNwpzPccn2qZ7bpb6f3yzM2Jf8c=;
        b=uRTxeEecSybNrguHqYQyeAnC/swmrSjmmD8MLOP/xBF63iVsFhIEoDMl/yMKIC14QR
         vV7nooGslxne74f0M8/X7YCrtCmFIopvy7nBge+VBOv9ZLwmFMV353NqjAZAeB5++OE2
         HoYjs4da4A+ZbXkICLeybFIq6KkC2ObWzPw0Py0uvhcKH4FuyRe1WAc3fkNSsh7I+Fpc
         UuJeYZW6gN02QSM/NpSfQIp/86QEXFtRsyi8hAptz9i8XWkdUIqN+ENouXOMhP7QXTFc
         CDT6t1VcfQ74WFrEulUghaITN/rLVdSGhLxBLtq2Fe3iC5K4rEsZjjthXevqC5HjtwuT
         5hZw==
X-Gm-Message-State: AOJu0YzwH6iU2Eb/AgPDfH4z51kVcJ21DnRpSoBD1lGipX66IeXM1Vzr
	ijaiROtGoP2EQz9fZf0iiZO+YwwEev1MF37K8sdtdWxYr7fkZCpOyCa5
X-Gm-Gg: ASbGnctjno/U3ci8MBvNL/wbFmGr2sNKDr5NQlQi3s10V6AFv67NZEslX3iwHwNUbD7
	yz1uVoHlVHOJrBjYBYIDT9j9Kof/dE8M9ci6d7rnRWm5BTq8lLzSPP/+qTbL+9TetxwdhvOiJ5B
	BqcrYkmxU6yStbEUq+fIHwcE048ZD+/JxqgrRDVkO36fgV+Ou7FCx9wuQ2Td2x2VFzQcLwfbVAg
	9bCi2t5YNnbubcauzitJ9iGnZy+/KqXhWPcxnDUmE1gT3PBfVJ1CCnPgzoP873VFkQomGVJ25/c
	UIyKznCKKd7PmFXMLd4ch5KJJ/LiWE0MNZGmKC5dK/KFIvOERTNQpxWgm7Zkak7kda/Ws6solVp
	Ik3bOT32zgvq/N9GSOc0HR0+8PHeHV4jedjTG
X-Google-Smtp-Source: AGHT+IHXlQs3naooWGZvpcsO/wbHJ5kA1brIeIBq6OMurJmwLCXCEAjzel1TdBQ14vLml2G96C56Lw==
X-Received: by 2002:a05:6a20:938c:b0:249:d3d:a508 with SMTP id adf61e73a8af0-2490d3e1f8emr1791836637.57.1756901885674;
        Wed, 03 Sep 2025 05:18:05 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm9061010b3a.11.2025.09.03.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:18:05 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] mtd: sm_ftl: replace strncpy with memcpy
Date: Wed,  3 Sep 2025 17:47:46 +0530
Message-ID: <20250903121746.2527046-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_051806_975948_B8EB0A7F 
X-CRM114-Status: GOOD (  12.54  )
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

Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
terminator after the copy. This aligns with current kernel best practices
as strncpy is deprecated for such use, as explained in
Documentation/process/deprecated.rst. This change does not alter the
functionality or introduce any behavioral changes.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/mtd/sm_ftl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index abc7b186353f..575e137ce8f3 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -44,7 +44,8 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 	struct sm_sysfs_attribute *sm_attr =
 		container_of(attr, struct sm_sysfs_attribute, dev_attr);
 
-	strncpy(buf, sm_attr->data, sm_attr->len);
+	memcpy(buf, sm_attr->data, sm_attr->len);
+	buf[sm_attr->len] = '\0';
 	return sm_attr->len;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
