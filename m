Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21265C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A9120829
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHgEIfW0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfkUHHya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A9120829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=66tqM+jNSyWKUmyfwK1zkb2lT4zKjxpeIipgy8QdM3o=; b=oHgEIfW05a1qtJo8j0F8IF2vu
	y+33jI9z9FU//gB3g8KZBN36IIYLLay4jnDDHfvb3cpMwH2nIqq6v2Bq5MGyavAdzXkebctLdK4Pu
	cVITA6G8S8MNrFxoeyySzZNwG+HOUoYRtm1HB5L3KC0F3y6fw271SOoPu14XNSjZVvAxZnOYP5QbL
	aY1xZar+vJtehQNE5DFFZxcruzOmGYjq20e+aXuui6dVbX+s0GYrzKPFd07x12kn7LDg9kigLobVq
	T0g7KDk9SVm4+PsviZMO4efs3zRQ9ORTftlVWQ7fZSesFJKmDAdAid7WHmbdOof+0ySaKdo9xxEL9
	3/2/4RIRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTtE-0003Zv-7W; Fri, 16 Oct 2020 17:51:40 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTtB-0003ZO-Ii
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 17:51:39 +0000
Received: by mail-il1-x12b.google.com with SMTP id l16so3570043ilj.9
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RKvjTH9HSFpSfTXEh3IUAvFiv9ub1nbm/awIa2h+row=;
 b=DfkUHHyahP5gsJHa1Htm7kpiKPn+bi9sHIy0MU15G4K/IcAdcNgl49YNQB0f2jNHXB
 JrpzSWbl+i4+MGdRvwEe8ykSF3TxRREDQlSfPbNJbt9iNO5OJCmG0Dys62W4+ETGi3J5
 dayOY9/QEdHyn4vnORp6hwxMepzNqcpuEg9iUqr+5PSZs+TdiPCy9Qw4Kl/GVNr5ppyb
 8HV3+zlVAYrNcvJJjkxvYrgAdNepYBlXwojWZ/HnYrcFO7/af2+X+5Wluzy0reYIv1q/
 nUxt2HwfmpQXyOcPJLPaxsLVGuCdraB+fKNnuvIrg69ze1c+rU+rA45q9jBYhTUOaEaX
 7p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RKvjTH9HSFpSfTXEh3IUAvFiv9ub1nbm/awIa2h+row=;
 b=uFgSAnjYGVTznTlH4XVnwMSlGFmts2gG3q4sZLO8R9nXgHeIs3jOoZV4kZvuB3gc5y
 lNhhScJob5M7UdDrV8xX24lWvpDYXt0PQJKWMXl7UZXHAPuQe7ImDJmSy9E/aBgc33fC
 qGMokxHLO8ZoYBr7cbLtUirPMZfr02RPb6zZDtrsjFowQoXkJ17AhPVjATh0BpuG2jyN
 3/DS34dtp1M+L3810fZSgjMfgj0QI9wJVFQigEsuTEhFWXMBEf9mHT2yVfnLBZdwvcWT
 rRzbypf8NiHuoCHY8YDqdfhX114DFWqt9hb9J6ERafFBD1iylDNiBcbcyX+d+7q6jGUX
 oKpA==
X-Gm-Message-State: AOAM533tirTu4voNERmLaFdUPcETp77i06NQATgUcBDmaILLd0A7HPxk
 g5zCsJWP+DhLLZgZMe3ylCbJ8LpT3xWLv9WwibU=
X-Google-Smtp-Source: ABdhPJwNU70NOv89Moa4oxYP9AbWCieiHd90g1gGGRly0u2GUxrQdGcGjvMf3eZR7123b4s0A7GE6KZXoMGuMbpA9DM=
X-Received: by 2002:a92:de0f:: with SMTP id x15mr3711339ilm.164.1602870694695; 
 Fri, 16 Oct 2020 10:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
 <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
 <20201016191424.2a41b632@xps13>
In-Reply-To: <20201016191424.2a41b632@xps13>
From: Han Xu <xhnjupt@gmail.com>
Date: Fri, 16 Oct 2020 12:51:24 -0500
Message-ID: <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_135137_640389_5A275225 
X-CRM114-Status: GOOD (  27.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMTYsIDIwMjAgYXQgMTI6MTQgUE0gTWlxdWVsIFJheW5hbAo8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBIYW4sCj4KPiBIYW4gWHUgPHhobmp1cHRA
Z21haWwuY29tPiB3cm90ZSBvbiBGcmksIDE2IE9jdCAyMDIwIDEyOjA5OjIyIC0wNTAwOgo+Cj4g
PiBPbiBUaHUsIE9jdCAxNSwgMjAyMCBhdCAyOjI1IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBIYW4sCj4gPiA+Cj4gPiA+
IEhhbiBYdSA8eGhuanVwdEBnbWFpbC5jb20+IHdyb3RlIG9uIFdlZCwgMTQgT2N0IDIwMjAgMjI6
MDk6NTYgLTA1MDA6Cj4gPiA+Cj4gPiA+ID4gT24gV2VkLCBPY3QgMTQsIDIwMjAgYXQgODozNSBQ
TSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEhpIEhhbiBYdSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBXZWQsIE9jdCAxNCwgMjAy
MCBhdCA2OjM4IFBNIEhhbiBYdSA8eGhuanVwdEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gSGkgTWlxdWVsLCB0aGUgY2hhbmdlcyB0byB0aGUgbmVzdGVkIHN3aXRjaCBz
dGF0ZW1lbnQgbWFrZSB0aGUgbG9naWMKPiA+ID4gPiA+ID4gb2YgdGhpcyBicmVhayB3cm9uZy4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBDYXJlIHRvIHNlbmQgYSBmaXgsIHBsZWFzZT8KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBXZSBoYXZlIHNlZW4gRUNDIE5BTkQgcmVncmVzc2lvbnMgb24gbXgyNyBhbmQg
TFMyMDg4IHBsYXRmb3Jtcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbiB3aGljaCBwbGF0Zm9ybSBk
aWQgeW91IG5vdGljZWQgdGhlIEVDQyBpc3N1ZT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MK
PiA+ID4gPgo+ID4gPiA+IEhpIEZhYmlvLAo+ID4gPiA+Cj4gPiA+ID4gQ0kgdGVzdCByZXBvcnRl
ZCBhbGwgTFMgcGxhdGZvcm1zIGhhdmUgdGhlIEVDQyByZWdyZXNzaW9uLiBUaGUgZXJyb3IKPiA+
ID4gPiBpcyAiRHJpdmVyIG11c3Qgc2V0IGVjYy5zdHJlbmd0aCB3aGVuIHVzaW5nIGhhcmR3YXJl
IEVDQyIKPiA+ID4gPgo+ID4gPiA+IEkgaGF2ZW4ndCB3b3JrZWQgb24gYW55IExTIHBsYXRmb3Jt
cyBzbyBJIHRlc3RlZCBvbiBpLk1YIHBsYXRmb3Jtcwo+ID4gPiA+IHdpdGggZ3BtaSBOQU5EIGNv
bnRyb2xsZXIsCj4gPiA+ID4gdGhlIGNvZGUgcmFuIGludG8gTkFORF9FQ0NfRU5HSU5FX1RZUEVf
U09GVCBkdWUgdG8gdGhpcyBpc3N1ZS4gU28KPiA+ID4gPiB0aGVzZSBhcmUgdHdvIGRpZmZlcmVu
dCBpc3N1ZXMsIEkgY2FuIHNlbmQgYSBwYXRjaCB0byBmaXggdGhlIG5lc3RlZAo+ID4gPiA+IHN3
aXRjaCBzdGF0ZW1lbnQgcHJvYmxlbSBidXQgd29uJ3QgZml4IHRoZSBMUyBwbGF0Zm9ybSBpc3N1
ZS4KPiA+ID4KPiA+ID4KPiA+ID4gSSB0aGluayB0aGUgZmFjdCB0aGF0IHRoZSBleGVjdXRpb24g
cmFuIGludG8gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVAo+ID4gPiBoYXMgYmVlbiBmaXhlZC4g
SG93ZXZlciB0aGVyZSBpcyBzdGlsbCB0aGUgb3RoZXIgaXNzdWUgdGhhdCBJIGFtIHVuYWJsZQo+
ID4gPiB0byBmaW5kIGp1c3QgYnkgcmVhZGluZyB0aGUgY29kZSA6Lwo+ID4KPiA+IENvdWxkIHlv
dSBwbGVhc2Ugc2VuZCBtZSB0aGUgbGluayBvZiB0aGUgZml4IHBhdGNoLCBJIGNhbiB0ZXN0IGl0
IG9uCj4gPiBpLk1YIHBsYXRmb3Jtcy4KPgo+IFRoZSBmaXggaXMgaW4gbmV4dCBzaW5jZSBtb3Jl
IHRoYW4gYSB3ZWVrLCBpZiB5b3Ugc3RpbGwgaGF2ZSB0aGUgaXNzdWUKPiB0aGVuIGl0J3MgcHJv
YmFibHkgdGhlIHNhbWUgaXNzdWUgdGhhdCBzYXNjaGEgcmVwb3J0ZWQgaW4gYW5vdGhlcgo+IHRo
cmVhZCBhbmQgaW4gdGhpcyBjYXNlIGRlYnVnZ2luZyBmcm9tIHlvdXIgc2lkZSBpcyB3ZWxjb21l
LgoKSWYgSSBhbSBjb3JyZWN0LCB0aGUgcGF0Y2ggIm10ZDogcmF3bmFuZDogRml4IHdyb25nZnVs
IGZhbGx0aHJvdWdoCk5BTkRfRUNDX1NPRlQiIGlzIHRoZSBmaXguIEJ1dCBJIGRpZG4ndCBzZWUg
aXQgaW4gdGhlIG5leHQgYnJhbmNoLApvbmx5IHRoZSBvdGhlciB0d28gcGF0Y2hlcyBpbiB0aGUg
cGF0Y2ggc2V0IGFwcGxpZWQuCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgoKLS0gClNpbmNlcmVs
eSwKCkhhbiBYVQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
