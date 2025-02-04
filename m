Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76915C02192
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 02:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJPgVyaLmvKCX50DfVwkmi5uwVhLt9QvlbIfPTwzGT0=; b=Cmu/4e0I0iVpq/
	/LNju6PK5RVw5jQXOUPIv2u91pAQlj/tVmHZeu0KjfFKiVhyyWg7CUlg2Zx8GjVwzKzRzOthiZQTX
	RgB5zWrtu2qmauqLYSZDcOdM4DKpj3a7wQ1It9l3ZPHzaOvZsuFPkzKp7YSH4XSc7ZkB8bo0XPphX
	UPYYfxoOtJshfFdILdos0ZQyLYuG0HtQhefd5QRYpnVcQFv9XSVHb3jwSmd8wqbh0/N37oTywhYfg
	vR8tTrHis4qR7wZFtXyRweqPFMlgHLXfYYUOGoB+pqE/t5tL33xL4jfxBbn3kU7AMVOp2YTpcNNVP
	ctbZtNiDsCkfuPrhxMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8m4-0000000H7Dq-3Taz;
	Tue, 04 Feb 2025 02:34:52 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8m2-0000000H7DV-1ocy
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 02:34:51 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-46df3fc7176so45353191cf.2
        for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2025 18:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738636489; x=1739241289; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNTxfPJ8scz5P8ra0xEsV/4TfL1hI/K4qQuIKsBFcL4=;
        b=BpjDIXGw0cptd7VLmLhhENo8Klu0AA6L3xwuPbSnHPior3yL6H9mJyHgewgehoEFA0
         6ql4KN6XYeof1DQjkiEz4/QmGPdcFopJ3n50ABTv5ix922zCE/O7WwKp5Lv6dA8EKJn2
         WpSH8KNZCiWhoqGenYwdHrTIzRFptWfmU9BCdL/XJybEiYnsbL18j8YXxE+NYl4dYaty
         WqUI4x61jxMDXLNgyR6ZH72Ap6g7PN2leCGKGtGKpMlh7GrwwotfjeZve7PQbf/8UTME
         Y87GXCjQteRGPcZXEgN/YZOw+ucd8IiFzCcJr/rhNPRvlKlyC1o/T6MeMtJuyj+GuCE8
         nK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738636489; x=1739241289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNTxfPJ8scz5P8ra0xEsV/4TfL1hI/K4qQuIKsBFcL4=;
        b=QiqIyzii63QLtUgfKuBETMnk8r6z0wdEshDdLGwKmklL+UFAIiXs/VzwwL8LdVNtc1
         Uf+rMMOFFDKOvI1ebn8pJTlntODkbmKbDuLpu9D2iryWWexVEqNyVoEUcvM7zIvSeDS6
         MIfUFJ6i6huik2UZpTXPm/wt1utaZh1cizzge+l2Ea77RfLsULVJfUYNxNbDU0Mt760E
         bH8Z3bbr1Q99Cq3ApWWQP86vnh26kVGWoIAJ5WGLsSpUTSttiHXSwwyovReaoYJE5Njo
         mh4NDnL6wrNgT+ZjPVGIt4sCs11Oyt4te7yLtHtvznVvg1KXVcTSq6ZlDEcGJcVNwQBj
         3bjw==
X-Forwarded-Encrypted: i=1; AJvYcCUybLpc3Co0hcp4SZzReYQS8x9vlmiEZeA0oAHsX2+sDjxcNgKNBNBlHpKL4XHKsSFWbDW+GQz1tH4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpcM+ObMP3n5eqd60DgDK33GfGCyaWuPgy2/N63Ujw3p/4CtaJ
	9xMiW0kgzNxak58lkYYCuzAZDwttC6Fjfgd2VaiVAKao70o/w8n+1cTGbdFF3GDyktMq0hEfsZY
	Qc06FS7+g9bxzEnzXIvNeN5Jh3lQENg==
X-Gm-Gg: ASbGncvyhyxXwDxF2thKywByS+oDKcsEf8aiyUhiiudwJBpLcapHYU6/O+BKjR0P+U1
	iYm3K5dCqn1K8qAAqiD5Akorp7Uc6IYGSlNSp07B6peAdZ2mbU0bUN/QLorFV9K/cqQcUG7fj
X-Google-Smtp-Source: AGHT+IEK50aSCmTeFuOHAwQQeYblTvCn6dbXx6xfD+SAIobH6xYybFfsHHkKFfIMfM5I5kQKiaBCu9KJhQwH6QbqrNY=
X-Received: by 2002:a05:622a:254:b0:467:613d:9a1 with SMTP id
 d75a77b69052e-46fd0b91021mr339827781cf.48.1738636488834; Mon, 03 Feb 2025
 18:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com> <87tt9bxwc0.fsf@bootlin.com>
In-Reply-To: <87tt9bxwc0.fsf@bootlin.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 3 Feb 2025 21:34:38 -0500
X-Gm-Features: AWEUYZl082pPVthAFAYQsgrgM0XrRlIDwdjYQMv7xi2bolv-wHodMKLbD9AsSKw
Message-ID: <CANeGvZWi3rZoLcgAyTVU_nKTaE0pHxPYzdqZy2oBsmH+LpUryg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add check for kcalloc()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, gmpy.liaowx@gmail.com, kees@kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_183450_481084_C6D36D9B 
X-CRM114-Status: GOOD (  21.01  )
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

SGkgTWlxdWVsLAoKT24gTW9uLCBGZWIgMywgMjAyNSBhdCAzOjMy4oCvQU0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAwMi8wMi8yMDI1IGF0
IDIwOjU0OjU2IEdNVCwgSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29sQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+IEFkZCBhIGNoZWNrIGZvciBrY2FsbG9jKCkgYW5kIHByaW50IGFuIGVy
cm9yIG1lc3NhZ2UgaWYgaXQgZmFpbHMuCj4KPiBDaGVja2luZywgeWVzLCBidXQgbG9nZ2luZywg
bm8uIElJUkMgdGhlIGNvcmUgZG9lcyBpdCBhbHJlYWR5IGlmIHJlcXVpcmVkLgo+Cj4gPiBGaXhl
czogNzhjMDgyNDdiOWQzICgibXRkOiBTdXBwb3J0IGttc2cgZHVtcGVyIGJhc2VkIG9uIHBzdG9y
ZS9ibGsiKQo+Cj4gQ2M6IHN0YWJsZSBpcyBtaXNzaW5nCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEpp
YXNoZW5nIEppYW5nIDxqaWFzaGVuZ2ppYW5nY29vbEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL210ZC9tdGRwc3RvcmUuYyB8IDUgKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5j
IGIvZHJpdmVycy9tdGQvbXRkcHN0b3JlLmMKPiA+IGluZGV4IDdhYzhhYzkwMTMwNi4uMzY4OTk3
MTU1YzA3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkcHN0b3JlLmMKPiA+ICsrKyBi
L2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4gPiBAQCAtNDIzLDYgKzQyMywxMSBAQCBzdGF0aWMg
dm9pZCBtdGRwc3RvcmVfbm90aWZ5X2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ICAgICAg
IGxvbmdjbnQgPSBCSVRTX1RPX0xPTkdTKGRpdl91NjQobXRkLT5zaXplLCBtdGQtPmVyYXNlc2l6
ZSkpOwo+ID4gICAgICAgY3h0LT5iYWRtYXAgPSBrY2FsbG9jKGxvbmdjbnQsIHNpemVvZihsb25n
KSwgR0ZQX0tFUk5FTCk7Cj4gPgo+ID4gKyAgICAgaWYgKCFjeHQtPnJtbWFwIHx8ICFjeHQtPnVz
ZWRtYXAgfHwgIWN4dC0+YmFkbWFwKSB7Cj4gPiArICAgICAgICAgICAgIGRldl9lcnIoJm10ZC0+
ZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgbWFwXG4iKTsKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAgICAgLyoganVzdCBzdXBwb3J0
IGRtZXNnIHJpZ2h0IG5vdyAqLwo+ID4gICAgICAgY3h0LT5kZXYuZmxhZ3MgPSBQU1RPUkVfRkxB
R1NfRE1FU0c7Cj4gPiAgICAgICBjeHQtPmRldi56b25lLnJlYWQgPSBtdGRwc3RvcmVfcmVhZDsK
Pgo+IFdoYXQgaWYgcmVnaXN0ZXJfcHN0b3JlX2RldmljZSgpIGZhaWxzPyBZb3VyIG9ubHkgcGFy
dGlhbGx5IGZpeGluZyB0aGUKPiBwcm9ibGVtIGlmIHlvdSBkb24ndCBoYW5kbGUgdGhlIGZyZWUo
KXMgdGhlcmUgYXMgd2VsbC4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsIEkgaGF2ZSBz
dWJtaXR0ZWQgYSB2MiB0byBmaXggdGhlIHByb2JsZW1zIGFib3ZlLgoKLUppYXNoZW5nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
