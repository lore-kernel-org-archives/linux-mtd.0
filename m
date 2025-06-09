Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666AC5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=afJv0oiDH05MHpWplt6XXJzgcJRI6vzqcAEup3PlP0I=; b=EKy/bhEP0tKE7D1GYaOL7PE7ZV
	MHXCvHOt4zIMs31Ag73HoO4hpQaWNjmnX0eztoVIdYKl91uBvIGUo9nb1XSC1zNGd40nk/5oPdkYK
	dzkjVpmS3f7DPJSBZpUB6al68j1LCv/aMQSZPzwxGiBYuXe2z2dyfGh1jYVnfMemNV2+N5JzAIPBt
	7Zk3EtyB45NZsHCOkC4LsybH4CnrICRKmtt9jKO7G2IWLfu940gp2krkZOYU2zC9bFSZX+CEtLjp4
	iNPS1zUjBHIiMb2Vz9/H9mXTGsv3eZIjg9cfgooOV3AOx7zrz1Ll367IQblIELlFHYzRYWfKXpUq1
	6lqwNRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiBN-000000051Ls-1adl;
	Mon, 09 Jun 2025 19:29:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgp2-00000004reV-1aio
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 18:02:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-451d3f72391so60499825e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1749492130; x=1750096930; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2XXB1BYc0A6MVOdCwg0lzlDSyV2cpc+2wEYmwVpNlA=;
        b=t5V5ZeazMVx39NmWzq+6fmgmJieucOy8JvoSEuMXRHEZzBMLt4WBNV3dk37bM7CPZA
         yve3x2V4c6r9HAZvoJ2HvuJrPFhvMPeNwidfUp/qJZdBtiQkZNFHVs6Orm+9SOHWZVOE
         iMB/fAWEb9bpovPvcVlJW6e0WIRBPMRH90Wr+zzuEuwruXVZJi46f/XDV2v0sMJBiD3a
         YaxLxjOIVXsj1pyKoZaXeWrHX9i6Uk1bW4+tQLMzCPYhPBULPHWAnocgNybcFwNkb1u9
         BneUhc/IzBylhXImSwwj0/84f+Oovg4/3JuCADK4LCyMGrxjGvmOLnbAx+DYrZrpiwqK
         2QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749492130; x=1750096930;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2XXB1BYc0A6MVOdCwg0lzlDSyV2cpc+2wEYmwVpNlA=;
        b=FLXPyflMZgrzmJqQhBZltM+6/YbZyqSh1giC/aqoJcnZ1iQa36hGmlAbguqL5Rh1hq
         NAMP8syEi2AUqxyc/ycxgS1c5b7Pr6HIJVG6o3KEaBE9YDv1aDGHKxEIIu/TSVJJfg8L
         K6Y458uKSvl4JZT6cFmSmw4nBwfZw5e057NQ2Y3MK74hWoewX8jPC06WXNHFBv5FQgc2
         2gdjr18y2tvZN7yA6omXydowZXbVHDZOWD4zIA/A3On15FnFzjCMeNRI5GFYZnjfFADC
         wisLKUAz8+QIW0YtPStwWeQP5uGtK2oU5z8EcQwGAwac3LRGnMAqjf+CQLHC12oeUmcd
         fZ4Q==
X-Gm-Message-State: AOJu0YzeNtYOpZPs5APh7r89G+FCUfzei5Qi+CI1Slb6LojhlnPkP8xr
	CWL8uiPKFiqCJYdlGXJ8lebLpAu3Dktywu0ML9Asr4D/CTnSvBc+pNOmkVDf/rAKN5w=
X-Gm-Gg: ASbGncsp/tVaiufyC4v6OFKFMTQF5QMH4ZNi9HcrM/kucz+lLfgt/F3WThhsXc4DQ27
	Gvo4qgHrB68CpIo9zcP2XYktJJ+Tl2P23p0apU1+ZjmbLAuOy48YHvnNyi+PoJwOxIOxLXND7ke
	TrV2OBOMmNfu11oD7btii1pBbGLnI559S8/xsVvAX0RwcNB/0nG3JROl13X5jCYUnvdeKZaRAme
	DgbAjo2Z4COsIgBV8h/o/2kvtBJwo6BUDg9BILOaRKkAVc6haUrC2bATiZN5FhD2rKa8hT5EsCB
	nMKfr100eKDxX2K0Lijh5j/6jvt7VszQq6S/Yl+xb1tQGcFbCB8DlAkownFYU6FWfDa44kA9KEh
	d3S5OfCFyZU+iwyyZ+w==
X-Google-Smtp-Source: AGHT+IHKjMJqnPDC5gReoLI679deY1j6HBO+KvIQAR0+D/f3Dz1vpd8LZYnNo/8/PX1804m5WTehHw==
X-Received: by 2002:a05:600c:1c25:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-45201437a46mr143329445e9.3.1749492129560;
        Mon, 09 Jun 2025 11:02:09 -0700 (PDT)
Received: from [192.168.108.121] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c66a1sm113794815e9.27.2025.06.09.11.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 11:02:09 -0700 (PDT)
Message-ID: <e56ab56f-9ceb-4c95-a134-ad7186951b34@freebox.fr>
Date: Mon, 9 Jun 2025 20:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
Subject: [PATCH] mtd: spinand: fix memory leak of ECC engine conf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_110212_523687_492F436E 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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

TWVtb3J5IGFsbG9jYXRlZCBmb3IgdGhlIEVDQyBlbmdpbmUgY29uZiBpcyBub3QgcmVsZWFzZWQg
ZHVyaW5nIHNwaW5hbmQKY2xlYW51cC4gQmVsb3cga21lbWxlYWsgdHJhY2UgaXMgc2VlbiBmb3Ig
dGhpcyBtZW1vcnkgbGVhazoKCnVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmZmY4MDA2NGYwMGUw
IChzaXplIDgpOgogwqAgY29tbSAic3dhcHBlci8wIiwgcGlkIDEsIGppZmZpZXMgNDI5NDkzNzQ1
OAogwqAgaGV4IGR1bXAgKGZpcnN0IDggYnl0ZXMpOgogwqDCoMKgIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Li4uLi4uLi4KIMKgIGJhY2t0cmFjZSAoY3JjIDApOgogwqDCoMKgIGttZW1sZWFrX2FsbG9jKzB4
MzAvMHg0MAogwqDCoMKgIF9fa21hbGxvY19jYWNoZV9ub3Byb2YrMHgyMDgvMHgzYzAKIMKgwqDC
oCBzcGluYW5kX29uZGllX2VjY19pbml0X2N0eCsweDExNC8weDIwMAogwqDCoMKgIG5hbmRfZWNj
X2luaXRfY3R4KzB4NzAvMHhhOAogwqDCoMKgIG5hbmRkZXZfZWNjX2VuZ2luZV9pbml0KzB4ZWMv
MHgyN2MKIMKgwqDCoCBzcGluYW5kX3Byb2JlKzB4YTJjLzB4MTYyMAogwqDCoMKgIHNwaV9tZW1f
cHJvYmUrMHgxMzAvMHgyMWMKIMKgwqDCoCBzcGlfcHJvYmUrMHhmMC8weDE3MAogwqDCoMKgIHJl
YWxseV9wcm9iZSsweDE3Yy8weDZlOAogwqDCoMKgIF9fZHJpdmVyX3Byb2JlX2RldmljZSsweDE3
Yy8weDIxYwogwqDCoMKgIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg1OC8weDE4MAogwqDCoMKgIF9f
ZGV2aWNlX2F0dGFjaF9kcml2ZXIrMHgxNWMvMHgxZjgKIMKgwqDCoCBidXNfZm9yX2VhY2hfZHJ2
KzB4ZWMvMHgxNTAKIMKgwqDCoCBfX2RldmljZV9hdHRhY2grMHgxODgvMHgyNGMKIMKgwqDCoCBk
ZXZpY2VfaW5pdGlhbF9wcm9iZSsweDEwLzB4MjAKIMKgwqDCoCBidXNfcHJvYmVfZGV2aWNlKzB4
MTFjLzB4MTYwCgpGaXggdGhlIGxlYWsgYnkgY2FsbGluZyBuYW5kZGV2X2VjY19lbmdpbmVfY2xl
YW51cCgpIGluc2lkZQpzcGluYW5kX2NsZWFudXAoKS4KClNpZ25lZC1vZmYtYnk6IFBhYmxvIE1h
cnRpbi1Hb21leiA8cG1hcnRpbi1nb21lekBmcmVlYm94LmZyPgotLS0KIMKgZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jIHwgMSArCiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwppbmRleCBiMWRmN2Y2MjcxNjEuLmExODc3YmY0NjU1MCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYwpAQCAtMTQ5Niw2ICsxNDk2LDcgQEAgc3RhdGljIHZvaWQgc3BpbmFuZF9jbGVhbnVw
KHN0cnVjdCBzcGluYW5kX2RldmljZSAKKnNwaW5hbmQpCiDCoHsKIMKgwqDCoMKgIHN0cnVjdCBu
YW5kX2RldmljZSAqbmFuZCA9IHNwaW5hbmRfdG9fbmFuZChzcGluYW5kKTsKCivCoMKgwqAgbmFu
ZGRldl9lY2NfZW5naW5lX2NsZWFudXAobmFuZCk7CiDCoMKgwqDCoCBuYW5kZGV2X2NsZWFudXAo
bmFuZCk7CiDCoMKgwqDCoCBzcGluYW5kX21hbnVmYWN0dXJlcl9jbGVhbnVwKHNwaW5hbmQpOwog
wqDCoMKgwqAga2ZyZWUoc3BpbmFuZC0+ZGF0YWJ1Zik7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
