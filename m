Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5B5CA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 18:49:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE9A82080F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 18:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9rAo8M4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZK9cJLlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE9A82080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pyFluvDrjThd6QI0Yfs4ne7M33kuV8Ccya36flHUnmU=; b=M9rAo8M4DVFRUmxN5Kuj+vRIvt
	VMNj98AE0ciKOwfDGcMGTf7RrFBK43BZjjpAl8Hz4+IBcsJh+zhH1zh+l3ycaidiuGTB0IWclv/Ek
	rbUI7vMIUU086n9hQAmQFdo+WJjhyJqVKNDAvDSCsUge3/rgvq/1LK+qdW2G/ydZKooY2GKhaeTUR
	wvj6BqX64w1xX9Po0t0SJAr8dsBj8HGLLhUVgGy7HHl4z0rBsjIg7OGiSJ9g9cOQNZRjgD7vavRdH
	Puu7OgRQWVj/zYPryttLwJqOvRY/HETmnDPF6fhs4F2hd19dcb9YNHZ9EsHzCkbx44tZRMjCavxFl
	PJno/QGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPt1l-0005Jc-HI; Wed, 30 Oct 2019 18:49:05 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPt1j-0005JG-7m
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 18:49:04 +0000
Received: by mail-lj1-x243.google.com with SMTP id v2so3848408lji.4
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2019 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4IftJjikoyVFD34AT75BtbVyJkiq+T/Ke6SEePUiz6U=;
 b=ZK9cJLlUFqiD4lGNPe9BCMUBoQN3Whz0AxOKuPaPJt6csd/8jt3nKGjW7RgYo79fEJ
 BHE2xyRv/5cOJZF/cjori6nfn98M8Us3bqYt21MUA79J6elFcJwfEOc+BLt5bCY0a40F
 CxaFJlckk+quuxShtJQVm+vRLMQvAt3lbMFzZQCMfAt9ctLHE7RtYS7Y8wmEgv4QBBg0
 c7v7h6F9swWMf6OvhXDGIITR4OoNHI4sJfsxQmxG7nvlkR4MJ2Cn68I+0hjNIEMkN0xw
 jrHOvn0ENmzQMVCUDp+PxNuRNghAZ06ctSih84C7DP/571S5O4RsRgaYO1YPD69OF+hU
 vFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4IftJjikoyVFD34AT75BtbVyJkiq+T/Ke6SEePUiz6U=;
 b=tZ2jI+ATRI2V7AB6/5w8YjhCrX2aENkt9MTKFtSJNUVJLrHbcns0+NXGLw19ZSyeJ0
 4ZmFCMRyPi9oKxDFGJ6dANa43qv50HmmL59maynAG++p9D6oq0Sj+xIWgQj8UBdHtkJ6
 c2Mj9dv4zrv95ISxCgHIZePWxRkCLKEV7+U+NjI1bRnDAP98f0HJj+E5pGlvdDH92LSE
 V256RKaSdBfeE6O8UcFE1HoW4Py+CLf7tuuJQzSrKlqW8v6NTQQxO20cx2lKvvGqy8tr
 pUaj9moVd0cnraPzrXmVgYaYXRtwfZzkJmApWLSrcSbepf9tfGmLYGJ0o/shidqdBWmI
 ZAHQ==
X-Gm-Message-State: APjAAAWDQ8pmRLE+1FMkSf4WU+z9pCLil/ykZVLRZPlJxXl0/zxOOCig
 t8oQfXCp/CvIN/tvkRdJ9+4yNSmIkC0=
X-Google-Smtp-Source: APXvYqw7AbP3GrvlVJEIK2/foIUMM2jJUv65x3gom5Z/H5WBs28Lbcp21hB5IXIhoA38uTpqa6tQ0w==
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr861630ljb.22.1572461341078;
 Wed, 30 Oct 2019 11:49:01 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:454:89dd:4e25:eb47:574e:ea06])
 by smtp.gmail.com with ESMTPSA id m26sm407199lfc.7.2019.10.30.11.48.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 11:49:00 -0700 (PDT)
Subject: [PATCH v2 1/2] mtd: spi-nor: fix silent truncation in spi_nor_read()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <e069093b-ea7c-9a8f-7700-ee0d8d23ef91@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d684c04b-7546-fe1b-7bfc-c2288f211ea8@cogentembedded.com>
Date: Wed, 30 Oct 2019 21:48:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e069093b-ea7c-9a8f-7700-ee0d8d23ef91@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_114903_280208_A8CFB4F5 
X-CRM114-Status: GOOD (  15.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

spi_nor_read() assigns the result of 'ssize_t spi_nor_read_data()'
to the 'int ret' variable, while 'ssize_t' is a 64-bit type and *int*
is a 32-bit type on the 64-bit machines. This silent truncation isn't
really valid, so fix up the variable's type.

Fixes: 59451e1233bd ("mtd: spi-nor: change return value of read/write")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- cleaned up the patch description.

 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -2544,7 +2544,7 @@ static int spi_nor_read(struct mtd_info
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	int ret;
+	ssize_t ret;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
