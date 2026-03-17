Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28FBFB5EA8
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 03:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQb24UNny7ww1zFRLIySFeg0f9zVQHmlzZIUI+MCkFw=; b=1wYNqd0MfAnnEL
	6+hN0/A2+y8mNKSyznfv+kiVmkyBB9HDug4/7aGoueLmveZV9pIwzk2+EcysoGn57EdzTbIVLnwGh
	MFvsKlgYlEbN5jjmHUOejOTjorPGjcjw/YMCZKn4FIB2CDmTxUdLkf64DtYPmyFn88mNwHCAHVBvQ
	iXUvSkG24/1tKRCAmzrPy/HcXQomveT3BZG+GjVLVqERkoLFZrugYRRr9g8lw6J1ukLpQfZzXzMFz
	pFFjheqNPs9NW37K3lNSyBWdvs1qv862SbF5W06++d5zlF/TIyKwy1SUD0vS29WagTQfy18RBPro/
	K6spKWrFzRO5zN1GWyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LJn-00000005L05-0QK2;
	Tue, 17 Mar 2026 03:42:07 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LJk-00000005Kz0-0SIn
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 03:42:05 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-661169cd6d8so3748a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 20:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773718922; cv=none;
        d=google.com; s=arc-20240605;
        b=cvxatAkrhoRcbaG94bBnFc/FITRvxMAvvuiMCRl3tf+9kXsOqY6GXbOz9RQHO+5Lou
         Sue7AOEKhIgL08cOpDBWMhefyHeMuI0rSI/LcqcsUEeSRJkHrVzU2iPOLJfS9RSrucBF
         akznW2EkuRePwyyxDqgefM1l3i29r/+yt0rO/QZOFOZEKPyi1yOry9dJDdQCNMZtGZs6
         us9OmIe9BUUji8xOPepX8xD8lK7ReGNRzm+P7d/KcuDSmdES7NIDeelpUzZITT+sPAak
         V8EEZUO7j8SYV4uQculvPyo1UnkIlQdc8T55MMGbq2h0UV2ewmE96X4SwI8sTuWjs6Qd
         BxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        fh=q/v6gRBs91tC8uwvFUhImjtvomt41AKGmj8P+0mnidk=;
        b=kgi/Coozjq4MKonZ8DORYNqE1kkEVZ6R28HVQzM7GBlcFBb2ABbE7RNlRae+IqS0KV
         Vus18K4QX0I+RT2MIrFOPmSphbB4W5FuPwoLPNNikrQGyd2Jru4Zoe7IuPJJshneW0eZ
         myvmqAGM/DnYdHa0PdK9otpmzX4/S6xGhRlrdgUZhu9HF1pJo/mGJgdK+kEeSwYSbrFy
         ZvlOtALStPh7AYpHoZty81Bh+uZWTIuvmB06txJDkH262UhEnpm510FSXGa3Zkz/JzEn
         +53Fw3Dd3s1I9tAwsJA//ywqUQaqYeaAShoRgNrAEgXz76jYlQKGIzwGWw1FWEPsBn0m
         qdbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773718922; x=1774323722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        b=T/C3+Qd8FDElqfeEmeckupONqlo0TOVc8nbEjYL+pbm2BnVfkwk853pYIk2YMGCiIk
         PzJFDYiuGfVRlFVE7OHvqOBSARGELrSDa2dprcZ5iBW6BHAmkAjJHYy0MhQQLCHGXQhM
         Ck23evp085hHCzsvvzb8FuKRhsGoPwuOPZpjVz5ZwzNyEZwB345g01s6pGAUc1UU0Fup
         iWtZtmEVOFbgdpvlZCEfWBCW84zJZIcVE2zS/t7h1qyITG0WhPgpv5gc178RPsfcCEFg
         Gn+Rqo6DqbstwZUsseelKK9E+bQUzmboHCQD7GJ/csPpQtlTQ6hXxUrCbhAC4j9mRyVe
         2ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718922; x=1774323722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        b=LrHPg/Ai+LY+sEjBy1MXYcGy6NSpS3yb+VxduFuxEKCt0u9m9n/pdMAKeQsMP/oT6E
         vuwhhjmuTf8M8X3YP3FYM3rRbIH+TL4RNboic7EH5BmYZQ3GRzyCaxYakBZ0td5T5hJ2
         Swy7cys7imrfz8//Q62ChkcoyZxjIka7uGQp4pjhYb6Hg3gLgvHkTtBum0PacQRQj5iG
         IKEDZyo355P5ZJNlwzDPqbtW8U9YUWNMEztTtNOyRsu7PwKzHL7boBfZp8bOqffOugb+
         aroI/zGmTWadB7z7B1Ftc9QvMtHr1L4+4GPAYZgdp5JeCdk58XqtoaRr3+32Dxu7wPul
         snVw==
X-Forwarded-Encrypted: i=1; AJvYcCVxU+G4BemLxcdhE02xFgBdSbDmi5RJkDeKo4mi/V4CpHRCskRHrBQmqAftTGABhbezjTFxLV94XdA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGK3MD2uPKx/28UTCwQBpliyYBGHQlnIwQrbDhJaYXgddqsccO
	9KVLwoBksDazK8u7dBX+8rpDecFBJNhcU8j9WqEI+3WukxcNVFX1+O882mk2lcFsGzeHnDqpQDs
	renU49p3D2UatgmYKitlsx5orK2/ag34L57ti1LHV
X-Gm-Gg: ATEYQzzz2uXTcB3xjoV4htu0/zELdrN+QcX4mxdAXIpAVvjxMTHbpNNfroui8s772hX
	6uUWvri0m/ZuSkTYlfGHfSSrZU6Quz+EryNzQKjqq1frjMws0K8+U3SV85kG6ZjE4bdiBpMuKDq
	XbxMoGDm223SsZ5VYe1PJuODPt3CFuoCGr3QPI3j4L8UrrvA09hsc8VAiLGipk0FIn06lgRmD3d
	e1HDFX+pYZiRBDKjTcagK423q1rlZpznqkR22lMzQ9OXSgO4tUSGQI3XdX/6epD1+3L/faWE5Re
	P3wMzQ==
X-Received: by 2002:a05:6402:5047:b0:667:926:56e with SMTP id
 4fb4d7f45d1cf-6671449f938mr28406a12.2.1773718921655; Mon, 16 Mar 2026
 20:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com> <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
In-Reply-To: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 20:41:48 -0700
X-Gm-Features: AaiRm51L9yY6IK4TcJFLhN8NGwQS7Z64sx0O9EJzSXirWOtaRRhN6Ww7XVogluY
Message-ID: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping failure
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
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
X-CRM114-CacheID: sfid-20260316_204204_183642_72AC32A8 
X-CRM114-Status: GOOD (  47.36  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNzoyOeKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDc6
MzI6NTRQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4gT24gRnJpLCBNYXIg
MTMsIDIwMjYgYXQgNTowMOKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAwNDowNzo0
M0FNIC0wNzAwLCBVc2FtYSBBcmlmIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgMTIgTWFyIDIwMjYg
MjA6Mjc6MjAgKzAwMDAgIkxvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSIgPGxqc0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gQ29tbWl0IDlkNTQwM2IxMDM2YyAoImZzOiBjb252
ZXJ0IG1vc3Qgb3RoZXIgZ2VuZXJpY19maWxlXyptbWFwKCkgdXNlcnMgdG8KPiA+ID4gPiA+IC5t
bWFwX3ByZXBhcmUoKSIpIHVwZGF0ZWQgQUZTIHRvIHVzZSB0aGUgbW1hcF9wcmVwYXJlIGNhbGxi
YWNrIGluIGZhdm91ciBvZgo+ID4gPiA+ID4gdGhlIGRlcHJlY2F0ZWQgbW1hcCBjYWxsYmFjay4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBIb3dldmVyLCBpdCBkaWQgbm90IGFjY291bnQgZm9yIHRoZSBm
YWN0IHRoYXQgbW1hcF9wcmVwYXJlIGNhbiBmYWlsIHRvIG1hcAo+ID4gPiA+ID4gZHVlIHRvIGFu
IG91dCBvZiBtZW1vcnkgZXJyb3IsIGFuZCB0aHVzIHNob3VsZCBub3QgYmUgaW5jcmVtZW50aW5n
IGEKPiA+ID4gPiA+IHJlZmVyZW5jZSBjb3VudCBvbiBtbWFwX3ByZXBhcmUuCj4gPgo+ID4gVGhp
cyBpcyBhIGJpdCBjb25mdXNpbmcuIEkgc2VlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRv
ZXMKPiA+IGFmc19hZGRfb3Blbl9tbWFwKCkgYW5kIHRoZW4gaWYgZ2VuZXJpY19maWxlX21tYXBf
cHJlcGFyZSgpIGZhaWxzIGl0Cj4gPiBkb2VzIGFmc19kcm9wX29wZW5fbW1hcCgpLCB0aGVyZWZv
cmUgcmVmY291bnRpbmcgc2VlbXMgdG8gYmUgYmFsYW5jZWQuCj4gPiBJcyB0aGVyZSByZWFsbHkg
YSBwcm9ibGVtPwo+Cj4gRmlyc3RseSwgbW1hcF9wcmVwYXJlIGlzIGludm9rZWQgYmVmb3JlIHdl
IHRyeSB0byBtZXJnZSwgc28gdGhlIFZNQSBjb3VsZCBpbgo+IHRoZW9yeSBnZXQgbWVyZ2VkIGFu
ZCB0aGVuIHRoZSByZWZjb3VudGluZyB3aWxsIGJlIHdyb25nLgoKSSBzZWUgbm93LiBPaywgbWFr
ZXMgc2Vuc2UuCgo+Cj4gU2Vjb25kbHksIG1tYXBfcHJlcGFyZSBvY2N1cnMgYXQgc3VjaCBhdCB0
aW1lIHdoZXJlIGl0IGlzIF9wb3NzaWJsZV8gdGhhdAo+IGFsbG9jYXRpb24gZmFpbHVyZXMgYXMg
ZGVzY3JpYmVkIGJlbG93IGNvdWxkIGhhcHBlbi4KClJpZ2h0LCBidXQgaW4gdGhhdCBjYXNlIGFm
c19maWxlX21tYXBfcHJlcGFyZSgpIHdvdWxkIGRyb3AgaXRzCnJlZmNvdW50IGFuZCByZXR1cm4g
YW4gZXJyb3IsIHNvIHJlZmNvdW50aW5nIGlzIHN0aWxsIGdvb2QsIG5vPwoKPgo+IEknbGwgdXBk
YXRlIHRoZSBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBtZXJnZSBhc3BlY3QgYWN0dWFs
bHkuCgpUaGFua3MhCgo+Cj4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdpdGggdGhlIG5ld2x5IGFk
ZGVkIHZtX29wcy0+bWFwcGVkIGNhbGxiYWNrIGF2YWlsYWJsZSwgd2UgY2FuIHNpbXBseSBkZWZl
cgo+ID4gPiA+ID4gdGhpcyBvcGVyYXRpb24gdG8gdGhhdCBjYWxsYmFjayB3aGljaCBpcyBvbmx5
IGludm9rZWQgb25jZSB0aGUgbWFwcGluZyBpcwo+ID4gPiA+ID4gc3VjY2Vzc2Z1bGx5IGluIHBs
YWNlIChidXQgbm90IHlldCB2aXNpYmxlIHRvIHVzZXJzcGFjZSBhcyB0aGUgbW1hcCBhbmQgVk1B
Cj4gPiA+ID4gPiB3cml0ZSBsb2NrcyBhcmUgaGVsZCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
cmVmb3JlIGFkZCBhZnNfbWFwcGVkKCkgdG8gaW1wbGVtZW50IHRoaXMgY2FsbGJhY2sgZm9yIEFG
Uy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbiBwcmFjdGljZSB0aGUgbWFwcGluZyBhbGxvY2F0aW9u
cyBhcmUgJ3RvbyBzbWFsbCB0byBmYWlsJyBzbyB0aGlzIGlzCj4gPiA+ID4gPiBzb21ldGhpbmcg
dGhhdCByZWFsaXN0aWNhbGx5IHNob3VsZCBuZXZlciBoYXBwZW4gaW4gcHJhY3RpY2UgKG9yIHdv
dWxkIGRvCj4gPiA+ID4gPiBzbyBpbiBhIGNhc2Ugd2hlcmUgdGhlIHByb2Nlc3MgaXMgYWJvdXQg
dG8gZGllIGFueXdheSksIGJ1dCB3ZSBzaG91bGQgc3RpbGwKPiA+ID4gPiA+IGhhbmRsZSB0aGlz
Lgo+ID4KPiA+IG5pdDogSSB3b3VsZCBkcm9wIHRoZSBhYm92ZSBwYXJhZ3JhcGguIElmIGl0J3Mg
aW1wb3NzaWJsZSB3aHkgYXJlIHlvdQo+ID4gaGFuZGxpbmcgaXQ/IElmIGl0J3MgdW5saWtlbHks
IHRoZW4gaGFuZGxpbmcgaXQgaXMgZXZlbiBtb3JlCj4gPiBpbXBvcnRhbnQuCj4KPiBTdXJlIEkg
Y2FuIGRyb3AgaXQsIGJ1dCBpdCdzIGFuIG9uZ29pbmcgdGhpbmcgd2l0aCB0aGVzZSBzbWFsbCBh
bGxvY2F0aW9ucy4KPgo+IEkgd2lzaCB3ZSBjb3VsZCBqdXN0IG1vdmUgdG8gYSBzY2VuYXJpbyB3
aGVyZSB3ZSBjYW4gc2ltcHkgYXNzdW1lIGFsbG9jYXRpb25zCj4gd2lsbCBhbHdheXMgc3VjY2Vl
ZCA6KQoKVGhhdCB3b3VsZCBiZSByZWFsbHkgbmljZSBidXQgdW5mb3J0dW5hdGVseSB0aGUgd29y
bGQgaXMgbm90IHRoYXQKcGVyZmVjdC4gSSBqdXN0IGRvbid0IHdhbnQgdG8gYmUgY2hhc2luZyBz
b21lIHJhcmVseSByZXByb2R1Y2libGUgYnVnCmJlY2F1c2Ugb2YgdGhlIGFzc3VtcHRpb24gdGhh
dCBhbiBhbGxvY2F0aW9uIGlzIHRvbyBzbWFsbCB0byBmYWlsLgoKPgo+IFZsYXN0YSAtIHRob3Vn
aHRzPwo+Cj4gQ2hlZXJzLCBMb3JlbnpvCj4KPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gIGZzL2Fmcy9maWxlLmMgfCAyMCArKysrKysrKysrKysrKysrLS0t
LQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9hZnMvZmlsZS5jIGIvZnMv
YWZzL2ZpbGUuYwo+ID4gPiA+ID4gaW5kZXggZjYwOTM2NmZkMmFjLi42OWVmODZmNWUyNzQgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS9mcy9hZnMvZmlsZS5jCj4gPiA+ID4gPiArKysgYi9mcy9hZnMv
ZmlsZS5jCj4gPiA+ID4gPiBAQCAtMjgsNiArMjgsOCBAQCBzdGF0aWMgc3NpemVfdCBhZnNfZmls
ZV9zcGxpY2VfcmVhZChzdHJ1Y3QgZmlsZSAqaW4sIGxvZmZfdCAqcHBvcywKPiA+ID4gPiA+ICBz
dGF0aWMgdm9pZCBhZnNfdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFyZWEpOwo+ID4g
PiA+ID4gIHN0YXRpYyB2b2lkIGFmc192bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFy
ZWEpOwo+ID4gPiA+ID4gIHN0YXRpYyB2bV9mYXVsdF90IGFmc192bV9tYXBfcGFnZXMoc3RydWN0
IHZtX2ZhdWx0ICp2bWYsIHBnb2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2ZmX3QgZW5kX3Bnb2ZmKTsK
PiA+ID4gPiA+ICtzdGF0aWMgaW50IGFmc19tYXBwZWQodW5zaWduZWQgbG9uZyBzdGFydCwgdW5z
aWduZWQgbG9uZyBlbmQsIHBnb2ZmX3QgcGdvZmYsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqKnZtX3ByaXZhdGVfZGF0YSk7Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgYWZzX2ZpbGVfb3Bl
cmF0aW9ucyA9IHsKPiA+ID4gPiA+ICAgICAub3BlbiAgICAgICAgICAgPSBhZnNfb3BlbiwKPiA+
ID4gPiA+IEBAIC02MSw2ICs2Myw3IEBAIGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJh
dGlvbnMgYWZzX2ZpbGVfYW9wcyA9IHsKPiA+ID4gPiA+ICB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGFmc192bV9vcHMgPSB7
Cj4gPiA+ID4gPiArICAgLm1hcHBlZCAgICAgICAgID0gYWZzX21hcHBlZCwKPiA+ID4gPiA+ICAg
ICAub3BlbiAgICAgICAgICAgPSBhZnNfdm1fb3BlbiwKPiA+ID4gPiA+ICAgICAuY2xvc2UgICAg
ICAgICAgPSBhZnNfdm1fY2xvc2UsCj4gPiA+ID4gPiAgICAgLmZhdWx0ICAgICAgICAgID0gZmls
ZW1hcF9mYXVsdCwKPiA+ID4gPiA+IEBAIC01MDAsMTMgKzUwMywyMiBAQCBzdGF0aWMgaW50IGFm
c19maWxlX21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4gPiA+ID4g
ICAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+ID4gPgo+ID4gPiA+IElzIHRoZSBhYm92
ZSBhZnNfYWRkX29wZW5fbW1hcCBhbiBhZGRpdGlvbmFsIG9uZSwgd2hpY2ggY291bGQgY2F1c2Ug
YSByZWZlcmVuY2UKPiA+ID4gPiBsZWFrPyBEb2VzIHRoZSBhYm92ZSBvbmUgbmVlZCB0byBiZSBy
ZW1vdmVkIGFuZCBvbmx5IHRoZSBvbmUgaW4gYWZzX21hcHBlZCgpCj4gPiA+ID4gbmVlZHMgdG8g
YmUga2VwdD8KPiA+ID4KPiA+ID4gQWggeWVhaCBnb29kIHNwb3QsIHdpbGwgZml4IHRoYW5rcyEK
PiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICByZXQgPSBnZW5lcmljX2ZpbGVf
bW1hcF9wcmVwYXJlKGRlc2MpOwo+ID4gPiA+ID4gLSAgIGlmIChyZXQgPT0gMCkKPiA+ID4gPiA+
IC0gICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZhZnNfdm1fb3BzOwo+ID4gPiA+ID4gLSAgIGVs
c2UKPiA+ID4gPiA+IC0gICAgICAgICAgIGFmc19kcm9wX29wZW5fbW1hcCh2bm9kZSk7Cj4gPiA+
ID4gPiArICAgaWYgKHJldCkKPiA+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArICAgZGVzYy0+dm1fb3BzID0gJmFmc192bV9vcHM7Cj4gPiA+ID4g
PiAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gK3N0YXRp
YyBpbnQgYWZzX21hcHBlZCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwg
cGdvZmZfdCBwZ29mZiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBm
aWxlICpmaWxlLCB2b2lkICoqdm1fcHJpdmF0ZV9kYXRhKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+
ICsgICBzdHJ1Y3QgYWZzX3Zub2RlICp2bm9kZSA9IEFGU19GU19JKGZpbGVfaW5vZGUoZmlsZSkp
Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+
ID4gPiA+ICsgICByZXR1cm4gMDsKPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAg
c3RhdGljIHZvaWQgYWZzX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiA+
ID4gPiAgewo+ID4gPiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKEFGU19GU19JKGZpbGVfaW5v
ZGUodm1hLT52bV9maWxlKSkpOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuNTMuMAo+ID4gPiA+
ID4KPiA+ID4gPiA+Cj4gPiA+Cj4gPiA+IENoZWVycywgTG9yZW56bwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
