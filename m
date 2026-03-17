Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42895FB5EBD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 04:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHFiBRubz7sM/U+NQcqJNZMURHaISkunl0MbEbsT+N8=; b=zb7TEdJgUR9LVC
	DWXRSZ2LNnIp+GaZVqSzvULQUZrKTUqIllRoCnlvZqXoD2xmvwEjzc8IBx9+XUjh+M/JqjIm0lgAz
	HSNNI8lXAnStKSktesf6FMak0Le3k893ZVD/h3FZrmT0W5yEtmnG+YzLZbJbgRBprxBRcxJ/t/XOz
	s3Qh3UlpHj65aQbJbeaFkXJoyNxbB7/tSjSb54xQzxNataC1Qdj00JCh6PwlkX/AJ4gxuYniIL+ZQ
	JEVFGxKzxCXYYsDqt2QtNWNRNlB1reQodiT22txe7bDr5S6GyD/vrWumlHAeBD/ZOwDyBC5rvbjC9
	d8yOlYUojn8DNkXYbgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M7Z-00000005Ori-2y5U;
	Tue, 17 Mar 2026 04:33:33 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M7X-00000005Oqf-3kFu
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 04:33:33 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-509062d829dso230991cf.1
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 21:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773722011; cv=none;
        d=google.com; s=arc-20240605;
        b=TEYMUHM9mc6fBybg9+ly7s7WjJpDB85KEIbGmaqenwSMYjtbGPvLFd6T99gA1c8OXy
         HQLdbcaDl8tMVr9pFt/D+DEClIKJvD2rlj/wlc0Q+cckYECw4B9OGwArO8AslIDGGnJn
         GGGpHFqCZnZczOtJR0dxpJwfOGeSe+6DWgtTDC0D9kRFM1RB4WaGJxmDW7WEoW2lR4JL
         UZe/V2zWJRW7RtY0o0VcJdf5C1k7Lk/Uu48PY4DSf3X4wHNssqYzvTZrb8dwP1xhj+JQ
         HPITvky3IMCxzt1viRmPSAHF6UCas+KMMTuRzA+NmLmoDtm0r8nn/S13JSrwkJ8+waGj
         df+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        fh=ioM4pJTCvaJOayhWFnV10uOZ/XcJxS7jAh/MlDLMfHc=;
        b=Pl3FMA8H0jZq3cxpsaAnzgMRrTDHSSos2qexE7RFoxAkAZ/q/el3nlmAXizxPcKC4s
         u2kfKn8tY8ayEeudpUkVbMHzjSeOG9D5SvMEt2SpMVF3UQ659EaFkk0Utf0oh1fde4TP
         guT6KHvWhbvuRMmbfUDGj3AyMaF3wXOriecAsrJLmtMUyIkeCGzSphdVa+eGjQKWM7j9
         0LE3g/L/i3gI3CULv+3t65dyeVUkOyD+tPLkgorYwcKexn5xs+YDbRRKbaBqYSpyS6Sc
         jQOr7GtmAjH9rgxpD0p8fmSeH5o2NpNJLSqPUieBzqP4RCEEjpCs6JMjTfof2yPyHvmK
         Ig2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773722011; x=1774326811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=IVP0q4RnyZEGTC9qt1wxtsP6tVGTbjcG10IQWUYeuJQQU7uJklLQ87VLgCxJSGyiBm
         Wzs8ml9cBOG8lu3n3nNFCP4jb6/W0HOoJ/GKWd6Hj3MLqsKupDVY4mIFXYDiKdTowEvr
         UkJXieyKW962YMmnGPd8lPnAyVL9OpuJhHvA+VmKAv4riJJwrrSsLoDSvPWopIcO53oD
         qgbIVvfc8pA5S+o1Rxxd9/14UUWTaanKJb93TFNSFXKsj+qwZTc3Vdaol2r5Egy+NO2I
         nSGrYQYd/uouNXSIuLq/WZZVK0Ls/sNBTiJ4urWcgn0ws626Qb3Jrvc6ADMbRWvaxE2i
         J9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773722011; x=1774326811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=qn3eUjm8d16/4Y/ZLd1mzXK3MiK6t85Vk+K/A/rEjILn7xwxyuRqNiS6o3ZGg+K+Jr
         dL1mtsaeN7DoBzoF9xA+63uk8oe28ee4tQpW7zLhd2XknSKr7FFGJklIp7OmZLgBKxBv
         hiZHtWltz11ik1CSAUSGmxEV9o3ivTMKROBfhda47NeZ5JWMCMkSV0epXmkNI8+spsi3
         dLrTbEygwZf/KMRV2BND1JehrOk8O/E6hONYxUhfeXae7Uw4u/LbhB5nQaMxPGt3SHHZ
         ZriXJdvRWjVyztn6TGsD8VifRYymxXMMsGXwdWnc5rGZCDkBEzH6ygVnnVkujRmjixyN
         CmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEzZ2ViFempAUGjS6xLlMrF5GsbZHSjAdp2zPjtvsnNgpRRpXEl3ehDES+uZBCYSorOs/J1Zoh1aY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsZ2UirNzePwyrbSgFNaR0FsrTZPqd7VrG/w4TZojt/C/Wgq+y
	p1j8NaW57BrVvJrU2wuT1nc25FAFDhGjslZqbk2O5dydGVy3STxR7orzUdPAfMXKMxCft/85Ccb
	TL1DPyxBGR7xKrxPExgLqULq330UqKAUR51q6N3RU
X-Gm-Gg: ATEYQzzOkoI2LIgiwrajCuWHs7NCVuBoX277yi67UCqfOgci1JbRkbVpOBPGe11Ghu8
	H5ZEnFeNxXDtolE1WHmDP9EBRVnD1hsuKZjicT+4KiMlAfm+UAzKQHaTYXGurK88jip9BvH4lmf
	QrODvrHDKQW6MQZUXDAmULdkrvxoUmgSYN3dVJ0eCJg/B0EqOxIB/0L/9a4+Pclq4XhdppD9Wxq
	SIgxQLraFbYTaC8vt/8+1yVh4wmv4RloMYZrZIelMfpEtsgRYo0EZbnjD3xt1Ygl9/hmGk6/Ny/
	/AahTA==
X-Received: by 2002:ac8:5844:0:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50998d3b42cmr9273521cf.10.1773722010151; Mon, 16 Mar 2026
 21:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
In-Reply-To: <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:33:19 -0700
X-Gm-Features: AaiRm50Qx7Mej7rYBXyqChXz1IjfagNMkbSFlVwOhEN7Z-gN2V6TQSUIzNbqMWk
Message-ID: <CAJuCfpHBfD0zO60tPCEeNXSRJSoDi5Azs0LzutpYFEBW2z6JJw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] hpet: replace deprecated mmap hook with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_213331_946599_58BD5F99 
X-CRM114-Status: GOOD (  19.28  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJz
L2NoYXIvaHBldC5jIHwgMTIgKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2hw
ZXQuYyBiL2RyaXZlcnMvY2hhci9ocGV0LmMKPiBpbmRleCA2MGRkMDlhNTZmNTAuLjhmMTI4Y2M0
MDE0NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NoYXIvaHBldC5jCj4gKysrIGIvZHJpdmVycy9j
aGFyL2hwZXQuYwo+IEBAIC0zNTQsOCArMzU0LDkgQEAgc3RhdGljIF9faW5pdCBpbnQgaHBldF9t
bWFwX2VuYWJsZShjaGFyICpzdHIpCj4gIH0KPiAgX19zZXR1cCgiaHBldF9tbWFwPSIsIGhwZXRf
bW1hcF9lbmFibGUpOwo+Cj4gLXN0YXRpYyBpbnQgaHBldF9tbWFwKHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc3RhdGljIGludCBocGV0X21tYXBfcHJl
cGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3QgZmls
ZSAqZmlsZSA9IGRlc2MtPmZpbGU7Cj4gICAgICAgICBzdHJ1Y3QgaHBldF9kZXYgKmRldnA7Cj4g
ICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHI7Cj4KPiBAQCAtMzY4LDExICszNjksMTIgQEAgc3Rh
dGljIGludCBocGV0X21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQo+ICAgICAgICAgaWYgKGFkZHIgJiAoUEFHRV9TSVpFIC0gMSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PU1lTOwo+Cj4gLSAgICAgICB2bWEtPnZtX3BhZ2VfcHJvdCA9IHBn
cHJvdF9ub25jYWNoZWQodm1hLT52bV9wYWdlX3Byb3QpOwo+IC0gICAgICAgcmV0dXJuIHZtX2lv
bWFwX21lbW9yeSh2bWEsIGFkZHIsIFBBR0VfU0laRSk7Cj4gKyAgICAgICBkZXNjLT5wYWdlX3By
b3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKGRlc2MtPnBhZ2VfcHJvdCk7Cj4gKyAgICAgICBtbWFwX2Fj
dGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBhZGRyLCBQQUdFX1NJWkUpOwo+ICsgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPiAgI2Vsc2UKPiAtc3RhdGljIGludCBocGV0X21tYXAoc3RydWN0IGZpbGUg
KmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtzdGF0aWMgaW50IGhwZXRfbW1h
cF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiAgICAgICAgIHJldHVy
biAtRU5PU1lTOwo+ICB9Cj4gQEAgLTcxMCw3ICs3MTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyBocGV0X2ZvcHMgPSB7Cj4gICAgICAgICAub3BlbiA9IGhwZXRfb3Bl
biwKPiAgICAgICAgIC5yZWxlYXNlID0gaHBldF9yZWxlYXNlLAo+ICAgICAgICAgLmZhc3luYyA9
IGhwZXRfZmFzeW5jLAo+IC0gICAgICAgLm1tYXAgPSBocGV0X21tYXAsCj4gKyAgICAgICAubW1h
cF9wcmVwYXJlID0gaHBldF9tbWFwX3ByZXBhcmUsCj4gIH07Cj4KPiAgc3RhdGljIGludCBocGV0
X2lzX2tub3duKHN0cnVjdCBocGV0X2RhdGEgKmhkcCkKPiAtLQo+IDIuNTMuMAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
