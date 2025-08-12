Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4588CCA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 05:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VTEWZDz91yrtAjfzMutMiR1gohg7Q7vI6d9mZDXOpxE=; b=BuFjeZyCpZg7FC
	uF9zRBw9OIItqTRWqB661gYHYuPB4fNDu4AXLVtqYlea+cOcHM7t1s51mfcHpq6DWgxcjxxgqJLPl
	mYHkO77KL33xv+1PLyz6QQe7czh8DxJNQqADFP6GrbH6DBzq779ZWhxtdxya4A+BFUe9YNJ9E/GLD
	NvbIPCfDqGDaPE89LZyXSf2dcxn8XtMZdFaOfxNCSBk1vGD1gReaGO4fxmc7a12tfqPegzLn3ZK1I
	jLsRNsDU2RoiV0moP43tdue5SCLSdYlcwpDc3mjByKUiAR3Xu+g1XgGnn56+ZWTTUaQ3jrZN0cu5M
	6pBQ4KXYk5Y2B7og8Hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhjs-00000009trM-2AWL;
	Tue, 12 Aug 2025 05:40:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhST-00000009s4p-21Ln
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 05:22:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23ffdea3575so33004425ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 22:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754976120; x=1755580920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6NJO3iNOv3qmpNKbpG0b8ArdkFZkJCoKkSUSOP4dNw=;
        b=Y8wENNrUeMqDimUD77/iHFX6ZBmk2uSKdpwO9aqe4IYE+q4j0xP5JIvMmgOmKmIZcK
         9yINeYITBhLmf6fnfyAhk1klqd8CUr8+k5zD7Athjcq3ThsIH9oUeNLrw1UT3Vpx4x1g
         dz3U4JABppZuqbt4Lg1/tD4s+k2TlSvpoRLGbolkKwfvcbRc4xCpaf6dYDUjqF56r6Pn
         6SOBoQ9d6FuP+Cmk7DKsorvcLaPPcwcAVwTqaKmeDoLOyfqJ13so5J9R2Ay5RJkfXOcq
         lBzMbEoDkLhAr/lCIn7wmFa14lRZ1NSYEPV+Lz9o2Hleyzj9mHfPzMmzNPd1iuaPbRaU
         ePCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754976120; x=1755580920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6NJO3iNOv3qmpNKbpG0b8ArdkFZkJCoKkSUSOP4dNw=;
        b=stljTVHJL9q68q84MM33e7SgxIW4lnY4sSfxXdVcqZWBgRC/KAJi7KhqSwifpUg5mf
         YPZUejTQqAJVeHyRQK3MB8LJSadP8ZJLE0XvGsor5Q6nFEIvo1mT1yRfqwhJIYJ6URSk
         dDQjHs6B3c4EoFB3oQVpPUj+bbOoOmlL2EHHs5GmzWq7qSaVY/A+6G8w8ddd7T1TfJuc
         7h9YUgeu/yBa3renSLYwItNFogwnli0xSWHcuosuTmuv5VDyhvFG71ZVYxi/GRDlRdbK
         1YQwUl/MM0r1MEu8DDMfnVehCWoNNfvTTadUCy5f73agzP7i3bPLF1BYXjCfHRxaELsc
         KgnA==
X-Forwarded-Encrypted: i=1; AJvYcCVzf+GpP07ClghC+WmtVWn8wXNhxTNmqnqpJwrfNH3YSwZMzxhq/nhoGcn84CREZJ6L7b0/OGHkEvM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx45qo2QQymG8gC7IS2EKL1/yh0Pynzpd/fft3mWQwpW+HA6DiL
	X3+gVT4ifS+BJ8YZYiBZ8RJqnpgtDuL/IXnsGrGHfXVEKQBsW98Xi1aN
X-Gm-Gg: ASbGncu9uycg6VeGtlv+rUZGpdi2AuuZIPmt+mQt/QlImI0TOqTMtxT6oTqRRJV+jy3
	LTvM6z/if+zm2RC6OxTaL5Ws99DmSP10TTH3O5+VwUZqZoqugyfIitx4J62IO/exSqkb29Bi8eD
	66KEkZFCSGLk1eGPtXMgVCKPksi2VB5TX+cpr6NiiYdEjUbsFZjM40fmgx4oI7V0J8KCxNzqjUQ
	mab9Wrrrz4oDfkpZvoW8OaqE2OU7H6NknVeISY7FeXSgLfoOaYomuLF3uwncVplWHv/dT7xc3At
	JttG+w7UUob8PObxIhMCd1FMnMH3c0BYyNqdd3QpLOdQVUGN+iIaNVvBXeoyxoBioMNHsZjS1h8
	ZG1STwm8z7PvHiNW0ubP82wUTWsyXo0FNAwpX2hi8Nrn0cArs6TSEVX3nhqttBA==
X-Google-Smtp-Source: AGHT+IF1ochuXZ3IX5U0e55OXQGDw4nd3ipP9HyvaUP+4khivk9Hd9lYjetLf8OXfPWiIAhXj5+nig==
X-Received: by 2002:a17:903:1ac6:b0:235:e942:cb9e with SMTP id d9443c01a7336-242c1ffb1e7mr217653265ad.9.1754976120361;
        Mon, 11 Aug 2025 22:22:00 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aab0ffsm290686715ad.166.2025.08.11.22.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:21:59 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 79DBE8022A;
	Tue, 12 Aug 2025 13:27:22 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [RFC] mtd: ubi: skip programming unused bits in ubi headers
Date: Tue, 12 Aug 2025 13:19:49 +0800
Message-Id: <20250812051949.983040-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_222201_536555_CC319CDC 
X-CRM114-Status: GOOD (  10.97  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch prevents unnecessary programming of bits in ec_hdr and
vid_hdr that are not used or read during normal UBI operation. These
unused bits are typically already set to 1 in erased flash and do not
need to be explicitly programmed to 0 if they are not used.

Programming such unused areas offers no functional benefit and may
result in unnecessary flash wear, reducing the overall lifetime of the
device. By skipping these writes, we preserve the flash state as much
as possible and minimize wear caused by redundant operations.

This change ensures that only necessary fields are written when
preparing UBI headers, improving flash efficiency without affecting
functionality.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/ubi/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a4999bce435f..ccab4691b338 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -868,6 +868,7 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 		return -EROFS;
 	}
 
+	memset((char *)ec_hdr + UBI_EC_HDR_SIZE, 0xFF, ubi->ec_hdr_alsize - UBI_EC_HDR_SIZE);
 	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize);
 	return err;
 }
@@ -1150,6 +1151,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 		return -EROFS;
 	}
 
+	memset((char *)p + ubi->vid_hdr_shift, 0xFF, ubi->vid_hdr_alsize - UBI_VID_HDR_SIZE);
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			   ubi->vid_hdr_alsize);
 	return err;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
