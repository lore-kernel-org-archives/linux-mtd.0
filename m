Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55784CC6B2F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=onIBDBQESm9xYkym3brZMalOqAPLfRyFJl7WTgtwO5Y=; b=Dn1hhdhPaJjIji
	dgu8X3aWVrQsWinjlqeYJ0dYuiURZuGEPTPwRoXjA46vcg74j6Zn/92FlKscik5iu/1BX9X/6wEEw
	h5QEMmyAHQMr+dpCaspzxSntdhKKMOHJZJyeO6Wf1y/v7+uYYWjl/lwN61Tkgpo/Vx5zuo0lYgMrU
	m52ZjeHa1l4W6EiXKtqEl2mQGIyXcTkaWKDjAED4wktk8J8yHvFrNJlI6T8bBIxmbSA7DoYs3J8Rb
	vChJ2sk4EEb7Kjua5/W6VRMJWLV5tZ77sTxrR1ADlAwprUx/Sl1vChGMH4e8HbZo/S0tXtGOjEzqL
	khwJK6yEpxb/S1Vc59Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHC5r-0000000GjF7-464k;
	Thu, 15 Oct 2026 03:25:23 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHC5m-0000000GjDx-2Ggd
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:25:22 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZQJP3733915
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=lPkP1qL/sgYi5P1+hcjzd3Wr99
	AUsW3QdnQ2mlsImRo=; b=BUUdKgyV0+T/4nz9jx4mWFWRrPXfvoWXRisdK0qh1n
	cXEzFtx1tY6Ba+X+gdO2jZ0Uqi0OA1Oh5wHeUQgPVHrBYrtnJP2FZrC6YuRgy43Z
	eZSFKuAnjMr3vTM/BGP882GQuMJTL19UIPgZxacXtrg5etd9Qkx9O7e0HnfMpr0u
	Vpvfzg9cEpmElQLLghQ8izVLuz2ccsCJDWsbTr1yacpLg3gaKWZzqvouO8FdeYAO
	TfOTZzKXZb/icndxlMV2MXcHdgmo3BHW/BchNhHQtTtkl/KzYU/Tu3i+aAeil5cg
	YwN0LzPGVQlEpfoUMcfAdZQXR8z7lYreSR2Yuz7VUUOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4haeruu9ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:25:15 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535851217d9so106339111cf.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792034714; x=1792639514; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPkP1qL/sgYi5P1+hcjzd3Wr99AUsW3QdnQ2mlsImRo=;
        b=tahuVw8PatJoFjKFJOI82p1IxXYuy1YEE4XA34gwlyYNMWi4qrwjh61De0IcTr5FQf
         XbRKY4GPSvX/8a3frNBTpY0Cq4/gvW5bb2uO77YZ238fkzeiKbkE06aC0BHVQw099PEk
         qfdkaz+GhqcO0+wYG1izQwTTvXgUNNLhwgD5djd57QF3NEwcdiofMLUmFgrzDOgC0SZX
         6h7h00zAEQUFSOVaV3r4NVWUa/AyBRLPxJNFbgMst/Po34bW9Zc4y5YA791BpKA0xJEu
         6Jx3zdt/8G92yu0wNrKHCsQCwB4G+BLFnxAMxCI+0sbuIWyMwvi6uqhF6uOP90+qVziP
         zBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034714; x=1792639514;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPkP1qL/sgYi5P1+hcjzd3Wr99AUsW3QdnQ2mlsImRo=;
        b=O0cdav23cdwZquYmf8Xi1UzzvHzJRDtK3Di1c2qzX1SwNL3FCrhsDhgLH5AG2YWVEf
         IPdSXTV+9XcwojePMAxsNcu/RwGGMOYC96/Kxm13iKTynPfKotEFX0C42PA9A5BLG0uP
         EZBTX/QKHsx8sM6WEa1WSLq5uf5EhFWRHB6O5u/8n4ofrqjrzJ9tT9nRHEwqdaf3YPtp
         3gF9y0Ybr1bHNkqTjBapKroCFZMmyCaaGPg/BHaQ2h+IiCHXGhkZSoxFZgPdJ/+uUXBt
         +cpkqnLdGtBkJutPw5az1+GHdUrDQAOl0C1DcVxzOSMzZl/xhit9i3E1OmXCZPXfGA/O
         380w==
X-Forwarded-Encrypted: i=1; AKwUvByuAdAMKKIm1tGYC6C9UXaWOn2ODFtUn0ya6UnirmL3DvY1OXXnh/ohRU//zt9fP+96DiOToKGDdrc=@lists.infradead.org
X-Gm-Message-State: AFq9FYIEieZbFDVOMDcGiM7s60dITzYhGRAAmq+0TBoBkoRPpL6wA0jI
	XZ9ryiOgUdvh5W2LOq0PMG8deOb70Ox5eSC8jTAvaIH7WWU0EMaAcZql6eT1JJMJHznsBunpuS4
	DlEonkJP7yOI3qRQe8Qg5gvzDO3y8VLL+99D/dse5JYE2tRz2ej4+Rsg7KYx3rq0=
X-Gm-Gg: AYBFou2tJCvwDpOuSmqImcaTRdQPcVgEKtAaZ2CWEhdnqt9Rb7OEh5Dn3NW33Yxg3uq
	Z7be8y9qT5tVuKNsS9Q0M1TNHpVN+zEhXkPaS8aGgEFya++GJzHYdt6yT23gIg2AdX47ygmlYkS
	2Ob/ipZ85cu6T2zESUlbrtHNjIEIvLcNA4URGFFHTxm1i4k7IHj9suKvPlH58DZR9Os+hTBdFTd
	QAScbihenXzkDRD1aKQRgX/KVMLoxC01hFGD307h/TeCbb2hMrev8vDUDFi8C6w834qNtZhwSXN
	mfyp0ipliIZK7a70DiDBcvaoZ87jPW5XWWNW7UA5SFtH0Xe0XNHZrpI6iT1e/Nt4DyL1HsEZOO1
	5031nig6u2i1ljClkWiBv4wAcQv/0E8aFbsrGOXnnGWBD
X-Received: by 2002:a05:622a:38a:b0:535:872a:a0a5 with SMTP id d75a77b69052e-5359f498f34mr299181661cf.2.1792034714138;
        Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
X-Received: by 2002:a05:622a:38a:b0:535:872a:a0a5 with SMTP id d75a77b69052e-5359f498f34mr299181421cf.2.1792034713757;
        Wed, 14 Oct 2026 20:25:13 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127bac07sm15022721cf.14.2026.10.14.20.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:25:13 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] mtd: rawnand: nandsim: stop pre-populating the cache
 file's page cache
Date: Wed, 14 Oct 2026 23:24:57 -0400
Message-Id: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIlH0GoC/yXMQQqEMAxA0atI1hZMB4bqVcRF1VQjGKVRGRDvb
 nWWb/H/CUqRSaHKToh0sPIiCZhn0I1eBjLcJ4Mt7BcLtEa89MqzkSWoceHjqXQWHRKkZI0U+Pf
 u6uZv3duJuu15wHXddrGCSHAAAAA=
X-Change-ID: 20261012-nandsim-nofs-8f3ae982181e
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792034707; l=1013;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=mCX7cB8PIi2qoYnlIpRswvtRTocND5Vrde2KwI39tKs=;
 b=a5U9wLXoay/mnQWMpScbE2Jn+l88Sha1NKRIcmO62pPqgbTwuTWwYg6trXqfOMp9+bp/RRVLH
 sREi3yJPFitAGb6CuY5p95XMwNjup5y2g6v0KgwduxwctJ6dnQYAhs1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: q37Ovmd04VhEgpslDIjzSV8pMkeRiPKD
X-Proofpoint-GUID: q37Ovmd04VhEgpslDIjzSV8pMkeRiPKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX8JA69nZdoWsY
 ZSe1NmDNUyxriUj+HV6iZzNqVbWV3vvdksuhk2SxE4kztyVRXhXxw/hxqt3WM/ICS0SjLB+eHCt
 +6kiDTqr7iO+E08mL8wNPXliszMwE93hEn5Kdlgl28MYmhkCZKdcWMWGM54tUmUPmXYd7MSjhrE
 JbGWMStS1Q541JPzFehUbHY7+NkEPdlBDQvaRdbSUHnd24e1i2+45/vY+1P2anPJNGQLSuk3fsW
 1hLMjhqmLkpgRH7tt5GXlgqu+rwi6jSkDmz6faDkK4PBojxxicCsOATZCRqSXhc+rd0OgrW0BBw
 UoDuU6XERTffItjLU/NhGrhQv80J4UsayfTr9fNlB4c8f0ynPi5CgudUUK6aS/CVfhr8VEnkF64
 jc1kMiJbuoVAjz04Bw4uwkes5UjbeGdf2xQE7pXjClL73xaTZ2PG3nujd8HInLnLuJOPfN+q9tn
 AYZh/QP6uB/zcOT0EVg==
X-Authority-Analysis: v=2.4 cv=E5xYNqdl c=1 sm=1 tr=0 ts=6ad0479b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=fsQuAqkoyy6rfPB4ug8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX3gSvd7io0L/I
 6982kN+LliMleE/SZFzbPBKQRUDqeJNOezO6ejZcDWvbXcCavqbqi+JKERnn6+HREUOA0KxpLeG
 70oriB5fgri1qqHeC1kN86fuwznv/BsYj9qtAxH7nsOj12AbV0q7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=10 adultscore=0 spamscore=0 lowpriorityscore=10
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_202519_051049_0AF5233F 
X-CRM114-Status: UNSURE (   9.25  )
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

nandsim runs its cache file I/O under PF_MEMALLOC and pre-populates
the page cache before each access, both to get NOFS allocation out of
kernel_read() and kernel_write(). Use memalloc_nofs_save() for that
instead and remove the pre-population. The pre-population is the
driver's only struct page usage and one of the last users of
find_get_page() and find_or_create_page().

Tested on KVM using the MTD test modules, nandtest, and fsx/fsstress on
UBIFS over a nandsim cache file, with no errors and a 6-13% speedup in
mtd_speedtest.

---
Tal Zussman (2):
      mtd: rawnand: nandsim: use a NOFS scope for cache file I/O
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
