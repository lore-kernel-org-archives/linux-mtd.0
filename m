Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E29CCF2C6
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AVmSJJOGVxBQhowz9+6OOKa8ysBJvQ2tnQIkiNG0Rc=; b=DgJa31LyU3kQVW
	AscWkxxqXKvm0xF4T7528Z2nkH0hLvAHUxHa5gFf+tYT/2fQ2ZpqOYr1CEGljOd7Jn+bzx+Jvvs11
	vYvq4iKNot1SiS42m56tny8dsKzC8pRu1bCngfKJpAuwXfrQTe33XjYRbeK3AitoVyyQZsYiJOWID
	/jSDLSu+ezKThPbG1P9N5RchXmSXYzSN+coMH6s4yxmghvtcrleH6shc3LPR2bnRHOOhgxwq70bN1
	oIk+PwbY1VeucynkYfalu5nTp/kR0YZLfWfrnp4xLFRZXdMryb9zC7jB3vMvi282y4KquEkc+HOVI
	Wt9G94h7dr4uQ4rI/94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL6-00000003ped-32sx;
	Fri, 16 Oct 2026 19:11:36 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL0-00000003pbA-09ip
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 19:11:33 +0000
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIcDTZ463969
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=/fCp
	J59+YgngC9F1OcKtiJqkIBPYAyjcjbtV+EnY0Qk=; b=fXto6E4TgNj8SNhOrr6R
	uA0yn2fdpEzd7byl+9tpKBZ/wZWdJAYBT0mk8q1bC6yOka0J6Lg0YfIP3yhdFxv/
	tHg8tpEh4nxzhAPgN9sIMvRCsNpFPBzgzwx8W0cOkHT3MMcVftoyKEIa5DSxgrCl
	wqLg9UlyUANuIzgeva0KCxnzixQt+P4t4RKcZ6ian2GB88QsBxQ2+0oxzK7OO2S7
	qf6zKwojpz7A7NI70DXsF1dvfzqUg/I2zstT84ZQPKwO5XlO5dFf/D42NoXHdpj9
	kOEbWuCBJm1ov/o+vipZygwAqojDclTOjlAMT981bN4jfDH663gTk0eqpWoKH8xX
	jw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbgyj4bu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:29 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179743a76eso6591906d6.1
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177888; x=1792782688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fCpJ59+YgngC9F1OcKtiJqkIBPYAyjcjbtV+EnY0Qk=;
        b=K1uDJm1TsyzNZRqDJ0iNsHah93XeiUKuxqIiddGzqbuWnfBCiytBDWrZnCuByq/QDc
         T3+XbjjW/L7fs73jSzp0Gx6O/NMhjbBrBCwdZU35gXb5FRw9e7WVhlxImrlAtg2a4oQ4
         GMXXkXSc2mc+f1m5GIbhbwcMuaZ44GHQfFldO4xpQCXcPjWK/P3CT8Vj4+SRu33MKQDD
         SPirRyoBU00PbsCi9B5N4F2gNQf+31TN0bgtBdjE37o64HtfWwhf4A0J+ccw/gfkcraK
         rYIYJgBkP2WgmHNfXMK8IwvQ50Vf5FQi3b98YI44p0kuCpjz9YQYejBqNrws31sVjYn1
         2GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177888; x=1792782688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fCpJ59+YgngC9F1OcKtiJqkIBPYAyjcjbtV+EnY0Qk=;
        b=kNxvPBHnW4osFwrWSnLnSjkD/GbYzuYMy0Q06gfydRMQC9HgWBEqzTe49ay5hNmH6A
         t1lKflhYG6ktf0UQIZs7GzSjncz1lOfKeNE6k/uF3Az7nHiw5iXLoV6JgLTR37IQqfw9
         GdhGoYSZB9j3Hac64w0Q7HoxVcRXRUy5eY5ROJP7F/4TVB3ZMf3tN4mio0ftQE5Gm0Et
         XkfthASc93COSMpoekBlYNkns3o4SlQ3Kuo8O9VLge0rSsn8EFzdE23RTAiN0NUmCQNR
         MnGXVuuOBSmAfI2ofcMixmLkJum7xWnoj/KWy6YGfmeLsTH1OFs8D3QWNPBUqoI3KzDn
         jvcw==
X-Forwarded-Encrypted: i=1; AKwUvBxEN+7aBCyjiBnfv2mNbqlidCjIUYY/cBlsPoJFq7Y6tzRvUtA7vn+j75dSDo3UeDTrUgd48EFob/0=@lists.infradead.org
X-Gm-Message-State: AFq9FYKb7SfXlqqueLp40IPCSyy6xsLNfsNLkjDI3/jMgR/ecHYPh9Wt
	TUJpmGy/X2F8sTM9eTbslT+L6YK0a4ACaySRYTbfjNv+Rh4A8kF2n7rld2JDH5Z9AjDreTYiCLS
	UgzjFlq5mSGrhAOjHYeGs4PBdULfoHfcxAV6/YSTDeQb7ab9b3wuYSBsoCkm+4l8=
X-Gm-Gg: AYBFou04aWdzyDXA11dUjrqCjYXCvzooIzN1FLQiGs9L7+Z1y2dNBwz5d448jBAiUqV
	5Uf62gBfT+xrz/O9dPj+0nxvynn+mRjguyxC7kmSdEEm35OeeWKmkjHhqrfbKjoTeB/a8eE93jq
	fcPHkYSvfrzPe28HTOCxbULdxToFbGPeFb5j/kTaWRB+36lBLAU1Ejo2fGbPRxkg87IO2qvGVFw
	wBK9n3SPuA6YnoXP9J5+SVA9a1GZrF7Hh1W+lXTNI+9fxyU3LtGOBhx8sQHON/yUDt4JWMkApGW
	+BqrW34XQMLz4EfI2sKk1AH0yeJLFE66rx0lIMZVD/A4LZL8zb9QNE7irswPMD9Ml7t1IsCDMSz
	vXbcNNkiui08CdMv1zoIqWqarPzJ2d0sV/VniIz9s5pqLO5U=
X-Received: by 2002:a05:6214:3906:b0:917:9703:48b5 with SMTP id 6a1803df08f44-91bc9694f62mr68163526d6.26.1792177888249;
        Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3906:b0:917:9703:48b5 with SMTP id 6a1803df08f44-91bc9694f62mr68163036d6.26.1792177887689;
        Fri, 16 Oct 2026 12:11:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:25 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:08 -0400
Subject: [PATCH v2 2/4] mtd: block2mtd: convert block2mtd_read() to folios
MIME-Version: 1.0
Message-Id: <20261016-block2mtd-folio-v2-2-8280c99e55c0@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=1701;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=1bz7r15jgAaWx4NqhBrgfqo1Nt2utTZw9ImBRfqga+c=;
 b=kgsIJlXGhiCJQppSvK1s15+vrlEB05FEaSc6z/d24jbmQtrDbz07sPmP7hiUS0virMI81LXcv
 DC2RsPPZDNADFC7ORXdUh83voz+AWowXdp/wb9MnSQBYKiq7f8BYhHo
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad276e1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=A657Os1j7QBKVqWzl58A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX98DjXT+4MpOk
 fkcz6ZEv700pOcuYFdBrjFP/JKqWM1n9dqjLiHTEbXD7E2yQuGU28yfxR6zl591Bkk0mhcvAC+6
 /qHESkG/mGx6AkNDrHEituUObu8R8n7h/c4Au1KGVOGQgJ93ct3Jdo80bF9DZ9lZtr9UPAR6IMi
 UZkWS/pYtsXQTIpCbEN232acZKuAXGtYtEhTj2CkdLwUFzsJaGQJldnHFtTVKwXNmk3ijairrjG
 x+lkvdPuuQrMnK5SnVsaTXer31Y9QQoUubCMV3xUxxA+rkFpZCjejrWLARCNfMYFwvKld/8iJ9O
 NsT5hRbp8/PlckUxnJw4lA3hmNpmozWjl4n5EeC9+frbMi1/MBedDvKIBWK/XLsQLNr8lvdJD/P
 sp9duA5fSVPyA2ZSTNnMfJmBZ9xORXMekcxNCM/yCL4AYshrw3D4MXaU871EADE4eZqPbDcQAdL
 IhGZus8lFjhvyXiTmEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX0AbIV+IMaAIX
 FzlH1XNhTcZyMbyavgrfjNjKrUbB8o1yk51i7Mz6hsp6Pjjc7OZIa6C0p9waoPxwvOUYbTMVxIT
 SxYIHfOc1LxDMo2vqzK7sgGjblfxbq+ZvwTSuKwKFdtZyRL/B9Dh
X-Proofpoint-ORIG-GUID: 5kHPDVSMPF_bl-Y2vrsQk39pPmErafKA
X-Proofpoint-GUID: 5kHPDVSMPF_bl-Y2vrsQk39pPmErafKA
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=10 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=10 phishscore=0 lowpriorityscore=10 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_121131_762014_E8581FE7 
X-CRM114-Status: GOOD (  14.70  )
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
index ca72110b07d6..db5472c6b8c2 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -112,30 +112,24 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
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
