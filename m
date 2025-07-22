Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD81C83F25
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxU/9CWbaSADhDuznTfRhgchnmaIGvRLuD9L/RkZ/Gk=; b=B3zmXiZ6YY8zlH
	CcvU45ELZATkVqVcdZ4WNwrjnI/pO85kXBCOj0ALX/umPEx093CQntZNHEeEpO0xCHGZlTkCIgFEy
	xsxOHl7fg+ldaBip1e8F/7rRyK70hMbJwqUMrBu98MFAOE55aYxnDqapPgxc0JfMel/T4Fa1JzHgk
	AnWfpGYszTT091OxDu02XMf0HclY2hQT59xGBUNpRQXVhzvOIDtEl+V6L68MYIFE8YGmS6WFjRLNw
	6LC6ovTKHdULUgIEOrAPcEj8Vxx8WnKC7+KMHsWMPoVKrlIvQGqGXUEMBpsLBnvG0pJqLXIS4cQre
	dmMLe5xz9zujajvgWkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Th-000000022Le-2aUn;
	Tue, 22 Jul 2025 09:40:05 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9RO-000000021vU-2eYb
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 09:37:43 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so10113077a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2025 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753177060; x=1753781860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pV0KmP7SnZDTkv34ZusWsOS5sGMMAlP7jVm4P/E25g=;
        b=l9Sy2q3g5HrRD72wZSaW+qgieVaKNzjSdCXCVWmNfvLUm+ZrUmaP5VRkwieyEI/dJp
         JEShGkqQTMw2XUCW4ObJteDBTfk2TDCLNNgHMDmtiTiLvd3E84v1vL8sxmQn7lnWLEtp
         FHEg53DH4ZagrOY+qWKTfcBKMfkHd2I6M3JQeyfpJ6Qy3RMqKuXMFKV5Ix/oP8UEqxmM
         eQXPjBoqtOp/dMw+HDxRQKMGO93z0gb15jWEXjgRQuRtlhiEpwH5QXi/tAJxfNyBqMD5
         6/Ty342HMSsD7T/569CLi0c98h3VY7twTqugy14IFLixoV6CP6ZGG9kFztPeLMWocazQ
         B+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753177060; x=1753781860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pV0KmP7SnZDTkv34ZusWsOS5sGMMAlP7jVm4P/E25g=;
        b=Y5cR1kTVfh+s3O9ONgnSupwAuatC95IXU+3pjuZAdfKfzqI4nmyugADOVDGR5JU8j+
         GzyJXFzG5r9PdmZ4Z8rc8GeVaIEO/VdOGFVo5ysk9IwZkf4XEiK0arC3oUlbE4inqfwi
         h0i412MEdcXONX92IvZL18T9lA9aq7p3a08pazOKH0HIQorptyecWoFd8bxDe3G9PTnW
         W1hCAJA17sGQCxWCbPiGI98egUPR6/WEvo/aO/7wJtxwaSzZsBRWmcNniGax5D7ZKwcl
         2yM891SaiJm8GCzqXClfFErBvfvJhcEfM6DV0edHbobAGS64xonD5nIBcSXEJ5qhj3ME
         LzPg==
X-Gm-Message-State: AOJu0YxDHqXS2SFeKheTedLkYi3q3gaIDDdVFcsY7+CbvCW7Yidcj67K
	Q6krKIdyDTMx7KKCVgZxoujvmXVNMFC4pTbp8PuS18eO6mBYi2Il9ZfgIahHY/ZJI00=
X-Gm-Gg: ASbGncsKFAsg49Vbe7K6TWKo/Q3gpzsXagheD95xt32advQ6piYTWF1vLbtDeIN0pw2
	fVQ6x+crk1iKEH3OeDt0qDITk5B6K6FANiyWWS4tX/ITQ5IjgDUn/C0lrJKyfgP1eH+XEr6dBk2
	dXPG/sO/U39fi0p66BRt4O7kTH2UZrCv2PFMcXjKdhEoPs2ZbhqI3fJZ/eDOF+XigzVU+8lXk2m
	APCg4o3DyPZP1zxTJDsm5ym6DLb9bXHufLBFRyMFsW6WZR3GMaYMGStu9AYvewgWoyQSmozE1jc
	36yfVu0iJHCQFwKB2sHBcHpzoxlbJugI1gmisavZvY6NlRq1CsJJ11WhDSyIbUmF+sL6LmAfZO/
	k+eqcUnfZ/0TPof2pfdBTlY3qbTNbj40=
X-Google-Smtp-Source: AGHT+IF2mpYCyGVUcU1jI9o10RqcMKRUSsS4RESsp4aChq6sbBycz3536/vpVNzy6Tu9lWLcrVnzdg==
X-Received: by 2002:a17:907:96a2:b0:ae3:60e5:ece3 with SMTP id a640c23a62f3a-ae9cdd8436fmr2406915166b.6.1753177060157;
        Tue, 22 Jul 2025 02:37:40 -0700 (PDT)
Received: from [172.20.10.10] ([46.97.171.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7bc8esm836474166b.106.2025.07.22.02.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 02:37:39 -0700 (PDT)
Message-ID: <c13f39b5-020d-4553-a79f-e22a0cbd1dfa@linaro.org>
Date: Tue, 22 Jul 2025 10:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Michael Walle <mwalle@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <9eabfe619554cbdd493086dcffef8f44@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_023742_682896_8E289243 
X-CRM114-Status: GOOD (  14.80  )
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

CgpPbiA3LzIyLzI1IDk6NDMgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gSGkgTWFyZWssCj4g
Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+IEBAIC0zNDMsNiArMzQzLDEwIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmxhc2hfaW5mbyB3aW5ib25kX25vcl9wYXJ0c1tdID0gewo+PiDCoMKgwqDCoMKg
wqDCoMKgIC5pZCA9IFNOT1JfSUQoMHhlZiwgMHg4MCwgMHgyMCksCj4+IMKgwqDCoMKgwqDCoMKg
wqAgLm5hbWUgPSAidzI1cTUxMm53bSIsCj4+IMKgwqDCoMKgwqDCoMKgwqAgLm90cCA9IFNOT1Jf
T1RQKDI1NiwgMywgMHgxMDAwLCAweDEwMDApLAo+PiArwqDCoMKgIH0sIHsKPj4gK8KgwqDCoMKg
wqDCoMKgIC8qIFc3N1E1MU5XICovCj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4
ZWYsIDB4OGEsIDB4MWEpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm90cCA9IFNOT1JfT1RQKDI1Niwg
MywgMHgxMDAwLCAweDEwMDApLAo+IAo+IERpZCB5b3UgYWxzbyB0ZXN0IHRoZSBPVFAgcmVhZCBh
bmQgd3JpdGU/IEknZCBndWVzcyBzbywgYmVjYXVzZSBvdGhlcndpc2UKCkFueSBvZiB5b3UgaW50
ZXJlc3RlZCBpbiBhZGRpbmcgdGVzdGluZyByZXF1aXJlbWVudHMgYW5kIGV4YW1wbGVzIGZvciBv
dHA/Cgo+IHlvdSB3b3VsZG4ndCBuZWVkIHRoYXQgZW50cnkgYXQgYWxsLCByaWdodD8gT3IgaXMg
aXQgYmVjYXVzZSBvZiB0aGUKPiB3aW5ib25kX25vcl9sYXRlX2luaXQoKSB3aGljaCB3aWxsIGJl
IGNhbGxlZCBhcyBhIG1hbnVmYWN0dXJlciBmaXh1cD8KCk0sCgp0aGUgb3ZlcndyaXRlIG9mIHNl
dF80Ynl0ZV9hZGRyX21vZGUgaW4gd2luYm9uZF9ub3JfbGF0ZV9pbml0KCkgc2VlbXMgYQpsaXR0
bGUgdHJhc2h5LCB3ZSBhc3N1bWUgdGhhdCB3aW5ib25kIHdpbGwgYWx3YXlzIHVzZQpzcGlfbm9y
X3NldF80Ynl0ZV9hZGRyX21vZGVfZW40Yl9leDRiKCksIGFwYXJ0IG9mIHRoZSBleHRyYSBvcHMg
dGhhdCB3ZSdyZQpkb2luZyB0aGVyZS4gQXJlbid0IHdlIGJldHRlciB3aXRob3V0IHRoaXMgZ2Vu
ZXJhbGl6YXRpb24/Cgo+IEluIHRoYXQgY2FzZSB3ZSBjb3VsZCBkbyB0aGUgc2FtZSBhcyBpbiBj
b21taXQgYWZlMWVhMTM0NGJiICgibXRkOiBzcGktbm9yOgo+IGFkZCBzdXBwb3J0IGZvciBNYWNy
b25peCBPY3RhbCBmbGFzaCIpLgo+IAo+IC1taWNoYWVsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
