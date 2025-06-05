Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AC0C5B555
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jun 2025 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVXikqr32Svk8wfnONOfOV+4XTb4r4E4vBwdULsXQy8=; b=4FfzTJ513OuIZ7
	UGXwAmmO/6MD/qtyjjHJCFFl6oKy2nt0fxEhlGikBPnxxRZYf53I3cd3UmGj6YjoRCpO9vUIE7Aqr
	D5GswsO6ffpNPIPFKK3tpiDN54lOF0aZMCs8AEYuwklCkrkZC+NSoOFETwcF49mvisFkXgTikeLBm
	/CVKfEl4fgfEoKoHfnwmLKaaF1jqfxy2/MD7iHhFLqpI/WKvBrrGHPGQ7eHaMzQpRqDvXmohYb/2f
	mu9vTTnc8NaflRS6HedxhVEJLcR56CXlvJRNmhROeomiro7APz33dStGGf5lhNkluiOYATJFmi09Z
	aebf2r3S09H5wSF5zveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMznR-0000000EXYZ-46xM;
	Thu, 05 Jun 2025 01:53:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzlH-0000000EXLT-3Ui8
	for linux-mtd@lists.infradead.org;
	Thu, 05 Jun 2025 01:51:21 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2c43cbce41so50476a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2025 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749088278; x=1749693078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi8DF512UCzmVxdqiiVnhqdNBf7mr98slXO/xgZ3GEA=;
        b=Tu7s0HqAGx5GY0qApyXHI7h8E+k1dusttMRa7K9ASA3l7vZEmlumHePv6kCknMNoHj
         3tTOjxp+nTROnhLpsu7Ryr1TpVP+hLTremd5EnbNNc9IoUK3enuF7BYfG9GZcRN9mIF2
         Yi+NLhb9dKwxphaeV7SUabSiwje8MkQX0oQYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088278; x=1749693078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yi8DF512UCzmVxdqiiVnhqdNBf7mr98slXO/xgZ3GEA=;
        b=gHgOz4LCBPSIyTuth/O8DuOUBsc+yDZFus2oJpug0gHCRIYrwknSAJ1esAp5mjjU9F
         0wlENpwSKJ6y8LdTNHwAdP/tZmDrG959fB709FaDMk6Y7nL3rJMIsO5hLs1hqSyyj/wX
         Ej0sQzs3gIvixL+uIxTjyjfLRd5XgkdO/gwJ0aGKbsqtawSTG8WYodwAzklPMbjrx9ec
         YhQFKJDuDBNyMEtrsodUe7vfdd0e/mJTgeHk1bBl6uqYzVVoe11FNt5PlydEVNrnLbNi
         HWX/WMILo9LG+Z+lJz6RvCYJimQBpamEPGteC+y5f7M+XZ6zQAk032qxriS10ocJ+4mN
         uL7A==
X-Forwarded-Encrypted: i=1; AJvYcCWKc1GXSCkwAXqxLQP9iKO2XCndEsY5apSY+SC1EENZ4ArE6bLM7FKw4uFYL7OxLNr4A2eEcEwmXrk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNodnmWR22IF0mvDoLxYwtbhWYaxWCEcJwuyG7rh+mW9Mg+Qp
	0TW3I9xn4jKlYSDWACBUvMIjBdX3Jn/pYGL/RVN5bVxAdzmaQnf9KDzebyX6Cde6+IAYlGkJ4vu
	zkadnNIl9aElgoza8XmsjZTu67DytB6jWnYS4RUIi
X-Gm-Gg: ASbGncsW7SGzws2P7B7Cq0gsyMnZF6pTuejv6jsABb+A+L6sl6wLSxlEJkvLhTD/5n2
	bPpZNMPy1bGT6d+oJ/+t3EVOB55O/bN96/0gSVM61AnTL5Qu9xOwJzalb68/c+KxaG+wNA78IaF
	+DjGPhBIUjrrCsoDen8W3Io5ndNnbbOAin2A==
X-Google-Smtp-Source: AGHT+IEaFKpjsWFeskLAEGV0N1RudoEjQsia03gkWWg1f3quBLAvO5IT5KWoJHnonAXrBHF0+OjfG5W1pzvZPIDQF9A=
X-Received: by 2002:a17:90b:180c:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-3130cd7eab2mr2600137a91.7.1749088278026; Wed, 04 Jun 2025
 18:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250530034713.4165309-1-dregan@broadcom.com> <87ecw2ns3s.fsf@bootlin.com>
In-Reply-To: <87ecw2ns3s.fsf@bootlin.com>
From: David Regan <dregan@broadcom.com>
Date: Wed, 4 Jun 2025 18:51:06 -0700
X-Gm-Features: AX0GCFtC8Agsi1wpjEZkyB90by2xTmeQg1m7afAny8GVFx1QEwwSpixj_fSsOh0
Message-ID: <CAA_RMS52nYO=XqQH9VkCDTC=OrrCLSAcXXeR41qCKNNVLzzi5g@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, 
	Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu@gmail.com, dregan@mail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_185120_016311_C173DD00 
X-CRM114-Status: GOOD (  15.64  )
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

SGkgTWlxdcOobCwKCk9uIE1vbiwgSnVuIDIsIDIwMjUgYXQgNzoxOeKAr0FNIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMjkvMDUvMjAyNSBh
dCAyMDo0Njo1OSAtMDcsIERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPiB3cm90ZToK
Pgo+ID4gQ3VycmVudGx5IHdlIGF0dGVtcHQgdG8gZ2V0IHRoZSBhbW91bnQgb2YgZmxpcHBlZCBi
aXRzIGZyb20gYSBoYXJkd2FyZQo+ID4gbG9jYXRpb24gd2hpY2ggaXMgcmVzZXQgb24gZXZlcnkg
c3VicGFnZS4gSW5zdGVhZCBvYnRhaW4gdG90YWwgZmxpcHBlZAo+ID4gYml0cyBzdGF0IGZyb20g
aGFyZHdhcmUgYWNjdW11bGF0b3IuIEluIGFkZGl0aW9uIGlkZW50aWZ5IHRoZSBjb3JyZWN0Cj4g
PiBtYXhpbXVtIHN1YnBhZ2UgY29ycmVjdGVkIGJpdHMuCj4KPiBUaGlzIGNoYW5nZSBkb2VzIG5v
dCBmZWVsIGNvcnJlY3QuIFdlIGdhdGhlciB0d28gc3RhdGlzdGljczoKPiAtIHRoZSBtYXhpbXVt
IG51bWJlciBvZiBiaXRmbGlwcyBjb3JyZWN0ZWQgaW4gYSBzaW5nbGUgRUNDIGNodW5rCj4gLSB0
aGUgdG90YWwgbnVtYmVyIG9mIGJpdGZsaXBzIGFtb25nIHRoZSB3aG9sZSBwYWdlCj4KPiBUaGUg
bW9zdCBpbXBvcnRhbnQgb25lIGlzIHRoZSBmb3JtZXIsIGJlY2F1c2UgaXQgbWF5IHRyaWdnZXIg
d2Vhcgo+IGxldmVsbGluZyBmcm9tIHRoZSB0b3AgbGF5ZXIgKFVCSSwgdXN1YWxseSkuIEl0IGZl
ZWxzIGxpa2UgeW91IGFyZQo+IGJyZWFraW5nIHRoaXMsIGFtIEkgd3Jvbmc/IFdvdWxkIHlvdSBt
aW5kIHRvIGJlIG1vcmUgZXhwbGljaXQgb3RoZXJ3aXNlPwoKRGV0ZWN0aW5nIHRoZSBtYXhpbXVt
IG51bWJlciBvZiBiaXRmbGlwcyBjb3JyZWN0ZWQgaW4gYSBzaW5nbGUgc3VicGFnZQooRUNDIGNo
dW5rKSBkb2Vzbid0IHdvcmsgY29ycmVjdGx5LCBob3dldmVyIHRoZSBjb2RlIHdpbGwgc3RpbGwK
dHJpZ2dlciBhbiBFVUNMRUFOIHNpbmNlIHdlIHJldHVybiBtYXgobXRkLT5iaXRmbGlwX3RocmVz
aG9sZCwKY29ycmVjdGVkKSAuIE15IGZpeCBpcyB0byBhY2N1cmF0ZWx5IHJlcG9ydCB0aGUgbWF4
aW11bSBudW1iZXIgb2YgYml0CmZsaXBzIHBlciBzdWJwYWdlLCBpbiBhZGRpdGlvbiB0byBjb3Vu
dGluZyB0aGUgdG90YWwgYml0IGZsaXBzIHBlcgp3aG9sZSBwYWdlIHRvIHVwZGF0ZSB0aGUgbXRk
IGNvcnJlY3RlZCBiaXRzIHN0YXQuCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCi1EYXZlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
