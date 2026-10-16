Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E62CCF2C3
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W9Do2q9JKmuMHZcRQ11t/EDc0C9cdZNTLqJ5RIg2FlQ=; b=ZA36kDHH9rBpEh
	XEBBCP4PoK8e/7K/RJqKOvQXJfz3bHOQUkWfPSY6L4hoVIN3/wrkZbH30y+U4Odmw+3AL1sBLOHQo
	tr68aHRkS7Qolrvf/OZfW2whGg0k3sOJ/x7sN6SyTHriMbhKqELhAe6+qbVw/xh6c57Mdb/gnh70s
	5+MYADyT+RGoi17Xd2QDcrpxGrkX7VI2oTqOriD6ry7VcPnt0BBYjWWxS3ZsNEze1fW6QLafAqtCm
	p3psnJ7IzXgWn3bbpZp1guwr4Nb5dC223nnsB9a3Lw7Y6cNZLwpXFOPqjmx48P0Sueh2zOxZPDSNl
	W/BVFFi2ipZ6SxLuYR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL6-00000003peM-1tjK;
	Fri, 16 Oct 2026 19:11:36 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnKw-00000003pZt-3rcm
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 19:11:31 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIc0uN491275
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=cwcorJm8DJY7Y3KikDHPzRYSai
	n4E2CH+UQE6qVHh6g=; b=KFGv+QkLbf/Axt96k19E4KjS0+09zaBXmTmaRwMI3b
	1zXKVwP2lVkrqbH7AbJppr8reYdinOLlsLBx9FSCE38hlkRUhLWxpyV/9KZNWwss
	Aw49NamhFFQgyd3GWjayYOb3jSx3ll6ajZ+f2IHch9ppA6vOzHah+2WKfc82FYuD
	FF1M6ukHBqeROfpcCFDBvc0n5lEMD23QcwFmOBefiW76nDIhRuy1lfTTSgXgU0Ax
	taOZUV0KtsOlBSd5DL6U9qAwfs982jerAQrwK2yL29NwGf207wwnkgS0alWhTmAg
	tDC67y/SinXkD9ij7lfEcf3P/1ir3u9Cz4BfV7IHYSRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbqfy9a9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:25 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337b591609so3321641cf.3
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177885; x=1792782685; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwcorJm8DJY7Y3KikDHPzRYSain4E2CH+UQE6qVHh6g=;
        b=D4RfA2OT4s0M7gRwumU0TbEFrmUT8J+kItQQiEpGhu4TwQqz5rAuu/D463RbiQh2Db
         PlOyxSxl6aUcippvwlLpVx7KA4I7M4jbgaVa/aiS8vIRzZnNRPPPGD5gyAjmdissvQzv
         vHp+f8lFxRJWhxLVR01G2zFXXz9BzO6kAwz0ig4JWS3t1hTQCvitDrwlcwjUme59UtIA
         RiZZqAgzVqcklQDIuklRj+KnOosFzOz/zj4zxZFGnp0jXm39cz8V8FvC+X5CELIFIWBq
         17gqXg25YNwqJiQYrLWFTia5R5l9omT0KEX4MdEoZcMTg7klDBZRzWnZzHXpMYPt5ZsJ
         gzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177885; x=1792782685;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwcorJm8DJY7Y3KikDHPzRYSain4E2CH+UQE6qVHh6g=;
        b=WPux4q5eeFv5FCRnR2VJnZA/0qUdYC1lL85fAbK5/cOAmbwys2Fbg18UGitRg8W866
         omTAggiSjiajcyTmQLgJ7B9vyuYx1qmexSF+I/O3gO5Eaf/dJk3v+l8QBpkWMGXWC0in
         G8GLs6b1xhwOKMUY96xT3Ts31OLaFXgdrYlmf0taTOx8ccBL2zzNeVeyu45o8AuX9lYr
         VZ89b2L9NvAtxgBgpuJUjDfS6nhVtFhGaNX7d+LVptSNcO9fOKeMawrgAqmTCxczjXEu
         Jwov4EG9HLCVOO7khv+U5lNCBd4JUOZDVcVQknQ2LF+xDonTCWy508ZooKKtiXo1He64
         Op2A==
X-Forwarded-Encrypted: i=1; AKwUvBzfS/WhfttLkGZAJuEpeOvtmt6SkU96oKJ5S0si+JEUNk+FkfjnVfBBQQiAUIjWRULA0Ld5vBhoNDk=@lists.infradead.org
X-Gm-Message-State: AFq9FYIvzeoeIwGfIHkhxuzQM1FUjX3HlROAlx/73Qj+vFSLVqVr1WYf
	KigqDDPmKAvjWTff1NyIg/V+K8U91jrhVQr/zLtAhsvbOweZ9nPhn6uXFOHgapZz+cOQk6Bpn1u
	gseJ64VATs/pfZAkUOaPRz9mEERtJvBovmKr0kVYWrc+CLzgR+16vbVDC9G8wE/c=
X-Gm-Gg: AYBFou1Icizp3miJrFpyvfM7EQGNFo2xXX/Q9scnmo4/xlukfu5IJyZ43IigwJDBrBL
	r39wKL23WGrin9cIbJn3v/12fvGut2i+68+/M44xlQAc2F4DCNXvH6UpvErPJzuK6w3ek4V1aBo
	z5QgXVZqQBTyF8TC7nUUiNglNZXQp7MA1fuS0BDrloWX3ZctH+AWFL9+K35imnH5ANr4AHGOaTx
	1+CawwmIXpKSOllQtKV+YHf9nnWg63xLJDiab2DGU0TXsYWwa/peacz4Vbd/czI9Hy93tvZ9qLM
	TLwu76VuzDnxfstF4onjDJKRwHbKXlcuHV2Oz5iuAoknP7kdRFaHNEnW1sJ0+1tWtPCb7btQjIU
	1deYFf6yqm3DfR19GA77s8kdfpUw1WgcmVfd0NJhMuji+0JY=
X-Received: by 2002:ac8:5e0d:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-536460ef954mr6757641cf.63.1792177884965;
        Fri, 16 Oct 2026 12:11:24 -0700 (PDT)
X-Received: by 2002:ac8:5e0d:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-536460ef954mr6756491cf.63.1792177883313;
        Fri, 16 Oct 2026 12:11:23 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:22 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/4] mtd: block2mtd: convert to folios
Date: Fri, 16 Oct 2026 15:11:06 -0400
Message-Id: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMp20moC/2WNQQ6CMBBFr0JmbU1bsQZX3sOwaKeDjAI1LRAN4
 e4CxpXLl7z//gSJIlOCczZBpJETh24BvcsAa9vdSLBfGLTURkmlhWsCPnTbe1GFhoMoEJ0xhwL
 l0cKyekaq+LUVr+WX0+DuhP2aWY2aUx/ie7sc1er96vlffVRCClV4nVsyJ0N0wdAMrWO7Jz9AO
 c/zB5bHpm3DAAAA
X-Change-ID: 20261012-block2mtd-folio-9ccb6639c05a
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=4232;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=MegzC1CcFvU7ToREYLrsCq2shNb+UO9ZT2fmALBkktM=;
 b=K6bz/hUvXvQ8M5Cpz1AwTfjBFQ/z6M6fSKI0SR3VjxUDliiyo9izScd2roWE0iGzsc8KiSaaI
 R7F1aTVGpt5CRl1qkUc2LXFGcGuxA/XEPiofjQCd+ql/bNp0dqdxi17
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=b+4ncdGx c=1 sm=1 tr=0 ts=6ad276dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=bC-a23v3AAAA:8 a=hYzvmxoKW4JbWu-oBV8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 5XpifypZd0ekbCCI1lCKFVlyf7ULvKby
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX/UgHfEfGwFAk
 fTLoXLTgZgL8rhCODmPSLo3arXZQSWM3goqOFEfRulNfNE3+4+CtKtM65vf/4LT7MTaT4jw9xWw
 cYS/n6FEKkNWhsh2kDBxHkvzOrDI0lBt5I/XN4eFplNA5XD08Mk2
X-Proofpoint-ORIG-GUID: 5XpifypZd0ekbCCI1lCKFVlyf7ULvKby
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX3aHaMaPakizQ
 DF56abKLF3JEVXzCNXearzX4rL1PsSyYHkPVIHkuRDni5xcQ5kaqX26NgQZmm7SBRf04SdP8OfS
 slyPdSPuezLF/3EkpiC4JElVOybKbhCjcHZYdYSgnJf+wOL2711i4fOw4gKIguYQVybd34SDPY4
 CbyoxXtQ6LmeKc46FiEcahVAYIcz3glE3c2DjzGUtr3UAKknZjfqfLIdPi0WUofSvZg92OIhTT6
 h9FPOyrjOZ9wCeAwpHsGqeA6KFDdRZSyL9bKRPLeg7Es4WS8AweMgd1acTWoa8Zs9aPbZwkLGN9
 mgYgjymsLbNUcZWedGLrlsrFZxWUkAIYLrGgzqloepUxv5+TXHPCLRv0kiFjAz3c0iu9El97HwM
 +yrQcXkSVRmlXCK7a5cqtiliNUThheRC9TykNvvTV4x4BlPJ5sXhwSeq8Z7svbqKUKtcD3hWNDI
 mG78KtXrXyhrqbKS4og==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=10 lowpriorityscore=10
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_121126_975984_A7420382 
X-CRM114-Status: GOOD (  11.24  )
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

block2mtd still goes through the page wrappers around the folio page
cache API, each of which hides a compound_head() call. Convert the read,
write and erase paths to use folios directly. This removes a
compound_head() call per page in the read path and four per page in the
write and erase paths, and leaves the driver with no struct page usage.

The first patch fixes a pre-existing race in the write and erase paths,
which could modify a page that invalidate_bdev() had already dropped
from the page cache.

Tested on KVM with the MTD test modules and fsx/fsstress on UBIFS with
no errors.

The numbers below are the time in ms for one pass over a 256 MiB
device, by folio size, from mtd_speedtest except the last row, which
is from the MEMERASE ioctl:

+------------------------------+-------+--------+---------+---------+
| Test                         | Folio |   Base | Patched |  Change |
+------------------------------+-------+--------+---------+---------+
| Eraseblock read (128 KiB)    |   4K  |  20.25 |   19.55 |   -3.4% |
|                              |  16K  |  20.19 |   14.55 |  -27.9% |
|                              |  64K  |  20.21 |   13.24 |  -34.5% |
+------------------------------+-------+--------+---------+---------+
| Eraseblock write (128 KiB)   |   4K  |  26.37 |   25.01 |   -5.1% |
|                              |  16K  |  26.10 |   17.62 |  -32.5% |
|                              |  64K  |  25.69 |   15.45 |  -39.8% |
+------------------------------+-------+--------+---------+---------+
| Page read (512 B)            |   4K  |  75.70 |   72.02 |   -4.9% |
|                              |  16K  |  76.50 |   73.00 |   -4.6% |
|                              |  64K  |  76.44 |   72.96 |   -4.5% |
+------------------------------+-------+--------+---------+---------+
| Page write (512 B)           |   4K  | 113.57 |  109.59 |   -3.5% |
|                              |  16K  | 114.42 |  109.73 |   -4.1% |
|                              |  64K  | 114.39 |  109.57 |   -4.2% |
+------------------------------+-------+--------+---------+---------+
| 2-page read (1 KiB)          |   4K  |  48.42 |   46.40 |   -4.2% |
|                              |  16K  |  48.96 |   47.07 |   -3.9% |
|                              |  64K  |  48.59 |   47.07 |   -3.1% |
+------------------------------+-------+--------+---------+---------+
| 2-page write (1 KiB)         |   4K  |  63.61 |   61.28 |   -3.7% |
|                              |  16K  |  63.96 |   61.20 |   -4.3% |
|                              |  64K  |  63.82 |   60.85 |   -4.6% |
+------------------------------+-------+--------+---------+---------+
| Erase, blocks hold data      |   4K  |  15.40 |   14.13 |   -8.3% |
| (mtd_speedtest)              |  16K  |  15.28 |   10.48 |  -31.4% |
|                              |  64K  |  15.22 |   10.13 |  -33.4% |
+------------------------------+-------+--------+---------+---------+
| Erase, already erased        |   4K  |  26.60 |   18.30 |  -31.2% |
| (MEMERASE ioctl)             |  16K  |  26.70 |   15.10 |  -43.4% |
|                              |  64K  |  26.50 |   14.40 |  -45.7% |
+------------------------------+-------+--------+---------+---------+

---
Changes in v2:
- Patch 1 (new): Retry if the page was dropped from the page cache
  between the lookup and the lock, per Sashiko.
- Patches 3 and 4: Carry that retry over to the folio loops.
- Cover: Report the benchmark as time per pass over a 256 MiB device
  instead of throughput.
- Link to v1: https://patch.msgid.link/20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu

---
Tal Zussman (4):
      mtd: block2mtd: retry if the page was dropped from the page cache
      mtd: block2mtd: convert block2mtd_read() to folios
      mtd: block2mtd: convert _block2mtd_write() to folios
      mtd: block2mtd: convert _block2mtd_erase() to folios

 drivers/mtd/devices/block2mtd.c | 128 +++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 68 deletions(-)
---
base-commit: 2f7fa8d90694d21dce68ceabd8383252b111cfea
change-id: 20261012-block2mtd-folio-9ccb6639c05a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
