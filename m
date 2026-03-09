Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE42EFCC9A4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 00:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/a68abbcgz6qPhh538tOIYNYOLAff3Xj/M+0b8zMico=; b=F/K5L28Z2POlkJ
	eAKstwEVInoF3xQN3Nz/ZKUJND9fN12kk+9QGIuvX9JHobnPmJuoTY/P32TtCQY1WhLQHXMP07Bt1
	dRXCQxKSuv9Yhlx2wqoj/m7gWZd1ZNJp8Zg+GVL02PHI+U9Ws/etNBlsQCX1E59LlOU0xDGikdA0f
	VmWFwmDR7pSDirQLFn9jrrIpCROwX+8jUmjzkNmJXrQzJpCGhUez2oAoo8+HI9/IQSjIIDhkMoC/X
	N5nengEMbkd848jgYu+3K0QfVATv57CupE+VQ1SeDgbAulT/fZznSdD1q6fBCY9fOm8kYkAZ6wlHT
	uAOQ83uXQObdbnbuP7Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkZ2-00000008MQK-37fD;
	Tue, 10 Mar 2026 00:03:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkZ0-00000008MPl-3eBj
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wUJ62UzriDRExITrg9iBzNvEWYzDINBTrPfASD/nLws=; b=TzE/+aRKVh3tIL4Omb6aO4lBKR
	XhCqqmL7aQXQiV9z2VnTGuU8NLKPALsBdrZ8nVhnsV+YonUOGclb4/KWfmgjASiGPoeSD5J6ILp9W
	8LjYpibKDihgNlajBZsgyouzMdTrlj/2w6BOSrUdDSHvuqI9IOkx5DqyDCda5oR4yM4U9goQq1rQ1
	YiClrwc+UDjf0wU1XlAGCZV3OG7x4A8X3QJRCup9guECfTFdW7GVnT/FZnGGID+UX85KWtReIi8T+
	k4ltutfSEkOXL5nu/eTi7dH0WGmOFxiuvKI8TdHahpr6l+1C2tbOn0SpScw9alUJRsu5hsLtzR7/B
	OoHOD1xQ==;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkYr-0000000DN9D-2E5v
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 00:03:05 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b955351e0a6so359440766b.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2026 17:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100976; x=1773705776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUJ62UzriDRExITrg9iBzNvEWYzDINBTrPfASD/nLws=;
        b=rv3yu8VQoza/yxtCFvx0fl+RcfSuH3vQTAPFHUZjnsnax+UbIAhNddLexYnldYlnFh
         Z+2FbAdGkENehXEW2f5FkQgY57yeFtduyKTwQ1RvnAOPnZSA+/eU7rdI4HJcZfAaqdgr
         jtqW5m/nWpAqXC2shSFdSvstjcNEZO8RBK0NwEhHTGdp0zvT+FVoUX4KHX+QePNhgHsE
         6aOXx1Fx9llRNr2Mlu1g9F6cVJFfJGDkndA+/ozfpX3PejENU6ljNG2EtKvMyS1R+gzM
         w0wRF9S5LVUHB+a/IfTXvGbR41EK0vfHaiFLHEbU3gh6m6TGoQnYjJ4VhqH7oGsnm87y
         cXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF51FwkGaUesYYnEe3t2igpX5n1643QzPgVz8A78TAtYAaRb1vJu3eDM0Mx+9rZgj87DxI2c5MY1Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8lLqq6hWHAV8svNT3+JCqApciaekxVC9Z5jWBmQVPYgW5DMA5
	jhCHRW+KaxbFQ+REXfMhvy2qX9bmwwQXYj6GBhqrUPUazUkROhk437K0aNnJhe0Y8YCtvAoZ
X-Gm-Gg: ATEYQzxwBpmd4Qy8zfvUOXJAKmT2gJECQJvyicBhFFCLWrNZdyiI+czjzdH6RJXBRLX
	6flmwogsg3IgmHZJ9N61S8N4aBnkVH0PUmDz1CPX+4FtW/erMe8pthHnUsW54X5ci5m316KGnje
	vq0xKNs1pGyv8wpNW5XeZj9+Us7YnP1thhC96YAlei8VI4pErPLxN1+ipp4WB2yfeolMTzyPQ1p
	b2qM8O5wfLM3/mhtyDeIg5jIV2HSPGutDiU50nVr8Euazb4npmOhBGsA5N70Q0N6bY294I648QI
	zQuB0QwiE+46lQXTFGyx23+w3g0H7ZersdIEQ00wfXIJbf2WwTLQBJkLIE4cRYTqZnA72ltzMVh
	AodA2pIxqQVbgX5vL/TGopvdTWZi09dOzVHKuXUtHBROhStuR+NsHbaku4fOv6lT3aamXeCGL0U
	+o5HKziaGkS632FyaBFA9UYSK6VPUQYazFq5l7L4fONPm4mxmyo1sN572z7IMFPHATNw==
X-Received: by 2002:a17:906:f5a5:b0:b94:1d92:7ec with SMTP id a640c23a62f3a-b942df7852amr697492066b.38.1773100976190;
        Mon, 09 Mar 2026 17:02:56 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef48348sm435755366b.12.2026.03.09.17.02.55
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:02:55 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b955351e0a6so359438866b.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2026 17:02:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHzCxAGcpPMf0DFM66zn+5T7bMcy72IfJrpKkNPfmg42KLmfAgsoh8jzDiJIG0PZoupvb6coB4Jmc=@lists.infradead.org
X-Received: by 2002:a05:6000:144b:b0:439:ac33:5082 with SMTP id
 ffacd0b85a97d-439da66b72cmr23928350f8f.26.1773100503051; Mon, 09 Mar 2026
 16:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
In-Reply-To: <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Mon, 9 Mar 2026 19:54:47 -0400
X-Gmail-Original-Message-ID: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
X-Gm-Features: AaiRm53vE5uEinTHUYE1aa6bIvdkwyOpz0dn9fOlsjLR4PN8Z_3w05vllGJ47mw
Message-ID: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000300_087385_25FC7F91 
X-CRM114-Status: GOOD (  18.68  )
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

T24gTW9uLCBNYXIgOSwgMjAyNiBhdCAxMTozMeKAr0FNIENhbGViIFNhbmRlciBNYXRlb3MKPGNz
YW5kZXJAcHVyZXN0b3JhZ2UuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTWFyIDgsIDIwMjYgYXQg
MTE6MzDigK9QTSBTdW5nd29vIEtpbSA8aWFtQHN1bmctd29vLmtpbT4gd3JvdGU6Cj4gPgo+ID4g
VGhlIG51bWFfbm9kZSBjYW4gYmUgPCAwIHNpbmNlIE5VTUFfTk9fTk9ERSA9IC0xLiBIb3dldmVy
LAo+ID4gc3RydWN0IGJsa19tcV9od19jdHh7fSBkZWZpbmVzIG51bWFfbm9kZSBhcyB1bnNpZ25l
ZCBpbnQuIEFzIGEgcmVzdWx0LAo+ID4gbnVtYV9ub2RlIGlzIHNldCB0byBVSU5UX01BWCBmb3Ig
TlVNQV9OT19OT0RFIGluIGJsa19tcV9hbGxvY19oY3R4KCkuCj4KPiBUaGUgbm9kZSBhcmd1bWVu
dCB0byBibGtfbXFfYWxsb2NfaGN0eCgpIGNvbWVzIGZyb20KPiBibGtfbXFfYWxsb2NfYW5kX2lu
aXRfaGN0eCgpLCB3aGljaCBpcyBjYWxsZWQgYnkKPiBibGtfbXFfYWxsb2NfYW5kX2luaXRfaGN0
eCgpIHdpdGggaW50IG5vZGUgPSBibGtfbXFfZ2V0X2hjdHhfbm9kZShzZXQsCj4gaSkuIG5vZGUg
PSBOVU1BX05PX05PREUgd291bGQgc3VnZ2VzdCB0aGF0IGJsa19tcV9od19xdWV1ZV90b19ub2Rl
KCkKPiBkb2Vzbid0IGZpbmQgYW55IENQVSBhZmZpbml0aXplZCB0byB0aGUgcXVldWUuIElzIHRo
YXQgZXZlbiBwb3NzaWJsZT8KClRoYW5rcyBmb3IgeW91ciByZXZpZXcsIENlbGViLgoKYmxrX21x
X2h3X3F1ZXVlX3RvX25vZGUoKSBjYW4gcmV0dXJuIE5VTUFfTk9fTk9ERSBpZiB0aGUgZGV2aWNl
IHF1ZXVlcwpleGNlZWQgdGhlCm51bWJlciBvZiBDUFVzLiBBZnRlcndhcmQsIGl0IGlzIGFkanVz
dGVkIG9uIHRoZSBjYWxsZXIgc2lkZSB0bwpudW1hX25vZGUgPSBzZXQtPm51bWFfbm9kZS4KCnNl
dC0+bnVtYV9ub2RlIGNhbiBzdGlsbCBiZSBOVU1BX05PX05PREUgaWYgQ09ORklHX05VTUE9biAo
dHJpdmlhbCkgb3IKcGNpYnVzX3RvX25vZGUoKSByZXR1cm5zIE5VTUFfTk9fTk9ERSBpZiBBQ1BJ
IGRvZXNuJ3QgcHJvdmlkZQpwcm94aW1pdHkgaW5mb3JtYXRpb24uCkJ1dCBJJ20gbm90IHN1cmUg
aWYgdGhpcyBpcyB1c3VhbCBpbiB0aGUgcmVhbCBtYWNoaW5lcy4gV2UgZm91bmQgdGhlCmNyYXNo
IGluIFFFTVUuCgo+ID4gIHN0YXRpYyBzdHJ1Y3QgbnZtZV9kZXNjcmlwdG9yX3Bvb2xzICoKPiA+
IC1udm1lX3NldHVwX2Rlc2NyaXB0b3JfcG9vbHMoc3RydWN0IG52bWVfZGV2ICpkZXYsIHVuc2ln
bmVkIG51bWFfbm9kZSkKPiA+ICtudm1lX3NldHVwX2Rlc2NyaXB0b3JfcG9vbHMoc3RydWN0IG52
bWVfZGV2ICpkZXYsIGludCBudW1hX25vZGUpCj4gPiAgewo+ID4gLSAgICAgICBzdHJ1Y3QgbnZt
ZV9kZXNjcmlwdG9yX3Bvb2xzICpwb29scyA9ICZkZXYtPmRlc2NyaXB0b3JfcG9vbHNbbnVtYV9u
b2RlXTsKPiA+ICsgICAgICAgc3RydWN0IG52bWVfZGVzY3JpcHRvcl9wb29scyAqcG9vbHM7Cj4g
PiAgICAgICAgIHNpemVfdCBzbWFsbF9hbGlnbiA9IE5WTUVfU01BTExfUE9PTF9TSVpFOwo+ID4K
PiA+ICsgICAgICAgaWYgKG51bWFfbm9kZSA9PSBOVU1BX05PX05PREUpCj4gPiArICAgICAgICAg
ICAgICAgcG9vbHMgPSAmZGV2LT5kZXNjcmlwdG9yX3Bvb2xzW251bWFfbm9kZV9pZCgpXTsKPiA+
ICsgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIHBvb2xzID0gJmRldi0+ZGVzY3JpcHRv
cl9wb29sc1tudW1hX25vZGVdOwo+Cj4gU2ltcGxlcjogaWYgKG51bWFfbm9kZSA9PSBOVU1BX05P
X05PREUpIG51bWFfbm9kZSA9IG51bWFfbm9kZV9pZCgpOwo+CgpUaGFua3MsIEkgd2lsbCBtb2Rp
ZnkgaXQgaW4gVjIuCgpTdW5nd29vLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
