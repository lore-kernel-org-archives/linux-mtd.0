Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3795CCC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjj9PlxRXJ0w8/29Cu1+6rkefN15TTBOj4d+7e6LURM=; b=LDRijR41L2BR9g
	mHOtSl9o9MWaK1w1RpAbgGyDKzm+Agez83EfHbbJd/aQfQsuynVwmO+PMUnRSIIu6TMCl4EumgFQH
	KmwcbcWGrpFKr67PIvoDoD5tqA4pbhFz+qFYuEk/MboOab3VzlFwWFi4PaYuuw2S7Dm2+xAbcXDmm
	6wRphlo5LVYsaiAd+wy1+lc8k65yALvcgOFZ6kiWA2MaxNiv+Rzt9Qw9PCFUCcKGWrmm64OiSQc6j
	WPHYnHzgzWJx5e4CNWlQZVX6gaXmuwR+FMTuFCzXcS1SIN1sNE6lPlbra2yi8lbHrC9Z+KOKaphUF
	rXfCT/zvETkXCHlBba6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH25j-0000000G1RA-1fCL;
	Wed, 14 Oct 2026 16:44:35 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH25h-0000000G1Qq-16SW
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:44:34 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-34c522572bfso548262eec.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996272; cv=none;
        d=google.com; s=arc-20260327;
        b=d7sFCSv5Lm9c3flnwrPiSA0sTOZjlGJk2rufdo975GfnD6WTozgIElrM6fd1XsnwL6
         e5OohLwpVMr3KxKbckhScVERwJ4ijxhYcWP5UbJFjQ9hpJDThuIR2n/XHFkmN4qEoD65
         Grx8PQrdpKR7X+7FoHuOjR+oP3puWK2NLMc2aKT6LgQKRRYnNXj4RtEyJpLsyqJv1X0h
         j7A8iGzJNSl0ybfYlbx7IN3BbyuevjoH3rKKtnXrAzNPhFh7A91ISlbKpZWzqHap8wa1
         46SgnPu/48dSINAVLiiqckVCKLxuMLVzRJOz+FSjDY7WhSfRZAPkj5vmt1QezryxEqoJ
         OoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        fh=xO52CSCC9QEulVYnVRLdCwA2/onm2RVUgWtGy4VfsUs=;
        b=iNEpR/De7uariEeoz0brc8zsQ9i+2GAiyPSP0e0jPiel8ciqDZJmmiSCE54COOMslH
         3zjJTQGkn9Z3DdjjnUAnOJAXdgqxI5bXmhfaJcgOwsgEP8YC9ft/ym7rUD0FiX0zYn5D
         p3HOKnGG8zjSppcN50ECTgnT6N60+2D7jfCW3+67nse2Tn4f8oMKFiH5JkX6atmDLLbK
         o45VbHI4QWF4SHdVrKI2VkoNUoNFlF9rD/pNi5xdOm+F4vesSgZtqwoA59dDaJv1yZcA
         9AuigQG7RunPlTweb2G4xPSktEEqaJ/Wbkn79ntt7KpTuX0ykHEy25NUNW4olKQdm6Az
         150A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996272; x=1792601072; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=idj1fkaGSL0/pD27Geq0frK/y8D5yIUjCmKJvYiN086xOvGeTqxDq1ofw+Ez7oYQ4N
         RdZS3iTOJfOhxANa3bS7FOv1jDr+1NZz+Q/kVRcJoaKh9RRpH1OpM2Izvd/VcBtoTOlD
         OQh+5pQPVgIh6vt/aBjT9kNQH7A+4U7TghgMoB4+lkmpc+mLJzmGdE83+hng34/IbM7T
         hNrvJ1Qi2f54OWOBL0/tdSJ4wCpmlhVrHbGAZ7jAMt9f7JcE0vRC1oneH9II8HQgRhbj
         o/SiDYZzEuscH4gi+VtLPQavJHAyVwnzPkV0as0HiN+t36cNjCo1DF3MJl0kfe9Vb0Ft
         J8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996272; x=1792601072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=SbH63Kdd2uFgUmhuwHYhA5Ja5LjpR5DK5zGDInrIk8yfvPKIkeZrfHudTRpL3MjJUG
         6oB+ITx0tZ7QVUh2Xxn9lXbSbOzRSrB1si2dBbv2amlMpUaJ4GoVkjlSX/iIRfpdlFHA
         dSwYcjqaLcBQ9o9s9sCsU3ABVP9UFh8qwYLml5LtM4Q5mKuriKxaLiWfqRG7yFMu/dqj
         TzlYpZ6VDFeumB5mL6xaGlQMC3QIthxAuMO8AuP5yA9InPRO+hf34j8JsjCQpgw7L2S7
         kgBAKNP51lOQtkzlF3Nn261s6nYwyGRMHd+vZ7pZhfLgdpGMzd+Uh6WU7xq1Wpnr9C4d
         Z1GQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3vDo5Ag9d72d8mVagJt8fgy21vmScrugtb6+O9CHMlvMT/hwUG9nuDSbjVfXHP/KBa1zxaOxV1hs=@lists.infradead.org
X-Gm-Message-State: AFq9FYL1cH/aT0ofER+elQm9ElvA9fL8Ak5KfjLSo6meEzCQZDhcg/f3
	PulG0dgAiOAX69m/CrVORwxa1ouA/PisTPYtxMFg2NZNACy++ANh+dNAwycbN/2LLv5TV4ksBDq
	mNFj8qRl9u3+p9QADEPm7B8s02JICgzE=
X-Gm-Gg: AYBFou3LqpAe3Y3i6b5WaByyaaceXnNz36C22se7lmhTtnntXSNlpthjvN/BdndyuH0
	7ciwqgh//+WWwNbCu/y+wqi8pPR6xCk2gtwDhziBBdou+1R2+fO3KhrlkTl4FrHUVfCuhLvR8n3
	EYAtHZcSCS94Xq8s9FNy29xhDEIEn+Gjc8JdYE+jQ1mizSJZXrWmrsk7qkC5Itr6SMSgA6iefxl
	H/7OwPg3UVX3voPOF3PuGCZfFlbBjQJUPJDXzEGtZxlfGb0tQTgbiCkT3w+WbxQyzH8iMpbtwkx
	60hoLWr9EiVwzxCeyYRImYsaLeYoBB7F4ZWAoNMIv+/6qBEW4xEFRysNkXI5Nvl8SUt/r04iFPD
	+naJyIiCFuA6DPnTR0c/KG4V+5JM87W9UkclKjTi5cdXvNHbFUa6V23dq9v6ZV7yLMzo5Iu6Uei
	HkCWYa4XuvleyK1B16KX8Jh3feqZL+9ZIchWx+ZKVeevePDIn2zKw=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr28158500eec.1.1791996271702; Wed, 14 Oct 2026
 09:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 18:44:18 +0200
X-Gm-Features: AclHuK_d31yoge0njHjovdIQh7JfJY6W-PLjzMLBq14NjY-schAqigzEJUAQwG8
Message-ID: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_094433_305052_E67B72DC 
X-CRM114-Status: GOOD (  16.46  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNjozN+KAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEknZCByZWFsbHkgbGlrZSB0byBoYXZlIHRoZSBhdHRyaWJ1dGUgYXZh
aWxhYmxlLCBhbmQgSSd2ZSBnb3QgYXQgbGVhc3QKPiBvbmUgdXNlciBJIGNhbiBhcHBseSB0b2Rh
eSB0aGF0IGRvbid0IHJlcXVpcmUgZml4LXVwcyAoc2VxX2ZpbGUpLCBzbwo+IGlmIE1pZ3VlbCBp
cyBva2F5IHdpdGggaXQsIEknZCBsaWtlIHRvIHNuYWcgcGF0Y2ggMSBhbmQgc2VuZCBpdCB3aXRo
Cj4gbXkgc2VxX2ZpbGUgImZpcnN0IHVzZXIiIGZvciB0aGlzIGNvbWluZyBtZXJnZSB3aW5kb3cg
c28gaXQncyBhdmFpbGFibGUKPiBzdGFydGluZyB3aXRoIHY3LjQtcmMxLCBhbmQgd2UgZG9uJ3Qg
ZW5kIHVwIG5lZWRpbmcgdG8gd2FpdCAxMCB3ZWVrcyBmb3IKPiBvdGhlciBzdWJzeXN0ZW1zIHRv
IGJlIGFibGUgdG8gdXNlIGl0LiBBbmQgdGhlIGtvYmogZml4dXBzIGNhbiBjb250aW51ZQo+IGlu
IHBhcmFsbGVsLiBEb2VzIHRoYXQgc291bmRzIG9rYXk/CgpPZiBjb3Vyc2UsIHBsZWFzZSBmZWVs
IGZyZWUgdG8gcGljayBpdCB1cCAod2l0aCB0aGUgc21hbGwgdHdlYWsgSQpyZXF1ZXN0ZWQpIGlm
IHlvdSBoYXZlIGEgdXNlci4KCkFuZCBpZiB5b3UgZG9uJ3QgcGljayB0aGUgdXNlciwgSSBjb3Vs
ZCBzdGlsbCBwaWNrIHRoZSBmaXJzdCBwYXRjaCB1cAp0aHJvdWdoIHRoZSBjb21waWxlciBhdHRy
aWJ1dGVzIHRyZWUgaWYgeW91IGFuZCBvdGhlciBmb2xrcyB3YW50IHRvCnVzZSBpdCBhZnRlciAt
cmMxLgoKR3JlZzogYWRkaW5nIHRoZSBhdHRyaWJ1dGUgaXRzZWxmIHNob3VsZCBiZSBzYWZlIGFu
ZCB3b3VsZCB1bmJsb2NrCm90aGVycyB0aGF0IG1heSB3YW50IHRvICJwcm90ZWN0IiB0aGVtc2Vs
dmVzLCB3aXRob3V0IGhhdmluZyB0byB3YWl0CmZvciBldmVyeSBwb3RlbnRpYWwgdXNlciB0byBn
ZXQgZml4ZWQgKGJ1dCBvZiBjb3Vyc2UgSSBhZ3JlZSB0aGV5CnNob3VsZCBnZXQgZml4ZWQgLS0g
d2Ugc2hvdWxkIG5vdCBmb3JnZXQgYWJvdXQgdGhlbSwgaWYgdGhhdCBpcyB5b3VyCmNvbmNlcm4p
LgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
