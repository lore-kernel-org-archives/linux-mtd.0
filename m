Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE4C3DA6E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=30ZHGfK/I6QguEAGOHAziFVgvT8PGaAFxvaJlxbUSzg=; b=oNiw11VOObxJvqlZOXDuN7J8Gg
	5a/qH2vDL8VEoPGHT5rpgJOKUhzzeKDNTIeOfz71ZIzRmAErhV4rLXXpFgCEB+rQpMNstFP6ym1hO
	IE0vd8h6pFTdzbZnuRL3sI4rqK5bZnGa0pCFj2k30E/vLPvOXZzxBFyjVeiPUf5TLu7h2ZXikhKc0
	bxPFq0Pv4Yiu9cOltgGzzpQJpBDuN+Ud9goJ2qWKqjgXRIGkPOeaCTvcnskTth8yjdfotmwUku686
	mOvSCNe0sf7QHbWSoHHVN6MVOzNIo4TJ7t1FjUA7VDFLenxvs7fOtnum/Z1GG0eGavwOLxKBVmXA1
	/y36FMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIoHI-00Gdnt-1g;
	Thu, 28 Dec 2023 11:10:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIoHF-00GdnF-31;
	Thu, 28 Dec 2023 11:10:15 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 991F66343B3D;
	Thu, 28 Dec 2023 12:10:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ha9HAdblf5Fu; Thu, 28 Dec 2023 12:10:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0F9C76343B4E;
	Thu, 28 Dec 2023 12:10:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jBjqUGApe4hb; Thu, 28 Dec 2023 12:10:11 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id CF83F6343B3D;
	Thu, 28 Dec 2023 12:10:11 +0100 (CET)
Date: Thu, 28 Dec 2023 12:10:11 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>, 
	senozhatsky <senozhatsky@chromium.org>, Coly Li <colyli@suse.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-um <linux-um@lists.infradead.org>, 
	linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linux-bcache <linux-bcache@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1544995699.172154.1703761811676.JavaMail.zimbra@nod.at>
In-Reply-To: <20231228075545.362768-5-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de> <20231228075545.362768-5-hch@lst.de>
Subject: Re: [PATCH 4/9] ubd: use the default discard granularity
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: use the default discard granularity
Thread-Index: kk75ae1xWs0+YtjBcgdOSaDYaxww3w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_031014_127356_829E10A0 
X-CRM114-Status: GOOD (  10.27  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gQW46ICJKZW5zIEF4Ym9lIiA8YXhib2VAa2VybmVsLmRrPgo+IENDOiAicmljaGFyZCIgPHJp
Y2hhcmRAbm9kLmF0PiwgImFudG9uIGl2YW5vdiIgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5
cy5jb20+LCAiSm9zZWYgQmFjaWsiIDxqb3NlZkB0b3hpY3BhbmRhLmNvbT4sCj4gIk1pbmNoYW4g
S2ltIiA8bWluY2hhbkBrZXJuZWwub3JnPiwgInNlbm96aGF0c2t5IiA8c2Vub3poYXRza3lAY2hy
b21pdW0ub3JnPiwgIkNvbHkgTGkiIDxjb2x5bGlAc3VzZS5kZT4sICJNaXF1ZWwKPiBSYXluYWwi
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEiIDx2aWdu
ZXNockB0aS5jb20+LCAibGludXgtdW0iCj4gPGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmc+
LCAibGludXgtYmxvY2siIDxsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmc+LCBuYmRAb3RoZXIu
ZGViaWFuLm9yZywgImxpbnV4LWJjYWNoZSIKPiA8bGludXgtYmNhY2hlQHZnZXIua2VybmVsLm9y
Zz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBHZXNlbmRl
dDogRG9ubmVyc3RhZywgMjguIERlemVtYmVyIDIwMjMgMDg6NTU6NDAKPiBCZXRyZWZmOiBbUEFU
Q0ggNC85XSB1YmQ6IHVzZSB0aGUgZGVmYXVsdCBkaXNjYXJkIGdyYW51bGFyaXR5Cgo+IFRoZSBk
aXNjYXJkIGdyYW51bGFyaXR5IG5vdyBkZWZhdWx0cyB0byBhIHNpbmdsZSBzZWN0b3IsIHNvIGRv
bid0IHNldAo+IHRoYXQgdmFsdWUgZXhwbGljaXRseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiBhcmNoL3VtL2RyaXZlcnMvdWJkX2tl
cm4uYyB8IDEgLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvdW0vZHJpdmVycy91YmRfa2Vybi5jIGIvYXJjaC91bS9kcml2ZXJzL3ViZF9rZXJu
LmMKPiBpbmRleCA1MDIwNmZlYWM1NzdkNS4uOTJlZTI2OTdmZjM5ODQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC91bS9kcml2ZXJzL3ViZF9rZXJuLmMKPiArKysgYi9hcmNoL3VtL2RyaXZlcnMvdWJkX2tl
cm4uYwo+IEBAIC03OTgsNyArNzk4LDYgQEAgc3RhdGljIGludCB1YmRfb3Blbl9kZXYoc3RydWN0
IHViZCAqdWJkX2RldikKPiAJCXViZF9kZXYtPmNvdy5mZCA9IGVycjsKPiAJfQo+IAlpZiAodWJk
X2Rldi0+bm9fdHJpbSA9PSAwKSB7Cj4gLQkJdWJkX2Rldi0+cXVldWUtPmxpbWl0cy5kaXNjYXJk
X2dyYW51bGFyaXR5ID0gU0VDVE9SX1NJWkU7Cj4gCQlibGtfcXVldWVfbWF4X2Rpc2NhcmRfc2Vj
dG9ycyh1YmRfZGV2LT5xdWV1ZSwgVUJEX01BWF9SRVFVRVNUKTsKPiAJCWJsa19xdWV1ZV9tYXhf
d3JpdGVfemVyb2VzX3NlY3RvcnModWJkX2Rldi0+cXVldWUsIFVCRF9NQVhfUkVRVUVTVCk7Cj4g
CX0KCkFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtz
LAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
