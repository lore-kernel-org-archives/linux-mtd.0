Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05FDC369AB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Apr 2025 01:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9KS0LExH2B6/CobeN6cxi0zEbn947S/RBSLQPt01cQ=; b=g7JQBSGhO9r6RR
	z+rW8zsBDaUR8G/b47hrkpSQDD1cX9ydTbU31n0cEZu81PZBSk0mAxYYb/Gfce+2JobV9+BnUTJP5
	w03OcDvWqIYlJSUWgr+9W6xbXAu3+co+DPOfhPgD+ZsnpqruFrfXV7fawVsN0vmq96DECyGeyMRIi
	c9t9kBdSdkAeG97zIsiWmXy7BbiGaq0jXFzCuUg5k/+wPHdCGnYzQPmyqPVSO7ohYP8P526BKYc0+
	oJKR+hYanawZml99A4qTOpjNNFh+HhHuN+Hpfo4HzNwjzt0RnR3wb/MBATCKXQX5N5f6dYfcmVhMC
	mCmMiey1FYFULtfTKmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72b6-00000005WpJ-2YKd;
	Tue, 22 Apr 2025 01:38:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72b3-00000005Woe-34m6;
	Tue, 22 Apr 2025 01:38:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22435603572so46870745ad.1;
        Mon, 21 Apr 2025 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745285928; x=1745890728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=;
        b=hUqLqQaZNpDvg09FglxdjCPLmHA1I/ADrHb7M1RSaVDO/yhEWGfj2fzLpANyhFQdpH
         lr8ArvXHfBwIAhl3ycFT4vbKQSfVVqkZOUCevOasK3BfC9xkxLmICPBIuSKqcUN7ofv2
         S+2k8PtD5tJUETrMFToTu2MlaZUmdOV29KCtRa6YG9Dksfgi+Ii9TOt1PEgOKsZy1IJF
         MbGITpvVHtoxrIzd7v11AQ9LUCsxgLb4LVCsc8+R7pGmaMNxefgjTPzyPSAt2IhKZQGp
         0kNyyoHaOwhd3rmldZSoJ67CfcYP30gIA0EwYQTalVMJVV0JUbcbmffpinrZHAEY2nl6
         CuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745285928; x=1745890728;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=;
        b=IfqdPDtI+cPRMZg8GWbdsV6ObFQ6ViaxAqvp8VAw28AtUVMsSnLnGZp6a4K3ceFmYU
         gRQF4Hs/lKf3aTzyB8TG9B4sohnx0O1q/yen5XdE4/HhflcrQO+xhPiFOyNu2fz9sO0y
         sBXuLntSCa9LXuDmAYYqMzbOnzRXF8vYe2mb3PxamRpmJSKQzvPgH7VsVVKqeOSEO31a
         1ZE+//k8RWhkdjc/fOgQwjD4YUsu3ZOm883cHBbn6CztGV3TxkLEkPXKP0Zj0Cn5/nEc
         cqgqRQ5XM7XriTCxrKSADaZRYkydX7kP1Ei5EtiY0gb5etFcBL+Fgb22iqpTyEEfJZef
         JuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBUgggl+uIrrserPRbPUUgMhR9GHzN6CVthWpuojFG3Czuuy/a6MEpPrpKPEWbD1ZZ7Uahyp63uRGcVMDErlT@lists.infradead.org, AJvYcCWNyJsN8JVe+7PRGcvP832EQcigzDt3zIXfFKywd3qJB8h2NlvOhmuI3Dfa6AF07JhA5560n4jwVT00OrtHCRs=@lists.infradead.org, AJvYcCXSm8hGGRE9GjQYC0awBH3guGkLXeuZzQJ025mQzadXiy+UWe/mXE1AtvlZxYd2+l5OeOoVGpbmjKVk@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ17LEMGUDQ0G4f347GpuoCVP1QTTZdxvmv2JG63zmYceoy7/H
	elatRERo5tCWupZRCD65YCMnyyaodMCsNyG+DAfPk4jZq+gJkR0G
X-Gm-Gg: ASbGncsbxGb0iPQb+HbV735DjrrMH6RH4x2jF9uxp2IUgeGo4LuwWNTjRDph4OXMorx
	EsZ04HoiFoLSW7l79fMlukTyNYGvEAqtbjSlbGpR8h5vEvHtMHKCC6O5DZc72t2FRb5DnAhlCdS
	TsrWSRyrTs/yzrzWb4P5GwK4PPBqTO8qh+SPfGv1eaD6+zbe08NfsuLbcLEF7811bx20Frq4ycE
	z7P7l7y1EJaqWNioVBPyfqX/R83Pej+23u7zuQGFjBepPbRBwJvPbM/RN3hKFzZBq5PHTEWA5Q0
	dlKHtZ3ChsjMqAPkNeqq/cZFlr+8yf4+wMjWoOcbjWN46qD8nNxwqobz
X-Google-Smtp-Source: AGHT+IFnOJAIOYBHLa4wObdFkR0uD9Ygi2NKzxRE1wPLcAvg5M8KaAp2Fh+vAO/hoWG+KYGbLiD78Q==
X-Received: by 2002:a17:902:f60b:b0:224:826:277f with SMTP id d9443c01a7336-22c536041a9mr197018305ad.33.1745285928302;
        Mon, 21 Apr 2025 18:38:48 -0700 (PDT)
Received: from [192.168.98.254] ([104.28.254.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb74sm72112005ad.166.2025.04.21.18.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 18:38:47 -0700 (PDT)
Message-ID: <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
Date: Tue, 22 Apr 2025 09:38:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and then
 update_cache in write operation
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Golle <daniel@makrotopia.org>, Chia-Lin Kao
 <acelan.kao@canonical.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Steven Liu <Steven.Liu@mediatek.com>
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
 <871pymtab3.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Content-Language: en-US
In-Reply-To: <871pymtab3.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_183849_794382_1EE948B2 
X-CRM114-Status: GOOD (  20.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8hCuWcqCAyMDI0LzEyLzUgMjM6MzIsIE1pcXVlbCBSYXluYWwg5YaZ6YGTOgo+IEhlbGxv
LAo+IAo+IE9uIDE5LzExLzIwMjQgYXQgMTc6Mzk6NDkgKzA4LCBTa3kgSHVhbmcgPFNreUxha2Uu
SHVhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKPiAKPj4gRnJvbTogU2t5IEh1YW5nIDxza3lsYWtl
Lmh1YW5nQG1lZGlhdGVrLmNvbT4KPj4KPj4gQWNjb3JkaW5nIHRvIGRpc2N1c3Npb24gd2l0aCBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBhbmQgQ2h1YW5ob25n
IEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4gb24gRk9SRVNFRSBGMzVTUUEwMDJHIHBhdGNoLAo+
PiBDaHVhbmhvbmcgcmVjb21tbWVuZHMgdGhhdCB3ZSBjYW4gdXNlIHRoZSBmb2xsb3dpbmcgc2Vx
dWVuY2UgaW4KPj4gc3BpbmFuZF93cml0ZV90b19jYWNoZV9vcCgpOgo+Pgo+PiB4MSBtb2RlOgo+
PiAwMkgocHJvZ3JhbSBkYXRhIGxvYWQpIC0+IDg0SChyYW5kb20gcHJvZ3JhbSBkYXRhIGxvYWQp
IC0+IDg0SCAuLi4KPj4KPj4geDQgbW9kZToKPj4gMzJIKHByb2dyYW0gZGF0YSBsb2FkIHg0KSAt
PiAzNEgocmFuZG9tIHByb2dyYW0gZGF0YSBsb2FkIHg0KSAtPiAzNEggLi4uCj4+Cj4+IDAySCBv
ciAzMkggY29tbWFuZHMgd2lsbCBjbGVhciBjYWNoZSBidWZmZXIgb24gU1BJLU5BTkQgYW5kIGxv
YWQKPj4gZGF0YSB0byBpdC4gRm9yIHRob3NlIFNQSSBjb250cm9sbGVycyB3aGljaCBjYW4ndCBm
aW5pc2ggdHJhbnNtaXNzaW9uCj4+IGluIHNpbmdsZSBzdGVwLCA4NEggb3IgMzRIIHdpbGwgYmUg
dHJpZ2dlcmVkIGZvciB0aGUgcmVzdCBkYXRhLgo+Pgo+PiBXZSBvYnNlcnZlIHRoYXQgc29tZSBj
dXJyZW50IFNQSS1OQU5EcywgaW5jbHVkaW5nIEZPUkVTRUUgRjM1U1FBMDAxRyBhbmQKPj4gRjM1
U1FBMDAyRywgbXVzdCB1c2UgMDJIIG9yIDMySCB0byByZXNldCBjYWNoZSBidWZmZXIgaW4gZmxh
c2ggYmVmb3JlCj4+IHVzaW5nIDg0SCBvciAzNEguIE9yIHVzZXJzIG1heSBlbmNvdW50ZXIgcHJv
Z3JhbSBmYWlsdXJlIGlzc3VlLiBUaGlzIGlzc3VlCj4+IGlzIG5vdCBhbHdheXMgcmVwcm9kdWNp
YmxlLCBidXQgaXQgbWF5IG9jY3VyIGFuZCBjYXVzZSBzeXN0ZW0gaW5zdGFiaWxpdHkuCj4+Cj4+
IFRoaXMgc2VxdWVuY2Ugc2hvdWxkIHdvcmsgb24gYWxsIFNQSS1OQU5EcyBub3dhZGF5cy4gSSBh
bHNvIGNoZWNrIHdpdGgKPj4gRm9yZXNlZSB0aGF0IHRoZSBzZXF1ZW5jZSBjYW4gc29sdmUgdGhl
IGFib3ZlIHByb2dyYW0gZmFpbHVyZSBpc3N1ZS4KPj4KPj4gT24gbXkgdGVzdCBwbGF0Zm9ybSAo
TVQ3OTg4KSwgU1BJIGRyaXZlciBpcyBkcml2ZXJzL3NwaS9zcGktbXQ2NXh4LmMuCj4+IEFuZCBJ
IGxpbWl0IE1US19TUElfSVBNX1BBQ0tFVF9TSVpFIHRvIFNaXzFLIHRvIHNpbXVsYXRlIGxpZ2h0
d2VpZ2h0IFNQSQo+PiBjb250cm9sbGVyIHdoaWNoIGNhbiBvbmx5IHRyYW5zbWl0IDEwMjQgYnl0
ZXMuCj4+Cj4+IFRoZSB0ZXN0IHN0ZXAgaXMgdGhlIGZvbGxvd2luZzoKPj4gLSBtdGQgZXJhc2Ug
L2Rldi9tdGQyCj4+IC0gZGQgaWY9L2Rldi96ZXJvIGJzPTIwNDggY291bnQ9MSB8IHRyICdcMCcg
J1x4QTUnID4gb3V0cHV0LmJpbgo+PiAtIG10ZCB3cml0ZSBvdXRwdXQuYmluIC9kZXYvbXRkMgo+
Pgo+PiBCZWZvcmUgYXBwbHlpbmcgdGhpcyBwYXRjaCwgd3JpdGUgb3BlcmF0aW9uIHVzZXMgb25s
eSAzNEgodXBkYXRlX2NhY2hlKToKPj4gWzc4LjkzNzcyMF0gT1AgY29kZTogMHgzNCwgYWRkciB2
YWw6IDB4MCwgZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6IDB4YTUKPj4gWzc4Ljk0
NTI5N10gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4M2ZjLCBkYXRhIG5ieXRlczogMTAyMCwg
ZGF0YSAxc3QgYnl0ZTogMHhhNQo+PiBbNzguOTU0MjUxXSBPUCBjb2RlOiAweDM0LCBhZGRyIHZh
bDogMHg3ZjgsIGRhdGEgbmJ5dGVzOiA3MiwgZGF0YSAxc3QgYnl0ZTogMHhhNQo+PiBbNzguOTYy
OTY2XSBPUCBjb2RlOiAweDEwLCBhZGRyIHZhbDogMHgzMDAKPj4gWzc4Ljk2ODgxNl0gT1AgY29k
ZTogMHgzNCwgYWRkciB2YWw6IDB4MCwgZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6
IDB4ZmYKPj4gWzc4Ljk3NzIzM10gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4M2ZjLCBkYXRh
IG5ieXRlczogMTAyMCwgZGF0YSAxc3QgYnl0ZTogMHhmZgo+PiBbNzguOTg1MTI0XSBPUCBjb2Rl
OiAweDM0LCBhZGRyIHZhbDogMHg3ZjgsIGRhdGEgbmJ5dGVzOiA3MiwgZGF0YSAxc3QgYnl0ZTog
MHhmZgo+PiBbNzguOTkyNTI3XSBPUCBjb2RlOiAweDEwLCBhZGRyIHZhbDogMHgzMDEKPj4gWzc4
Ljk5Njk4MV0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4MCwgZGF0YSBuYnl0ZXM6IDEwMjAs
IGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPj4gWzc5LjAwNDQxNl0gT1AgY29kZTogMHgzNCwgYWRkciB2
YWw6IDB4M2ZjLCBkYXRhIG5ieXRlczogMTAyMCwgZGF0YSAxc3QgYnl0ZTogMHhmZgo+PiBbNzku
MDEyMDMxXSBPUCBjb2RlOiAweDM0LCBhZGRyIHZhbDogMHg3ZjgsIGRhdGEgbmJ5dGVzOiA3Miwg
ZGF0YSAxc3QgYnl0ZTogMHhmZgo+PiBbNzkuMDE5NDM1XSBPUCBjb2RlOiAweDEwLCBhZGRyIHZh
bDogMHgzMDIKPiAKPiBJIGFtIHNvcnJ5IGJ1dCBhYm92ZSB5b3Ugc2FpZCB0aGF0IHdlIHNob3Vs
ZCBub3QgcGVyZm9ybToKPiAKPiAgICAgIDB4MzIsIDB4MzIsIDB4MzIuLi4KPiAKPiBiZWNhdXNl
IHRoZSBzZWNvbmQgdGltZSBpdCB3b3VsZCBjbGVhciB0aGUgY2FjaGUgYWdhaW4uIEFuZCBoZXJl
Cj4geW91IHRlbGwgdXMgdGhhdCBhY3R1YWxseSB0aGUgY29yZSBhbHJlYWR5IGhhbmRsZXMgdGhh
dCBieSBwZXJmb3JtaW5nCj4gaW5zdGVhZDoKPiAKPiAgICAgIDB4MzQsIDB4MzQsIDB4MzQuLi4K
PiAKPiBTbyB3aGF0IGlzIHRoZSBwcm9ibGVtPwo+IAo+IE9yIG1heWJlIEkgbWlzdW5kZXJzdG9v
ZCB0aGUgaXNzdWUsIGJ1dCBJIHRoaW5rIENodWFuaG9uZyByYWlzZWQgYW4KPiBpc3N1ZSB0aGF0
IGlzIGFscmVhZHkgc29sdmVkPyBJc24ndCBpdD8KPiAKClRoZSBpc3N1ZSBpcyB0aGF0IHRoZSBG
T1JFU0VFIE5BTkRzIHJlcXVpcmUgdGhlIGZpcnN0IGNhY2hlIHdyaXRpbmcgCmluc3RydWN0aW9u
IHRvIGJlIFdSSVRFX0NBQ0hFIGluc3RlYWQgb2YgVVBEQVRFX0NBQ0hFLiBpLmUuIGl0IG5lZWRz
IGEgCmNvbW1hbmQgc2VxdWVuY2Ugb2Y6CiAgICAgMHgzMiwgMHgzNCwgMHgzNCwgMHgzNC4uLgpU
aGlzIHBhdGNoIGRvZXMgZXhhY3RseSB0aGF0LCBtYWtpbmcgdGhlIGZpcnN0IGluc3RydWN0aW9u
IGlzc3VlZCAweDMyLgpJdCBzaG91bGQgYmUgYXBwbGllZCB0byBmaXggdGhlIGlzc3VlIGFib3Zl
LgoKLS0tClJlZ2FyZHMsCkNodWFuaG9uZyBHdW8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
