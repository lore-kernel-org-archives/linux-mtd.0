Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F10C3DA59
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jFpYNAilbCRzbvuLBMGqmlihZo9EVjG57OYA98SNG0=; b=KoL986RNaY4zAx
	pO+clD90mmPqtxuN6+Y3It70GAI066aqZlOAAAtXr2JY2zs67wchXJESCnnspezPQau54ZJ37v5V4
	wgCjs2eDr2+JZldKVhxUlTloDOywfEpXVh/8gEoov8ECHYwQFr5XtTR+dI0Zl1oJbwtQ52aeX0b00
	sp6425oWkFvf80ndoDnO2Ep/AMah4+48FSm2IUdma5y9fCnIQn11segGtWAJas2UunQPljWtusD1l
	THjySSDTr7Ll4TydHFLSjLTtwE0JtpTWef2WyWGuX9dHQVJq+Ls/OUW44CZXgix6AbEPTTv3vDt4L
	LG4AsyFZj1pYcz+Aq0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVqLP-00000009GTf-0Zkj;
	Mon, 22 Jul 2024 10:32:39 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVqLM-00000009GSq-1LBO
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 10:32:38 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cb63ceff6dso2102495a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2024 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721644355; x=1722249155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzxrng2ips9k4km0fNurQAEEStELmLC0Wc5XsDbqmzs=;
        b=et8vSuA9AXev7EHFUP2PzABmjHgD9VdaIMCr+7L7IvItkrxf9QzsdeeOuTOPCuRJYH
         3Tb3L2CNQj5zFiXP3RYGCQZp73MNfeDg2OHKBhQGGFtP7ebk+9xHWp7JsDoGa49ZD/mW
         hoOfHPEJ/I8ystflnpILXWa2e+0dra5+99gnXaI9ZdraMEc8eHrXmSBSXPZ9w7A0jWoF
         3sIF9SZnyB5jpKadUZJLuKGvx2GZel0Re/AyF6/91m0XueL5XGGtbvVLUS8zsqJMqKwj
         r59t1M6iVI77DaTADD8f5j9tqH/Ns1ir/grhHc/stRPDw7Y5jpo5deC8dA3eYMLfrbWL
         7pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721644355; x=1722249155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzxrng2ips9k4km0fNurQAEEStELmLC0Wc5XsDbqmzs=;
        b=V2XKXywltmx8AMbdmjTO0a4bpHIgJR1uRPe8lz3WJwhuk395Zl//0opXv9nKg7EwwO
         GEkyicqQCp4noS03o1EmcPl5LZNaQ369QwbCZniArOrxlyxVkaDakbBen4R9oSu0179x
         fm+oq6YGluuqGZHV0+y/vJKocVIJ2pGAGAhYkYZ2adAmHLbvsX7tihhszrL1CazeHN1r
         0FZ6K0BbKUPA8k+kj/78wi49aB+i2b+9PQCrgcFUrfAbgW7bfxBbimmozXmKT9R6gIkE
         3YmZhf+vl3TyVum1vVhG4sR4EvsG2SRjp6HwtL05kW8y9zz4lA/RUDePRPBGMGN8Ghqt
         E+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7P8dJUExLqJ8mcY0OyXYnly8r2qgTM668RsjgEDI7nMR5Opj9nxlXbFoQAiAzKFdCPKJpNwQPNZvm3SGfg7SJxYH2lPYsK/07m8sP5g==
X-Gm-Message-State: AOJu0Ywh1tYdi20LrUQ1FdBVqIQtxdII33+yFAI15bZv2qEaNGkQ3jzl
	OX+0A6rc0Ph6DtG2hCP594tbhAmF+CsxtETM7UauIXpLDnjTrqkO4kBwNted7BTVw6bt/wmJg8p
	T4ldAffW4NKobGX3pLBQ01l40tC4=
X-Google-Smtp-Source: AGHT+IH12NObTTgq+EuiB7GVeSjPcrP/tKmAkOKK1AbEOE90Kfz+JuJCIHE6zsm345U+8TJMhqbYIzl/vSCbFkSoxyQ=
X-Received: by 2002:a17:90a:734b:b0:2c9:90f5:cfca with SMTP id
 98e67ed59e1d1-2cd274dabb9mr2774216a91.42.1721644355292; Mon, 22 Jul 2024
 03:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240722084952.608770-1-linchengming884@gmail.com> <D2VYGD0191M5.30VXXMSA7N267@kernel.org>
In-Reply-To: <D2VYGD0191M5.30VXXMSA7N267@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 22 Jul 2024 18:31:26 +0800
Message-ID: <CAAyq3SZ91aK=r8S+u0aWNsR3g6zoVWp7Lx51B1ygCFBe-kH5Fw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: Add support for serial NOR flash
To: Michael Walle <mwalle@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leoyu@mxic.com.tw, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_033236_379294_7CD106E3 
X-CRM114-Status: GOOD (  20.61  )
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

SGksCgpNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4g5pa8IDIwMjTlubQ35pyIMjLm
l6Ug6YCx5LiAIOS4i+WNiDU6MjDlr6vpgZPvvJoKPgo+IE9uIE1vbiBKdWwgMjIsIDIwMjQgYXQg
MTA6NDkgQU0gQ0VTVCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPiBGcm9tOiBDaGVuZyBNaW5n
IExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IE1YNjZVMUc0NUcgYW5kIE1Y
NjZMMkc0NUcgYXJlIE1hY3Jvbml4IHNlcmlhbCBOT1IgZmxhc2guCj4gPgo+ID4gVGhlc2UgZmxh
c2hlcyBoYXZlIGJlZW4gdGVzdGVkIG9uIFhpbGlueCBaeW5xLXBpY296ZWQgYm9hcmQKPiA+IHVz
aW5nIE1YSUMgU1BJIGNvbnRyb2xsZXIuCj4KPiBJJ3ZlIGFza2VkIGZvciBhIGNoYW5nZWxvZy4g
Tm93LCB3aGF0IHlvdSd2ZSBzZW50IGlzIGEgdjIgKG9mIHdoYXQKPiBzZWVtcyB0byBiZSBhIHNw
bGl0IG9mZiBvZiBhIHNwbGl0IG9mZikuIEJlZm9yZSBzZW5kaW5nIG91dCBhbm90aGVyCj4gdmVy
c2lvbiwgcGxlYXNlIGNhcmVmdWxseSByZWFkOgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwKPgoKSSBhcG9sb2dp
emUgZm9yIHRoZSBtaXN1bmRlcnN0YW5kaW5nLgpUaGUgbGFjayBvZiBhIGNoYW5nZWxvZyBpcyBt
eSBvdmVyc2lnaHQuCgo+IFRvIGJlIGNsZWFyLCBwbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyBpcyBh
IHNwbGl0IG9mZiBvZiB0aGUgbGFyZ2VyCj4gc2VyaWVzLCB3aGF0IGhhcyBjaGFuZ2VkIChvciBp
ZiBub3RoaW5nIGhhcyBjaGFuZ2VkIHRoZW4gc3RhdGUgc28pLgo+IFdoeSBkaWQgeW91IHNwbGl0
IGl0IGV2ZW4gbW9yZSAoYmVmb3JlIGl0IHdlcmUgdHdvIHBhdGNoZXMpLgo+CgpUaGUgcGF0Y2gg
SmFpbWUgcHJldmlvdXNseSBzdWJtaXR0ZWQgaW5jbHVkZWQgc3VwcG9ydApmb3Igb2N0YWwgRFRS
IG1vZGUgYW5kIGFkZGVkIHRoZSBuZXcgb2N0YWwgTk9SIGZsYXNoIElECndpdGggUldXIGZlYXR1
cmUuCkhvd2V2ZXIsIHRoZXNlIHR3byB0aGluZ3Mgc2hvdWxkIGJlbG9uZyB0byBkaWZmZXJlbnQg
cGF0Y2gKc2VyaWVzLCBzbyBJIHNwbGl0IHRoZW0gYXBhcnQuCgpUaGUgcmVhc29uIGZvciBzcGxp
dHRpbmcgdGhlbSBhZ2FpbiB0aGlzIHRpbWUgaXMgYmVjYXVzZQpJIHRoaW5rIHRoYXQgYWRkaW5n
IHN1cHBvcnQgZm9yIHRoZSBvY3RhbCBOT1IgZmxhc2ggd2l0aApSV1cgZmVhdHVyZSBzaG91bGQg
YmUgcHJvcG9zZWQgYWZ0ZXIgQWx2aW56aG91J3MgdjkKdmVyc2lvbiwgd2hpY2ggc3VwcG9ydHMg
b2N0YWwgRFRSIG1vZGUsIGlzIGFjY2VwdGVkLgoKU28sIEkgaW5kZXBlbmRlbnRseSBhZGRlZCBz
dXBwb3J0IGZvciBzZXJpYWwgTk9SIGZsYXNoCndpdGhvdXQgUldXIGZlYXR1cmUuCgo+IEhvbmVz
dGx5LCBiYWNrIHdoZW4gSmFpbWUgc3VibWl0dGVkIHRoZXNlIHBhdGNoZXMsIEkgYWxyZWFkeSBz
cGVudAo+IHdheSB0b28gbXVjaCB0aW1lIHRvIHJldmlldyB0aGlzIHN0dWZmIGp1c3QgdG8gZ2V0
IGl0IGRyb3BwZWQgb3IKPiBoYW5kZWQgb3ZlciB0byBhbm90aGVyIGVtcGxveWVlIHdobyB0aGVu
IGNvbWVzIGJhY2sgdmVyeSBsYXRlLgo+IFBsZWFzZSBhbGlnbiB5b3VyIHdvcmtmbG93IGF0IE1h
Y3Jvbml4IGFuZCBnZXQgYW4gaW50ZXJuYWwgcmV2aWV3Cj4gYW5kIHNvbWUgdHJhaW5pbmcgaG93
IHRvIHN1Ym1pdCBwYXRjaGVzIHVwc3RyZWFtIGFuZCBkb24ndCBwdXQgdGhhdAo+IGJ1cmRlbiBv
biBtYWludGFpbmVycy4KPgoKSSBhcG9sb2dpemUgYWdhaW4gZm9yIGFkZGluZyBidXJkZW4gdG8g
dGhlIG1haW50YWluZXJzLgpNb3ZpbmcgZm9yd2FyZCwgd2Ugd2lsbCBlbnN1cmUgZXZlcnl0aGlu
ZyBpcyBpbnRlcm5hbGx5CnJldmlld2VkIGJlZm9yZSBzdWJtaXR0aW5nIHBhdGNoZXMuIFRoYW5r
IHlvdSBmb3IgeW91cgpwYXRpZW5jZSBpbiBhZGRyZXNzaW5nIHRoaXMgbWF0dGVyLgoKPiBUaGFu
a3MsCj4gLW1pY2hhZWwKCkJlc3QgcmVnYXJkcywKQ2hlbmcgTWluZyBMaW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
