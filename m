Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC8CCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D3GfUrm9K2UKF2JpIIDOSKs92RnxXT80d7Xu/5ZiLiw=; b=DyjitwNcYc784p
	gvCxFhxP8pxtoK6x4DfVtXWXyuoyG8MF84RDI1gSoZ+ri8ky2B7utszngWMy8tkb72+JeYd9i4Vhl
	V/jx6dr0Sp10ZVx89ienr96h8m27L3tql+SqmYUJpKyTWOu7RCZzIFYGUuoWAIA4WrDRA26DHMqC2
	i3WAAwKlD9RDLhYGEHjYE4Uo6qctAeP+4cNgl8S8UfBfNgNoReW0eJLxjljS3tgubkFrhwknsK1qt
	IIsGG11JinPJaUbPfjrlF1gm+ZeJ6tN1Vkig/IKTGedMxG1gmiITnbrcZhDJUUA4OSci1KCEhU0jH
	VV9yqnYceMRf1pgLYAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhFT-0000000Fn3g-2w7H;
	Tue, 28 Oct 2025 10:48:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhFR-0000000Fn37-2ivW
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 10:48:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-591eb980286so6082954e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761648495; x=1762253295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/dkCaYwuy6k/VCW4Ihz5PjQFBOcB6fd68PVzBYbeCU=;
        b=NLiWkif4D8+ODEqoCubRdbbpW9Nt12AcyvQI2PFq1E4K/rE6Nqf62CbzhFsMyeh4e0
         Xvs9ol3PtQIQ3PKb/+UjVflHLVlIw2YWDw/egyJjMWz1BEo2bWOp2ypkmfvYQLrGwq0u
         fwtYUp2q5TLbK8+6QJVfW8efhPK8G7Lh3loLX9ohZITzCCbsCYxfI/YDNfXE0EOnN+h4
         oLsULtOO7h7i+i3JPbJnkgsQpMutC+DrT0DbfMUT6OSUHpOEZ7YYT4HBNXoTp8vVBdiI
         kZsBDZ5kcCPpDJ5EirdwZsuxRSgXXRJ25Zxa+vilf76p2oq+L4ud4DGo11EMqvmUWRY6
         SlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648495; x=1762253295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/dkCaYwuy6k/VCW4Ihz5PjQFBOcB6fd68PVzBYbeCU=;
        b=xT3T3NnW56BXmNULbtpP4dp9Q6jn/bo0jNXKa6XcMHldvZSCBVslgKKO3QbMNlkU+6
         d+8Yewt6L1mXL19bOU1+w0f+ETUhbHpMex3Bq3XUnqsGdO82pZAVxCav56md5eqdimJI
         ISLuvWRqtMAaM2EUPAoMDAbRhHDXfaNp6XlM5fXyjhg4lXvShbs8zzmP6HMePCROgBdu
         3k+p5+C0958l4Gs4FEG2U5DFuMvu5i1kZmCyruV9zLgXU8RCiVp/4GLXYlL46MpzKnOn
         dJgT8CpZaYfcfd1/AYKMtHOxUQvPSien054tc3bcXDRGWtdlcAirc6oKcq5J13WfSLrt
         Lcyw==
X-Gm-Message-State: AOJu0Yw021nA01tRtFxtbA2Ze+iIYrHQ9hcvyFJYsLf3rD8qsHdfRi31
	v19AkuME1f0AcG5Q6bejh1ufWIMOX+9X0vzC6KHtZVpe15arYANx5N6sJG+WhLMZYjIekQ==
X-Gm-Gg: ASbGnct0rUVMOYn4OkuTdzHKDXtcQgyhYpAmQ95FkEPfFBIsjcmKwhle1EIP0Z1Zb09
	gOuJuRGGP4KN01gtDPCvLMkNq2xjCAvVFRzrqdL1IzEPU3TwGjaSOO9I/ZPpNI9MFmETcLx82yQ
	REnl5vHx8+AFoaHSEkKSWrXgKp3xNMW+2SE14KW+COpd/YCXI+5jZnHRtMFe2TR2Plhv1xS/kd9
	NkdVzV0Rx11brAO1Ez1rXblrvHdO+cMQo2SVZYgJqxASMdGvQQc0lcSBbk5iwlImIh+g0F3mNAn
	POXLzywRZblXN05t/o/DHjhoYWtz24yiroMAmMpL2Nk4W8KuTi6HFSOadeRqRx58ZgjGqZ11kJH
	g5ufG7p6eJdZXEBzVTvsuescuUDhjtGH6bdVkVfHtGfIbFIMpKzUSWwyPUrf5eJ9SFhVRnfhN6u
	oZMhI0yvybnuHt+FOq0g+2ngs0ctMYIzacDiVMbtMLzF3KNpr6GXWg46l3bnYp
X-Google-Smtp-Source: AGHT+IEKIhjHuAZnA/7rxFzTb4SZln42CWK9VdWpUgZfoktpFAwwCdxcYmfMY5RcIagRbDjqzjO7vA==
X-Received: by 2002:a05:6512:1188:b0:592:f9c6:972f with SMTP id 2adb3069b0e04-5930e9c9283mr1295470e87.54.1761648494793;
        Tue, 28 Oct 2025 03:48:14 -0700 (PDT)
Received: from lnb0tqzjk.rasu.local (109-252-120-31.nat.spd-mgts.ru. [109.252.120.31])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59302878849sm2952293e87.80.2025.10.28.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:48:13 -0700 (PDT)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] misc-utils: docfdisk.c: validate partition size to prevent arithmetic overflow
Date: Tue, 28 Oct 2025 13:48:10 +0300
Message-Id: <20251028104810.65250-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_034817_714461_CE277791 
X-CRM114-Status: GOOD (  10.83  )
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

report of the static analyzer:
Possible integer overflow: right operand is tainted.
An integer overflow may occur due to arithmetic operation (addition)
between variable 'block' and value { [1, 4294967295] } of 'nblocks[i]',
when 'block' is equal to '1'

correct explained:
Added bounds check before incrementing block counter to ensure that
adding nblocks[i] does not exceed totblocks. This prevents potential
integer overflow when user-specified partition sizes are too large,
which could lead to incorrect partition table layout and device corruption.
The validation ensures safe arithmetic by checking block + nblocks[i] <= totblocks
using unsigned comparison.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 misc-utils/docfdisk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/misc-utils/docfdisk.c b/misc-utils/docfdisk.c
index 486ce29..df070b2 100644
--- a/misc-utils/docfdisk.c
+++ b/misc-utils/docfdisk.c
@@ -255,6 +255,10 @@ int main(int argc, char **argv)
 		ip->firstUnit = cpu_to_le32(block);
 		if (!nblocks[i])
 			nblocks[i] = totblocks - block;
+		if (nblocks[i] > totblocks || block > totblocks - nblocks[i]) {
+			printf("Requested partition size exceeds available device space.\n");
+        	return 1;
+    	}
 		ip->virtualUnits = cpu_to_le32(nblocks[i]);
 		block += nblocks[i];
 		ip->lastUnit = cpu_to_le32(block-1);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
