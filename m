Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048ACCF2C3
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gbkv0LW+wHtdCGIGvJOWFFulhHj+9qCmTqbiuQjvx0=; b=vVyhAvfeAnrBgk
	X0ilei3ZB2ifQupiVdPW75SvU6FMZmesL4u/WTDrmdG8bwRkm+6yNs5v9H7YaGti2p+3hkaVOea+8
	+LYpbC/BhzEkoSLwSaPVsLL389whM3KtFsLKjfEvhK0VpU1AmTGCd2cf1NT/Rmi5ZOovis6Stpfbo
	DNLusRB9zbhffSTi9xuX06HTWQKnCJuQ6+DSxrE4EbPNypi7vvWvkL5OG7Cnk4Ss9+IfzCZlszp0R
	1Ib0nS/GiRwcvjemCFtERnfzCun395FWicpkYPtniwn2iLq0irYBcqxnQ5xnSKpvJsAIi3CSVbcmq
	UKOlIi8VMLx2t+VfJctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnLA-00000003phg-0MQd;
	Fri, 16 Oct 2026 19:11:40 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL3-00000003pcl-2tAV
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 19:11:38 +0000
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJ8hPP1489577
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=NRRJ
	qFw3o6qpCxgXNI1W4++LwOS2DHeB7BgVPz4LPFs=; b=R3DfOq3KNqQ2QGxySH/s
	2MOBoOdoJpBQXcHttOjCA2Rd1uRPIbBpUdkU2ejZpP+VbjURhZd7P8Toh0VzX9Kj
	h2babJXvFmE6Ka2QtJN8e6NuD7WKI5X9EoDUuXA7dB26Xqe+ygbnx26ETE3/osty
	VCD1KDnzMblr4PjMJFdM8hMels+RkWRnd5b4e/w3rsWphUgw56Gzb/bjqgrKrsOJ
	LeuwUwduLgAHm34RVxMkj5l8yqz65YmnP9qbu7Fa97oPCr28jGq5IAXfiLMxEQju
	XYsNzvk+mpBwojdyChFpNSngetIXpbOwFYETxnvaQQnB1QwXBxx83yrUrp/Jnja8
	/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbstx80vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:33 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b8c60c550so8222406d6.0
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177892; x=1792782692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRRJqFw3o6qpCxgXNI1W4++LwOS2DHeB7BgVPz4LPFs=;
        b=vRle0Eum8S4y6PK35rxEqYX9htUOFvdCCQZNbCBru6cEn0HXWvrKHzF34rYLN7TCqF
         EvDkO4f0ll4WsPpTUcKTfE+PtnAr3TLPGS7F3SanxFl6xKJl2YezL6A5sx5jl+SbbsCk
         asihMz5d+j5o5fKV0BPZefmLjlnoZHgyjex08We9rd4p/Qh6iU1hEsczZ+GAu9cuOkXG
         67qsek/m5DPpO15X6szcLA41eQLL0Y2GhW2aeaArzBiVzGs8xXh8u6PnCEWqYvlyJBwp
         UzjxM/jrWMm6GJUk5el/DvSdhFZ4RhJmnu6KphRmb0ZEAuUCbOire0FFiN7aMJciVCO0
         osOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177892; x=1792782692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRRJqFw3o6qpCxgXNI1W4++LwOS2DHeB7BgVPz4LPFs=;
        b=PPzmsgG+yCHuNU26ppAbRuwCvfRIcJtZznfytYUMIhWJOOX38G9XMpGUAjGf/PHqK0
         PW+I9ugHx/tPNeqt2ixbvB9qGS5kiO6dLhOl8oZe7Zarst6G23cmfYoNbw6kWok3vH2P
         Rez+tUqtRgwRNXIVnw8MG/Blb2HoNVzqhsrnAy4GoA8hq7+kA/dgSbPN6wGA0RRmVERD
         VTT6yvlCAdbNwW+3udFQl7rFpxPg+3/CBq8zlU5sakBmYJ/YmJ2eSITa4m62wjpzEo41
         yQhqVvxeMj6MKXFTziDaA0SNRmsQoHA8Ckr551ANwqK2gBl8nqrk8ViEJnTlC7fEeZBU
         LlQA==
X-Forwarded-Encrypted: i=1; AKwUvBzMioAb2beFM/2CILDj9aaB1sIuBJFO/9jImtULMncFT4aU5IVOhfUi3i33Tzbn3+n102TzIPIa3sc=@lists.infradead.org
X-Gm-Message-State: AFq9FYK2X/B5syy/uiQREEsCvjQ52MwGbrejdEuLRdVvvDjWh7tj4Tq9
	qYXhgjIbhOqwSDk36aVovCq6fxe9hFrOkOTQb/npgpVMhBEFz5hbSVYk2fjhFeOiwITmzMUPPzh
	LuqKamL5yP6O3QpkIpa4YYvak+Vf1DphrhPVs5rkEhOL//7lptLPMvv5JfERLvBs=
X-Gm-Gg: AYBFou3X7IVXwjE4ENd0pYl2WNlDdiGro93ZZAOGYdwm04k++S13PtlMO3YxCm3jGzy
	0L2eGJdWOJYBmQ+beJl0ElCMrO2fruBqH4afXBBTCDQpuZzvwnjqvB1+OLARV1ucmamDwmyPksK
	trUDaVp5EVvcOJywdyv52wi3Aym8RwOzq+7GkY3QbKG4yXIgrgpOr46xNvULgV1BCanZOQsLgwH
	XkZ/6bfTZym8bzqZwwklLxa5qncsiuNLhn9Dx3jG+tyNeHPhVM9BZzgoYQgSkf+bQa0w4ub3Jru
	HkZLgzY/FS2QXrWgub9fOVmGSlZOU8M9s310nFDMEh0gCipu76rYeiOE7iXAFEtTEeeXRCE1/Kn
	ze0hpAReQa0HXf9C2ejjS8L27PrgNFR1D/Z1KFZQ6G+FOqUc=
X-Received: by 2002:a05:6214:2f87:b0:91b:5d3a:4fc7 with SMTP id 6a1803df08f44-91bdf40e9femr16000636d6.52.1792177892021;
        Fri, 16 Oct 2026 12:11:32 -0700 (PDT)
X-Received: by 2002:a05:6214:2f87:b0:91b:5d3a:4fc7 with SMTP id 6a1803df08f44-91bdf40e9femr16000266d6.52.1792177891493;
        Fri, 16 Oct 2026 12:11:31 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:10 -0400
Subject: [PATCH v2 4/4] mtd: block2mtd: convert _block2mtd_erase() to
 folios
MIME-Version: 1.0
Message-Id: <20261016-block2mtd-folio-v2-4-8280c99e55c0@columbia.edu>
References: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
In-Reply-To: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=2531;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=NeyQ+ewlJtdvAoeks5E0kfGa6FgvGUZnNq3sy9wiMbo=;
 b=2lBGZsCI+vbNK5aRyz38BTiEcNSSiB1u28z6ltnzhfmFfW3s0tIA0iuFRpCNaJf19Zqd+pQnB
 bhSFQC8+xwyD1HvBIURF/hQ014i6jTpmYZmaj4Uxxefe7DMU8thfCXx
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfXxluwnDzZYoXj
 PMOewJiLY8maIOJYBMErrc10TAlvdatP4vZLJK/yy7PYyCLYjI1usIoQO2mSB6bNQjCZpHxXivR
 VxFSNvcECgp4oJxIT70R7Znk0sLzy5r3+sUjg68RIzJLKzqK0MtRPXZwJvLHL7i6G7nXtc0RxzP
 1YomLxkaZ1SULuYFOHz6sqU8k4xnu7VWDfP9Xd4HA7Ecykh2gEKuc1asiFy0Xg949QsPe5R4jjd
 DSJZhMCpANRg0TyagMfuydq8SlVJ9PirZBHhx2Wpd3mJ94gWPfK8yMT7oA82SYszf6JgdStMpc1
 eZsal9xJCsXvVDa/+o3prw+XpwxKpk5jvDbMptfJqm+9G4bgErRvBtKbfoy4UfisiePPM0nseJh
 AL3ck3e/9p78QrtOxrI1ehir2AJqq6CQj/Bc9GBy3nuJkN9qdaaOK5YnKaIyMgO+g2KLlj75BFz
 ZSm2qJMPpGN5laKRAXg==
X-Proofpoint-ORIG-GUID: qalIYecnNBeZCJhNU61PpPDGSNRKO_cL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX4vw211oPCjaO
 WK4vduc18AGbSc3cx013CPQOtMmmGnx0fmxIgR0W27oWZ/YAsyvme9R1sbgMmMbdjX3h3gCtRLQ
 nsMYHPl5ArHlBfGpILFp2uQG0IzLF4zlgxBrIxZJanH8Hdeb1P7S
X-Proofpoint-GUID: qalIYecnNBeZCJhNU61PpPDGSNRKO_cL
X-Authority-Analysis: v=2.4 cv=I6fw19gg c=1 sm=1 tr=0 ts=6ad276e5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=1GrdX2YOhsIbM6oth-cA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=10 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=10 spamscore=0 suspectscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_121133_828325_6A1E9037 
X-CRM114-Status: GOOD (  15.45  )
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

Erase through a folio instead of a page, and use memchr_inv() to check
whether a range still needs erasing instead of the open-coded scan.
This removes four hidden compound_head() calls per page, and the last
user of page_read(), so remove that too.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 60 ++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index acfd3754c2b3..e95c4c81adad 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -47,46 +47,38 @@ struct block2mtd_dev {
 static LIST_HEAD(blkmtd_device_list);
 
 
-static struct page *page_read(struct address_space *mapping, pgoff_t index)
-{
-	return read_mapping_page(mapping, index, NULL);
-}
-
 /* erase a specified part of the device */
 static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 {
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	struct page *page;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int pages = len >> PAGE_SHIFT;
-	u_long *p;
-	u_long *max;
-
-	while (pages) {
-retry:
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		max = page_address(page) + PAGE_SIZE;
-		for (p=page_address(page); p<max; p++)
-			if (*p != -1UL) {
-				lock_page(page);
-				if (page_folio(page)->mapping != mapping) {
-					unlock_page(page);
-					put_page(page);
-					goto retry;
-				}
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-				balance_dirty_pages_ratelimited(mapping);
-				break;
+	struct folio *folio;
+	size_t offset, chunk;
+	void *p;
+
+	while (len) {
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+
+		offset = offset_in_folio(folio, to);
+		chunk = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memchr_inv(p, 0xff, chunk)) {
+			folio_lock(folio);
+			if (folio->mapping != mapping) {
+				folio_unlock(folio);
+				folio_put(folio);
+				continue;
 			}
+			memset(p, 0xff, chunk);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
+			balance_dirty_pages_ratelimited(mapping);
+		}
+		folio_put(folio);
 
-		put_page(page);
-		pages--;
-		index++;
+		to += chunk;
+		len -= chunk;
 	}
 	return 0;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
