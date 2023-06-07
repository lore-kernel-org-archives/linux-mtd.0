Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E7C7EE2F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCQmFqEpHclo0wrIg7SO9CasC8po578oeqy7ZKzZX/Q=; b=wb7uTDOk1GAa78
	7VzEd/CrQKQvuuuz6YnbP6MGKeNoflQGjYeZ9HFBTI2IXBrIYXVohUTkZiypuzcso1NprPJYK3bBs
	Lzjn6ilfBirzk2WgCpIJAvbpYvLxU0oSW1womVe+JAvhyZKmY0LlGmZ+nuwJq6tfvC+q/E1SAV2uO
	gox1mR9z6Xw2PG57KvWhhozVHIImuyHciWX2x1B3sJGsVhjQ1LL2CL7y5sFDOtLP5p7aul3MBEmqC
	g6UQQILN0jFp+FnNuPUJ88w4c/7roCnIhq19xFfl8uGB8cGG00qR/VyP7+5H3d9duA8hbcv8LZjM0
	uCKIDsBF/WwlbO5TD88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pcr-005HYD-22;
	Wed, 07 Jun 2023 09:38:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pcp-005HVW-0o
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 09:38:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977cf86aae5so578819166b.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1686130719; x=1688722719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjKWGYzTLmxl6ndmaqY1vhf0MYCxKeiBaM5D6TZOn9k=;
        b=YXuPeKYHXY8x573VqT+WBt2/3c0ykgaHJuCFCznCBd9Wetpo4vgup6yqqURCu0byaA
         Z/WQU4wI1a6QCL47tLiZRI6KTt32VZU/qDKhKKJKLQFyY7AmMCGDwrGB1pizVTFQERU7
         t/x6PD6wstNl8G+Np+qAroVsRlq5DhK6VHOceLAS64dGk9Gj3fcvwZo0Y8lemLlMRb9N
         lmkimh7iJEnOSo+NJeMchGTnQhFoj8noYEGMLBj46T+S0Fm4jsdixCjB8sRTniHot4zo
         HY10z3v3++4U48Fj0kZDnrEgImtyRX0sgkHyTWWoWMiMmGGRFIMZm1Lm0qh585DtYYsI
         wCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130719; x=1688722719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjKWGYzTLmxl6ndmaqY1vhf0MYCxKeiBaM5D6TZOn9k=;
        b=NaI9kfdoxM4dATjgNpAQMldowB7NLHe8dy0nFDvo2zuHkzE0YrMcDhgUzLH2YlpDCq
         4+atT0khxL/FtwljBBf0ZMbDwKQK0mccoaylyj7CjC1Vj/jEg7mdZPs48q52ESajh4zJ
         5XAvSiZgmR49Wal1m/sv23TjgKoqkcXJ2Wi4ZDE2sA9w25Fi2FAVS74VsdCO4JVeck5y
         KN37k5aD3BCB8xIA+Og4yYGwrsPrbdo4OpQvk8lKL7fMgAg+H6uacVY9jVE83O6a++rx
         R/jUKj7PbbZTOH1LNjdgMjrDIXzy6Lyk4Z6OfU2r10i0e46d/LN2IrU4U2MH/qqZLrg9
         RMNg==
X-Gm-Message-State: AC+VfDzKMR/oLmc2b/vaXMTsn2G/oHNJkt0yWfOnaIo0kMhGd3WmgsvI
	6wRzy0CMim/GG/UF+ls51qEwkxEyOnfNEBttdgaCJA==
X-Google-Smtp-Source: ACHHUZ4JO4oLBtR+CLz1tcyt1M0aK5Az38dx3TKZ26TI2779MlmTOIaNGaUTpmyncHvDOVtnmf3szZ6EUx+OtsgHRJ4=
X-Received: by 2002:a17:907:3f22:b0:96b:1608:3563 with SMTP id
 hq34-20020a1709073f2200b0096b16083563mr5475281ejc.58.1686130718689; Wed, 07
 Jun 2023 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de> <20230606073950.225178-15-hch@lst.de>
In-Reply-To: <20230606073950.225178-15-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 7 Jun 2023 11:38:27 +0200
Message-ID: <CAMGffEk8Zex5+u69YW9AXGQh-ch79mw7=Gn3L1M=qwvZCVa5VA@mail.gmail.com>
Subject: Re: [PATCH 14/31] rnbd-srv: don't pass a holder for non-exclusive blkdev_get_by_path
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Phillip Potter <phil@philpotter.co.uk>, Coly Li <colyli@suse.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com, 
	linux-block@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-scsi@vger.kernel.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_023843_293638_A429BD80 
X-CRM114-Status: GOOD (  16.26  )
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

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjQw4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gUGFzc2luZyBhIGhvbGRlciB0byBibGtkZXZfZ2V0X2J5X3BhdGgg
d2hlbiBGTU9ERV9FWENMIGlzbid0IHNldCBkb2Vzbid0Cj4gbWFrZSBzZW5zZSwgc28gcGFzcyBO
VUxMIGluc3RlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KQWNrZWQtYnk6IEphY2sgV2FuZyA8amlucHUud2FuZ0Bpb25vcy5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Js
b2NrL3JuYmQvcm5iZC1zcnYuYyBiL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5jCj4gaW5k
ZXggY2VjMjJiYmFlMmY5YTUuLmNlNTA1ZTU1MmY0ZDUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
YmxvY2svcm5iZC9ybmJkLXNydi5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtc3J2
LmMKPiBAQCAtNzE5LDcgKzcxOSw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc19tc2dfb3BlbihzdHJ1
Y3Qgcm5iZF9zcnZfc2Vzc2lvbiAqc3J2X3Nlc3MsCj4gICAgICAgICAgICAgICAgIGdvdG8gcmVq
ZWN0Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBiZGV2ID0gYmxrZGV2X2dldF9ieV9wYXRoKGZ1
bGxfcGF0aCwgb3Blbl9mbGFncywgVEhJU19NT0RVTEUsIE5VTEwpOwo+ICsgICAgICAgYmRldiA9
IGJsa2Rldl9nZXRfYnlfcGF0aChmdWxsX3BhdGgsIG9wZW5fZmxhZ3MsIE5VTEwsIE5VTEwpOwo+
ICAgICAgICAgaWYgKElTX0VSUihiZGV2KSkgewo+ICAgICAgICAgICAgICAgICByZXQgPSBQVFJf
RVJSKGJkZXYpOwo+ICAgICAgICAgICAgICAgICBwcl9lcnIoIk9wZW5pbmcgZGV2aWNlICclcycg
b24gc2Vzc2lvbiAlcyBmYWlsZWQsIGZhaWxlZCB0byBvcGVuIHRoZSBibG9jayBkZXZpY2UsIGVy
cjogJWRcbiIsCj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
