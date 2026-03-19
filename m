Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB01075280
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb1kZNLUu7VkrjdPNDKcvobiQH2T6gJIbVhfKxiC0ZI=; b=tahHlUdvkO49e9
	u8nrZOP9Pet0saMeK0OrBVTSrV2OahTOloPxFejc/TJporxgmV7ywD0mZo5szCBvTCn7GGS0uYS1x
	vYnOT20lQ4AxO6d9YKEW0YQYBfZJOrI+SeOMXlE8twwotvSFm6qNgnaBh0azBCfvmFO+smT6y4qVI
	YfdICg63VYBk2ORhg+vUJozAa/lHzPY1L1zwSLXntoWdshdkQvJC7Wa+IlDaW6sozNvR4767xYqE0
	41XKj6FXxQLaLdoaHUcJlBA7eZiiHLbl3I81YpFRLFRNJokuoS0ulaCQ5VhxoYe7lvG51WDTT4I/R
	BSpUYD5KV0rThk5V9uIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39PE-0000000AIhF-097w;
	Thu, 19 Mar 2026 09:11:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39PB-0000000AIgj-3Eb8
	for linux-mtd@lists.infradead.org;
	Thu, 19 Mar 2026 09:11:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-485345e1013so13111035e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2026 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773911460; x=1774516260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0YrBdPtPd82EVcXQNlEOmZj6YWUSRUq9jn0jdHCTP4=;
        b=FS/3EAfA1sY6IzuD++sWEapP8T5X+y20nnxh+51xqemQFNdQCb2zRDsWZJlwC1xaQs
         6RBd6Kd7OYNoi/gOfU/NzCmDm2tVFULF/8Ja/gQdFe3csnFxXvWCxyIMSE05dPFt4Yzb
         xrCKFbPb7cQ13TF5tQS1LlayGNqJIRBlOP2jTjxu09sTWV5jk/722uVazNr7m0dG6klm
         f3irUeRleoRtnMydNuwP62ddJVB1Mnz/7xDHqZbPZjZVGcO7NGkOC0nJjRnObc8HjqXe
         W5UP2THgvN93+GJtGlHhPmKUEPme06x4gdsyDIIVZW9NWzqSGt0ccQVifUl7zlxrh7JC
         E7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911460; x=1774516260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0YrBdPtPd82EVcXQNlEOmZj6YWUSRUq9jn0jdHCTP4=;
        b=AoJuS1BEN4ZNgu9Tw4wCSzuqXoYVISyyzqc0Ifrys4/crUv1atD4pqWBU6OX/3OFbV
         Ij3Ab0EemDPi6kQp7iwAcSNmT3WblLhHRHzgow55D0P5dOSCeXcaFDbVjm3qMkyiHhB2
         aWW10Gz5IRRaq6DuraBYHew9I8eITcl3rolTB7qyzviVQy2BxXb8QDuscqPKJkvtDwQy
         EqAjL+6h+PparHtzvEc1h/PMJau2vrvL3dw1siS0PYN84YXutZJyVqHOZkVEwZgpSqdx
         7pgGKTuMVw5ktaVG0aVuvCK+O97JthOjd0wZNvzczpFVojKFuYHb04pqM7kX6pnkr4oa
         FNsA==
X-Gm-Message-State: AOJu0YxkZ54zLotrrWkzhuUcOvF28cFzwm+cH4tUmt9Kvqu6lp8pmWc9
	LnLgfmTi3U2v3+UAsCLlFoQQgH1J2d88Iazgkzu53yc0m0C7QNf2bTYyDMOFE8vbIlwMnHHBm7O
	Qq9qwVZw=
X-Gm-Gg: ATEYQzxY17+JE6tNrybmgIdEmb1bg+dyJtybmUCji542niBvIdVijyV19ciD07h2+5q
	IqtxfOtiw6wfawAOcu0EddjXfBSwWawdGLcVXS6IkAtk2zLXY7+pSP3dwRqVAjb2xblAk0qaXbr
	J6oQ47TiUXrc1ooZyrBUX4OjaajHwhsSALAS1ECAxZO0eqxe1QrDXvs1I/vTND4ovtHb80PitQn
	22y22eM//4q3ZlcNgOiimm16ZGaIKDAngkJeV2+rH6qRG+hW1LIUpoL84WHvtoi3vhrYVZ4tyL8
	8xTYBwrInhGKoAC6AfjdXRKwDYAfidTPYoF9jSiT8M8qXIbJRY1kFU7bIUeJQiojJ10U27BrDmo
	4BVEJ4ZlX22VydYHT/OnOlVBq3s7yuxgOzkVUr8tv5i3rpvcqUziE2/9NthViu2tf5XDgiaQBuV
	R3jKVku2uulD9Bls+An5YE2oG5kI4jA0M=
X-Received: by 2002:a05:600c:8b31:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-486f8b20188mr42015065e9.5.1773911459701;
        Thu, 19 Mar 2026 02:10:59 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45d8e3dsm39844985e9.0.2026.03.19.02.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:10:59 -0700 (PDT)
Message-ID: <36e65648-707c-4b45-a429-1ea7f9f65f07@linaro.org>
Date: Thu, 19 Mar 2026 11:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: fix FSR read fallback for
 controllers returning -ENOTSUPP
To: Bean Huo <beanhuo@iokpp.de>,
 "Zailiang Zhang (zaizhang)" <zaizhang@cisco.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "mwalle@kernel.org" <mwalle@kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bean Huo <beanhuo@micron.com>
References: <20260318131857.2685004-1-beanhuo@iokpp.de>
 <639bd964-b499-4e9f-9035-0010fecfb17c@linaro.org>
 <3c94f0e1c5a8bf184d7a81f49b7beb999355dcd3.camel@iokpp.de>
 <DS0PR11MB8668FC8E62236D0893A8CEFFC84EA@DS0PR11MB8668.namprd11.prod.outlook.com>
 <4223576d9f55b2a3ae18cf148765a1a5487367df.camel@iokpp.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4223576d9f55b2a3ae18cf148765a1a5487367df.camel@iokpp.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_021101_826303_DCD1881A 
X-CRM114-Status: GOOD (  19.85  )
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

CgpPbiAzLzE4LzI2IDc6MTcgUE0sIEJlYW4gSHVvIHdyb3RlOgo+IAo+IAo+IAo+IAo+IE9uIFdl
ZCwgMjAyNi0wMy0xOCBhdCAxNzowNCArMDAwMCwgWmFpbGlhbmcgWmhhbmcgKHphaXpoYW5nKSB3
cm90ZToKPj4gSGksCj4+Cj4+IE91ciBwbGF0Zm9ybSBpcyB1c2luZyBJbnRlbCBSYXB0b3JsYWtl
IENQVSwgc28gaXTigJlzIG5vdCBvdXIgb3duIHNwaSBtYXN0ZXIKPj4gZHJpdmVyLgo+PiBUaGUg
a2VybmVsIHZlcnNpb24gd2UgYXJlIHVzaW5nIGlzIDYuNi4yMS4KPj4gSSB0aGluayB3aGVuIG1p
Y3JvbiByZWFkIGZzciBmdW5jdGlvbiBjYWxscyBzcGlfbWVtX2V4ZWNfb3AoKSwgaXQgaGFzCj4+
IGZvbGxvd2luZyByZXR1cm46Cj4+PiBpZsKgKCFzcGlfbWVtX2ludGVybmFsX3N1cHBvcnRzX29w
KG1lbSzCoG9wKSkKPj4+IMKgIMKgIHJldHVybsKgLUVOT1RTVVBQOwo+PiBQbGVhc2UgY29ycmVj
dCBtZSBpZiBJIGFtIHdyb25nIGhlcmUuIEFsc28gdGhlIGxhdGVzdCB1cHN0cmVhbSBrZXJuZWwg
bWF5IG5vdAo+PiB1c2UgdGhlIHNhbWUgaGFuZGxpbmcgY29kZS4KPiAKPiAKPiBIaSBaYWlsaWFu
ZywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAo+IFlvdSBhcmUgY29ycmVjdC4gdGhlIGNvbW1pdCBjZmY0OWQ1
OGY1N2UgKCJzcGk6IFVuaWZ5IGVycm9yIGNvZGVzIGJ5IHJlcGxhY2luZyAtCj4gRU5PVFNVUFAg
d2l0aCAtRU9QTk9UU1VQUCIpLCBtZXJnZWQgdXBzdHJlYW0gb24gTm92ZW1iZXIgMjksIDIwMjMs
IHdoaWNoIGNoYW5nZWQKPiBzcGlfbWVtX2V4ZWNfb3AoKSB0byByZXR1cm4gLUVPUE5PVFNVUFAg
aW5zdGVhZCBvZiAtRU5PVFNVUFAgd2hlbiBhbiBvcGVyYXRpb24KPiBpcyBub3Qgc3VwcG9ydGVk
LiBLZXJuZWwgNi42LjIxIHByZWRhdGVzIHRoaXMgZml4LCB3aGljaCBpcyB3aHkgeW91IHNlZSAt
Tk9UU1VQUAo+IG9uIHlvdXIgcGxhdGZvcm0gd2l0aCBJbnRlbCBSYXB0b3IgTGFrZS4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgICAgICAgICAg
ICAgICAgICAKPiBIaSBUdWRvciwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gwqAKCkhpLAoKPiBUaGlzIGNoYW5n
ZXMgdGhlIHBpY3R1cmUuIFRoZSAtRU5PVFNVUFAgWmFpbGlhbmcgb2JzZXJ2ZWQgaXMgY29taW5n
IGRpcmVjdGx5Cj4gZnJvbSBzcGlfbWVtX2V4ZWNfb3AoKSBpbiBrZXJuZWwgNi42LjIxLCBiZWZv
cmUgY29tbWl0IGNmZjQ5ZDU4ZjU3ZSB3YXMgaW4KPiBwbGFjZS4gVGhhdCBjb21taXQgZml4ZWQg
dGhlIFNQSSBtZW0gZnJhbWV3b3JrIGl0c2VsZiwgYnV0IGl0IG1heSBub3QgaGF2ZSBiZWVuCj4g
YmFja3BvcnRlZCB0byBhbGwgc3RhYmxlIHRyZWVzLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAo+ICAgICAgICAgICAgICAgICAgIAo+IEkgd291bGQgdGhl
cmVmb3JlIGFyZ3VlIHRoYXQgb3VyIG1pY3Jvbi1zdC5jIGZpeCBpcyBzdGlsbCB3b3J0aCBrZWVw
aW5nIGZvciB0aGUKPiB0aGUgcmVhc29uIHRoYXQgaXQgcHJvdmlkZXMgYSBzYWZldHkgbmV0IGZv
ciBzdGFibGUga2VybmVscyB0aGF0IGRpZCBub3QgcmVjZWl2ZQo+IGNmZjQ5ZDU4ZjU3ZSBhcyBh
IGJhY2twb3J0LiAgICAgICAgICAgICAgICAgICAgIAo+IAoKSSBhZHZpc2UgYWdhaW5zdCB0aGlz
LCBvdGhlcndpc2Ugd2UnbGwgY2FycnkgZGVhZCB3ZWlnaHQgb24gb3VyIHNob3VsZGVycy4KCj4g
VGhhdCBzYWlkLCBJIGFtIGhhcHB5IHRvIGZvbGxvdyB5b3VyIGd1aWRhbmNlIG9uIGhvdyB0byBw
cm9jZWVkLsKgCgpJIHdvdWxkIGJhY2twb3J0IHRoZSBwYXRjaCB0byB0aGUgc3RhYmxlIGtlcm5l
bCBpZiB0aGF0IGZpeGVzIHRoaW5ncyBmb3IgeW91LgpUaGVuIEkgd291bGQgZm9sbG93IHVwIHdp
dGggYSBwYXRjaCBhbmQgcmVwbGFjZSAtRU5PVFNVUFAvLUVPUE5PVFNVUFAgaW4Kc3BpLW1lbSBh
bmQgc3BpLgoKQ2hlZXJzLAp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
