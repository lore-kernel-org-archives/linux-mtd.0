Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374EEC47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ylHpoVyxxsOkaB0JBqnLTaaLliOlEtKy9IkDcZOxiAA=; b=Mnk0v25TuH0d6l
	qV5b9QZr6vvpENtfYE272JahNGhYPkgRzrfvvC2+3RMHxS3WKmG48+0epwCoBZUKbTNNaoXrwl0Wf
	Ag552b6A0lGghNuc750jAbUuF5iGv1AM/5Vg2TUmNMup5FUdZ5FpZCAUGqR5DihUBwBq63NXQFccH
	G8HFBGu4edNh0Ei+Kv1tj8jadHaSro7Xw2+RNBO6mGOfj+eoD+HOzR7qMV+dG3PoqPotKd7eK1Weq
	hHAE1n3Bv9/ywyU+d5DcDlb4HoWhIauiop5Tt2vgU22DzmajZvHFgvhKdfWmvuEU9WbdYCJp37yg6
	yoDdEq7fvBJnVNbu/UAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5uf-00000001h7C-16Zp;
	Thu, 25 Jan 2024 20:01:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5ua-00000001h1q-0NA0
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 20:01:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a27e7b70152so189454166b.0
        for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2024 12:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1706212875; x=1706817675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjZQMJu8JXGJ4/hFdnB0KIWnvhPMFZL0jbAwRB4Bxd8=;
        b=0MgyCqy6vDrXtHrHNjQIiDvEzRjsBS4lnxJ/hlzoVrBHSxfoutCTzHh63aO2hn7aq0
         X16eNQE3a+TxGNoGscLvaxgh+WwxMc/0q0TjAAtU42SYlOzZ89Np8DrFn+8X2HiDtIu6
         SzpDIoAxEHTlqvzWN+H8uxfDKaj9Ev5kRB1kroiHGF6piXyl12sf9hoYOn0cqVT1u3jR
         DQqNgnBAvtAV+lq9ehexYzkNxywvZmsPKzIg/UpIK5VQNmNZNO163b3rOfiIXVCGN0ji
         XdGuVXpehrKW26F9150LmH3NWbvQgDvMWfk11Lg6ApVYUNFQvQEyN1M0p6rHYq3ZmNbs
         CYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706212875; x=1706817675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjZQMJu8JXGJ4/hFdnB0KIWnvhPMFZL0jbAwRB4Bxd8=;
        b=bXY6Z4JM6SiitH9VcV2h6RPIfF6WQ7WX2xXrhMv7va7PficsdgjbpQUX5JcX1IlnPc
         M7zhfE9TLPvQcDXf7GtB35KJlnhJ6Kdfp4rGeUljiAw+O3eDH004b7BaoroIyybg5bgg
         k36LHIcV9FOkRW+W5UCA0et/FgPWP0khistsl4hCKA6HDY8/ypkmh5i2qhZ9Ne0MdHT8
         xyL0XReo5WDMrGVww9CqhGiwPlCd6WuIbfLDwCRyXUh40XTwGED3u+MIb1gnswy4N2J7
         el3h3+S2ATp4PZwqxidieKxeQMoeUSrt55VQTa2hA80W4f1vEIkQ8QfM4fl4OrT9gbGX
         lYsA==
X-Gm-Message-State: AOJu0YyLkcjRLqKhw3ahGVTiBHt7GcC9Q2hgX62dk/HX5JB0jJPhy/g/
	x8Ipiwnn+8bIsXtSfCLqnZYsUvjwXE9AqTPywyU5UljzTl5fc0NNFFlr7I/q8kcyKpygOWKWKD5
	K
X-Google-Smtp-Source: AGHT+IHGkHmj96AZrG1C9Gzn4qdCJRKaw3LE7lV5CI3SQbvj9lV/LuLm0m5wCgvzJsK98B1SDt8pJg==
X-Received: by 2002:a17:906:ca58:b0:a34:8908:de0c with SMTP id jx24-20020a170906ca5800b00a348908de0cmr137234ejb.2.1706212875558;
        Thu, 25 Jan 2024 12:01:15 -0800 (PST)
Received: from pikachu.. ([105.225.45.176])
        by smtp.gmail.com with ESMTPSA id ss17-20020a170907c01100b00a3496fa1f7fsm195577ejc.91.2024.01.25.12.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 12:01:15 -0800 (PST)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: spinand: Resolve GigaDevice/ESMT ID clash
Date: Thu, 25 Jan 2024 22:01:06 +0200
Message-ID: <20240125200108.24374-1-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_120120_469986_66228DDC 
X-CRM114-Status: GOOD (  10.19  )
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

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Since commit aa08bf187f32 ("mtd: spinand: esmt: add support for
F50D2G41KA") the MT7688-based GARDENA smart Gateway no longer boots.
This is due to an ID clash resulting in the ESMT driver being used
together with our GigaDevice GD5F1GQ5UEYIG.

The following patches resolve the issue for our board. However, I do not
have any ESMT NAND flash chips to further test my changes with.

Ezra Buehler (2):
  mtd: spinand: Add support for 5-byte IDs
  mtd: spinand: esmt: Extend IDs to 5 bytes

 drivers/mtd/nand/spi/esmt.c | 9 ++++++---
 include/linux/mtd/spinand.h | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
