Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E919C5DF81
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NjdDJN4L72v6BfbuLmemUpGaGJJJwCxrYVPYO+GPznA=; b=bogfOL4atSr3+n
	04Nh/JZJM5MqRS8WlEH/udvbI84YzkcvwXQO1ZkQC4G7OSLz2L53uVJOLKpuy7IKj3uD9I3c0A8Y9
	4we/a/QyZ059A6Nbnub7JdQqoA6cfHmrg8Trlf6OoUfMVAsdx1dZuA8w1oOSX08oPwpwo1wR0bvr5
	EFVP+Moue9AIsnCyFztqnbxMAq9e979z8W25qSnPgCCntMNH9bxPWKBq2Q9pngkZ2HFPdfPuX9COa
	UfW9xt0DfL2OVswbxDXCdt6dHVJ4JOcdynM70OlHIFbtS0cTh8kFc6venyjjRW7BO+1WP5auBJ59+
	q9PJSamGjRcdOQsfLrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyV4a-0000000GjLq-1P1E;
	Mon, 24 Aug 2026 13:50:48 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyV4S-0000000GjL6-1laz
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 13:50:45 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4FB837A0115;
	Mon, 24 Aug 2026 09:50:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 24 Aug 2026 09:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1787579435; x=1787665835; bh=nv
	unR9QZ6DCxhKVpGLRl/WP8zFCI1YRX0wksIa+vhlY=; b=KGHBr7hDwMPWReuLYd
	Xm9zWboAoPODc4ApJpw98fSjLwrFhYKgQFX5IAaDlprmp7zrk7y/uV6nTd7FWUCn
	Ad3M7NxlueeNqHVZ0ZJ6fJ7UTfmbVMrx3WOtdtfsvpwlNNGlOl4VD+yZexKPFR8z
	zeKDZJaY8VcdyKCWo6L+OYg3HNzs/JkaAsASZC0n33duVQw1WGlXD+ViVMzWn6L9
	Q5vOeD21RBsr4Yoq2K7JVbOSmyjHH+TzMVzTT+X01H5LthTOKDN1DqzsB8C6G73t
	yCpuJlE5anECY/JyTZmPcIufDw6xJhUNFAEfsk/YDxa9YOFHFJkh9a8e+wseXXWT
	tb2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787579435; x=1787665835; bh=nvunR9QZ6DCxhKVpGLRl/WP8zFCI
	1YRX0wksIa+vhlY=; b=CzHjPkw/ob0f+1X7JDBnUlhZSW48sMCYCymcPSIJ0zFl
	xcIexS5nBgzmEIuAwnJjMj+TOcvxnh6A0DRpufwUG/R2oaPIm+eA7plTJ+AJPd/V
	eBDOzpS1184feQfYnLQzTIgi9dZ0wLm32krlT3q68iDNRRmu4kh0zrSUePDPeAMP
	3BTYUdQszxSA1YfaJ/arxFz+UjXHojqVjW1qxuqCE2cuFsQ5XG/9OWsYZi88/28h
	HGaZWJEzqTWRUy5qHgV0lTsNEJl8ShNzpZBnW28i/vx5VbQSFn26IfVGBdZ7skkd
	r9QRL1y7xg05LeIUhCvfuV6+a3A4IS3gFVUAW8Y4ag==
X-ME-Sender: <xms:KkyMasWvOXadDjQDmMuZn1olL_3P_HE4kPMVxz1-5ZXoF7m0299BYw>
    <xme:KkyMap5EBO43B2YICPINfHb7Gh1g6MRnWV11MeIufkpwNmRig7GZHAZp7fKdt11fM
    r7jwuCwfSQ38Bh47hg6-m8rP4OFDnwJRGwAW6TKrIDrm0STOrZR>
X-ME-Received: <xmr:KkyManr6lNlxJUag5oWjvAz5IUi1Qc5ESSOfX2GPlAyJrznM0OaQI8sY2SsHjdxZFUaiYe9so-jODVZXJ4bv2GGFRG1G7bWikvegkSdU_k8KscvCKP0>
X-ME-Proxy-Cause: dmFkZTG1QvCBI00aswX29U7GkNWSh6lvm7BbVcIApheAQEbmKQK9lhXaTyeUapNH2O6zXz
    eXsqJxCbKf/riX7OKbmYfWpJ5ohS00kegtAz5r6OvqSu3EafFj7BsqMvDZCpAyyvX8Y8Ho
    jpweOzI9txN5NU3gukm9VbsZ1eKEPW0HI82fsP8XHfGERaFuPnKSFjA7Fuf9CIGX9Y5g4K
    DmRuOTviQtCvZk9hp9mnsIwpXIugVSiHFaG2MNuHsDJjDFNhUdtTXzciPYk2O1n1LxbrJW
    MOh7jBw9n3uTkwvDGohiw5iGYEno3JKU1U1wzqz5UKzxUy8sWZLE/Lii23BbI7TiJ9KrJ1
    9/ZKkxnofIRjhpZYdI9h7OeNrg67Kj8ZR+CRlxQDnkVqxQsbg+wL9BUyrmB3UKd7tJyYP1
    ev/j73GSENYwXnFOZ6f3D0TbVadhuYL7AF3Ee/CTcs1lEqE5gMCkb0cRLEKvo75XeV2Y+/
    vi6mrH2lahKdZxK0bXSE5GGzsvSZiDLhGcxQF2PEB/MUiG3NUYfYR/dfHyv182VcawmWMu
    EifHaGl7iLG0sYQaFmdDqZkdpJ1i86kwK3H29UXSdQ3MFdI+jZLVBfV/LIry+j1G6DAGmn
    iuSYGpf44jPw80XIohqzn3e5W9XPBg8B9OF78bb3uuZjni4EuwWmSMZXrnaA
X-ME-Proxy: <xmx:KkyMaslgIMEzkG5UhiuV_ijRjnDPqjUvtbJK4PSnnKsb2jPZe07noA>
    <xmx:KkyMajNCEufkMcB5UC4mJNsMWEAl3dJW2Ri0Upfc81VZYpjlyyAgww>
    <xmx:KkyMagMGEgqCf_e8uTMEQgrt118QDhKjXeAgM4LMHgSIMR8gAmqUdA>
    <xmx:KkyMakgdG4tWyGCHxR8iWmhKlImpQLBB9RaEtawS7K68XbFTo2hQ4A>
    <xmx:K0yMaiCMHC2Vi4TmW0iAN0iLoilUMngKIWUshzppMfERBhog-ZI3Izs7>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Aug 2026 09:50:32 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Mon, 24 Aug 2026 15:50:27 +0200
Subject: [PATCH] mtd: parsers: afs: add size check to v2 partition
MIME-Version: 1.0
Message-Id: <20260824-mtd_break_looper-v1-1-e46d7f02faab@kroah.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3dySlPikotTE7Pic/PyC1CJdEyPLFPPkNNNE82QDJaC2gqLUtMw
 KsJHRsRB+cWlSVmpyCcgcpdpaAEAbJbZ0AAAA
X-Change-ID: 20260824-mtd_break_looper-429d7cf5a7c0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787579433; l=1406;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=Dz+JYr+QZ7EnxzLpFcu4z+F/syS0AOky+wc+UgMTk/g=;
 b=SBfukzCqg0rm7JzeS5cp8PaEl7xQyZNOt5K+9AR1/h706sFUYDGJoiA7zMNhQPE6AUolKX4+d
 xt1z829+dxaCcEphgnWjgwfusK5kRWH1A6TvUmIkkSC0v/kFvdgg2qm
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_065040_508859_347B716F 
X-CRM114-Status: UNSURE (   9.80  )
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

Add a size check to the loop in afs_parse_v2_partition(), avoiding
walking out of the imginfo[] array bounds if a malicious packet fakes a
large region count.

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/mtd/parsers/afs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 26116694c821..2c6f8768312c 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -287,12 +287,18 @@ static int afs_parse_v2_partition(struct mtd_info *mtd,
 		 block_start, block_end);
 
 	for (i = 0; i < region_count; i++) {
-		u32 region_load_addr = imginfo[pad + 3 + i*4];
-		u32 region_size = imginfo[pad + 4 + i*4];
-		u32 region_offset = imginfo[pad + 5 + i*4];
+		u32 region_load_addr;
+		u32 region_size;
+		u32 region_offset;
 		u32 region_start;
 		u32 region_end;
 
+		if (pad + 5 + i*4 >= ARRAY_SIZE(imginfo))
+			break;
+		region_load_addr = imginfo[pad + 3 + i*4];
+		region_size = imginfo[pad + 4 + i*4];
+		region_offset = imginfo[pad + 5 + i*4];
+
 		pr_debug("  region %d: address: %08x, size: %08x, "
 			 "offset: %08x\n",
 			 i,

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260824-mtd_break_looper-429d7cf5a7c0

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
