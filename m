Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A377DCC6B2D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51cwY2ZmUKVlT3qYx+YbH/K86K0CeJCqXluwmkge70s=; b=V0D07rQcy8JkVd
	rkib+ckXTwXqVW/TZj5LTGSO1gusz4f78tjqbeM6I52Hdlp7JoWvX8xAlnxLhIkETknNciuziizl3
	7CEArOAYfIT0BFLJKRprw4iXhiB66G1RisVixh/ySz5WmRIevbWVSTEZ8CHpfdQaOPLh7PNbFXx5u
	ECjNBsEcbEx0UKE3nkN0cVMD4MJ86sBY59stNZQo5N/kn2b4CiR1W2GYRGpGgQiV5mUnAbP/nt6We
	1TnnvqD3WgNKgM03q5KU3EWOnbUCZCac/SfZt0e6ZRQ+6zB8MB+D1ilSEZDTESLITwiW3pcUj4jsl
	WkecZTF6N/gogOE1KDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHC5r-0000000GjF2-3byE;
	Thu, 15 Oct 2026 03:25:23 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHC5m-0000000GjDy-09Rt
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:25:21 +0000
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZoNM827006
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DWqe
	9XdiB9YALa0XNdGGt3qO4v5pjMXhO74UrVFhCcE=; b=OWdB22kVGDXt6qvpaA7C
	ET7zw++v1tAmUdO5l9nhHw4RuVQU9PTgKbMl7SOmNORRslZk8ScAnPJzNaa4eRTV
	8ourJBDmwYDrojki+dMqrBQgHzfxjXyrX+PWfS8pLZnqQInXEMKh9oJah9UmxxGA
	WwBKafUO09tCDN0nJ49f/o1O9ztFE+vQCxLY4GG3NHieeftyHnQkL8Oprf9JaQvT
	y9Rw/wQ7D/7IckAwDtjTADAmHjEoQsegD0RioedEPgYVABdTOwLymGFSGhDW+nsG
	/fylvFWmwxQvFTqtKVXJH0vtZ8W5gphO8/pWP7hn024L5PLtHRzgf0yNIj0SeZ7D
	9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hahdr9s4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:25:16 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-534f3fe0236so102160761cf.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792034715; x=1792639515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWqe9XdiB9YALa0XNdGGt3qO4v5pjMXhO74UrVFhCcE=;
        b=fDcxI2L96h9+UkgjxsqpeLa5oyRGazYr3IiDPViH+gvgTu8XAVZ9XYiy1afEt4qBjB
         aaZk8PGVGl03fDUzoLoVOSjVt/89OsGcVI7p6BvTeTDRIeb54KlmO6ZNDn4jIlJMWCMl
         HNzpwPkyC0H0hoc0XUV7aLTztBR7f0MZaNWRdb0CfdVZn5V4pXb//cXRjcYeVNIRCSQK
         NGDo5KG8FFvzN6dhPWhH8gipjcAo4YsuQJKpjH9imcjIMvXliONJXTIlLa4PwSp0GiG6
         hGuNN1Ha9x/Qbah+CE62wPVScqO+CiKmpcHw5z0xawJiTOmQPVvOHbquxJ0eDZtecY6x
         mWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034715; x=1792639515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWqe9XdiB9YALa0XNdGGt3qO4v5pjMXhO74UrVFhCcE=;
        b=iDqmen1RudyClXjYyeDXu69DPIF6r/zEwiNnJKVCLZZL6rKsRcvaLFmsLrCx8qfAP2
         MMbNr5HOuHWtlUgubphnmGwLVn/KTOVJpoiKyCqT4BO4HXFox/3qn5L62/PYgOB7tcDB
         G2mCK62BuiDGzS2mHzgeKG2YOKX6Z50X9Vselmu9wdDCCY/3qJyQo7saeetTywL4YF2h
         fHPIiswy6IgLDQtYUT5IIKFX6g65B2IBT+OH2yMPgaJju+7BEG8ZVxFukZGouo172OXT
         ogqKCuP/HFg0ndhPpuhnhKgdJTn8GKmiF5xFACd9yGEPaX9Bo16DeYpzU+Lo/IfMOcXK
         a/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxRRAzXd0ejFeFlFxIDzry/H5gOIHyfdgeLIor6igSBuuC4/J5S37NVIDjDM8EabCI4YnCw4R9ypUM=@lists.infradead.org
X-Gm-Message-State: AFq9FYIac2i9T4qznguIK1sHr6W0kpNh2wbT+enIEAOghCjqwDlwRnbE
	LfA86tSJxSW/36EW9bHyHnJeH/lL38zu5e+H/n5wmrrPtN/YeZZcA01mIZ29k32tayQPb8YdTh2
	O+UDFIWfx/7sUQH+pmd1xGau41FOYzSkS09LpHaIzX6NpLt5zCODZix/cx8Lx/6s=
X-Gm-Gg: AYBFou2K9uBYhuPSoks9ZMpOdN1Zth4gqd0zlgOrlZFQXSbdbGli4btRFyMT043mmVJ
	yg/VohoNEyt6n48RQCAsTAE/gnjp15Hm7k5wdfsHdOTsFw2/MpwzbJaQ83tGwGVRZdyMWZuz39y
	WnAiTiY3oYvnytWLeIIe96rwSz5jjW2YuoXTT5vAZuPhckbpQsJGtlHJBSkvBOzLmPxrlX5tFCO
	+3Ex1icNVbh5n+9DwYM8ngGsREd8/jhHC/4f1x41Q0c6gOAa2LP0IhYMf+m3FPW9hUwQG67lgd5
	qDXSPg+yad1zpLrUdlYbjQglhxXYlQuTA1UUv2pbccYElbi8Fk0V0eUktMjetX9hR4bMaHivH+f
	/HGOcudM0FwGdIoOMiDTSU/ACd66nynjbzCi4vjpqM2L3
X-Received: by 2002:a05:622a:356:b0:535:92a6:22f2 with SMTP id d75a77b69052e-5359fac57f5mr307845211cf.15.1792034715196;
        Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:535:92a6:22f2 with SMTP id d75a77b69052e-5359fac57f5mr307845041cf.15.1792034714638;
        Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127bac07sm15022721cf.14.2026.10.14.20.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:24:58 -0400
Subject: [PATCH 1/2] mtd: rawnand: nandsim: use a NOFS scope for cache file
 I/O
MIME-Version: 1.0
Message-Id: <20261014-nandsim-nofs-v1-1-47e49f37e387@columbia.edu>
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
In-Reply-To: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792034707; l=1770;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=dFhC1z+EDvEt0t+4kDQuvuxnIcKAqfOusvzAzWnwYCc=;
 b=gdPk5oGVHFG9xdpf1Jfc5X7tjpYQFQ2+zh2213hn1/5jO5zP1y/i4CExdetr8Nuku913JxF7r
 LnHBFIRYa+VAPob8ci1x/JImO7CRu68XQi+eF8SlTgWIJIa3Ve0Fn+V
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX7g6QWc0uzS7G
 sLa8aWv/erw4s5N55hC99oulko5v3bJs2liYeNVioz7ZxSLrTvMDL4B+Bf/bVE9kLbLQGPg0N7y
 cV24sdNzDZGJWa4j/cAomMeFdPZZipLblVm3eehwpgUYZfTvAsqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfXw1UQzVE9KMYa
 TXIoY8m6Be/X65SINnc+clpfvFgJOW53MERCyfQG2h/NuF1MMiKl3u24mXs2V0Vp5MKDb3/J081
 pl0NubBT1PKkUUEBLqzLIEBIF9XmwmWpu2gPsK1Pe0sPNxThZIi9Mx2smYiuV+hvTajzkSFpy+P
 etGCWU8Eu9aEw5kBF1UORj3u6yJl515vgrTmS/SPv3fQYkKvwDYmofY08QwT01c9gxO6Rtp3GKH
 PKf4gi5Ly27jvejswSCS4iRzH+ujspEhx4HLnPY9Xxu+tVeqvca0FnmNmUUDUk29nIkHJ03Pcpl
 kPXTvpJjjpOl8M8CyqY/2IV4hHz9xj15gdFeDCLeuijRxvhF5qQhcsKqaIhjD/3D2brmtD3uhYA
 LmTY4BmGV2duxoxAu6X++xLxGprMzy5PkoIIUUU1uGiKawEf8cUcaVjwfebZdNSDGrv9YG4OTdx
 jEGD0AUL+crQLgUmRjw==
X-Proofpoint-ORIG-GUID: UJxEZDtYUIRBDxrN_si_W_FVnKMpaAaB
X-Proofpoint-GUID: UJxEZDtYUIRBDxrN_si_W_FVnKMpaAaB
X-Authority-Analysis: v=2.4 cv=a7KlZkSF c=1 sm=1 tr=0 ts=6ad0479c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=jB6vpCtqdLSoJdYjNPYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=10 spamscore=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 phishscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_202519_052197_69FBFF16 
X-CRM114-Status: GOOD (  12.87  )
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
which the filesystem on top of it can issue from writeback, so an
allocation in that path must not recurse into filesystem reclaim. The
driver ensures that by running kernel_read() and kernel_write() under
PF_MEMALLOC, which is more than it needs. Use memalloc_nofs_save()
instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..4559df2cfa3c 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1342,14 +1342,14 @@ static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int nofs_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	nofs_flag = memalloc_nofs_save();
 	tx = kernel_read(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_nofs_restore(nofs_flag);
 	ns_put_pages(ns);
 	return tx;
 }
@@ -1359,14 +1359,14 @@ static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int nofs_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	nofs_flag = memalloc_nofs_save();
 	tx = kernel_write(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_nofs_restore(nofs_flag);
 	ns_put_pages(ns);
 	return tx;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
