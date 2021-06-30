Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FB4C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 09:22:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3186E61D0F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 09:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3186E61D0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAazCyQ49ybTgAKh3XgcPkmi5IesouHAPkfKPJhVmhk=; b=CTEY5aKtkM8BNE7wQdT7OUj8zG
	VgdELYE53Z5461CXSUhiB3z6m1O7NGRBD2RHNTavPWzyGN5Hi5B/dTJqvDteDFxFsqc7jRo2o/2+f
	GB8UMcqW2sOTIn4gg6Wpw2+Z9eC40ieCZBTsIQ2AZSku+4cZoF+0f4e1MirBoHAusiG9M1uJX1y0J
	zqg4UxOAJFYM5RZaM2d+DmveMejlNrWC/WWFkE7G71e4nspFuUKvQMiSmPgCTVyLSiocvoLa4/S5n
	/C49+KeCEg8sNPt0GEXWsgvQckXtdlrTYjZappxPmWdk6w5yL0r4GtwpIOSDjDwLXZhR+Ae9QAyrn
	bkgsar3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyWPU-00DSxF-Or; Wed, 30 Jun 2021 09:21:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyWPS-00DSwZ-4N
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 09:21:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id b12so731778pfv.6
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2021 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ss+braA99PMlefO6rn0rJTWwO6dSTN7YOlvZhUkt/NI=;
 b=Azd3pboa8NSOfcWpp1zQo5TVVrsWk+aOGO/yRc1OD1FC5mdVinM1ZCZgEHsGG+qWVv
 fQHlkqS257cFTe0Iag27H104iLT5OIp44TBYB51VUHAojcfh2tn60mOilVOrlQ2KC1OV
 JFwuWsOYI9/lcSKXgvEaIoGmk21mWDgXxPGwqz8s4US8zzvVRFgjHpMAuQPGOj7vOdEl
 GUAk5EzaiC6VtRprnNzKE8/cDkMvSw9UNplqLPxd1EadjrNialYxFtKuvTi0A8xYLvn0
 GKLirL2zo4/BlgLzie+3KAPKjUMC6in6PuZ3xLgrTo9uXg/jnamlL8QDe275WbG+4Pzr
 FA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ss+braA99PMlefO6rn0rJTWwO6dSTN7YOlvZhUkt/NI=;
 b=hoPEEQJZS3162C7Vg8DQyc0gYtAMIV07iwuTLR++g9xoY2iXqf15eSBiq+HvR2/rWQ
 JqAo3A1IvAUf2whx7CroOWNmWC5LI8ZcdgY4J/QbISQE/Z2ElMSdpVwVT/448IhCp/Yd
 RGpPGiDRcKAf3IjJr7NbBN9Q4Y6SXfuhWv9KpWjpC60aEd2RWmfN1GM2CAujE2WrZUnq
 PYQA+7yxJV5x3DuaQ6OnSGPo9RIXrAoeiJL4mhRnOB8EvfW0u4+AKMfMXAaz3qS3vYy9
 CQaAq4kDc03zX7/aQYRqrJsZMiV78kJ+PF+D/NN5FSMnxkUS5UWOtPMPJy2ShVjnwgdi
 4rPw==
X-Gm-Message-State: AOAM531AG9iGrIw7zdShNTKukEp4UFRV7sF2Owt3UP0zMLuHL6sUo/fM
 opEX+OGAJGR2/jWhiQZXOaM=
X-Google-Smtp-Source: ABdhPJzQKipMf04Vme5US7L4gH173r21LIVHZ0nJ0BzgMVVVwUkkXpSE1R4lND3iNpXHEu8kBKiWaA==
X-Received: by 2002:a63:d305:: with SMTP id b5mr33758691pgg.67.1625044888154; 
 Wed, 30 Jun 2021 02:21:28 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id z3sm21629542pgl.77.2021.06.30.02.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 02:21:27 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 Christoph Hellwig <hch@lst.de>
References: <20210617160904.570111-1-desmondcheongzx@gmail.com>
 <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
 <20210630104353.7575e920@xps13>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <99b6573c-8c6d-8bcc-af8d-ce63cdfb74e4@gmail.com>
Date: Wed, 30 Jun 2021 17:21:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630104353.7575e920@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_022130_234601_07FA6D3F 
X-CRM114-Status: GOOD (  20.83  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMzAvNi8yMSA0OjQzIHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhlbGxvLAo+IAo+IERl
c21vbmQgQ2hlb25nIFpoaSBYaSA8ZGVzbW9uZGNoZW9uZ3p4QGdtYWlsLmNvbT4gd3JvdGUgb24g
V2VkLCAzMCBKdW4KPiAyMDIxIDE2OjA0OjE3ICswODAwOgo+IAo+PiBPbiAxOC82LzIxIDEyOjA5
IGFtLCBEZXNtb25kIENoZW9uZyBaaGkgWGkgd3JvdGU6Cj4+PiBTeXpib3QgcmVwb3J0ZWQgYSBj
aXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3k6Cj4+PiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS9idWc/aWQ9N2JkMTA2YzI4ZTg0NmQxMDIzZDRjYTkxNTcxOGIxYTA5MDU0NDRjYgo+Pj4K
Pj4+IFRoaXMgaGFwcGVucyBiZWNhdXNlIG9mIHRoZSBmb2xsb3dpbmcgbG9jayBkZXBlbmRlbmNp
ZXM6Cj4+Pgo+Pj4gMS4gbG9vcF9jdGxfbXV0ZXggLT4gYmRldi0+YmRfbXV0ZXggKHdoZW4gbG9v
cF9jb250cm9sX2lvY3RsIGNhbGxzCj4+PiBsb29wX3JlbW92ZSwgd2hpY2ggdGhlbiBjYWxscyBk
ZWxfZ2VuZGlzazsgdGhpcyBhbHNvIGhhcHBlbnMgaW4KPj4+IGxvb3BfZXhpdCB3aGljaCBldmVu
dHVhbGx5IGNhbGxzIGxvb3BfcmVtb3ZlKQo+Pj4KPj4+IDIuIGJkZXYtPmJkX211dGV4IC0+IG10
ZF90YWJsZV9tdXRleCAod2hlbiBibGtkZXZfZ2V0X2J5X2RldiBjYWxscwo+Pj4gX19ibGtkZXZf
Z2V0LCB3aGljaCB0aGVuIGNhbGxzIGJsa3RyYW5zX29wZW4pCj4+Pgo+Pj4gMy4gbXRkX3RhYmxl
X211dGV4IC0+IG1ham9yX25hbWVzX2xvY2sgKHdoZW4gcmVnaXN0ZXJfbXRkX2Jsa3RyYW5zCj4+
PiBjYWxscyBfX3JlZ2lzdGVyX2Jsa2RldikKPj4+Cj4+PiA0LiBtYWpvcl9uYW1lc19sb2NrIC0+
IGxvb3BfY3RsX211dGV4ICh3aGVuIGJsa19yZXF1ZXN0X21vZHVsZSBjYWxscwo+Pj4gbG9vcF9w
cm9iZSkKPj4+Cj4+PiBIZW5jZSB0aGVyZSdzIGFuIG92ZXJhbGwgZGVwZW5kZW5jeSBvZjoKPj4+
Cj4+PiBsb29wX2N0bF9tdXRleCAgIC0tLS0tLS0tLS0+IGJkZXYtPmJkX211dGV4Cj4+PiAgICAg
ICAgIF4gICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+Pj4gICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwKPj4+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2Cj4+PiBtYWpvcl9uYW1lc19sb2NrIDwtLS0tLS0tLS0gIG10ZF90YWJsZV9tdXRleAo+
Pj4KPj4+IFdlIGNhbiBicmVhayB0aGlzIGNpcmN1bGFyIGRlcGVuZGVuY3kgYnkgaG9sZGluZyBt
dGRfdGFibGVfbXV0ZXggb25seQo+Pj4gZm9yIHRoZSByZXF1aXJlZCBjcml0aWNhbCBzZWN0aW9u
IGluIHJlZ2lzdGVyX210ZF9ibGt0cmFucy4gVGhpcwo+Pj4gYXZvaWRzIHRoZSBtdGRfdGFibGVf
bXV0ZXggLT4gbWFqb3JfbmFtZXNfbG9jayBkZXBlbmRlbmN5Lgo+Pj4KPj4+IFJlcG9ydGVkLWFu
ZC10ZXN0ZWQtYnk6IHN5emJvdCs2YThhMGQ5M2M5MWU4ZmJmMmU4MEBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tCj4+PiBDby1kZXZlbG9wZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBEZXNtb25kIENoZW9uZyBaaGkgWGkgPGRlc21vbmRjaGVvbmd6eEBn
bWFpbC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBDaGFuZ2VzIGluIHYxIC0+IHYyOgo+Pj4KPj4+IEJy
ZWFrIHRoZSBjaXJjdWxhciBkZXBlbmRlbmN5IGluIHJlZ2lzdGVyX210ZF9ibGt0cmFucyBpbnN0
ZWFkIG9mIGJsa19yZXF1ZXN0X21vZHVsZSwgYXMgc3VnZ2VzdGVkIGJ5IENocmlzdG9waCBIZWxs
d2lnLgo+Pj4KPj4+ICAgIGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgfCA4ICsrLS0tLS0tCj4+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIGIvZHJpdmVycy9tdGQv
bXRkX2Jsa2RldnMuYwo+Pj4gaW5kZXggZmI4ZTEyZDU5MGExLi43ZDI2Y2ZlMjRkMDUgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4+PiArKysgYi9kcml2ZXJzL210
ZC9tdGRfYmxrZGV2cy5jCj4+PiBAQCAtNTI4LDE0ICs1MjgsMTAgQEAgaW50IHJlZ2lzdGVyX210
ZF9ibGt0cmFucyhzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29wcyAqdHIpCj4+PiAgICAJaWYgKCFibGt0
cmFuc19ub3RpZmllci5saXN0Lm5leHQpCj4+PiAgICAJCXJlZ2lzdGVyX210ZF91c2VyKCZibGt0
cmFuc19ub3RpZmllcik7Cj4+PiAgICA+IC0KPj4+IC0JbXV0ZXhfbG9jaygmbXRkX3RhYmxlX211
dGV4KTsKPj4+IC0KPj4+ICAgIAlyZXQgPSByZWdpc3Rlcl9ibGtkZXYodHItPm1ham9yLCB0ci0+
bmFtZSk7Cj4+PiAgICAJaWYgKHJldCA8IDApIHsKPj4+ICAgIAkJcHJpbnRrKEtFUk5fV0FSTklO
RyAiVW5hYmxlIHRvIHJlZ2lzdGVyICVzIGJsb2NrIGRldmljZSBvbiBtYWpvciAlZDogJWRcbiIs
Cj4+PiAgICAJCSAgICAgICB0ci0+bmFtZSwgdHItPm1ham9yLCByZXQpOwo+Pj4gLQkJbXV0ZXhf
dW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+Pj4gICAgCQlyZXR1cm4gcmV0Owo+Pj4gICAgCX0K
Pj4+ICAgID4gQEAgLTU0NSwxMiArNTQxLDEyIEBAIGludCByZWdpc3Rlcl9tdGRfYmxrdHJhbnMo
c3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyKQo+Pj4gICAgCXRyLT5ibGtzaGlmdCA9IGZmcyh0
ci0+Ymxrc2l6ZSkgLSAxOwo+Pj4gICAgPiAgIAlJTklUX0xJU1RfSEVBRCgmdHItPmRldnMpOwo+
Pj4gLQlsaXN0X2FkZCgmdHItPmxpc3QsICZibGt0cmFuc19tYWpvcnMpOwo+Pj4gICAgPiArCW11
dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4+PiArCWxpc3RfYWRkKCZ0ci0+bGlzdCwgJmJs
a3RyYW5zX21ham9ycyk7Cj4+PiAgICAJbXRkX2Zvcl9lYWNoX2RldmljZShtdGQpCj4+PiAgICAJ
CWlmIChtdGQtPnR5cGUgIT0gTVREX0FCU0VOVCkKPj4+ICAgIAkJCXRyLT5hZGRfbXRkKHRyLCBt
dGQpOwo+Pj4gLQo+Pj4gICAgCW11dGV4X3VubG9jaygmbXRkX3RhYmxlX211dGV4KTsKPj4+ICAg
IAlyZXR1cm4gMDsKPj4+ICAgIH0KPj4+Cj4+Cj4+IEhpIG1haW50YWluZXJzLAo+Pgo+PiBBbnkg
Y2hhbmNlIHRvIHJldmlldyB0aGlzIHBhdGNoPwo+Pgo+PiBGb3IgYWRkaXRpb25hbCByZWZlcmVu
Y2UsIHRoZSBtdGRfdGFibGVfbXV0ZXggLS0+IG1ham9yX25hbWVzX2xvY2sgaGllcmFyY2h5IHRo
YXQgY2FuIGJlIHJlbW92ZWQgYnkgdGhpcyBwYXRjaCBhbHNvIGFwcGVhcnMgaW4gYSBkaWZmZXJl
bnQgbG9jayBjaGFpbjoKPj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPWNi
ZjVmZTg0NmYxNGE5MGYwNWUxMGRmMjAwYjA4YzU3OTQxZGM3NTAKPiAKPiBJJ20gZmluZSB3aXRo
IHRoZSBwYXRjaCwgYnV0IGl0IGNhbWUgdG9vIGxhdGUgaW4gdGhlIHJlbGVhc2UgY3ljbGUgc28K
PiBub3cgSSdtIHdhaXRpbmcgLXJjMSB0byBhcHBseSBpdC4KPiAKPiBUaGFua3MsCj4gTWlxdcOo
bAo+IAoKR290IGl0LiBUaGFua3MgZm9yIHRoZSByZXZpZXcsIE1pcXXDqGwuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
