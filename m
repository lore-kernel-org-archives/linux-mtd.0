Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F03CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgoVOLcmSBqqHJjfC2P1qD/gIS34UJHE6az6rbXSWZg=; b=U+rI6sB4Q/xRua
	KnRA9QBLquQPnwNHucNsC/hVaWFbO45UKbuu8NCJGy93RG1L5JxUFIJYZK/lzGsJ7JcDlOLxDMfTD
	5iZfivhdmL78UB8BZSiKTJY0usN5ZqOs+hFQM1sbKEdgKAGhSyU3uoVbHtEfy7lNh6ZoRo3c1LGon
	al5gMUBTK2yI++bYI/kZMy9MpLJ/1ZxVpsf/Eh5xfzqBpYuouAUWDBC9MTfKMESKNF4rfvijShSu2
	x6U/G6pwzYItbI28Rppb7krEYCgTOXsEITMxQdYzdRjX31Fgfa3pCEYuoM2KluWcclAEzIUy6xwU7
	L5m7oUF/lXAJGGySfMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL1-00000003pc1-3uXg;
	Fri, 16 Oct 2026 19:11:33 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnKw-00000003pZz-3rX8
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 19:11:28 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIc6x3491618
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=z1PE
	0307Akf9zgigB6zaioTQsjGQasVZfGnAbLPrtbc=; b=m294qtaQreGvJxTSlTuI
	vKz+37b2p48iCYANBzc4rcxdjVqbFgGXNUmGFzBfLgI7VhCIrCh/px89J18N+RZV
	S/vKJ5H+alc1a+8NJVo1Xhrhpb4PlcZkdMuOV7l15ZH2feT+dtwYg9VuSEU30/yg
	6h0O76CPvcaiFfkEPGv9b6iCSbn7TX7TychWM0JJHrP46Q+t5b2zb5MAXqOnHM5k
	QVe+xIYuU9Lmskz8ojHQhhILaF+/1kiwTtrpjpeOgbcSisGVVl1uvSYH7SHQWdGx
	7ku+7gyULyZMQ7ygaUUYOCGgsV03hUnMHioXmOvYP6rVzTzcD/Avji9NRWM9ZhfY
	JQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbqfy9a9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:26 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179d9cde17so3529836d6.0
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177885; x=1792782685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1PE0307Akf9zgigB6zaioTQsjGQasVZfGnAbLPrtbc=;
        b=LfrKYTIS1+zCusJfp/nk+suk8WsnP8lggKgFD7Qplu6Hc61dFOMoh9savd9uTXDwhg
         jn1BaljPXi3a0b0tyqMLbS/JNQrj0HbCBuC1X+RBq1ODwZx5jQ8sZ/GvYxdrIjTGll31
         F2JO46SVECvlT9TrNg7xyIQSHyCjQ9UxV9riuZDsGMiQs+fWxHP2tFOPWAPUnEnekZi1
         p7OuoBMcWBDG8LvRTt4f9pBYT2MuI0yRffCYSwaXXKuq4lhOyOjY5Y2EIRaAEoG3ZOw8
         CbLDlQhdd4FYiOK3g9lF3dahTU2RQQErNIDhGMHZlXDcNCI2U/OvsTAq7dWOCE8O/vDV
         mJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177885; x=1792782685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1PE0307Akf9zgigB6zaioTQsjGQasVZfGnAbLPrtbc=;
        b=bwO63MK4sSh2wmVW2bsbgxQpZJFqQrkiKIkJpvIlC95Ge/0UcaSO4Z3avwJJGehoEW
         HqI01aKQRLn87MW7v2mSExbC+1e43y0n+GW5I/AlBY4WUFOKQRY53x1nTpx6mrdcHK1W
         cVSsQl4yM9v4PkjZI2rT1HfKcVNnq99SR+lS0w0krkLG3LUqoO1dAEwKnM4fsHbSjuXS
         EGVgMzU92ghR3rS+ebkb7IkdAWZ8vOmdUE6OIuAclYyMhfxHpUCsjvWfVoQr3vpXqFsT
         1fUtCuvHdRLyDWhFG0LVpgxkOZiRPmEPUg0zaisqd3W4aQDzAciytBovg4OdT8fQ+hZe
         ms6A==
X-Forwarded-Encrypted: i=1; AKwUvBzAFtIdMK73wccCy61xxp5BzMYvYgOacir/gkyW0BF9CEb485uTWaqnqRtVnHCrv782wR/eTXxAR1U=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUvK5WTqLBQUx+8o6vIFtnauuyuj3bAQpMxSLcaHEv/aDnBUv8
	cvrFPGIJrfasIQNrpehtCeouMqFsWQ1THaq7VbsQ78WEvoMqw1tPZWGyNIYoNQpKXIx1s+8HQ6z
	ASWZIFq+hAwVeeDyNhFHPZQ099Zud+p/aB8jxsqeW5yEEk5KBCs9gadiEUhAvHEA=
X-Gm-Gg: AYBFou0yJEvqtLf12QWeJ3YvjGvRZieW+TWWkl8Vra16uq3ufjC7gf5yAwRuWaYdRAV
	FmzMTRxBnF8uoGMt6w+0qk4GGSfg38s4tqrnxl6ljpCI6vOHe+Ph7LCiANhB3vgYWLASkHPzjrF
	p9BO4l/hliOLp8ySskQPdYUgkD1Mi4OzJtGLwlr6j462wgL4citUhKgQHUD8twmM3vK0l6rg/La
	gOuGHazslqqs4qt0xV0iuSd1sFo/LlsTLJ4sA2LrdjKcFXOGrSzfP8xSHCusx+9zoUYqrxxWlod
	j1ZM0xMhq6z8iAY69CZyI0Q7D3ayCTjs6lT3iNjSn8j9IERsYuvrddjDtVBXPxrlK+ERptu0l9J
	rq6P3KXXSqAyo6s3QpvxAd42NrfBaIlNGEomi014vEN1sXDs=
X-Received: by 2002:a05:620a:46a1:b0:93e:6709:bc7f with SMTP id af79cd13be357-93f29cc8c11mr146642585a.15.1792177885058;
        Fri, 16 Oct 2026 12:11:25 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:93e:6709:bc7f with SMTP id af79cd13be357-93f29cc8c11mr146638285a.15.1792177884556;
        Fri, 16 Oct 2026 12:11:24 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:07 -0400
Subject: [PATCH v2 1/4] mtd: block2mtd: retry if the page was dropped from
 the page cache
MIME-Version: 1.0
Message-Id: <20261016-block2mtd-folio-v2-1-8280c99e55c0@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=2157;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=nDIdtsCuMVXU3GquABIfjO3wcSwZRZ5I7/ij7MqIM8g=;
 b=lGgrJ+GvKY8uGGSteHYmSdbD2jEVf9nl9zZ2AjqleznVwi7Zv6mSIPthqLdNsA8IAS4mEVMHJ
 i1vPqlmfW73AGtTUvuPKUv2Yzi+NZSKrWT4+Z3YQ/y0fpr/kGX3sOlv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=b+4ncdGx c=1 sm=1 tr=0 ts=6ad276de cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=JGVunZi7BP6-TY2bbWoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: bpBnbGhNudOgo6kVsvOUqXCRn38rtIlP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX0NXNmRCu+z3R
 FoJgq0DrZ7K5ftJdknnUyNK+kY3QUnbY6un++UaBPZUXEYbbthVNGUMtP+8WBgDa9qU4nxweFVM
 sLO8aXjbempT5H5pENh4i8izjc5Q9OcFM9bbbhkd+lzjEkp2S2t4
X-Proofpoint-ORIG-GUID: bpBnbGhNudOgo6kVsvOUqXCRn38rtIlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX2jVz/xRigkiu
 9zJtk1Nb3YhfAapzYH9PHj0pAInYwPlLeTpQCTP5PskYQ0aXQlwbc1fk8yty4mpf9XHlHwkF8Oo
 0Dr1wb4LlnDk5y0Sqhp6fNGIWkEMo7SmcFv3Hx0gI3FcKk4MyWSH4ld3+2YrlkE1GSEk3mhFrfA
 /MJpg+IyJY4IFtSzglSk9CfwUQAb59n2nIFaUDk3AeWTaZp0EOWlt0aOcRvkWuR1dXZIINML+op
 /Smc3gMoOg9ndws7HeJaE2qH7/pqEqki+jqngVe8zHi3o9VgV2TBCTMk4dwm4jegNmHntaaYntY
 EMH/sLO5n8YpNCzOSHj4M5hJ+FzT0iL0kXkxIHI6gvOTa07zxa1Qwm/n2lqXju2HFxhkZvI538x
 gpPzQOOldDFNYuafq5vz039dHDpkcpYTuHq+gXpXXK8b7q91Ou0zRgPUPjEmG/KNim8Vx4RTSjv
 sr8L1n9oRFSnrH3UZiA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=10 lowpriorityscore=10
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_121126_973959_17FFBE85 
X-CRM114-Status: GOOD (  13.10  )
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

_block2mtd_write() and _block2mtd_erase() look a page up, decide it
needs changing, and only then lock it. invalidate_bdev(), from
BLKFLSBUF or device removal, can drop the page from the page cache in
between, since it is clean and unlocked. The write then goes into a
page nothing references and is lost. Check that the page is still in
the mapping after locking it and retry the lookup if not. The page can
be a tail page of a large folio, whose own mapping field holds the
TAIL_MAPPING poison value, so compare the folio's mapping.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2c4f5a..ca72110b07d6 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -63,6 +63,7 @@ static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 	u_long *max;
 
 	while (pages) {
+retry:
 		page = page_read(mapping, index);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
@@ -71,6 +72,11 @@ static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 		for (p=page_address(page); p<max; p++)
 			if (*p != -1UL) {
 				lock_page(page);
+				if (page_folio(page)->mapping != mapping) {
+					unlock_page(page);
+					put_page(page);
+					goto retry;
+				}
 				memset(page_address(page), 0xff, PAGE_SIZE);
 				set_page_dirty(page);
 				unlock_page(page);
@@ -152,12 +158,18 @@ static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 			cpylen = len;			// this page
 		len = len - cpylen;
 
+retry:
 		page = page_read(mapping, index);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
 		if (memcmp(page_address(page)+offset, buf, cpylen)) {
 			lock_page(page);
+			if (page_folio(page)->mapping != mapping) {
+				unlock_page(page);
+				put_page(page);
+				goto retry;
+			}
 			memcpy(page_address(page) + offset, buf, cpylen);
 			set_page_dirty(page);
 			unlock_page(page);

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
