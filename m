Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B9CCF2C6
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2jp10c72BXtBzEexPfNCNa6VOsVDp8mYU/JWrLB9n1A=; b=tsECkMAbYWS2R+
	V3CDoAxT757Knm//uQpwXksGwONtsm5Kl+oS4CcJHpzec+ydmoW+wf26W61cgmQZLKo2ap9Ms9iCW
	1EV5rcm2N0Pq7jFV/ZZrqHDQuUv4tgU3HSM81q2wypY0jnt5to1QV0YEP+MFFWVUIXQ88W61Q70r9
	RbzYsPoe98gCvDGZlO4JQvdJZX3TRgzInzeciLjRweKSqNndwTl5HqXw1XB0PS+S82Ee2fAYu9Rvc
	CzjNRX3N2d6Rgcbm7k7bu/KnSnWXvmXdiSX7YZAODuT3zbA6zzPbfy2aVsBKMYEkA36ZZ3ZY4mIz5
	Hu9StEDFEXQTflfL7DTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmiV-00000003g7x-3vQ2;
	Fri, 16 Oct 2026 18:31:43 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmiR-00000003g6W-1fRa
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 18:31:42 +0000
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GGXvcG590925
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=ynKUazWiRiEGIxsFkc/QlWuKlm
	A0yVlUnEKK45d/P1k=; b=YwPZANlCJqZenq835F3SEQgidSDozA5vUUeLeyTcNz
	HmFz5Fg+TtcyWssW8fWe0TVFsRjihFiUMWS4X65b0EwnfSf8pbSl0lqRvQbOFyZv
	nLIeyZRi5rIF302EtpZKXmoBmk/vttD0F95DUHX2zpwxeLcHvGzqdvLk/6QzqYwl
	ndMiSz59dJukvZit6HzKoxlhteWmwD85H5CIkG0PJCQhomom/iHbi0pRMzA/1+ZZ
	gGMsV5L9MhVMWfxOLS4EtoeINwy+DjxSozAnfrpy4GXSq/GzGcOXa5nNxrFZCLMC
	yplbPEMH05JRnc9wWle/6MTRlcc6qkLbd72q+u/RKl0Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbhuav13h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:31:36 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a510b22fso5312676d6.1
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792175496; x=1792780296; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ynKUazWiRiEGIxsFkc/QlWuKlmA0yVlUnEKK45d/P1k=;
        b=nbLgJ4uZhDLMECsFk83Zo/MC0MR+0fs0hLMys0IlsRwIxZHKSWcp40glRxldrErXZH
         6BMO3JLc6600b4R0bVlXx2ylrNadUJjp3fhYLu3elpwU5TLg0FlEN9zv/nOgGfhVlm11
         eNrg6JRV5+jORhRcBIK21XrFLbnVvef4t1hVXTFHlxUD6o5oCpe3yyxoSKeb0mENH95/
         zOBAS3QJBVZdvmDfkuu33DNss9YnGTDQV3jvE3P8vInnY1+HETv1E7U57I4Oi+2QavCu
         3v7LGtKFY7CKAUciUo6JbSuTo9wqEQZLaaxEFL93+fCY5476c+D9rRDHqcSeKVaZjFcO
         a+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175496; x=1792780296;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynKUazWiRiEGIxsFkc/QlWuKlmA0yVlUnEKK45d/P1k=;
        b=U6X15jMD9lb9hZMKE8gr+CODrTmV2IyGvZcA2LGV4OxNt3eGuGwp+H6AvKodPJB04Y
         cXUdMHY+G/cvT1YWUJU6hVS4kBegBAS66d0ipCf/+YFMnbBHtRGuWsWFweWGmRkdLV77
         iKc1NC05k3uEWqpB/61pKcoeStCCG40X+FCWX83mSxtjnwi/giQMANPFJMjucyRpkFxG
         D4wdR+GhZzZkdOrSD0fHOo/9KreOg4gejPNXr6ZD7HRToQpebk2vRGB+x/2QwSz5kxO2
         7HbpNLoOVOfjzLNDY0vO5ERKBaZwTqiDllcQqYjd0nRWUS2ur6fKGjQHDymD18LEmtzb
         DNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/LNOdnadui5JOOE2GNTaypnD0+M4yUgRQArYfvVO3qqdEPRxHgpsYm8sT03OBRWYwQ5DXIL8xoRU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJv11J/d8fGeA3LnngmAZgMknTPl7JOvIeawI+SqIW6ExtAz+ef
	h/9jZHSbtrAi13yZv9mxlxjKl7R2M8lzEe6C61hZU5Xhi1IY54h/40Fp8vKNrthSro60l0moHJq
	cB624otIn2oeLiSQOwlM9libjYqvOBlgb+Vs7AcmGut1gjIHKNqqLRb1mz7xOBFk=
X-Gm-Gg: AYBFou3cyDQtCQTJjeTjf+ST7RJ3pntUp+e/p9+PmaYxyvzZ0pGlNhXazDNmAynJPD/
	XwsjuMZsyAq+WRdDApLJozB4X/aj7oT0MdqsPfDPNT96V/1y6UZIIXiekseo7CCVWDuHGNSw0+U
	5HNjNIiJt9bw/yKDvEtTJlcyjiGKndhSr2XCY2YwxKOwxr9PFcogziqg6TargPcVab7LbTLSpT/
	aen5DlD2dVdZO36HTtGWvaDqzWeTIYit2uMJoLa+roq9pvezlwyPxDSs6rAi0zWnUpayhcHuRf0
	vfBe4x0/B7BXUPxQG8Lfk0BEMO6EwPaSyP1OXQu8jqsOvD+CapkKXHnUCzjwV739gZWA0OlahlJ
	ku/Z/5dlKg7Os7j2PI9UJrhBSguB1jLbZ27dCjcCkL+Jud3Y=
X-Received: by 2002:a05:6214:29ce:b0:917:98b6:bd02 with SMTP id 6a1803df08f44-91bdec2965bmr16630286d6.1.1792175495898;
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
X-Received: by 2002:a05:6214:29ce:b0:917:98b6:bd02 with SMTP id 6a1803df08f44-91bdec2965bmr16629376d6.1.1792175495046;
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb30509sm29187696d6.36.2026.10.16.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:31:34 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/2] mtd: rawnand: nandsim: stop pre-populating the
 cache file's page cache
Date: Fri, 16 Oct 2026 14:31:18 -0400
Message-Id: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHZt0moC/1WNQQ6CMBBFr0JmbQ0tjRRX3sOwKDCVMdKaDjQaw
 t0FjAuXL3n//RkYIyHDOZshYiKm4FdQhwza3vobCupWBpWrk8ylEt76jmkQPjgWxhUWK6OkkQj
 r5BnR0WvPXesv89TcsR23xmb0xGOI7/0vyc37pfV/OkmRC12irlxRYmHKSxse09CQPWI3Qb0sy
 wcg1uz9vQAAAA==
X-Change-ID: 20261012-nandsim-nofs-8f3ae982181e
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792175493; l=1238;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Pl4jFV0oI10sTfDRlHbpVbxgnVtGO/n4/eOZHFWufC0=;
 b=VFjhlvO3jaWZgUBtJeB7KsRugx0lkxuVy4/37WJUIBV6XR0/E0r9LbZs6Besut+nWI/cZFogf
 m5VPtSqyOJcCXdHOmdjY7I4kfySXvBDdXy4g5a+9V/LZmCrifQ6YhPW
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: Ad85h-SqL9PsA0CImGDze_nWP-x5Jjzt
X-Authority-Analysis: v=2.4 cv=LbSpeTfi c=1 sm=1 tr=0 ts=6ad26d88 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=bC-a23v3AAAA:8 a=Qi7WR6Ei4ccS7xMmyJIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX6NQiDYcOMcSE
 Mw4v2m3qPQWX9fLvHN9Quy+JF1+Y3ldiBGVQpyJFDQZSr/I3aTruLDJsjIc29zUvgLUFKkMlQpO
 ABRQs/NZfTP2+xcL0AdhLhmsyP+lLevEcVIS/TEE7DJXI08iityy
X-Proofpoint-GUID: Ad85h-SqL9PsA0CImGDze_nWP-x5Jjzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfXz8RYubVdCo2v
 0l2FkVQE8xciETpGqGZxlQqyCgRHHpwG4+JTllMa2xfJp37m2UBM8fbmqfxFNcDRzc22TOsQ/1X
 FQDEe9QL0ZtyI+zj2yQHkjAmyq0RbxhVCJbgQyc/dMyT2lR+l2t72rzE//XOxwZQiBwsqOkWHxU
 abZUeQ5CBGNiM9CAm2lDQUKsmU8Ix87mR9eBILW1M3AAUC8mDG0HGLPzkWtl8YHeTTQKfFX5ank
 XBz1TDixiz/HKsrf6LCnKvGOtTCyxfAD6Vv/umffHJmPjv8vpg7un+1oW5HfGSH0KW7omYLZuwL
 3Xep4W2UQbPuF1LuZThtqnD5vIHVR9/wN+eKmOJ5SUFAwCH8kUf9WDXRa/5AHYo9gyCZLIimKoV
 e49d8CO85kJg2cAqSO2GFpMKyklqeEMq4jMbaN2fNqAHZJ7o5qj0+SF48kwKxfQD+1HNQzxzT9T
 NM2oxd0cECxw8d8GOyg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 bulkscore=10 lowpriorityscore=10
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113139_560178_4CB09B6C 
X-CRM114-Status: UNSURE (   9.52  )
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

nandsim runs its cache file I/O under PF_MEMALLOC and pre-populates the
page cache before each access, both to keep reclaim from coming back
into the MTD during kernel_read() and kernel_write(). Use
memalloc_noio_save() for that instead and remove the pre-population. The
pre-population is the driver's only struct page usage and one of the
last users of find_get_page() and find_or_create_page().

Tested on KVM using the MTD test modules, nandtest, and fsx/fsstress on
UBIFS over a nandsim cache file, with no errors and a 6-13% speedup in
mtd_speedtest.

---
Changes in v2:
- Patch 1: Use memalloc_noio_save() instead of memalloc_nofs_save(), per
  Sashiko.
- Link to v1: https://patch.msgid.link/20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu

---
Tal Zussman (2):
      mtd: rawnand: nandsim: use a NOIO scope for cache file I/O
      mtd: rawnand: nandsim: stop pre-populating the cache file's page cache

 drivers/mtd/nand/raw/nandsim.c | 85 +++++++-----------------------------------
 1 file changed, 14 insertions(+), 71 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261012-nandsim-nofs-8f3ae982181e

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
