Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E7EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:10:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F8320848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+VJnO/y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ri8RJO6Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F8320848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bFaxKRdrMy+IXkQgx2bwlR6MCb9stRI4aw4Rgwz04UY=; b=P+VJnO/yVmaU1qs/696JuiP7m
	wrUzwQuJ1EYA+jyEO/+cSiP62kHiGVIEtcRmrY8lnNkPzS6QGLrwTWrHfZJNtE+ReYKx/AQ0LrnxI
	F/PyDjflgHQLNQXnoSoe7EdP9X6fObHVeBdzdInegHMBYu+ARkPImpHggif/JryBnX7ecfDFTwNwg
	A/17ZHaLDJMkUd4SCfS1kAI++OjfN7frh3yMjSDuuMfPX1gEAeu47xRh2rlGtBv3CyJ0bFy8Obfa8
	KwS0OC/0sZi2zRuPoqWuoOUWfyXgf3b0Jons9r7SOTuBdIk3ZfTHTN+sxFtiXFi/sGJ/hmd5lvoJV
	XwxENV7nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTEX-0004EE-Ds; Fri, 16 Oct 2020 17:09:37 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTEV-0004DU-3i
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 17:09:36 +0000
Received: by mail-io1-xd44.google.com with SMTP id 67so4718848iob.8
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FKLknodt07OiWHRW4RDyl/foHQG5CqN+JZupvX+WZ7w=;
 b=Ri8RJO6Q8h0O4AUdBgcG6hkgbi5aKP8HWP62gfUJvaSt15w7XLHUDH9zyn7UxN3Nqn
 Zkxg7N8+xQk5M/t23Yg4K2Q00BXmuiQUcQIw7TUnqnTEG1XfZMEzp6qNolawjGdxF4+1
 bxyvQzikAgbVIADLPF6dZ1FNpoONbvXxBRE72+dPyMctE4mWalKeelSAA5MalJvJIEXa
 y4S1kPHbsUr2UHiBlQYNtTjW8srupGm+nnwPslp+hwiIUsHFrwWD8uIiFVbfW9+MJ/Jv
 Kl6tRkzCUNLEfZLcWIfB6U5DOAqYfRdppfMLypo/LuorqnRhGAxDbbQqeyQf3VVDLfuZ
 YGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FKLknodt07OiWHRW4RDyl/foHQG5CqN+JZupvX+WZ7w=;
 b=smkp+L58Y6jjtSDptuB9NQg01SANC+/WE33eFpWNglPqp1blybIc8GJxdF8fLxNye9
 LToykR6kvn1i+0JV9RidxDzAGKhh35zF+ktxdM2cbR7p4Clr0YmD2PMQ5fdWtcsN/Prr
 ndc2aViSBG+7PnxgZj+Ub9UcFSBy5Sf9zebVuczyY7FDUEYKFKyfHioy+iPn1KlTOWNS
 t9vJBg+cp7UmKmeifTSs++mwNmq69Gp501Pn/hRLJnpBQthW5FHOic5E+vO/Wo7jvJNU
 hL+UvVIrC7od99CVo9xeppQAO6xHWbhOMhSIlan6J35OmZXIuYvtdwaHITCW+e1HWQ42
 BQYQ==
X-Gm-Message-State: AOAM532FqX9HAq7jiDLEy7pdeUdsmRlqioCy/kgadZVNbstRQ5zQJsbL
 cxEAHQg5OpDF9sRtHNQuB291Aq/HqkliyXVOotw=
X-Google-Smtp-Source: ABdhPJyx7nEH9qNaE45DpROw5fNsRkq6M2nTPG3jJsVIkCDP64LB/LvMYpSj2VCAwo5eNWntaK1yDrHhtPILZxX0Xao=
X-Received: by 2002:a02:ca03:: with SMTP id i3mr3477382jak.50.1602868173469;
 Fri, 16 Oct 2020 10:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
In-Reply-To: <20201015092502.2ea2a7fc@xps13>
From: Han Xu <xhnjupt@gmail.com>
Date: Fri, 16 Oct 2020 12:09:22 -0500
Message-ID: <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_130935_254145_4D586854 
X-CRM114-Status: GOOD (  20.00  )
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

T24gVGh1LCBPY3QgMTUsIDIwMjAgYXQgMjoyNSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEhhbiwKPgo+IEhhbiBYdSA8eGhuanVwdEBn
bWFpbC5jb20+IHdyb3RlIG9uIFdlZCwgMTQgT2N0IDIwMjAgMjI6MDk6NTYgLTA1MDA6Cj4KPiA+
IE9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDg6MzUgUE0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgSGFuIFh1LAo+ID4gPgo+ID4gPiBPbiBX
ZWQsIE9jdCAxNCwgMjAyMCBhdCA2OjM4IFBNIEhhbiBYdSA8eGhuanVwdEBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiA+IEhpIE1pcXVlbCwgdGhlIGNoYW5nZXMgdG8gdGhlIG5lc3RlZCBz
d2l0Y2ggc3RhdGVtZW50IG1ha2UgdGhlIGxvZ2ljCj4gPiA+ID4gb2YgdGhpcyBicmVhayB3cm9u
Zy4KPiA+ID4KPiA+ID4gQ2FyZSB0byBzZW5kIGEgZml4LCBwbGVhc2U/Cj4gPiA+Cj4gPiA+IFdl
IGhhdmUgc2VlbiBFQ0MgTkFORCByZWdyZXNzaW9ucyBvbiBteDI3IGFuZCBMUzIwODggcGxhdGZv
cm1zLgo+ID4gPgo+ID4gPiBJbiB3aGljaCBwbGF0Zm9ybSBkaWQgeW91IG5vdGljZWQgdGhlIEVD
QyBpc3N1ZT8KPiA+ID4KPiA+ID4gVGhhbmtzCj4gPgo+ID4gSGkgRmFiaW8sCj4gPgo+ID4gQ0kg
dGVzdCByZXBvcnRlZCBhbGwgTFMgcGxhdGZvcm1zIGhhdmUgdGhlIEVDQyByZWdyZXNzaW9uLiBU
aGUgZXJyb3IKPiA+IGlzICJEcml2ZXIgbXVzdCBzZXQgZWNjLnN0cmVuZ3RoIHdoZW4gdXNpbmcg
aGFyZHdhcmUgRUNDIgo+ID4KPiA+IEkgaGF2ZW4ndCB3b3JrZWQgb24gYW55IExTIHBsYXRmb3Jt
cyBzbyBJIHRlc3RlZCBvbiBpLk1YIHBsYXRmb3Jtcwo+ID4gd2l0aCBncG1pIE5BTkQgY29udHJv
bGxlciwKPiA+IHRoZSBjb2RlIHJhbiBpbnRvIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgZHVl
IHRvIHRoaXMgaXNzdWUuIFNvCj4gPiB0aGVzZSBhcmUgdHdvIGRpZmZlcmVudCBpc3N1ZXMsIEkg
Y2FuIHNlbmQgYSBwYXRjaCB0byBmaXggdGhlIG5lc3RlZAo+ID4gc3dpdGNoIHN0YXRlbWVudCBw
cm9ibGVtIGJ1dCB3b24ndCBmaXggdGhlIExTIHBsYXRmb3JtIGlzc3VlLgo+Cj4KPiBJIHRoaW5r
IHRoZSBmYWN0IHRoYXQgdGhlIGV4ZWN1dGlvbiByYW4gaW50byBOQU5EX0VDQ19FTkdJTkVfVFlQ
RV9TT0ZUCj4gaGFzIGJlZW4gZml4ZWQuIEhvd2V2ZXIgdGhlcmUgaXMgc3RpbGwgdGhlIG90aGVy
IGlzc3VlIHRoYXQgSSBhbSB1bmFibGUKPiB0byBmaW5kIGp1c3QgYnkgcmVhZGluZyB0aGUgY29k
ZSA6LwoKQ291bGQgeW91IHBsZWFzZSBzZW5kIG1lIHRoZSBsaW5rIG9mIHRoZSBmaXggcGF0Y2gs
IEkgY2FuIHRlc3QgaXQgb24KaS5NWCBwbGF0Zm9ybXMuCgo+Cj4KPiBUaGFua3MsCj4gTWlxdcOo
bAoKCgotLSAKU2luY2VyZWx5LAoKSGFuIFhVCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
