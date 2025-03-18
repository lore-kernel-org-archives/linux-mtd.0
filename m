Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DBAC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jr8kpfsftnkQ2yke6inELTjnKAPZJcgUapgAWERLxn8=; b=fd3MShnBfVKzrk
	nrH3Po7ZFGWpLe9srX/qa6S4CwLGAGmKZJ59z0Mii4H2CB3SKr+ahfVl8faxLWSG4JJ3cKrb3Xp6H
	SitA8rgP+YCDLj4p1lLdFv0AN1Gaww16sEZL8dXHxFWrVhd/3qcjpdv0dAMajJs6UIvT9OGWlx6Ke
	pGRhUkDpeqHvb+omcfC4CjE2YitJXPPPSur7dKhXJLrx432FIf1L03cbEYeTjBM+mTTJxr33neupN
	NLm4RMoOwmKD+xXRdqVrZfIhTwJSYADNDazJdVkLO7+Yk545NN/dKuviHmVMwyVWAh6pzqTf4tEfA
	8jYSGHkTGsoA5JP+FaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYJ8-00000006FWd-3vUF;
	Tue, 18 Mar 2025 14:52:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYJ6-00000006FVi-2Ssl
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 14:52:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390effd3e85so4763316f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742309558; x=1742914358; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P52+0oCRnVmD6adG2x2Zy/twFor9rxgj0GU1RvsmWOw=;
        b=Y2hPOkp16ouQbDQiK7DLq/d/a1p5tJgaOmAVdRkZMNC1MR5fmGHo1Qcju+sq8Y2Tod
         lAc4wtLJGYJq4Ty9MJ93ZYWDFf8NXXSM/doGjor235day3zkxLc8vxv80WElnUR55CB0
         FBlkEKxjqLZBd7aqHUC9ncHrTKDniyjCstBECk4yOFcnDsOz8N//CkjQvKDpgdwpe4+r
         z2QV1SqgOvjnOLC6pRq0RFlqx569/mzRNsEonXQHXzASfi263gtUB52B1SFU/eRdnwOY
         2TACNre46HF5a4IC+20yxCDjho8AmlH5mivz3zaMAlopEEWQhgQV1Lez0CSPlPOkOjhp
         D2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309558; x=1742914358;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P52+0oCRnVmD6adG2x2Zy/twFor9rxgj0GU1RvsmWOw=;
        b=ihj4KInrwUnWWrmDyQe97oi3vflw2wSe8gB6B7tLoMnyMbF4GW2m/ylqQnZ+cal8En
         iDNSWwd1CaKd1qZED+BQl08pKjes5iIoRq79cH2ic4IFyAWkJWwBnwVRmOhijvichorJ
         6SEbM/OMsIzZ/ztUhd1v4CMuSfwi7Xd0Ic4VR0asNhp3oCLpT4eozLV9Q1eCl5e85iHZ
         lUC90D47Y/YDEQUn2Z+E9SYDjDFk0IiiZaAfCEYynHjOSWOUZo3jLWlWmrPbIO66b1Yr
         GNe+SRFEKb5VV2McEchBJC1cRgBg+nfc1ENldoTEhA23WIdu0nFx4PR8weGsP9k4RP7g
         ZbvA==
X-Forwarded-Encrypted: i=1; AJvYcCXwMGxn0Uf2Cy0u14CifYfXT1lBE0grdW0dV2PJHYcySEnrmY9+Ii+rItuXRY70oSaPkDJ8muznEIM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8hk7ctXyhk5isn/LB4dTV6Sg4C2DbULw7uGEksZIiIRu+BiIi
	FLirs+ighB3GA3qMY6oVj+F93Nz76zKUZV3byFtgSCXVGihXOdxP
X-Gm-Gg: ASbGnctkbmI0Bit6cDEUIyIYtIzhCqDbvjHPRnnfbVO//7K7S17hav0yaztuXzPQXT7
	SMWZMFeQaIwh89US3+aLHBVN+651vZb3i+qW74suYWWDT975xz4+PcgDyWa59x1Ha5ad6wiJH/o
	uxmNSJsihNVZtzoImsWRoAMGbXYhvg+TZtXk19xCKRnlVi29ArNrEFcwvbsY1mWsvUonCWZWjqq
	CN2at/wBdXjv2pG7kI21P8H5B6TNWEXS2xevHQkFKcHLno8KY9TAkGxedSjwldRR+wK2H7nRwgk
	jJJrGvlylr0H8GMAatychrRzYICZWknhDhEyLtfIC/77qNvRaze5R7663/fbN2HqQGReFITyhJi
	lTOBZiFdISw==
X-Google-Smtp-Source: AGHT+IGQ80YKRzqbI+bYWzTgEHSqoRgS1lsMKKEEz74wAmHtbW5UtEjm/1W1j+K4zE1tY/NoaZQL2A==
X-Received: by 2002:a05:6000:18a8:b0:38f:4fa6:bb24 with SMTP id ffacd0b85a97d-3971f41160emr18927310f8f.39.1742309558233;
        Tue, 18 Mar 2025 07:52:38 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm18481455f8f.62.2025.03.18.07.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:52:37 -0700 (PDT)
Message-ID: <32785a6a-3f30-4d77-b32d-ee70c459de1b@gmail.com>
Date: Tue, 18 Mar 2025 15:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v3 1/4] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
 manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, bbrezillon@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-2-quic_mdalam@quicinc.com>
Content-Language: hu
In-Reply-To: <20250310120906.1577292-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_075240_624592_57B86D19 
X-CRM114-Status: GOOD (  23.71  )
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

MjAyNS4gMDMuIDEwLiAxMzowOSBrZWx0ZXrDqXNzZWwsIE1kIFNhZHJlIEFsYW0gw61ydGE6Cj4g
Q3VycmVudGx5IHdlIGFyZSBjb25maWd1cmluZyBsb3dlciAyNCBiaXRzIG9mIGFkZHJlc3MgaW4g
ZGVzY3JpcHRvcgo+IHdoZXJlYXMgUVBJQyBkZXNpZ24gZXhwZWN0cyAxOCBiaXQgcmVnaXN0ZXIg
b2Zmc2V0IGZyb20gUVBJQyBiYXNlCj4gYWRkcmVzcyB0byBiZSBjb25maWd1cmVkIGluIGNtZCBk
ZXNjcmlwdG9ycy4gVGhpcyBpcyBsZWFkaW5nIHRvIGEKPiBkaWZmZXJlbnQgYWRkcmVzcyBhY3R1
YWxseSBiZWluZyB1c2VkIGluIEhXLCBsZWFkaW5nIHRvIHdyb25nIHZhbHVlCj4gcmVhZC4KPiAK
PiB0aGUgYWN0dWFsIGlzc3VlIGlzIHRoYXQgdGhlIE5BTkRjIGJhc2UgYWRkcmVzcyBpcyBkaWZm
ZXJlbnQgZnJvbSB0aGUKPiBRUElDIGJhc2UgYWRkcmVzcy4gQnV0IHRoZSBkcml2ZXIgZG9lc24n
dCB0YWtlIGl0IGludG8gYWNjb3VudCBhbmQganVzdAo+IHVzZWQgdGhlIFFQSUMgYmFzZSBhcyB0
aGUgTkFORGMgYmFzZS4gVGhpcyB1c2VkIHRvIHdvcmsgYXMgdGhlIE5BTkRjIElQCj4gb25seSBj
b25zaWRlcnMgdGhlIGxvd2VyIDE4IGJpdHMgb2YgdGhlIGFkZHJlc3MgcGFzc2VkIGJ5IHRoZSBk
cml2ZXIgdG8KPiBkZXJpdmUgdGhlIHJlZ2lzdGVyIG9mZnNldC4gU2luY2UgdGhlIGJhc2UgYWRk
cmVzcyBvZiBRUElDIHVzZWQgdG8gY29udGFpbgo+IGFsbCAwIGZvciBsb3dlciAxOCBiaXRzIChs
aWtlIDB4MDc5ODAwMDApLCB0aGUgZHJpdmVyIGVuZGVkIHVwIHBhc3NpbmcgdGhlCj4gYWN0dWFs
IHJlZ2lzdGVyIG9mZnNldCBpbiBpdCBhbmQgTkFORGMgd29ya2VkIHByb3Blcmx5LiBCdXQgb24g
bmV3ZXIgU29Dcwo+IGxpa2UgU0RYNzUsIHRoZSBRUElDIGJhc2UgYWRkcmVzcyBkb2Vzbid0IGNv
bnRhaW4gYWxsIDAgZm9yIGxvd2VyIDE4IGJpdHMKPiAobGlrZSAweDAxQzk4MDAwKS4gU28gTkFO
RGMgc2VlcyB3cm9uZyBvZmZzZXQgYXMgcGVyIHRoZSBjdXJyZW50IGxvZ2ljCj4gCj4gVGhlIGFk
ZHJlc3Mgc2hvdWxkIGJlIHBhc3NlZCB0byBCQU0gMHgzMDAwMCArIG9mZnNldC4gSW4gb2xkZXIg
dGFyZ2V0cwo+IHRoZSBsb3dlciAxOC1iaXRzIGFyZSB6ZXJvIHNvIHRoYXQgY29ycmVjdCBhZGRy
ZXNzIGJlaW5nIHBhYXNlZC4gQnV0Cj4gaW4gbmV3ZXIgdGFyZ2V0cyB0aGUgbG93ZXIgMTgtYml0
cyBhcmUgbm9uLXplcm8gaW4gUVBJQyBiYXNlIHNvIHRoYXQKPiAweDMwMDAwMCArIG9mZnNldCBn
aXZpbmcgdGhlIHdyb25nIHZhbHVlLgo+IAo+IFNEWDc1IDogUVBJQ19RUElDIHwgMHgwMUM5ODAw
MCAoTG93ZXIgMTggYml0cyBhcmUgbm9uIHplcm8pCj4gU0RYNTUgOiBRUElDX1FQSUMgfCAweDFC
MDAwMDAgKExvd2VyIDE4IGJpdHMgYXJlIHplcm8pIFNhbWUgZm9yCj4gb2xkZXIgdGFyZ2V0cy4K
PiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiA4ZDZiNmQ3ZTEzNWUgKCJt
dGQ6IG5hbmQ6IHFjb206IHN1cHBvcnQgZm9yIGNvbW1hbmQgZGVzY3JpcHRvciBmb3JtYXRpb24i
KQo+IFRlc3RlZC1ieTogTGFrc2htaSBTb3dqYW55YSBEIDxxdWljX2xha3NkQHF1aWNpbmMuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29t
Pgo+IC0tLQoKPC4uLj4KCj4gIC8qCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL25h
bmQtcXBpYy1jb21tb24uaCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaAo+
IGluZGV4IGNkNzE3MmU2YzFiYi4uNjI2OGYwOGI5ZDE5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL25h
bmQtcXBpYy1jb21tb24uaAo+IEBAIC0yMDAsNyArMjAwLDcgQEAKPiAgI2RlZmluZSBkZXZfY21k
X3JlZ19hZGRyKG5hbmRjLCByZWcpICgobmFuZGMpLT5wcm9wcy0+ZGV2X2NtZF9yZWdfc3RhcnQg
KyAocmVnKSkKPiAgCj4gIC8qIFJldHVybnMgdGhlIE5BTkQgcmVnaXN0ZXIgcGh5c2ljYWwgYWRk
cmVzcyAqLwo+IC0jZGVmaW5lIG5hbmRjX3JlZ19waHlzKGNoaXAsIG9mZnNldCkgKChjaGlwKS0+
YmFzZV9waHlzICsgKG9mZnNldCkpCj4gKyNkZWZpbmUgbmFuZGNfcmVnX3BoeXMoY2hpcCwgb2Zm
c2V0KSAgKChuYW5kYyktPnByb3BzLT5uYW5kY19vZmZzZXQgKyAob2Zmc2V0KSkKClRoZSBtYWNy
byBoYXMgbm8gcGFyYW1ldGVyIG5hbWVkICduYW5kYycsIHNvIHRoaXMgd29ya3Mgb25seSB3aGVu
IHRoZXJlIGlzIGFuCmlkZW50aWZpZXIgd2l0aCB0aGF0IG5hbWUgaW4gdGhlIGNvZGUgd2hlcmUg
dGhlIG1hY3JvIGlzIHVzZWQuCgpBZGRpdGlvbmFsbHksIHRoZSBtYWNybyB3aWxsIG5vIGxvbmdl
ciByZXR1cm4gdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgYSByZWdpc3RlcgphZnRlciB0aGUgY2hh
bmdlLCBzbyBib3RoIHRoZSBjb21tZW50IGJlZm9yZSB0aGUgbWFjcm8gYW5kIHRoZSBuYW1lIG9m
IHRoZSBtYWNybwp3aWxsIGJlIG1pc2xlYWRpbmcuCgpTaW5jZSB0aGUgbWFjcm8gaXMgdXNlZCBv
bmx5IGluIHRoZSBxY29tX3ByZXBfYmFtX2RtYV9kZXNjX2NtZCgpIGZ1bmN0aW9uIHRvCmNvbXB1
dGUgdGhlICdhZGRyJyBwYXJhbWV0ZXIgZm9yIHRoZSBiYW1fcHJlcF9jZXtfbGUzMn0oKSBmdW5j
dGlvbnMsIG1heWJlIGl0CndvdWxkIGJlIGJldHRlciB0byBnZXQgcmlkIG9mIGl0IGNvbXBsZXRl
bHksIGFuZCBkbyB0aGUgY29tcHV0YXRpb24gZGlyZWN0bHkgaW4KdGhlIGZ1bmN0aW9uIGluc3Rl
YWQuCgpSZWdhcmRzLApHYWJvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
