Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B6FCC9A5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 23:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZoFoS3EUzWyVYnI7aeZeaQ5Yd5Df8Je85cKTmnbRvD4=; b=oRbYqAjEmuetOa
	O0utH/zwSby0VOB0ZufSiRyJhkCjx4XXy9QLtPeSv+grIj8O3LzHlg8g2GJEqeK4IcJoMt9Eole+r
	4hQzHDsrNSS/jG0hxh7/na5HXx6XiBtfvvXOuBfTsAAj6Oikhp3YQupJVhOqlK61ntTv7iGpVM3qw
	nLF3LtPPzlRzFt/JbgY5TJZRcEMFqqtuex/xQ0MCBP/tPEyk6TaPtu+CUp+nQKIk73QQyPOVxjvK1
	oC9VigruuoEy3J+11EEjJbx55WiFucg1uMEWENgi9XI8jE0nTfRJdijlSvkJPwXeb3CejuGTbueUZ
	uL/41bY/WZ106darRm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkUy-00000008KLM-35QJ;
	Mon, 09 Mar 2026 23:58:56 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkUv-00000008KL0-2ml9
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 23:58:55 +0000
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-661f8ea8a2bso4245726a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2026 16:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100731; x=1773705531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oe74yVewJW4EdL4NdMuEiANgmdgDMqRgsPaxoV9IVrk=;
        b=dbnba+APdkMih/ZVkW4aOFGPM3DZedT2vKavRvPtIew8+Lh1bqwHpydArPTjrD0X0T
         wdi4AVrr9/a9x5EAkEs/Ejr7UQCotuUw5loXRx7Utx2wJRhLGrVIT8BaPhWJEvQLqmWQ
         Z5tey+UZGP/YZ8/vggHIDZTyogId+R2sET4WKI6fL0iTx6rx9/QjTmrqcL7mQAxMSRbQ
         nM94l0UMEEJebRjq6xsc4YJScSMHo7/ltrTH8Oh8uRbHAhQCdRXX+XycPOZCe+7IHW/Q
         zTGqgGxQlGMB+lAxyPDnljjMiuU8/wOVuWc/Ic7Qms9d59LEXa/3p67KTfiC8TcTReVQ
         0JYg==
X-Forwarded-Encrypted: i=1; AJvYcCVchdwmP7JiC5snb4mv/2xEsYAOgIww2OB3bXiST3oQ1bHH3RSQHDcpyZM1F0XgR7nqQCLVTQQTLqQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuiS0hif6upEYV/MtQuQCBnGZVDdpn6/bYf3n+QVh0hYb0WWSV
	9a0g1bF7m+3CCvKPS7SjBBtiYr4MJvX9vmOYVCJHG/SzU55NNj+huCxXCSi25RqT
X-Gm-Gg: ATEYQzyCk+JdItkeDQH8gugFztrv/bpXTMXTBxY45ZD0ZKlw17oa/wNNcAId4bSa6O9
	HNW1jTn1dD5dxhn3pRp7nVP/okIT6eeQsQogOiYRwh8/gIT6xHzN4hq18jRZznen7kASZVMA9ZW
	SzRrKwN4sq3Ovxf7ID5Nf7HgeyoiPqlaysebIBk+s3K6BkzuPya622F5Vca4vfze9/A+voIog2K
	5k32XOSBv4d8cXLX6RvqEJCNoCzIkYA/bhishASggOuHxqIVQi6Rsg5rrvxDJrvz7UGdqen5VKa
	va1S4LASoYnoSxBeGNXChLBujWB/3aYYrk5ZUpU1vijJlH3Qplj4eEOke2qpwG51bwZpi4BbipH
	EWirl7hd6bzkngwKA+qLDI4Y8JyJUcIIj1iAUoLzNxOJ1b+gnIrN/VCBkclkhpgHcvD2z3do+dF
	ieojaQv9rwwsPO7BAFzgGKLjOVqanUiwZg7/N5o+ZCkjEiMAr86h4QgNE=
X-Received: by 2002:a17:907:2687:b0:b94:1771:529f with SMTP id a640c23a62f3a-b942dbc7cc3mr676487866b.23.1773100731437;
        Mon, 09 Mar 2026 16:58:51 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8cc27sm418181566b.28.2026.03.09.16.58.50
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:58:51 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439c5b40f60so5124889f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2026 16:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVmrLmeApOUjFXGq0xsML/2+AOmuJY8Y6hnAuIvww1Q93gMMQx+HukMURIlXZOvMGi3GTx6bJc4kQ=@lists.infradead.org
X-Received: by 2002:adf:f4cb:0:b0:439:df33:827f with SMTP id
 ffacd0b85a97d-439df33828emr14050045f8f.10.1773100730271; Mon, 09 Mar 2026
 16:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <202603090911.0DdOwjTR-lkp@intel.com>
 <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
In-Reply-To: <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Mon, 9 Mar 2026 19:58:34 -0400
X-Gmail-Original-Message-ID: <CAJNyHp+a8FqB7Y8DobMxKOn9KAQXH0KvHTRgTjFuMppneSznvw@mail.gmail.com>
X-Gm-Features: AaiRm50FODLuR7mIvmUavdQJgpvkliqN2c7Myo_nPa5e2Uo34ON5h-NAjYa6-ys
Message-ID: <CAJNyHp+a8FqB7Y8DobMxKOn9KAQXH0KvHTRgTjFuMppneSznvw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: kernel test robot <lkp@intel.com>, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, oe-kbuild-all@lists.linux.dev, 
	Chao Shi <cshi008@fiu.edu>, Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_165853_717156_F96CADCF 
X-CRM114-Status: GOOD (  23.00  )
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
YW5kZXJAcHVyZXN0b3JhZ2UuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDksIDIwMjYgYXQg
MTo0MuKAr0FNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBTdW5nd29vLAo+ID4KPiA+IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxv
d2luZyBidWlsZCBlcnJvcnM6Cj4gPgo+ID4gW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiBheGJv
ZS9mb3ItbmV4dF0KPiA+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gZGV2aWNlLW1hcHBlci1k
bS9mb3ItbmV4dCBsaW51cy9tYXN0ZXIgdjYuMTYtcmMxIG5leHQtMjAyNjAzMDZdCj4gPiBbY2Fu
bm90IGFwcGx5IHRvIGxpbnV4LW52bWUvZm9yLW5leHRdCj4gPiBbSWYgeW91ciBwYXRjaCBpcyBh
cHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3RlLgo+ID4g
QW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMg
ZG9jdW1lbnRlZCBpbgo+ID4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0
Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0KPiA+Cj4gPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvU3VuZ3dvby1LaW0vYmxrLW1xLW52bWUt
Rml4LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1udm1lX3NldHVwX2Rlc2NyaXB0b3JfcG9v
bHMvMjAyNjAzMDktMTQzMTA3Cj4gPiBiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2F4Ym9lL2xpbnV4LmdpdCBmb3ItbmV4dAo+ID4gcGF0Y2gg
bGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDMwOTA2Mjg0MC4yOTM3ODU4
LTItaWFtJTQwc3VuZy13b28ua2ltCj4gPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0hdIGJsay1tcTog
bnZtZTogRml4IGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCBpbiBudm1lX3NldHVwX2Rlc2NyaXB0
b3JfcG9vbHMoKQo+ID4gY29uZmlnOiB4ODZfNjQtcmhlbC05LjQtcnVzdCAoaHR0cHM6Ly9kb3du
bG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYwMzA5LzIwMjYwMzA5MDkxMS4wRGRPd2pU
Ui1sa3BAaW50ZWwuY29tL2NvbmZpZykKPiA+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDIwLjEu
OCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0IDg3ZjAyMjdjYjYwMTQ3YTI2
YTFlZWI0ZmIwNmUzYjUwNWU5YzcyNjEpCj4gPiBydXN0YzogcnVzdGMgMS44OC4wICg2YjAwYmMz
ODggMjAyNS0wNi0yMykKPiA+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6IChodHRw
czovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjAzMDkvMjAyNjAzMDkwOTEx
LjBEZE93alRSLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+ID4KPiA+IElmIHlvdSBmaXggdGhl
IGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZl
cnNpb24gb2YKPiA+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZ3MKPiA+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pgo+ID4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAy
NjAzMDkwOTExLjBEZE93alRSLWxrcEBpbnRlbC5jb20vCj4gPgo+ID4gQWxsIGVycm9ycyAobmV3
IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+ID4KPiA+ID4+IGVycm9yW0UwMzA4XTogbWlzbWF0Y2hl
ZCB0eXBlcwo+ID4gICAgLS0+IHJ1c3Qva2VybmVsL2Jsb2NrL21xL29wZXJhdGlvbnMucnM6Mjc0
OjI4Cj4gPiAgICB8Cj4gPiAgICAyNzQgfCAgICAgICAgIGluaXRfcmVxdWVzdDogU29tZShTZWxm
Ojppbml0X3JlcXVlc3RfY2FsbGJhY2spLAo+ID4gICAgfCAgICAgICAgICAgICAgICAgICAgICAg
LS0tLSBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4gZXhwZWN0ZWQgZm4gcG9pbnRlciwgZm91
bmQgZm4gaXRlbQo+ID4gICAgfCAgICAgICAgICAgICAgICAgICAgICAgfAo+ID4gICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgYXJndW1lbnRzIHRvIHRoaXMgZW51bSB2YXJpYW50IGFyZSBpbmNv
cnJlY3QKPiA+ICAgIHwKPiA+ICAgID0gbm90ZTogZXhwZWN0ZWQgZm4gcG9pbnRlciBgdW5zYWZl
IGV4dGVybiAiQyIgZm4oXywgXywgXywgaTMyKSAtPiBfYAo+ID4gICAgZm91bmQgZm4gaXRlbSBg
dW5zYWZlIGV4dGVybiAiQyIgZm4oXywgXywgXywgdTMyKSAtPiBfIHtibG9jazo6bXE6Om9wZXJh
dGlvbnM6Ok9wZXJhdGlvbnNWVGFibGU6OjxUPjo6aW5pdF9yZXF1ZXN0X2NhbGxiYWNrfWAKPiA+
ICAgIGhlbHA6IHRoZSB0eXBlIGNvbnN0cnVjdGVkIGNvbnRhaW5zIGB1bnNhZmUgZXh0ZXJuICJD
IiBmbigqbXV0IGJpbmRpbmdzOjpibGtfbXFfdGFnX3NldCwgKm11dCBiaW5kaW5nczo6cmVxdWVz
dCwgdTMyLCB1MzIpIC0+IGkzMiB7YmxvY2s6Om1xOjpvcGVyYXRpb25zOjpPcGVyYXRpb25zVlRh
YmxlOjo8VD46OmluaXRfcmVxdWVzdF9jYWxsYmFja31gIGR1ZSB0byB0aGUgdHlwZSBvZiB0aGUg
YXJndW1lbnQgcGFzc2VkCj4KPiBMb29rcyBsaWtlIHRoZSB0eXBlIG9mIF9udW1hX25vZGUgaW4g
dGhlIHNpZ25hdHVyZSBvZgo+IGluaXRfcmVxdWVzdF9jYWxsYmFjaygpIG5lZWRzIHRvIGJlIHVw
ZGF0ZWQgYWNjb3JkaW5nbHkgZnJvbSBjX3VpbnQgdG8KPiBjX2ludC4KPgo+IEJlc3QsCj4gQ2Fs
ZWIKCkkgd2lsbCBjaGFuZ2UgaXQgaW4gVjIsIHRoYW5rcy4KQWxzbywgSSBtYXkgbmVlZCB0byBz
cGxpdCB0aGUgcGF0Y2hlcyBieSBkcml2ZXIgYXMgdGhlIGNjIGxpc3QgZXhwbG9kZXMuCgpTdW5n
d29vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
