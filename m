Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBABBCD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoTfkDtkXV2Okvcalzln/cG5Euowt1PLKQEOvwnI7PU=; b=eGIRcN8Hs0Azh8
	6LboSTJdA0gpjOWoTfkOH29cV5+PJ9yk45zYfro5CCy5nasliBznJ/kvH8y5uKWM1XKeTMbYIYMHF
	PyXrNEQ1lrnMRL5ig5dXh01YBIvodIreBwJKc2qGPbxTkYEiq7WX32rj1QnHmj7vfpmjHtn6oPh7o
	+V7xHRfMfNMvNuAeXU9b8FVd2j7jzMbjZrnnU+5vk3WWA9Rf5YRR2M54oH/IViZwLbG/ENg6yAOjG
	XxgE9Urb8bPFTe2GQ3/oqS67bvxsoWvu0xethOonrKOm2txAw6OAadNHhdxkG91FCc4KaBaV5cZzi
	fFa1rDeLDrfdavVRjGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSV3o-00000005Fm4-1lAP;
	Thu, 28 May 2026 07:21:44 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSV3l-00000005Flh-2cGu
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 07:21:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so54932a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 May 2026 00:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779952901; cv=none;
        d=google.com; s=arc-20240605;
        b=d5CQ+qFv6IgXw3vMaHaX5IzhOwtlAGfiWZsAsGs6HGJM5LpCTiWrcHblPPBrEchUIz
         em0AQmbBeYO7tdfWxLfz/cug6e1rwEzGzxU5uJ03RdPzks7lFN/TfjjELBIKCdn+vcte
         Ayvpjq7zie6avlOYggkCx5blHmUFpSKq9iVfAnB2l4fS4auq4HAtJlp7nf/azbqmjorG
         7eIDaGmVA958dlkqguAGYxQgnSR4fe0IwwHX4e6s4CDW0gv8PGU1Qb0wa7eU1RKn8fv7
         dYkffb6D7q2tmeZj7bKiILbTjaWoDS1sgk/ZyFD8SCrW2OJTb0rn+DQ4D1VsxjJhK1lv
         4Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dO8OwR9YVm7ErHjKEFCwcTCS1pLjsPZhrJXf0QbRig=;
        fh=1baaZhQoHvfkbNdmEIItdC9rZFB/OdTRkeSAFrJfcgs=;
        b=NfeVCRER+U2kldyED1fl/lQJCKqasFwLZUJQ3PVPpZvOFA4ofvVj9hfTyNp0UGHuf5
         3VRkp4L2JHipPESJK2PqLTW7bMJrVdxEVxtUVWz/Lc5fQga22HHd9ZOtFVAqqhE/HeaI
         rgnadFhm014kgPepGABx+tQAJnOwHl+eWDL0MM9pNR+0IknwHLXIwVM5oKGpu20xtYv0
         CWHnLRFQK9Ndu7+WlD3+tILr8SUW8+vJJc6yC2wRdJnphAZ16QPow9p6a37lUHvmpUVz
         PL60rgHOr8n7souG7cf53N3pcI5RteStgAAZ1Eks1Rl3/7SQjKbqKPP/BcTRcU4a+iGa
         setA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779952901; x=1780557701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dO8OwR9YVm7ErHjKEFCwcTCS1pLjsPZhrJXf0QbRig=;
        b=qCL2NALb8u2G+brVQL9Iuuq1qdkkCwH8d4IJqxT2TmuCtqH/vXjsnrz5xgiPJjPUGV
         kBXnot7iNGUMMQPRI8EejDUzvUSa+87HXIMj6zp3/rgxJPKppNr0H9jrTO0O4BQ/ExuI
         i/PYxgI+lT3uCX9Z67JL3grCXpOlKoh3JkTdQYjDEKAckozUabnb3OQzZbnKnzZMorOS
         keyRAUstj8c2G1pMWrmZ273PYStE1df11sBzRF/bG0IWq0VRWvKwhdpNh0szm7YKq5iR
         GEjSoo0UAnLSBgjT4T7TY6aRNyng3dX5Qi/TY/2xH1+YB3ymvGAWWiYY7dPXRl38E6PV
         EShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952901; x=1780557701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dO8OwR9YVm7ErHjKEFCwcTCS1pLjsPZhrJXf0QbRig=;
        b=miZKQxN3miSTdii5op60Q9t79YNVB3u5yMwJCUCxiLwpVhZqebcVzvUI8DsC9FFbrl
         pfdlDUHU1cDzw3Nyl1VClOEijaHS+KuPDuajWd1BtESxYrSQs9HVGU4PQm1ZaZ6DSGOh
         ZoXIaOLmYQzoxVTnzhXBvyetcmhK7ghlLosn/og3VTm1UCRgvtu+gekuI6i2jKe6J2aj
         F7srCQ7B5gJLzAHZxzV36nvoytd5CQ83iERpyPbQ6xb3VEEy/RLlcVPReW4SixQbNVDY
         IfYoL4wMSMDTxYc6Z4IQE0xlWuyVoxr1eyMRMzoAZiR57iuvrWN9fqcrtajbvnNolG/2
         xQ9w==
X-Forwarded-Encrypted: i=1; AFNElJ/vbdNSX/jnfiSADQJ3xLWA+cG9kE+jevuxgIQK19tu9iMrMU7OEMK1LCGzAYvlylKxON3Ri08RsnY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx0SchTHeV6zcCLfzfUGKOht9gouvBaRxrUs4JOJ4uz6jk2Uyu
	sCEa7DDy5qXjlCKjCn5jEIluoJWdgBi1TrmdJI8q6DkeEYLvgShogBfcqZfiylepfza0HL4CR5h
	tIsL26ehzHz/nnZtMlHL5kOmm6leb754=
X-Gm-Gg: Acq92OEtSzvEu8QpHk6SOwQHENhIvZDR+kLJIrsSogPZ8+ciYP4TwiueikLULTFLbZn
	CWTnObM4aaXUsR4NUkyBv1UkIWGhBYp4UEvUsnm0mfUFv1sU3M5QslUqsAu/gwtHiabLXu6l6d/
	6N6sXAadjYkXS6usSxJOlKFheJWscoQpHZG3UyL5LywuR5rOw39JwOZVEwNclBWCFCM5Nw6EfKU
	96W09Bs4KE8RMjF796THAb0WHZBNcmZGA605rWF3oGoBiFx2r8CFwRhc6e1lxiHD4rNyihzh7Jy
	mXOrjnh68LCa6OlnPDww6WFz3uRH
X-Received: by 2002:a17:90b:3906:b0:368:3d3e:efa6 with SMTP id
 98e67ed59e1d1-36a67835aa8mr25369824a91.20.1779952900475; Thu, 28 May 2026
 00:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051751.1648246-1-linchengming884@gmail.com> <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
In-Reply-To: <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 28 May 2026 15:19:36 +0800
X-Gm-Features: AVHnY4KknU_CfN5jixAprjcv-ZtitqjCkzEmYklb2XzJmR-vxR0NKpBHia_Z1s0
Message-ID: <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_002141_668484_FD041593 
X-CRM114-Status: GOOD (  26.16  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDXmnIgyOOaXpemAseWbmyDkuIvljYgyOjM25a+r6YGT77yaCj4KPiBIaSwKPgo+IE9uIFRodSBN
YXkgMjgsIDIwMjYgYXQgNzoxNyBBTSBDRVNULCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+IEZy
b206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gQWRk
IHN1cHBvcnQgZm9yIE1hY3Jvbml4IE1YMjVMMTI4MzNGIGFuZCBNWDI1TDEyODQ1Ry4KPiA+Cj4g
PiBUaGUgU0ZEUCB0YWJsZXMgZm9yIHRoZXNlIGZsYXNoZXMgb25seSBkZWNsYXJlIDEtNC00IFBh
Z2UgUHJvZ3JhbQo+ID4gc3VwcG9ydCBpbiA0LWJ5dGUgYWRkcmVzcyBtb2RlLiBIb3dldmVyLCBz
aW5jZSB0aGVzZSBwYXJ0cyBvcGVyYXRlCj4gPiBpbiAzLWJ5dGUgYWRkcmVzcyBtb2RlLCB0aGUg
c3RhbmRhcmQgU0ZEUCBwYXJzaW5nIGRvZXMgbm90IGF1dG9tYXRpY2FsbHkKPiA+IGVuYWJsZSB0
aGlzIGNhcGFiaWxpdHkuIFRvIGFkZHJlc3MgdGhpcywgdGhpcyBwYXRjaCBpbnRyb2R1Y2VzCj4g
PiBtYWNyb25peF80cHAzYl9sYXRlX2luaXRfZml4dXBzKCkgdG8gZXhwbGljaXRseSBlbmFibGUg
dGhlIDEtNC00Cj4gPiBQYWdlIFByb2dyYW0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmcg
TWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPgo+IC4uLgo+Cj4gPiAtLS0gYS9k
cml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3IvbWFjcm9uaXguYwo+ID4gQEAgLTgzLDYgKzgzLDE4IEBAIG14MjVsMzI1NWVfbGF0ZV9pbml0
X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4KPiA+ICtzdGF0aWMgaW50Cj4gPiArbWFjcm9uaXhfNHBwM2JfbGF0ZV9pbml0X2ZpeHVwcyhz
dHJ1Y3Qgc3BpX25vciAqbm9yKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBzcGlfbm9yX2ZsYXNo
X3BhcmFtZXRlciAqcGFyYW1zID0gbm9yLT5wYXJhbXM7Cj4gPiArCj4gPiArICAgICBwYXJhbXMt
Pmh3Y2Fwcy5tYXNrIHw9IFNOT1JfSFdDQVBTX1BQXzFfNF80Owo+ID4gKyAgICAgc3BpX25vcl9z
ZXRfcHBfc2V0dGluZ3MoJnBhcmFtcy0+cGFnZV9wcm9ncmFtc1tTTk9SX0NNRF9QUF8xXzRfNF0s
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUElOT1JfT1BfUFBfMV80XzQsIFNO
T1JfUFJPVE9fMV80XzQpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+
ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgbXgyNWwyNTYzNV9maXh1cHMg
PSB7Cj4gPiAgICAgICAucG9zdF9iZnB0ID0gbXgyNWwyNTYzNV9wb3N0X2JmcHRfZml4dXBzLAo+
ID4gICAgICAgLnBvc3Rfc2ZkcCA9IG1hY3Jvbml4X3FwcDRiX3Bvc3Rfc2ZkcF9maXh1cHMsCj4g
PiBAQCAtOTYsNiArMTA4LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMg
bXgyNWwzMjU1ZV9maXh1cHMgPSB7Cj4gPiAgICAgICAubGF0ZV9pbml0ID0gbXgyNWwzMjU1ZV9s
YXRlX2luaXRfZml4dXBzLAo+ID4gIH07Cj4gPgo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
X25vcl9maXh1cHMgbWFjcm9uaXhfNHBwM2JfZml4dXBzID0gewo+ID4gKyAgICAgLmxhdGVfaW5p
dCA9IG1hY3Jvbml4XzRwcDNiX2xhdGVfaW5pdF9maXh1cHMsCj4gPiArfTsKPiA+ICsKPiA+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gbWFjcm9uaXhfbm9yX3BhcnRzW10gPSB7Cj4g
PiAgICAgICB7Cj4gPiAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQoMHhjMiwgMHgyMCwgMHgx
MCksCj4gPiBAQCAtMTMwLDkgKzE0NiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2lu
Zm8gbWFjcm9uaXhfbm9yX3BhcnRzW10gPSB7Cj4gPiAgICAgICAgICAgICAgIC5zaXplID0gU1pf
OE0sCj4gPiAgICAgICAgICAgICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SywKPiA+ICAgICAg
IH0sIHsKPiA+IC0gICAgICAgICAgICAgLyogTVgyNUwxMjgwNUQgKi8KPiA+ICsgICAgICAgICAg
ICAgLyogTVgyNUwxMjgwNUQsIE1YMjVMMTI4MzNGLCBNWDI1TDEyODQ1RyAqLwo+ID4gICAgICAg
ICAgICAgICAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4MjAsIDB4MTgpLAo+ID4gICAgICAgICAgICAg
ICAuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl80QklUX0JQLAo+ID4gKyAgICAg
ICAgICAgICAuZml4dXBzID0gJm1hY3Jvbml4XzRwcDNiX2ZpeHVwcywKPgo+IEl0IGxvb2tzIGxp
a2UgeW91J3JlIGdldHRpbmcgYml0dGVuIGJ5IHRoZSBJRCByZXVzZS4gWW91IGNhbid0IGp1c3QK
PiB1bmNvbmRpdGlvbmFsbHkgYWRkIHRoZSBxdWFkIFBQIGJlY2F1c2UgYXMgZmFyIGFzIEkgY2Fu
IHNlZSB0aGUKPiBNWDI1TDEyODA1RCBbMV0gaXMganVzdCBhIHN0YW5kYXJkIHNpbmdsZSBiaXQg
aS9vIGZsYXNoIGFuZCBkb2Vzbid0Cj4gc3VwcG9ydCB0aGUgNFBQLgoKWW91IGFyZSBhYnNvbHV0
ZWx5IHJpZ2h0LiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuCgpUaGUgTVgyNUwxMjgwNUQgaXMg
aW5kZWVkIGEgbXVjaCBvbGRlciBwcm9kdWN0IChyZWxlYXNlZCBhcm91bmQgMjAwOSkuClNpbmNl
IHRoZSBpbml0aWFsIEpFU0QyMTYgU0ZEUCBzdGFuZGFyZCB3YXNuJ3QgcHVibGlzaGVkIHVudGls
IDIwMTEsCkkgZG91YmxlLWNoZWNrZWQgd2l0aCBvdXIgaW50ZXJuYWwgUE0gYW5kIGNvbmZpcm1l
ZCB0aGF0IHRoZSBNWDI1TDEyODA1RApkb2VzIG5vdCBzdXBwb3J0IFNGRFAgYXQgYWxsLgoKU2lu
Y2UgdGhlIG5ld2VyIGZsYXNoZXMgKE1YMjVMMTI4MzNGIGFuZCBNWDI1TDEyODQ1RykgZG8gc3Vw
cG9ydCBTRkRQLAp3ZSBjb3VsZCB1c2UgdGhpcyBhcyBhIGRpZmZlcmVudGlhdG9yIHRvIGRpc3Rp
bmd1aXNoIHRoZW0gZnJvbSB0aGUgbGVnYWN5Ck1YMjVMMTI4MDVELgoKV2hhdCBpZiB3ZSB0cnkg
dG8gcmVhZCB0aGUgU0ZEUCBzaWduYXR1cmUgKFJEU0ZEUCkgaW4gdGhlIGZpeHVwIGhvb2s/Cklm
IGEgdmFsaWQgU0ZEUCBzaWduYXR1cmUgaXMgZGV0ZWN0ZWQsIHdlIGNhbiBzYWZlbHkgaWRlbnRp
ZnkgaXQgYXMgdGhlCm5ld2VyIGZsYXNoIGFuZCBhcHBseSB0aGUgU05PUl9IV0NBUFNfUFBfMV80
XzQgY2FwYWJpbGl0eS4gSWYgdGhlcmUgaXMKbm8gU0ZEUCBzaWduYXR1cmUsIHdlIGxlYXZlIGl0
IGFzIGlzIGZvciB0aGUgbGVnYWN5IE1YMjVMMTI4MDVELgoKRG8geW91IHRoaW5rIHRoaXMgYXBw
cm9hY2ggaXMgZmVhc2libGUgYW5kIGFjY2VwdGFibGU/IElmIHNvLCBJIHdpbGwKaW1wbGVtZW50
IHRoaXMgbG9naWMgYW5kIHN1Ym1pdCBhIHYyIHBhdGNoLgoKPgo+IC1taWNoYWVsCj4KPiBbMV0g
aHR0cHM6Ly93d3cubWFjcm9uaXguY29tL0xpc3RzL0RhdGFzaGVldC9BdHRhY2htZW50cy84NTgy
L01YMjVMMTI4MDVELCUyMDNWLCUyMDEyOE1iLCUyMHYxLjIucGRmCgpUaGFua3MsCkNoZW5nIE1p
bmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
