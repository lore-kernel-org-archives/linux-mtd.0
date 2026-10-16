Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E4BCCF2C2
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuwAUP7rFQ7Q53P1n2xeV+befzgIylXtWGmyuwg8mgA=; b=YSbuYULQdGntty
	+orDvEm6R9Z49Ih8N7znZm0BaZdB6KplXtiQTx4HZsi5jkEnH2NQeZjGZwuGLc2GlrW/L9xJFJpO9
	mebLntkFsXICj/f2u+6srBX+9XbGJpxnhhH4JFwMNHiP+8ZCmZjLmrjVuOmfRkj7vi9RqGlzUAkO0
	a4vTMt3EUV2FRmJdHr99VeuwwAAOI7Q3tdlGr6Kvp80ti6HaFnxe+ppBDSgxNWs8MeqcTgJM/xftB
	lT0W6fh8NjsPy6jW1t3Tw/fH0XWg07sUasybBQ0mQ9ymrnjomBk/nGX0LRf5GFs9I7CNpkMi4I0yR
	vOknv2Do2UAd9fgow4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmiV-00000003g7r-3Qad;
	Fri, 16 Oct 2026 18:31:43 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmiR-00000003g6X-112P
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 18:31:41 +0000
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GGXwNQ1471300
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XIiA
	j0L1SuTmikxb99uSi4FdXmLmG93cHg4VqspIFQM=; b=jp7yFhpmpzE7wvYpFb20
	64XHZXBPcBnzdMqPqOr7eVpzsOOE/zHakYpECbVlQ4Fu4bXRGtLUOUICjRIQUKZN
	Cwk3qgEX2gf9zw/WFpyooaR6Baeg8WLYBuZbAhqRU09QqQaVK+zWxrKY5GtnC3up
	wBIVcivN356Kd4nJ6ZgG8jDSasqA8IRv/3Dp63gW3q7eKGMpYipykUlyxAeIMQm3
	3ExTeuVLZ1lPo/Al5jnU3x0jRXb+D7cDlVo7cdci5D31skNd8VUVPto/2WzGg0A1
	MFNTsxA5lZI6SuY2TTXCLLVw728aHnRZcB9pfptu5EkrSQlOVNjV73KezRm+IPFO
	kQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbg72m65y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:31:37 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5339253dc3fso4248741cf.0
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792175497; x=1792780297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIiAj0L1SuTmikxb99uSi4FdXmLmG93cHg4VqspIFQM=;
        b=iIvmdpreomeZ6jxbiUu2f4KoSUpKhw5J8xrt4cwo73vD5nt4T3VAQjnbS/y/m/4o9k
         DaVD8FV6IEwe06sdW1/od/vEmpmAkRsL1kr+e/er/eW7hQp4HBtCPllBkUza3Yqz9vjK
         yWTedBw2owHdVL+8cMw9DThzwW8oVsXoGvvjKGVTKIJKkI6FVn0RV9CSDH9zXSkiy7YA
         /2bzUIPdnFRqW39wdd0BcnUfS8bwjPxa2bUojfXnXWycCGIMJ3KL1TFQfXaOGXrftxMn
         LBWeKQbH/p8l1OJdKBTC8PNDvZ7SSevjHFy5QHcbIrLWgioshz4HiisUVDKbMBL4T54Q
         3yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175497; x=1792780297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIiAj0L1SuTmikxb99uSi4FdXmLmG93cHg4VqspIFQM=;
        b=R7naHuXAGbRNhVep+JXqg7qBWe6dP5GczaKmYRNlBCt7HPkc0k5E5e7WJOte4UqZFt
         pz46VmP3e4KGnAE+Y2K5HXAEytktemD7ro8Qi3rHNHC98BTg/+oVcAD3pcoQqIxLh2wm
         0erA8SkZ8F/RSlbYl5HKcOjHMXy7iRWatoQ+My7HcUlGON5SoIw/SMRP58RGRpp8KB2J
         LGtLvNPVJjIOS02IkNGMEZMzVO3BKnd3qkqe+OwW4sdvu2rWi/x7IfmG4525Guoglgjl
         ebD5h1lZ7tSwTe/IbIZK1w0bslt9dgEp8ovcaaJPFYXZyzMmZBwBOj/LyOi0997vxmR1
         7Fiw==
X-Forwarded-Encrypted: i=1; AKwUvBzm8pr8c5yvz9yK8/lfKggnO5ygiTgG606RS1fbD0k8wKVY/PH2hIPSkCrqdNKGSyIrHvHFQlEzFCQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKDSCQdr329Jip5yXMLlHOJqkqse3eBcOyCHZ4dVcyT879MTx8X
	dJPKQOaoK1Mil/EUsxeRVOhQTcTmmcQqI4c02QYvey6FPxUM7QGtRRcooGCPb/TRcmSXyTGds9i
	i4OsZ51VNc88mEnNqEtAoSWIc7J0x/aNgWBi52ciQr1YoT+KrKECuyG+rOF4CkBw=
X-Gm-Gg: AYBFou2ih9UjPhOHDbpZUfAP5N1bDHG1+d/bL3WNknkXg6pcaWYY3B5zyaL4zubYvb+
	ULTPYNkGoyGhBt8Ivox2FtlDrRenSMo1Y9MMhP47pB5gakCZIIqNloM4M2c1haVL8wvpkjIyEq3
	oiilVC1vTxrxxYqHId18I5xluTxOOQiJm7tehogOZ75xH7siOSy/2gMq1cp0XJvROgYLBcsBTBu
	GYbeWB9WMzqX1ba9xSRWoM7SsygjuEQQRacnuaHA0C4If6yHOjN4mEaItlVG1qItRGr8WBm1e3x
	lM0QL/bGnRtUco9BlsnhuWGfFwxQDLueo3sjxoT0ms56VcOsWvLORXdcjQQ+BWASHIXegl3wvhe
	lVswQfLxC2jvX0M5pBAdvRmvhoAGLQRuxy1i55DgjZl26Tuk=
X-Received: by 2002:a05:622a:2293:b0:535:20cf:96a5 with SMTP id d75a77b69052e-53645c4106amr5449361cf.7.1792175496535;
        Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2293:b0:535:20cf:96a5 with SMTP id d75a77b69052e-53645c4106amr5448831cf.7.1792175495905;
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb30509sm29187696d6.36.2026.10.16.11.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 14:31:19 -0400
Subject: [PATCH v2 1/2] mtd: rawnand: nandsim: use a NOIO scope for cache
 file I/O
MIME-Version: 1.0
Message-Id: <20261016-nandsim-nofs-v2-1-f705c8819d11@columbia.edu>
References: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
In-Reply-To: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792175493; l=1940;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=x8vvF5qS8YMr2iEJTC+QZyR/N21tB0QY5FgJ/RCzKxw=;
 b=/fZ6YuNI9nC+fDTLTqHaqFZ+n68DizBKtmZjXDMAb07/IisxLEovqXWlWX/A9KHSE3/O8+e4a
 O4OBsNTS87FC+hPA+hasmbmBALLwr/6l6R1wYxJ/y5/4wLRXvIrhV9a
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: nFsmtd4b330Mzss6jqmTpA8DAc0Eyf1m
X-Authority-Analysis: v=2.4 cv=W/StxhWk c=1 sm=1 tr=0 ts=6ad26d89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=xz0OrRJCyJRxHT_uhz4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: nFsmtd4b330Mzss6jqmTpA8DAc0Eyf1m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfXxuDlaOjdYTcU
 pF5SmL3iNZetm3vdAAG/vZtGHdYDYdXjWXsY54cVdKO1dbuKdHHr2qDRMI/qzvh7FK5wuitpKwI
 BFVt17noDvxrm2NWIc209i7Bgt3FivtI6d2+QBanssud1+OQpKEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX2wzttlPOzM/z
 pioBTaCgNrULMz04C2OOJnnju9mHf+bmfDA7BdHSUzERnNi2bLeIwNVjrSQ+ZrpjXUY49Kxmk+Z
 OxGc+b5tHpYGHVZcxyhl4fRwbluBgqAKZySLNBYhO7TYHDWNhFrc014Rqh/Dw/ajD941IZzRaKs
 2NOcUZNNf1Yu61tY102sl8sEDUf6DpQXNeaanxuvAP3xlhhEfgSaWu68OkMsBuBUhcQqYvEquwl
 o2PDK3xGCqzXK6VT/hBK7i1vr3x61KJ7KFP3K/L1dnz9GfpZCw0NFkioGsTOi6fV+nY96+njBvG
 iHDOCFZdkBK8LcdV2x6UnvCCxk1G+2VPAhqjhl0dEllTBujK9JIvDKEN+ucOTXS/8t39jMBGNtp
 lDI52V84NB8R6CmKxZrIbwMHIpMoWW18m27vCvath2Xxp8nNPVQjFF21uL2mVxK7LDTFhri5LGf
 +4TvLZ17hagJomGCOYA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 bulkscore=10 adultscore=0
 lowpriorityscore=10 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113139_291036_9DE8AA3B 
X-CRM114-Status: GOOD (  13.49  )
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

nandsim reads and writes its cache file from inside MTD operations,
with the chip lock held. Reclaim from an allocation in that path must
not issue I/O that can come back to this MTD, whether the superblock
shrinker evicting an inode of the filesystem on top of it or swap on
an mtdblock device over it, since either would take the chip lock
again on the same thread. The driver ensures that by running
kernel_read() and kernel_write() under PF_MEMALLOC, which is more than
it needs. Use memalloc_noio_save() instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..586f4622b59e 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1342,14 +1342,14 @@ static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int noio_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	noio_flag = memalloc_noio_save();
 	tx = kernel_read(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_noio_restore(noio_flag);
 	ns_put_pages(ns);
 	return tx;
 }
@@ -1359,14 +1359,14 @@ static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int noio_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	noio_flag = memalloc_noio_save();
 	tx = kernel_write(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_noio_restore(noio_flag);
 	ns_put_pages(ns);
 	return tx;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
