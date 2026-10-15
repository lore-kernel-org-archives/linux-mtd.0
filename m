Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48FECC6B30
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQ+LOnp27tnpUW3GNGnOs6Y7E7WXbaK6teeXEFhyb+w=; b=sgAAPMFcUAubEm
	YgjVYgUtucG93yMJO+UaOoeZaDy/3NZ0gLK9UdtUB3YUzo8Ycxsek8baNEh3I8SNphQ1Upq8ozKK1
	PkLYg6GfUyGrVuISrDt/AxawPilXQKg6K3eeSsLZHy2MMO5mjU70AeFv/GDr+RPEQ0bp3zg4TszFe
	iwnMgKicYjwNQbmN72lsiY2Vt2TimD34/sFt7zJMSzqicBJ5qEGU9teYVHibSU2XwZ6xxIZ8qzR9e
	qcja9Pa7eTsfvo7v6Std2uvoGrne3Dg5HomElNcCdjkoL0jNWJgs1LRp0X8KQaLog73nvzSlDNSwc
	cSMhmhUYTEBJ3EFZTXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFV-0000000Gk5r-1vFC;
	Thu, 15 Oct 2026 03:35:21 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFQ-0000000Gk3j-0aB6
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:35:17 +0000
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZXlI187233
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QDDK
	e1lonQXdInY4QbmrZnCj9TeuoM6MCfPwTMajkDE=; b=rzBu2tyakaYFV0dGO5wX
	5EpGfL0R4i0ClHCoKi8dZAWErdHt4O1+Vqtx2h0+iCEZKi6U9NRv0NKAsek3aLri
	jbPz4Wa1pW9Nqb5nIcYswDVuKwqXCZu2yo59+Cp9TTlXXxD6TK6LLnGcqNYwuzoY
	XSwfRe6rvYknYg//nsm0DKp965CcwzKUcBw9HpzjohJ5kHRplOMlIF8N98HlKJzz
	uJcNDQxFsJEsLV14p/mXayBR1mpURcoSdqMZsoqLgrCa7VE663NJnxxzXqdfEB7v
	4AErKhLTm10nRvfrmAHs+lkDspCWpTtWBW5p7Z96jaU1aHUsyr0AYGMlyWreg7zG
	fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hae50bq4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:15 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53397338004so159001011cf.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035314; x=1792640114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDDKe1lonQXdInY4QbmrZnCj9TeuoM6MCfPwTMajkDE=;
        b=hrf7ABbB+WzzfbnY8DJr0RMQdnjEa6oHFKMVfARSVoXhXCstJIVVmaMQs9UhGpxsID
         cw+3a3f6gv0MJuleSaZOQebhwTIjEyQEomW+QhyaL5JpgGSyCZoNCP7HwaOxpYfZNTVh
         dCIdnVbdc8hsM0pVpvKcwCkbw3ZE8Pfy3feMBvJewL3HqncncGTw3VaYlaImd2d/GHKO
         E9L4HtFdyojMFFCzaDLvypXXJZt8qOlveRmiFnh53NHR9qHpE5xpNRPpo5j/HeoVNeSH
         Vmbnx2l3wEMxX/VCtNrvY8C4EoJKkRZojjhl4I3R9OjINx9j7RMb4bgniubX5sAh+PdN
         Dkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035314; x=1792640114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDDKe1lonQXdInY4QbmrZnCj9TeuoM6MCfPwTMajkDE=;
        b=WcZU7yh3vMNjL0bWBacDgerWIC4NiHiFvmSaWDa5tulEAUf2ML7fOLzv2XUWXIMxUg
         Ua6sW5wNi0HwIMb9/zR060e9TFvCLljGgjmT5YlhxZ2wC4+5YgUGdQLjUBATKOeAJZLo
         Y+HH3pUtMZ8zxnPls7RT641Ts+QycHoTCDwaZiUVgLcLwvoNEjmRKHIFPbTbR1PbB9Qx
         Y7oPV8Nmwg3As9zyMbrUdSO2EDBvdhj/nf+a6N6KrFonNqKzrEWPgxA9OTMUGJTkMJf5
         SzPYLFVPdduqit3GuwHoVAHKA7wnyVFnFrNl+NxTVaEFQd4IE71p9ZZ6b4XcG8C5H71E
         Ixzg==
X-Forwarded-Encrypted: i=1; AKwUvBxC4pcyLxee0mCuymaLANrZ55ld6Cuo7zKGVz3d3HveqYlQ2TU+H3qj8Q5ai2mTz5LqEOFVOHUoN4o=@lists.infradead.org
X-Gm-Message-State: AFq9FYKW1W1+aUN9ZNKSO2IicLBtLp5GqyKOaztjQszQ0Qc332J0NdNT
	kFIhupI13Hdku14UCgwAhS3v/jFnp5IYnTNX9V7M3O4HEvAqGbEdto8goQScvZVDqjkEfottmSD
	6i1EzQQndPKLRG2IkfjxcYRS+ANTpvqIS0pkFn8CltILpzIpR+boZSVqNZruePdA=
X-Gm-Gg: AYBFou01Apeic7TQeJ7EJw7uphL+qRmdIT9QIJJvEFRVaZQ9Kuk3kYwNOHHjP4eErqR
	BZAQaueK8yYs7GI8uMcduKw9TfSMH4LIBB6Cz4Vw/VFxJmDYOgp3huh1l3OHJPPQUnRx7Fpu/Jw
	FFh8uogGes0HoZqk/xJz0evgItD16iWNYy9P5nuGrqh47sml5N9ILeH9JkGUVoSGL8j883u7pJO
	JVe16duCejcIuqGEtZZf0Vg1ES5nb53tSyAIBfLx92ckwOAdokK7OMkmWPniAMMUBDjxAXECVeU
	hrE0PnBap9K0+PKQaa4w4T7xJuqZHPCxamA3yvfdM/9Zk0eEk733sxUaG2bOhcK+L179Bdua25n
	mNAiTJ/EyAomjb3VURRHMl2gsjPTxkK2NCHMxoKBmJnyi
X-Received: by 2002:a05:622a:144a:b0:535:b21:c997 with SMTP id d75a77b69052e-5359f48769dmr280775881cf.8.1792035314710;
        Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
X-Received: by 2002:a05:622a:144a:b0:535:b21:c997 with SMTP id d75a77b69052e-5359f48769dmr280775601cf.8.1792035314190;
        Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:34:55 -0400
Subject: [PATCH 2/3] mtd: block2mtd: convert _block2mtd_write() to folios
MIME-Version: 1.0
Message-Id: <20261014-block2mtd-folio-v1-2-19d24ae676ee@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=2138;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DiiQmcgm8+2rIcgAwan8SD0nMITDpbYudFJb4YmNAEw=;
 b=H2e96qMpeNdffWSFZdIS01Tk9osP7A1HnlcLamAgaZtxALSlF6uIYbyHe13U8s29HiMJHDdbn
 pxg7VEL7NQjBS/i+B4Ecfl5iFWuQw42dHio+aO12UDdHoME68oGBWfO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: HXPi1jPkwk7TTfYE7EjFssJHAjQf9gnx
X-Proofpoint-GUID: HXPi1jPkwk7TTfYE7EjFssJHAjQf9gnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX1COxlMet4d3o
 72T7Z70XS1O7SxW3t6aGZ+6YrgtWS8XMeyaKnMenHPpE/8lan4f9BggI5JPk2eAefrBJsSELwUv
 CGO3kd7zDBXDJtqFntHy/3Y6LqZ3g9kT/W8RHKuF8DBQ9u85/HUc3QxIFwJadYEja6Qi6H0RCzl
 YXEKwGWmKmOrb44xTwx466wstkFg579nx76P3nVYK2ez2/n/atWwsaIOsegCgOpdZHOgfnUCPh4
 S3KH9uUl43sJTE7V71W5fsG195YkUbu1szGJkkMY73sGteVGaRNFYTxiN0ssr2H4pyHWmrevVPq
 yYHtsPp2fjJSJcmU3vc7CY3m9yoUdXBcAb6+fH+sg5IZa1AR1nqaUiM+4j5tiji4SBxWQTs3hNa
 YF2NHKwcdBxrXcENcLD2+H7aLkIPNZkOAc/gZ+zbMdNA3+hYqwGViMZqSs2bztXBKsc3QOqyujB
 BlXBxEFefGn7nYNgbzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX5uyAM9Dy6ecj
 JAnV1l+MuHPCMxWIobZ+G8qOpkgSbncOKf8hDkiFseS+YrrF70eUsJPCNLOFGYWD3Gv0Oh6Rjku
 kif4cbsMPBIu7NYszBacENa7SG5Tfba1YHZi+hZRAF2RscXuReAp
X-Authority-Analysis: v=2.4 cv=fKqsTpae c=1 sm=1 tr=0 ts=6ad049f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=YexO6dktjN8EMJ2IXmIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=10 phishscore=0 malwarescore=0 bulkscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_203516_205306_6E8B268A 
X-CRM114-Status: GOOD (  15.58  )
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

Write through a folio instead of a page, looking it up with
read_mapping_folio() instead of page_read(). This removes four hidden
compound_head() calls per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index f28e49130197..910669d6bb94 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -133,38 +133,33 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 		loff_t to, size_t len, size_t *retlen)
 {
-	struct page *page;
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int offset = to & ~PAGE_MASK;	// page offset
-	int cpylen;
+	struct folio *folio;
+	size_t offset, cpylen;
+	void *p;
 
 	while (len) {
-		if ((offset+len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;			// this page
-		len = len - cpylen;
-
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		if (memcmp(page_address(page)+offset, buf, cpylen)) {
-			lock_page(page);
-			memcpy(page_address(page) + offset, buf, cpylen);
-			set_page_dirty(page);
-			unlock_page(page);
+		offset = offset_in_folio(folio, to);
+		cpylen = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memcmp(p, buf, cpylen)) {
+			folio_lock(folio);
+			memcpy(p, buf, cpylen);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
 			balance_dirty_pages_ratelimited(mapping);
 		}
-		put_page(page);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
-
 		buf += cpylen;
-		offset = 0;
-		index++;
+		to += cpylen;
+		len -= cpylen;
 	}
 	return 0;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
