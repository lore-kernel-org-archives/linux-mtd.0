Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32822CA9EDE
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCcQRz6jG28hdtuaN9ok+vWoWzAwmYrTyRUk1XJnavg=; b=okV4Gyc6ePLygB
	636CrQ62zt+/dVMkCAoPJ5j4rIWVXreK4SwwJKFAvqkPZp3rozPBnK/EgbERnquIwaCLdMIptQotk
	j4h+OWsMhTzMFKem7wPBJI8YbBDJutxOjUUTvoez8fwf4n6coIo86MC6Xj6AXjrFmqwNlGaxloimx
	22D2B4lMFYXRGkm3+m9nlsyc5V+EsT00Y6o+9uBiWbHhNhUACqOnX6Nk0tv7mdMys2XSTnOagQ7yJ
	4Xql5lPGaEFS8nuBEytkBRfSmNj+Y7r0KpBzE0/QcDcsVsQZ0ftMveU+TezdUsTzOclKRlrDyzsQt
	j8ax0rOkHXYgA34dQxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFS-0000000Gk4Q-0UEo;
	Thu, 15 Oct 2026 03:35:18 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFP-0000000Gk3F-15zB
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:35:16 +0000
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZsBQ827265
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=pVfi
	pGKKVzpFMxI57nodkkDVd3xpjhD+2tMnUW2JpMQ=; b=NWoeRuuBajVqg7odmmh9
	3PP9MMYdVpy+i8jjb6PWvENcetTYvzgHhlZUCWSv/yevldEd26Xro8FtDEmRKHFv
	LzRJftXswGGy7YMloS6kLT0ONoAPWkhd9mE1V8jb/b44mg9/jfhJIvtiheONaN5L
	K2hoNsNoXRHDS0SwYyIvIBRGCBOgFH8/DnzMj0Pp9zBCZXVs3IuXQPErf81skdtd
	zOHd6puI6+qO+Q2dM0NMnMDPpKPQZ+o5nvxkfPQbEoA70wLrt2Smbbdl/vyUeRey
	s7PCDK5yCf4Mwd71LZHsZ8FwLLsKkI3QF7z3ObqzbxcWWsjEXP0e6iDRL4bytqgy
	Sg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hahdr9t0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:14 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a3c27c9bso93708616d6.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035313; x=1792640113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVfipGKKVzpFMxI57nodkkDVd3xpjhD+2tMnUW2JpMQ=;
        b=lrfm3/4rTM6ftxfMEOGUFw+Arde/g7CIoaS4Pd43gZ0MPj7t4znYE1hrEpLF252ZFV
         QA4Jp4mzYsLc4QqZQXYPdK9q5uPTBFEggTdSTX0i7ZWz9kIkyE7tWkLxVqQOSi6HExlt
         4qSG+TPLUJo4RDmVc9un15D3tE4b12hNr3CyiugnQwxI4kF6pQn/K/G2Qud9m14TgFRD
         fucRdjZsxRlekHC2xuj0b5YPiPybOqmZtQA6irNzBU1BxKH27YETyrexoaQOhA+KBDz4
         VWWF/RHn777DHpQURssj5cyOociHzibO3WYbNBs4zVPRePIugsefNx0s0dXMJaa4dMGT
         o0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035313; x=1792640113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVfipGKKVzpFMxI57nodkkDVd3xpjhD+2tMnUW2JpMQ=;
        b=RoiaGZQ6toPLQOHc+SPyZLD4Sleg2DRMFctZs11ZhdlQLtXJ8yVA9/HOAYboFnOOtj
         lnFT9AslPjjAGgwyK13GiRst1BNN3y5wNJZhz7L7JyZ+ntS+1m0LgTx4SZatBZTEvCCx
         Nli7QFneekcHtUPQd1rBAY3GAJ/oG65xEu6ATFpFqcd1CiegSjCt8O/2PKyFUZmYe72H
         f1XeinOGD0swwI0yGy640uQIHexBdjqndBjgrs12NVkYpZ2SXO/HfBiuN1tqPAHEJ0uj
         fKkUStsKohLaLIDPRWhXxycu841y4ZBFqdMJ/c6O2uymTctzE8jDG3F5uhIEAiuGdgH1
         +smg==
X-Forwarded-Encrypted: i=1; AKwUvBwSOxBkmqsWCGPCpNtJ1J8B/AzNB6QlmSzzg0gQRF49bfStuyoW6lWTacIBBC4i7fyUNc25Jd4m+ac=@lists.infradead.org
X-Gm-Message-State: AFq9FYLPGcwKUado+JPkiX493VmrckXlaI95NyhQYn8duXqg02ZnfaL3
	4EUGOUDDAgBZwGv3o43dU+xwc9YtEtGhK/PGzIkYIh1EC+y1j49DyS8jLdXsaollWxn5R73ItBw
	8dBUlzlEYAi+/7ud9FXjjyDiwTtgHCtsv9qtP7/hTwfDg2uGC95yD8eKYl/3aSWzfTeVdFyI=
X-Gm-Gg: AYBFou21sMhckBygeJGC8kK29kAJwTlkeKst3J2NJtwJ64Fr32ysXkkEaBjGBIeJfbJ
	0UuH8EjbC1Fh//UkNWKe7c6pTatxkNW90sc35dcseVKMbV7PPwYesVxrCMy6ydGJ4yaj/4+c53s
	WwQzxnJUwOTJoK2UBD9P8Xo7JsKO6OmZY8SZy824pOWlNSYD6LfLWvvJFYOW1Mwmwi81nMP/mJs
	nFdSKqcemgWpA2Srw0IEomzwHtsReGsYFFA4mBTidLQqBkh5q31dEyp3OwivpkFbkLRgQ6EqbGc
	t07utieUcvq2imvPIwXirwHCquX6+xRaUIJs2HL9hD4KKKA8hModKxd0EyB058y9oJe5ZeYfjSh
	p0LLhdn6MTRcjKO1I1IerJZFL6YxuSA37p5c4cJUsx8El
X-Received: by 2002:a05:6214:3106:b0:919:53ed:d228 with SMTP id 6a1803df08f44-91b55798932mr305162946d6.36.1792035313613;
        Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
X-Received: by 2002:a05:6214:3106:b0:919:53ed:d228 with SMTP id 6a1803df08f44-91b55798932mr305162676d6.36.1792035313134;
        Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:12 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:34:54 -0400
Subject: [PATCH 1/3] mtd: block2mtd: convert block2mtd_read() to folios
MIME-Version: 1.0
Message-Id: <20261014-block2mtd-folio-v1-1-19d24ae676ee@columbia.edu>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
In-Reply-To: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=1701;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=FVulE/ra//zysrVQig6l5nUTnPktA7Q7oao7GOs/r4I=;
 b=1ZdUUrxZgJ42utIJaQd10KL8pt72aAvnFXxXqGAV1uWLkrSynZnZVLytYxinK6DPApm3Sxumx
 1arWGCjdb57BLqst49n0g8kvBaUSe7BDrrx6/ts21iiqpiOCG30LT6h
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX6x2XZ3dclRqx
 4dh9HYA0ruIog+pupQsmOJFMwGw9hMMea3CWhLe2ir1j9+sbaWf2jgT7teoNbkfOreU8UnXz4gY
 GaexNTlGStD4BgKeALSNgn8qlgZoXev6VIQuSX0Z21jhBZR4JLMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX/OC1qWqqzwC6
 D2VHzlKeglp9setac47C6U2NZmSrCRhduT8bMQJV7XrA1Qw2ieBZFZ7xaiy7NP+jHT9nk22RBYR
 LfrAI2vsrWjrNUK2ywbSVB0g472G7BdSy4VPVtQihqConBr3uzfUp+hu2wKj6N/prBNH8mt4kW5
 DiiU31VZNI7WK12p6WWoGt/SIuUFXSA8X8iv7WRX9AjRL75rQQCtHxUaSLMZEoGVVitfxt6oIrl
 DSc7fiGJU1pvr80roxDEv1ibLfmDAjK8qrIpSl63nqFiK/HAVL+0Keo5l1fnxvy/WzOTqDIzgfE
 GqXPeFW+174fouoj2ypg2sgUKf+Ku/LZD9h2Nlm7E2/4EsBEUxORl5kOBniVrlcEksMTrI+jQma
 9k+4Jv9zGunU+a6vADJmJb0MYsY2j4gZIg0O0gOv/AOl4IA3Ci6MrX1+4s8lWwG2ExONQxj96zH
 XYP+k7N/AXSjFPtiAdA==
X-Proofpoint-ORIG-GUID: 1SIRUUSRvK_umNQYLNSm4HHBLPRXNrbs
X-Proofpoint-GUID: 1SIRUUSRvK_umNQYLNSm4HHBLPRXNrbs
X-Authority-Analysis: v=2.4 cv=a7KlZkSF c=1 sm=1 tr=0 ts=6ad049f2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=A657Os1j7QBKVqWzl58A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=10 spamscore=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 phishscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_203515_307744_2C92A58D 
X-CRM114-Status: GOOD (  15.63  )
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

Look the folio up with read_mapping_folio() instead of
read_mapping_page() and copy from it directly. This removes a hidden
compound_head() call per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2c4f5a..f28e49130197 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -106,30 +106,24 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct block2mtd_dev *dev = mtd->priv;
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	struct page *page;
-	pgoff_t index = from >> PAGE_SHIFT;
-	int offset = from & (PAGE_SIZE-1);
-	int cpylen;
+	struct folio *folio;
+	size_t offset, cpylen;
 
 	while (len) {
-		if ((offset + len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;	// this page
-		len = len - cpylen;
-
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = read_mapping_folio(mapping, from >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		memcpy(buf, page_address(page) + offset, cpylen);
-		put_page(page);
+		offset = offset_in_folio(folio, from);
+		cpylen = min(len, folio_size(folio) - offset);
+		memcpy(buf, folio_address(folio) + offset, cpylen);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
 		buf += cpylen;
-		offset = 0;
-		index++;
+		from += cpylen;
+		len -= cpylen;
 	}
 	return 0;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
