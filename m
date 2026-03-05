Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D58EEEF30C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9uO3vnu46ycTZEggga/UtEFXHipCIOXt/1rz9PMzLk=; b=rgc8g3qp5/ZvwI
	GGRAowrfID3WFrfIJxjgkfCGRjptzBK9xoU62pz0FGIS2Nbl7ir2FGx62a+3eS+yhpPBxzHtBDjd5
	6brsOiS3L7SifHJ0fkHR3CVoeWNnnycBpIhJAdpexjfV+2jjwuUd51ehF7PqF6y9wi+D5EyKp4GSe
	KyNJipQX4vOvid1yuYPegzUFfceQuYih0T+Ac4aZb0YW3oSk03mjJPMlBXKAgou69xukTB5ixaG3f
	EPcmgVA+w6377r9GScQUlQVo1G3Dj82RJe1+ah7RXwLGPSK3t+L742sBggtl/wivoUsoqjdrPjEV/
	Iwsf1rYSef49FEDGGG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2xZ-000000014xX-22Id;
	Thu, 05 Mar 2026 07:17:25 +0000
Received: from birdy.pmhahn.de ([88.198.22.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2xW-000000014wz-10Uu
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 07:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1772694528; bh=B3WqYFq7PulkABx+UvDsEHqmfihF6zlRZUaKeuETJrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmTpcH4FZlSFxtbxLnni8kZjglRnFez2NRwhxpbbyaTsTD9SMsquS7S4l50wXY9lu
	 lQiFMjnVImW0PNApCR2qJpXPYou1Yh4BKwKHOf0gQqbhlQlOKqWfi9WUBHxz6ckmt0
	 OgHMo3Ju7jeZCTfr1wON5yxqHEZgytXXzz+ZGIATHtHFfKql2y5M/925w48F3WJ/Vc
	 60lICOR1b6xDXBX7rZuYeReLKh3iFM9kh4rWic8dGWFgYV2ZQs/0quHTeRoOObDt9D
	 GlhEA8kcd+Bt1d62dJrMiWyJikkYDHPH9pzVkfXsJpls60uJm6pjmcBhffRKqFNJ3z
	 JRiCAmdl/Ha0g==
Received: from birdy.pmhahn.de (p200300e2774061005730c4c2e01b5010.dip0.t-ipconnect.de [IPv6:2003:e2:7740:6100:5730:c4c2:e01b:5010])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 1EE052211078;
	Thu, 05 Mar 2026 08:08:48 +0100 (CET)
Date: Thu, 5 Mar 2026 08:08:46 +0100
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: virt_concat: use single allocation for node
Message-ID: <aakr_hzORmNpme9Y@birdy.pmhahn.de>
Mail-Followup-To: Rosen Penev <rosenp@gmail.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304221530.15018-1-rosenp@gmail.com>
 <20260304221530.15018-2-rosenp@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304221530.15018-2-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231722_738869_A477C5E0 
X-CRM114-Status: GOOD (  10.46  )
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

SGVsbG8sCgpBbSBXZWQsIE1hciAwNCwgMjAyNiBhdCAwMjoxNToyOVBNIC0wODAwIHNjaHJpZWIg
Um9zZW4gUGVuZXY6Cj4gQWxzbyBhZGQgX19jb3VudGVkX2J5IGF0dHJpYnV0ZSBmb3IgZXh0cmEg
cnVudGltZSBhbmFseXNpcy4K4oCmCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF92aXJ0
X2NvbmNhdC5jIGIvZHJpdmVycy9tdGQvbXRkX3ZpcnRfY29uY2F0LmMKPiBpbmRleCBhZWE4OGQx
YzliYzUuLjg5ZTIyM2VkYWM2YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRfdmlydF9j
b25jYXQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZF92aXJ0X2NvbmNhdC5jCj4gQEAgLTMxLDgg
KzMxLDggQEAgc3RhdGljIExJU1RfSEVBRChjb25jYXRfbm9kZV9saXN0KTsKPiAgc3RydWN0IG10
ZF92aXJ0X2NvbmNhdF9ub2RlIHsKPiAgCXN0cnVjdCBsaXN0X2hlYWQgaGVhZDsKPiAgCXVuc2ln
bmVkIGludCBjb3VudDsKPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqKm5vZGVzOwo+ICAJc3RydWN0
IG10ZF9jb25jYXQgKmNvbmNhdDsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZXNbXSBfX2Nv
dW50ZWRfYnkobm9kZXMpOwoKTG9va3Mgd3JvbmcuIFlvdXIgZm9sbG93LXVwIHBhdGNoIGRvZXMg
dGhhdDoKLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGVzW10gX19jb3VudGVkX2J5KG5v
ZGVzKTsKKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGVzW10gX19jb3VudGVkX2J5KGNv
dW50KTsKClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
