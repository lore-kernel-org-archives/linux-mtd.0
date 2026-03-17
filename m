Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7E5FF6E85
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 21:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFAMEShEb0jLKzJMhzmNyc5O4frtBvIEoDKZlk4zi9k=; b=lPpFMnV6zpq3LZ
	xzolcN8ecGk4sgkAhKhs4z8styE8hP8ZR4Wn5kG3iW7SjXzOXhT8XsbVtcv687LdhGIrbq61q2+N8
	LJMGlrBeIh5k5MklevpThyEZLj91agV6bOwbeXlvrQfu61egzTadJfI+T5v+HO/bCQMBCiSYbDh7+
	uSqhxRVfYZgKFruAC4B4NRZcQpGVUPRxkCv0QWYb3oxmT+ka99//kEEcsXrioysOKz+3BIjfgXFzQ
	0sf0y1ldez7y9w58X75UKucG/cj/lTcWN4jzUl45eJ/DTc42nUj469qdZpvJucv8NWKCF97V82bwA
	y8r8fI4h7wjC6nojy7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bw0-00000007FfF-30TC;
	Tue, 17 Mar 2026 21:26:40 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bvu-00000007Fdt-3rPz
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 21:26:37 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5091ed02c54so85891cf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 14:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773782793; cv=none;
        d=google.com; s=arc-20240605;
        b=RcY1xRUHsHPToJJXE5PMD2TJbTmKqXZYY99hdWPA2Dylp+9RlOvuPTI62Q6PxvSca9
         +qu389PbFN+AwMs4GW2j7GnMokYkAOlCAdNXWqeZM9YZ0jZdCdD0R+mlfuqvG/NGSKIj
         hmi4Rxb2SC8/9UWEHw4rr0fVXkqtS+SNe8ANadHvLtO5IhAGA6w0e/3Mv5A+vaNjH+jc
         wFSaztuz11VyAFvJiLdOs2q1n8RvOpR84Z9SZfunjLEjUtw634OpElHEkcac3CltmEqb
         v3m5ztLJTNxLEsFD9Db9uPZaNEpQTU1dcwi6r5vS8NaKhtNxh8o2Xz4hq/A8QV8eBnzs
         4kVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        fh=yFBlLjQPpacqMplAxvKWBv8K1jBti6wpXeltNIeEZJw=;
        b=Oe4aCjN1cCYFH7fPDCvPSH6bZH5RnpjfIJ1E/MejNxo36eP73Zd1UEoXhEeq5/kmyX
         6KxePUzWRyNgaLTBDQNKcMxYvmTtwtubetDBBMFW8/MxNfttie5u2PI0QOhNuxGUasza
         mVQuwrH5mgIQKL5e+FIewv8h4tfhln0hQWGxPZ2+XSrmT76W+Ut6BH494FDVErFEkVX/
         vdm1uub//egnlVV+T8jHjdu8sfjVfE4b1ca35befrJr9/i02EeGAqN1w+r8LRthEK4kc
         SFED3S5wxHG9EYrMVKJEMc+Ax9815uD9jjnau4Qw5s/j/w9/k7IVfIskCxo1bKKBNQuV
         qYhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773782793; x=1774387593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        b=vP4IlTq/8qHjeMbIRJwqylDrCQKVLfVFBRW8AVDsk72Xm86zxfXfTDQxX5ND8T4BV1
         L7JO6KwUU6/XrlytRklfknQA52Eak6yJ4+1yT7s6qYdWzrHUkXtzTAp6LCLRLiGWMsNh
         tlKL9uwQZn1cBh+wYKE3lZWABcajdMXqUM3yjCg5r7HD4Nss9csuSVkvV+9WY7uOBiKR
         27mOHTXq7MZ++QowLZKRs2ZaYDUF5bcDJKAhdzfGJi3A5skgWSgLDDi+nyKLLeLVfbWu
         HxO7htiljjMcsBYflHYUaxhN4yHVz2P+jYhkdGidkvwljOhylVL+uYJProa+1xSLTUSo
         7J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782793; x=1774387593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        b=W1hXGEBtB8Bm9ahBMyhjdWjSWMTj5LF47ScN/XRoDmgZ9Y+eE0XwFhBV71AamYcePD
         0wzcu9ppe/rgWKzKhCoP6rpnssO/zeTHMfe7amujd5BVoVUYXi4l2d/Uy/LJzYgq/KRk
         q95cseF4yRki3PzDfHukc7tl43PyJZOgg5fDchLDdkVCrsgj5MQhX8FfnDkqv9O5p4Hz
         GyKvTiCyQBlT8eQDsiFdVia6Q70DVOixeDJHsL0xQvQbMT+cwYQ7sGtJ0oYKY1w0pkeI
         AWb2wQfPWpeLNEZwxSkCh+Hq848gyZX0Q4PnLhI7wJDELwY9wHvePpYdWDzY95MkuAG3
         LU6A==
X-Forwarded-Encrypted: i=1; AJvYcCW52JmiSf3m7n16ZSdYrWgxtvHGtCS4cwqZhAX6ERS4Vq+677foL5ogNuRlyZ0i8EMRx0C4MS8K0FU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGlkzwYwOOc7xTuqzTnofVzy31zNdFR2fanLKXfF7ne3GsT1R4
	sF79/KZ0h3vi1X3MwWbGf06T1x251kPWoDsVZDqeW2hOqTcpY7Kfhvbh3/dxB3JMUBngyEhPJsv
	I6bsiwdm9GLcWvJ9tiiXWWJ9SIB0IAauQO1ZRzp3H
X-Gm-Gg: ATEYQzyncnabJ8xWOQflHH2S/9hdUg+Jkxbes5sbGaUv8wL9/K/xPDtOysEhRcgRjUm
	oBnaBijLtZaM7JEB+Agl6nDbJz+RaObOdRsOQuKO4zKiE20Blw1xFNveuRA0WyH7/AuYd4FrfPh
	mL2jXh7vVT2mq7O4/fP90aK3CtT7yy4JOZ1XyYKbMeR22G9d5/Q9jayva0jM4ZIcFmqBXwB0m+y
	vuLbNV6P6Ymks/AohAVwGTU6w+qhk0pZ4Sb9UNrOAJRusCc5TAS2i0rgTTBxUZ1H+ivxpL8NVan
	GG6UvTRchN7AnaiK2ajCRKHAcSjt8PDTl/ys2A==
X-Received: by 2002:a05:622a:614:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50b1470ee58mr4568251cf.2.1773782792685; Tue, 17 Mar 2026
 14:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
In-Reply-To: <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:26:21 -0700
X-Gm-Features: AaiRm51SJauRxJyG8YD3YuiOnfN0s_6akSz6AhkIFbo6vEz-Gt-mAXyXfHq04tA
Message-ID: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] staging: vme_user: replace deprecated mmap hook
 with mmap_prepare
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
X-CRM114-CacheID: sfid-20260317_142635_021303_4D8D925A 
X-CRM114-Status: GOOD (  32.03  )
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
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBGdW5jdGlvbnMgdGhh
dCB3cmFwIG1tYXAoKSBhcmUgYWxzbyBjb252ZXJ0ZWQgdG8gd3JhcCBtbWFwX3ByZXBhcmUoKQo+
IGluc3RlYWQuCj4KPiBBbHNvIHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBhY2NvcmRpbmdseS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0ICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZS5jICAgICAgfCAyMCArKysrKy0tLS0tLQo+
ICBkcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmggICAgICB8ICAyICstCj4gIGRyaXZlcnMv
c3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jIHwgNTEgKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJzdCBiL0Rv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0Cj4gaW5kZXggYzBiNDc1MzY5ZGUwLi43MTEx
OTk5YWJjMTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZtZS5yc3QK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJzdAo+IEBAIC0xMDcsNyArMTA3
LDcgQEAgVGhlIGZ1bmN0aW9uIDpjOmZ1bmM6YHZtZV9tYXN0ZXJfcmVhZGAgY2FuIGJlIHVzZWQg
dG8gcmVhZCBmcm9tIGFuZAo+Cj4gIEluIGFkZGl0aW9uIHRvIHNpbXBsZSByZWFkcyBhbmQgd3Jp
dGVzLCA6YzpmdW5jOmB2bWVfbWFzdGVyX3Jtd2AgaXMgcHJvdmlkZWQgdG8KPiAgZG8gYSByZWFk
LW1vZGlmeS13cml0ZSB0cmFuc2FjdGlvbi4gUGFydHMgb2YgYSBWTUUgd2luZG93IGNhbiBhbHNv
IGJlIG1hcHBlZAo+IC1pbnRvIHVzZXIgc3BhY2UgbWVtb3J5IHVzaW5nIDpjOmZ1bmM6YHZtZV9t
YXN0ZXJfbW1hcGAuCj4gK2ludG8gdXNlciBzcGFjZSBtZW1vcnkgdXNpbmcgOmM6ZnVuYzpgdm1l
X21hc3Rlcl9tbWFwX3ByZXBhcmVgLgo+Cj4KPiAgU2xhdmUgd2luZG93cwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMgYi9kcml2ZXJzL3N0YWdpbmcvdm1lX3Vz
ZXIvdm1lLmMKPiBpbmRleCBmMTBhMDBjMDVmMTIuLjcyMjBhYmE3YjkxOSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
dm1lX3VzZXIvdm1lLmMKPiBAQCAtNzM1LDkgKzczNSw5IEBAIHVuc2lnbmVkIGludCB2bWVfbWFz
dGVyX3JtdyhzdHJ1Y3Qgdm1lX3Jlc291cmNlICpyZXNvdXJjZSwgdW5zaWduZWQgaW50IG1hc2ss
Cj4gIEVYUE9SVF9TWU1CT0wodm1lX21hc3Rlcl9ybXcpOwo+Cj4gIC8qKgo+IC0gKiB2bWVfbWFz
dGVyX21tYXAgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiArICogdm1lX21h
c3Rlcl9tbWFwX3ByZXBhcmUgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiAg
ICogQHJlc291cmNlOiBQb2ludGVyIHRvIFZNRSBtYXN0ZXIgcmVzb3VyY2UuCj4gLSAqIEB2bWE6
IFBvaW50ZXIgdG8gZGVmaW5pdGlvbiBvZiB1c2VyIG1hcHBpbmcuCj4gKyAqIEBkZXNjOiBQb2lu
dGVyIHRvIGRlc2NyaXB0b3Igb2YgdXNlciBtYXBwaW5nLgo+ICAgKgo+ICAgKiBNZW1vcnkgbWFw
IGEgcmVnaW9uIG9mIHRoZSBWTUUgbWFzdGVyIHdpbmRvdyBpbnRvIHVzZXIgc3BhY2UuCj4gICAq
Cj4gQEAgLTc0NSwxMiArNzQ1LDEzIEBAIEVYUE9SVF9TWU1CT0wodm1lX21hc3Rlcl9ybXcpOwo+
ICAgKiAgICAgICAgIHJlc291cmNlIG9yIC1FRkFVTFQgaWYgbWFwIGV4Y2VlZHMgd2luZG93IHNp
emUuIE90aGVyIGdlbmVyaWMgbW1hcAo+ICAgKiAgICAgICAgIGVycm9ycyBtYXkgYWxzbyBiZSBy
ZXR1cm5lZC4KPiAgICovCj4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0IHZtZV9yZXNvdXJj
ZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtpbnQgdm1lX21hc3Rl
cl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiArICAg
ICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgdm1hX3NpemUgPSB2bWFfZGVzY19zaXplKGRlc2MpOwo+
ICAgICAgICAgc3RydWN0IHZtZV9icmlkZ2UgKmJyaWRnZSA9IGZpbmRfYnJpZGdlKHJlc291cmNl
KTsKPiAgICAgICAgIHN0cnVjdCB2bWVfbWFzdGVyX3Jlc291cmNlICppbWFnZTsKPiAgICAgICAg
IHBoeXNfYWRkcl90IHBoeXNfYWRkcjsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgdm1hX3NpemU7
Cj4KPiAgICAgICAgIGlmIChyZXNvdXJjZS0+dHlwZSAhPSBWTUVfTUFTVEVSKSB7Cj4gICAgICAg
ICAgICAgICAgIGRldl9lcnIoYnJpZGdlLT5wYXJlbnQsICJOb3QgYSBtYXN0ZXIgcmVzb3VyY2Vc
biIpOwo+IEBAIC03NTgsMTkgKzc1OSwxOCBAQCBpbnQgdm1lX21hc3Rlcl9tbWFwKHN0cnVjdCB2
bWVfcmVzb3VyY2UgKnJlc291cmNlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgICAg
ICAgIH0KPgo+ICAgICAgICAgaW1hZ2UgPSBsaXN0X2VudHJ5KHJlc291cmNlLT5lbnRyeSwgc3Ry
dWN0IHZtZV9tYXN0ZXJfcmVzb3VyY2UsIGxpc3QpOwo+IC0gICAgICAgcGh5c19hZGRyID0gaW1h
Z2UtPmJ1c19yZXNvdXJjZS5zdGFydCArICh2bWEtPnZtX3Bnb2ZmIDw8IFBBR0VfU0hJRlQpOwo+
IC0gICAgICAgdm1hX3NpemUgPSB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQ7Cj4gKyAgICAg
ICBwaHlzX2FkZHIgPSBpbWFnZS0+YnVzX3Jlc291cmNlLnN0YXJ0ICsgKGRlc2MtPnBnb2ZmIDw8
IFBBR0VfU0hJRlQpOwo+Cj4gICAgICAgICBpZiAocGh5c19hZGRyICsgdm1hX3NpemUgPiBpbWFn
ZS0+YnVzX3Jlc291cmNlLmVuZCArIDEpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2Vycihicmlk
Z2UtPnBhcmVudCwgIk1hcCBzaXplIGNhbm5vdCBleGNlZWQgdGhlIHdpbmRvdyBzaXplXG4iKTsK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAg
IHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7
Cj4gLQo+IC0gICAgICAgcmV0dXJuIHZtX2lvbWFwX21lbW9yeSh2bWEsIHBoeXNfYWRkciwgdm1h
LT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KTsKPiArICAgICAgIGRlc2MtPnBhZ2VfcHJvdCA9IHBn
cHJvdF9ub25jYWNoZWQoZGVzYy0+cGFnZV9wcm90KTsKPiArICAgICAgIG1tYXBfYWN0aW9uX3Np
bXBsZV9pb3JlbWFwKGRlc2MsIHBoeXNfYWRkciwgdm1hX3NpemUpOwo+ICsgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTCh2bWVfbWFzdGVyX21tYXApOwo+ICtFWFBPUlRfU1lN
Qk9MKHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJlKTsKPgo+ICAvKioKPiAgICogdm1lX21hc3Rlcl9m
cmVlIC0gRnJlZSBWTUUgbWFzdGVyIHdpbmRvdwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lLmggYi9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmgKPiBpbmRl
eCA3OTdlOTk0MGZkZDEuLmI2NDEzNjA1ZWE0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lLmgKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmgK
PiBAQCAtMTUxLDcgKzE1MSw3IEBAIHNzaXplX3Qgdm1lX21hc3Rlcl9yZWFkKHN0cnVjdCB2bWVf
cmVzb3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYsIHNpemVfdCBjb3VudCwKPiAgc3NpemVfdCB2
bWVfbWFzdGVyX3dyaXRlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYs
IHNpemVfdCBjb3VudCwgbG9mZl90IG9mZnNldCk7Cj4gIHVuc2lnbmVkIGludCB2bWVfbWFzdGVy
X3JtdyhzdHJ1Y3Qgdm1lX3Jlc291cmNlICpyZXNvdXJjZSwgdW5zaWduZWQgaW50IG1hc2ssIHVu
c2lnbmVkIGludCBjb21wYXJlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgc3dhcCwgbG9mZl90IG9mZnNldCk7Cj4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0
IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiAr
aW50IHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNl
LCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKTsKPiAgdm9pZCB2bWVfbWFzdGVyX2ZyZWUoc3Ry
dWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UpOwo+Cj4gIHN0cnVjdCB2bWVfcmVzb3VyY2UgKnZt
ZV9kbWFfcmVxdWVzdChzdHJ1Y3Qgdm1lX2RldiAqdmRldiwgdTMyIHJvdXRlKTsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMgYi9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lX3VzZXIuYwo+IGluZGV4IGQ5NWRkN2Q5MTkwYS4uMTFlMjVjMmY2YjBh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jCj4gKysr
IGIvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMKPiBAQCAtNDQ2LDI0ICs0NDYs
MTQgQEAgc3RhdGljIHZvaWQgdm1lX3VzZXJfdm1fY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCj4gICAgICAgICBrZnJlZSh2bWFfcHJpdik7Cj4gIH0KPgo+IC1zdGF0aWMgY29uc3Qg
c3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHZtZV91c2VyX3ZtX29wcyA9IHsKPiAtICAgICAg
IC5vcGVuID0gdm1lX3VzZXJfdm1fb3BlbiwKPiAtICAgICAgIC5jbG9zZSA9IHZtZV91c2VyX3Zt
X2Nsb3NlLAo+IC19Owo+IC0KPiAtc3RhdGljIGludCB2bWVfdXNlcl9tYXN0ZXJfbW1hcCh1bnNp
Z25lZCBpbnQgbWlub3IsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtzdGF0aWMgaW50
IHZtZV91c2VyX3ZtX21hcHBlZCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVu
ZCwgcGdvZmZfdCBwZ29mZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqKnZtX3ByaXZhdGVfZGF0YSkKPiAgewo+IC0gICAgICAg
aW50IGVycjsKPiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBtaW5vciA9IGltaW5vcihmaWxl
X2lub2RlKGZpbGUpKTsKPiAgICAgICAgIHN0cnVjdCB2bWVfdXNlcl92bWFfcHJpdiAqdm1hX3By
aXY7Cj4KPiAgICAgICAgIG11dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7Cj4KPiAtICAg
ICAgIGVyciA9IHZtZV9tYXN0ZXJfbW1hcChpbWFnZVttaW5vcl0ucmVzb3VyY2UsIHZtYSk7Cj4g
LSAgICAgICBpZiAoZXJyKSB7Cj4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmaW1hZ2Vb
bWlub3JdLm11dGV4KTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiAtICAgICAgIH0K
PiAtCgpPaywgdGhpcyBjaGFuZ2VzIHRoZSBzZXQgb2YgdGhlIG9wZXJhdGlvbnMgcGVyZm9ybWVk
IHVuZGVyIGltYWdlW21pbm9yXS5tdXRleC4KQmVmb3JlIHdlIGhhZDoKCm11dGV4X2xvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7CnZtZV9tYXN0ZXJfbW1hcCgpOwo8c29tZSBmaW5hbCBhZGp1c3Rt
ZW50cz4KbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwoKTm93IHdlIGhhdmU6Cgpt
dXRleF9sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwp2bWVfbWFzdGVyX21tYXBfcHJlcGFyZSgp
Cm11dGV4X3VubG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKdm1faW9tYXBfbWVtb3J5KCk7Cm11
dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7CnZtZV91c2VyX3ZtX21hcHBlZCgpOyAvLyA8
c29tZSBmaW5hbCBhZGp1c3RtZW50cz4KbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgp
OwoKSSB0aGluayBhcyBsb25nIGFzIGltYWdlW21pbm9yXSBkb2VzIG5vdCBjaGFuZ2Ugd2hpbGUg
d2UgYXJlIG5vdApob2xkaW5nIHRoZSBtdXRleCB3ZSBzaG91bGQgYmUgc2FmZSwgYW5kIGxvb2tp
bmcgYXQgdGhlIGNvZGUgaXQgc2VlbXMKdG8gYmUgdGhlIGNhc2UuIEJ1dCBJJ20gbm90IGZhbWls
aWFyIHdpdGggdGhpcyBkcml2ZXIgYW5kIG1pZ2h0IGJlCndyb25nLiBXb3J0aCBkb3VibGUtY2hl
Y2tpbmcuCgo+ICAgICAgICAgdm1hX3ByaXYgPSBrbWFsbG9jX29iaigqdm1hX3ByaXYpOwo+ICAg
ICAgICAgaWYgKCF2bWFfcHJpdikgewo+ICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7Cj4gQEAgLTQ3MiwyMiArNDYyLDQxIEBAIHN0YXRpYyBpbnQgdm1l
X3VzZXJfbWFzdGVyX21tYXAodW5zaWduZWQgaW50IG1pbm9yLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPgo+ICAgICAgICAgdm1hX3ByaXYtPm1pbm9yID0gbWlub3I7Cj4gICAgICAgICBy
ZWZjb3VudF9zZXQoJnZtYV9wcml2LT5yZWZjbnQsIDEpOwo+IC0gICAgICAgdm1hLT52bV9vcHMg
PSAmdm1lX3VzZXJfdm1fb3BzOwo+IC0gICAgICAgdm1hLT52bV9wcml2YXRlX2RhdGEgPSB2bWFf
cHJpdjsKPiAtCj4gKyAgICAgICAqdm1fcHJpdmF0ZV9kYXRhID0gdm1hX3ByaXY7Cj4gICAgICAg
ICBpbWFnZVttaW5vcl0ubW1hcF9jb3VudCsrOwo+Cj4gICAgICAgICBtdXRleF91bmxvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7Cj4gLQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0
aWMgaW50IHZtZV91c2VyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHZt
ZV91c2VyX3ZtX29wcyA9IHsKPiArICAgICAgIC5tYXBwZWQgPSB2bWVfdXNlcl92bV9tYXBwZWQs
Cj4gKyAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29wZW4sCj4gKyAgICAgICAuY2xvc2UgPSB2
bWVfdXNlcl92bV9jbG9zZSwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgdm1lX3VzZXJfbWFzdGVy
X21tYXBfcHJlcGFyZSh1bnNpZ25lZCBpbnQgbWlub3IsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gK3sKPiArICAg
ICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgbXV0ZXhfbG9jaygmaW1hZ2VbbWlub3JdLm11dGV4
KTsKPiArCj4gKyAgICAgICBlcnIgPSB2bWVfbWFzdGVyX21tYXBfcHJlcGFyZShpbWFnZVttaW5v
cl0ucmVzb3VyY2UsIGRlc2MpOwo+ICsgICAgICAgaWYgKCFlcnIpCj4gKyAgICAgICAgICAgICAg
IGRlc2MtPnZtX29wcyA9ICZ2bWVfdXNlcl92bV9vcHM7Cj4gKwo+ICsgICAgICAgbXV0ZXhfdW5s
b2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ICsgICAgICAgcmV0dXJuIGVycjsKPiArfQo+ICsK
PiArc3RhdGljIGludCB2bWVfdXNlcl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtX2FyZWFfZGVzYyAq
ZGVzYykKPiAgewo+IC0gICAgICAgdW5zaWduZWQgaW50IG1pbm9yID0gaW1pbm9yKGZpbGVfaW5v
ZGUoZmlsZSkpOwo+ICsgICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUgPSBkZXNjLT5maWxl
Owo+ICsgICAgICAgY29uc3QgdW5zaWduZWQgaW50IG1pbm9yID0gaW1pbm9yKGZpbGVfaW5vZGUo
ZmlsZSkpOwo+Cj4gICAgICAgICBpZiAodHlwZVttaW5vcl0gPT0gTUFTVEVSX01JTk9SKQo+IC0g
ICAgICAgICAgICAgICByZXR1cm4gdm1lX3VzZXJfbWFzdGVyX21tYXAobWlub3IsIHZtYSk7Cj4g
KyAgICAgICAgICAgICAgIHJldHVybiB2bWVfdXNlcl9tYXN0ZXJfbW1hcF9wcmVwYXJlKG1pbm9y
LCBkZXNjKTsKPgo+ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gIH0KPiBAQCAtNDk4LDcgKzUw
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHZtZV91c2VyX2ZvcHMg
PSB7Cj4gICAgICAgICAubGxzZWVrID0gdm1lX3VzZXJfbGxzZWVrLAo+ICAgICAgICAgLnVubG9j
a2VkX2lvY3RsID0gdm1lX3VzZXJfdW5sb2NrZWRfaW9jdGwsCj4gICAgICAgICAuY29tcGF0X2lv
Y3RsID0gY29tcGF0X3B0cl9pb2N0bCwKPiAtICAgICAgIC5tbWFwID0gdm1lX3VzZXJfbW1hcCwK
PiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSB2bWVfdXNlcl9tbWFwX3ByZXBhcmUsCj4gIH07Cj4K
PiAgc3RhdGljIGludCB2bWVfdXNlcl9tYXRjaChzdHJ1Y3Qgdm1lX2RldiAqdmRldikKPiAtLQo+
IDIuNTMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
