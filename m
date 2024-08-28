Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D8C5474E
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGKIN1dAht938CpTfosyP8PUkoM/XOOyuLI10RvaBW0=; b=4wwfQ6B7Vmqsld
	4jGnIHyA1MJN7wzpe3gq06mPGkpoL5CmO08QQD7NOlg9W4k2i3600cN3pF+jGaq7nUphrlag4eyJU
	Pj+Hs9yO2uAZ7RiX7U48TG78zK0/Cej+3/hCCPVjEu+tYwW+PxNJKElH8vJnuc/FQoPai/2ghQSZK
	k3dOF/E/S07VnvZrpFGX2KmHFUzRR2kFKcN4tsr2cRUi1+he5oVVNzEJPIYsCH5ig7thyI3ad/036
	3zk8Q/rj67dRU1Z8YOkpIl9h/ldf41sou4FPD/aBnakTIUVZSbe485sBL+J0ZLKY7zWCICu81dUvs
	J6RTZQaAeHkTyz1nW9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDUQ-0000000EOV2-0jcx;
	Wed, 28 Aug 2024 07:53:14 +0000
Received: from mail.widebizscope.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDSH-0000000ENtt-12MR
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 07:51:03 +0000
Received: by mail.widebizscope.pl (Postfix, from userid 1002)
	id BAFF924689; Wed, 28 Aug 2024 09:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=widebizscope.pl;
	s=mail; t=1724831455;
	bh=7b2Hseb9QY/049WYSH5jOQc1GsDAtRo2MBj6O2PAhWg=;
	h=Date:From:To:Subject:From;
	b=Ax0D7fxupqTO1G4ru5VVnp+pb5BCwVD61JEdK5kCM2LixB48s3gBwrNl7IFo0kJz+
	 u7ZxjB5LY75k7iSXsEwDotLHzYAmUxNwsMpjzO19pDwwxwK93uvb+CxSoby6+0AGxg
	 T8RvZjPke9Hv4N1M1XgIh9H9BXgznP9gtXL0eKLYkT3ZCKhCbiD+yaKOH6+vTSicKQ
	 XN+U+p0U/y6JbUGe51REqFpSTj6uKF0/1XyhB9FpD18y9iE6wSlqRiERa7rTwNQPy9
	 /ap2Nxu0tZZhHnAqXRJVDROtZ+dDovX93lWSgfWDolYGi7zb+MXLG8b1GYyDCRCf3C
	 88Ho0j8WN5CHg==
Received: by mail.widebizscope.pl for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2024 07:50:36 GMT
Message-ID: <20240828084500-0.1.dc.rm22.0.vs387u1d5b@widebizscope.pl>
Date: Wed, 28 Aug 2024 07:50:36 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@widebizscope.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Faktury
X-Mailer: mail.widebizscope.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_005101_475153_F5862571 
X-CRM114-Status: UNSURE (   0.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U3phbm93bmkgUGHFhHN0d28sCgpDenkgem1hZ2FqxIUgc2nEmSBQYcWEc3R3byB6IHByb2JsZW1h
bWkgcMWCeW5ub8WbY2kgZmluYW5zb3dlaiB3eW5pa2FqxIVjeW1pIHogZMWCdWdpY2ggdGVybWlu
w7N3IHDFgmF0bm/Fm2NpIG9kIGtsaWVudMOzdz8gCgpOYXN6ZSB1c8WCdWdpIGZha3RvcmluZ293
ZSBtb2fEhSBiecSHIHJvendpxIV6YW5pZW0sIGt0w7NyZWdvIHBvdHJ6ZWJ1amUgUGHFhHN0d2Eg
ZmlybWEsIGFieSBzenliY2llaiB6YW1pZW5pYcSHIHd5c3Rhd2lvbmUgZmFrdHVyeSBuYSBnb3TD
s3drxJkuCgpKZcWbbGkgemFsZcW8eSBQYcWEc3R3dSBuYSBuYXR5Y2htaWFzdG93eW0gZG9zdMSZ
cGllIGRvIMWbcm9ka8OzdyBmaW5hbnNvd3ljaCBwbyB3eXN0YXdpZW5pdSBmYWt0dXJ5LCB6YXBy
YXN6YW0gZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpTemN6ZXBhbiBBbmRyeXN6Y3p1awoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
