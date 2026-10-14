Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D12CCC6B2C
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wV5sU7TONsXvcH4kdXjhVdR2arByR8726o6EFNRF5lI=; b=m7LZM2O8yluKTq
	ICPfiV2iUFG/KxeefPUkfJur1KWfqAjRU1VPRIyhPch3zSlsaaNwvWTmUf045agwSkki7Y4WIM35i
	ILntcYlMkTaRTBPeFleztbiWtSaBftRtI3HO11XAkQMkhwPgT7Dzmyv2JwwP9JGYOSsKreAHjBdEK
	vSKNsArp+q/bHbQRDP6FWqEYr9mEM/RW0vf3V1UCIdgEpH2E7WfYOb6ggo2K7Anepqjvq4fLiKBXk
	CbGLjnLl4k1K9Qvm75/FTAXwzCAco2aOQPE6Xzp1MnaBSEWnyW+jXdLsbH4pxeky7yURycxx1oAOK
	rIAg7ayIfpv3cuCN+cZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH22y-0000000G15m-3j4A;
	Wed, 14 Oct 2026 16:41:44 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH22w-0000000G153-3P7Q
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:41:43 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-533202fe429so1289051cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 09:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996099; cv=none;
        d=google.com; s=arc-20260327;
        b=hhpeW6ZzaZ7ldqhKm+c9FwY+ixPTKO43rmtXq/65HCffZ7/PKMYVGO3rj1aAfAQmYH
         iI1GPJNHDvBVDoHkXfVWmXyu5Q2G/0gs0DwfqvggxJC3b2C9Ts1ukzy4sPiFmiMzIVIm
         BfGDLmE4s4Gc6zvjUMSnECojZI+ux++H8cSyRkc2RIRARMqcPjOpCwr5Vefxa6SWpDrP
         hB9gtdLzohxVbRcneRA3fFtQAiJW75ZsKwWnM1AuVFLlauEuOZfI6rxISAC+QCNvqvbg
         ie6F7lCmZueBahvk4zAC6JtAYadxrHNdXsJVtjchxbRQzeUbN10X+lPhG3gxNzCqPwCC
         cOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        fh=nrnaQS6QklOQIG0UHuCdrk954pE4JYi4dZrGmQ4Vqp4=;
        b=iCveevPFfCCNxXbhE6FvJL5MDqVtshI0d5zxZEEFQXuFLWgB2FqbvciE/jpVKD5sF2
         9P831MH6zWFsQ3RcQd1v+mkMPyw7YSwRhDEqsbxqE+0OAHNsy2iVNV7J+g+UHWY+aMw8
         EgT2P1r+KQIliVOAEdt+3sBBvbB/aK+xfd2pWu19VKx0e0DeLtUJoiBxViHcBnWuf5fo
         4IGE/qISH+aEqDmvbsViQ1YbgvXGLVrSplp790GTLfWhkSir9yxwK9JPwmEWyDcoeJRK
         R8wRzTNhGrAuzeVTkRlJbVGv9hdgjNWE9qaKoik6aBWs35Zo3qRl9mxZx6QAiZioVupN
         ZMxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996099; x=1792600899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=HJqARfnXqx/tEfUmWkbBi9SDdZ2xDCQ26EJtSsnVtJcdSbYXVnQepuidqYAnRU+Izd
         Uy6iUUKWpBw41VI3GAbqqiGrPLxsBbmrOSDz2IMrbMkf9xj/MJ+pMag8VhEMGg6zfbSC
         s9Cnyxdz/jbxc+MwYwSt0BNiSeYgzuhI5yZqZSOWOQpMgX8s66yA/y74M9VqF5QqovaZ
         Qy6c3aa+ATHaY1umtygwSLnY44hLK2MZl2BYJETwWVr4NIK9HldfGzSginOZNGe+xOX+
         NHY3j7Sd9QJKTGVbxjAJRd2i8C3o6pnE67dldasZwcEMYrORc4QIvQ8R784jhsTmyLic
         +Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996099; x=1792600899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=x9tTtlha2Z5sVSugoO6vApgwjIucsKeHBUKDOa8LdTLDjaqJsDYjB6vTyuROG58wzp
         0HRS/INvZpL4TCMrdc6tXXUZx7rgOlKzdGxjONChrNQ5jlOYjoSJ0QLaIvJlH7twd3+6
         u90lYATrw8ppC4wNl6CI3mj4tPApD5+PgUsrUI3xcpNnf+v1JKOz0CxqTsLtc15JkyjU
         3AEF0ja/YtAxwOBVx6T1uQzU8a8Z5/R3h4SD/dlCnfA4tpSH3GlPBXwnax/Mli+D6GOV
         D0OPkWR9hDdeu1cnFU06T1wWiculEbu3e+BcNlt4zralByER/hQ2GmInYVPQMkvZoJd0
         GVeA==
X-Forwarded-Encrypted: i=1; AKwUvBxFYIgW+7FYce1dqhZSy7OAnOTKCbOB5N37qNyReYeofqXkHrr4WQxuEtyzdq6Mr01vvuvd7OzAtO8=@lists.infradead.org
X-Gm-Message-State: AFq9FYKas+pgZDr9IdaLwWQvAYq48hvwgKIjkF6Iql+whSdaihNdcOMS
	4r/iLZuL14lFPyiraa14VqUwKxeShnXhNy7T2tsg5Go+kNZxuvj35PqY/3eYRox5VVjDO+AnDyg
	fvTD5Re39gr1JFp0hzsIQrDgjE+dnm6gp+hiYUWp8
X-Gm-Gg: AYBFou2WlUf36LaCrv4InoFiPTc/+MkGGklA7xwteYfNDIXD3R/ht1flPkUV9HuxuN6
	5H7JiyaT7mwOS6VXv4AtP5zcCx4ictZJCQbfXRNKWhmY9TlQnFOMmLWHaHzEkKl4yPM+tloBXfn
	8Wvc3d5LREWRuGDrY6YgoyldIYOtiI3qAolRh5JAsvw8i+Oz9doHOHv8Y9LLYcWKz8BpYMBlLV0
	wFrd4esdbclFStIdDy6KLWX1Q6ujlwVeTluZitGyjZSpRnYfNNc2dkK2vTWc2yHTcKm3JBFanHT
	Dfs294pRVSwLeCFn9tKsH0iFjssRM/lWf2OrH7QI0CI1LzBns8pBw65Czd9w9jk5NQXjVU8/bUD
	Dx4h05HKjCw==
X-Received: by 2002:a05:622a:1108:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5360573c96fmr14813151cf.5.1791996097367; Wed, 14 Oct 2026
 09:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Oct 2026 09:41:25 -0700
X-Gm-Features: AclHuK8_g-YOJgMR77fEpf5RTsveF4u_ERdXz6lvoN6wh_uF7KP8ZsaUSV1ti8A
Message-ID: <CAP-5=fVLWh4uay2HGy6DOpZmtTr5WAd-TehAkN+P-pQgq_BZhg@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261014_094142_870022_0030E07A 
X-CRM114-Status: GOOD (  30.51  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgOTozN+KAr0FNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDA3OjM2OjQxQU0gKzAyMDAs
IEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDEzLCAyMDI2IGF0IDAz
OjM5OjM1UE0gLTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+IENsYW5nIHN1cHBvcnRzIHRo
ZSAncmVxdWlyZV9leHBsaWNpdF9pbml0aWFsaXphdGlvbicgYXR0cmlidXRlIG9uIHN0cnVjdAo+
ID4gPiBmaWVsZHMgdG8gZW5mb3JjZSB0aGF0IHRoZSBmaWVsZCBpcyBleHBsaWNpdGx5IGluaXRp
YWxpemVkIHdoZW4gYW4KPiA+ID4gYWdncmVnYXRlIG9iamVjdCBpcyBjb25zdHJ1Y3RlZCwgZW1p
dHRpbmcgLVd1bmluaXRpYWxpemVkLWV4cGxpY2l0LWluaXQKPiA+ID4gKGVuYWJsZWQgYnkgZGVm
YXVsdCkgaWYgdGhlIGZpZWxkIGlzIG9taXR0ZWQuCj4gPiA+Cj4gPiA+IEZvbGxvd2luZyBkaXNj
dXNzaW9uIGF0IHRoZSBMaW51eCBQbHVtYmVycyBDb25mZXJlbmNlIFsxXSwgdGhpcyBzZXJpZXMK
PiA+ID4gaW50cm9kdWNlcyBfX3JlcXVpcmVfZXhwbGljaXRfaW5pdGlhbGl6YXRpb24gaW4KPiA+
ID4gaW5jbHVkZS9saW51eC9jb21waWxlcl9hdHRyaWJ1dGVzLmggYW5kIGFwcGxpZXMgaXQgdG8K
PiA+ID4gc3RydWN0IGtvYmpfdHlwZTo6cmVsZWFzZS4KPiA+Cj4gPiBDb29sLCBzb3JyeSBJIG1p
c3NlZCB0aGF0IHRhbGsuCj4KPiBZZWFoLCBJJ20gcmVhbGx5IGxpa2luZyB0aGVzZSBjb21waWxl
LXRpbWUgY2hlY2tzLiA6KQo+Cj4gPgo+ID4gPiBBcyBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2tv
YmplY3QucnN0IG5vdGVzOgo+ID4gPiAgICJPbmUgaW1wb3J0YW50IHBvaW50IGNhbm5vdCBiZSBv
dmVyc3RhdGVkOiBldmVyeSBrb2JqZWN0IG11c3QgaGF2ZSBhCj4gPiA+ICAgcmVsZWFzZSgpIG1l
dGhvZCwgYW5kIHRoZSBrb2JqZWN0IG11c3QgcGVyc2lzdCAoaW4gYSBjb25zaXN0ZW50IHN0YXRl
KQo+ID4gPiAgIHVudGlsIHRoYXQgbWV0aG9kIGlzIGNhbGxlZC4gSWYgdGhlc2UgY29uc3RyYWlu
dHMgYXJlIG5vdCBtZXQsIHRoZSBjb2RlCj4gPiA+ICAgaXMgZmxhd2VkLiIKPiA+ID4KPiA+ID4g
QW5ub3RhdGluZyBzdHJ1Y3Qga29ial90eXBlOjpyZWxlYXNlIGNhdWdodCAzMCBzdHJ1Y3Qga29i
al90eXBlCj4gPiA+IGRlZmluaXRpb25zIGFjcm9zcyB0aGUgdHJlZSB0aGF0IG9taXR0ZWQgLnJl
bGVhc2U6Cj4gPiA+IC0gUGF0Y2hlcyAyLTEwIGZpeCAxMCBzdHJ1Y3Qga29ial90eXBlIGRlZmlu
aXRpb25zIHdoZXJlIGR5bmFtaWNhbGx5Cj4gPiA+ICAgYWxsb2NhdGVkIGtvYmplY3RzLCBrc2V0
cywgb3IgZW5jbG9zaW5nIHN0cnVjdHVyZXMgd2VyZSBlaXRoZXIgbGVha2VkIG9uCj4gPiA+ICAg
a29iamVjdF9wdXQoKSBvciBmcmVlZCBwcmVtYXR1cmVseSBiZWZvcmUga29iamVjdCByZWxlYXNl
IChyaXNraW5nIGEKPiA+ID4gICB1c2UtYWZ0ZXItZnJlZSB3aGVuIENPTkZJR19ERUJVR19LT0JK
RUNUX1JFTEVBU0U9eSkuCj4gPiA+IC0gUGF0Y2ggMTEgYW5ub3RhdGVzIHN0cnVjdCBrb2JqX3R5
cGU6OnJlbGVhc2Ugd2l0aAo+ID4gPiAgIF9fcmVxdWlyZV9leHBsaWNpdF9pbml0aWFsaXphdGlv
biBhbmQgZXhwbGljaXRseSBzZXRzIC5yZWxlYXNlID0gTlVMTAo+ID4gPiAgICh3aXRoIGV4cGxh
bmF0b3J5IGNvbW1lbnRzKSBvbiB0aGUgcmVtYWluaW5nIGxlZ2FjeSBzdHJ1Y3Qga29ial90eXBl
Cj4gPiA+ICAgZGVmaW5pdGlvbnMgd2hvc2Uga29iamVjdHMgYXJlIHN0YXRpYywgcGVyLUNQVSwg
b3IgZW1iZWRkZWQgaW4gZGV2bS0gb3IKPiA+ID4gICBwYXJlbnQtbWFuYWdlZCBzdHJ1Y3R1cmVz
Lgo+ID4KPiA+IFNvdW5kcyBncmVhdCwgYnV0IGxldCdzIGZpeCB1cCB0aGUgdXNlcnMgYmVmb3Jl
IGFkZGluZyB0aGUgYXR0cmlidXRlLgo+ID4gTG9va3MgbGlrZSBzb21lIG9mIHRoZXNlIG5lZWQg
YW5vdGhlciB2ZXJzaW9uIHNvIGl0IG1pZ2h0IHRha2UgYSBiaXQgb2YKPiA+IHRpbWUgdG8gZ2V0
IHRoZW0gYWxsIG1lcmdlZC4KPgo+IEknZCByZWFsbHkgbGlrZSB0byBoYXZlIHRoZSBhdHRyaWJ1
dGUgYXZhaWxhYmxlLCBhbmQgSSd2ZSBnb3QgYXQgbGVhc3QKPiBvbmUgdXNlciBJIGNhbiBhcHBs
eSB0b2RheSB0aGF0IGRvbid0IHJlcXVpcmUgZml4LXVwcyAoc2VxX2ZpbGUpLCBzbwo+IGlmIE1p
Z3VlbCBpcyBva2F5IHdpdGggaXQsIEknZCBsaWtlIHRvIHNuYWcgcGF0Y2ggMSBhbmQgc2VuZCBp
dCB3aXRoCj4gbXkgc2VxX2ZpbGUgImZpcnN0IHVzZXIiIGZvciB0aGlzIGNvbWluZyBtZXJnZSB3
aW5kb3cgc28gaXQncyBhdmFpbGFibGUKPiBzdGFydGluZyB3aXRoIHY3LjQtcmMxLCBhbmQgd2Ug
ZG9uJ3QgZW5kIHVwIG5lZWRpbmcgdG8gd2FpdCAxMCB3ZWVrcyBmb3IKPiBvdGhlciBzdWJzeXN0
ZW1zIHRvIGJlIGFibGUgdG8gdXNlIGl0LiBBbmQgdGhlIGtvYmogZml4dXBzIGNhbiBjb250aW51
ZQo+IGluIHBhcmFsbGVsLiBEb2VzIHRoYXQgc291bmRzIG9rYXk/CgpJJ20gaGFwcHkgd2l0aCB0
aGF0LiBJJ20gd29ya2luZyB0byBhZGRyZXNzL2luY29ycG9yYXRlIHRoZSBvdGhlcgpmZWVkYmFj
ayBmb3IgYSB2MiBvZiB0aGlzIHNlcmllcywgYnV0IEkgY2FuIGRyb3AgaW5kaXZpZHVhbCBwYXRj
aGVzCnRoYXQgaGF2ZSBhbHJlYWR5IGJlZW4gbWVyZ2VkLiBUaGFua3MsIGV2ZXJ5b25lLCBmb3Ig
dGhlIHBvc2l0aXZlCnJlY2VwdGlvbiBpbiBnZXR0aW5nIHRoaXMgbGFuZGVkLCBJIHBsYW4gdG8g
Zm9sbG93IHVwIHdpdGggcGF0Y2gKc2VyaWVzIGZvciB0aGUgb3RoZXIgdXNlcyBJIGZvdW5kLgoK
VGhhbmtzIQpJYW4KCj4gLS0KPiBLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
