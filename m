Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D44C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/fvPNrn59NKJOrjPMonV94CxU/hmi6jfT+NLqt1VFU=; b=ATGqISxTfHpg3A
	WuSjk05O4wvwBeMShp/g9w67RU+CVGSoKx+wWqIibwqEOn6JSM7YQnyLdQdBgUYBDZqBLcBxvpQUJ
	7IMsXYdeEFpfCsLb3xs8Ydfk9Z+TtwmKPFm/VQDWIG3znXe5qFR78EOFDVHoJ5zEo68PupEekDMgp
	OFYH2e2j8MwcYWMTMAQaI/OTHka4FxWJ9aJSvbAlz2RVwBAlNd+9KJ3rLmfxFkzU5WICxEqbVpktR
	5UhOX/m6J7X1F1dq4nQkNBNoRc6fPKd+NiL9sDVoEtE/7Q/T7kZiAoIa8qRQmoDgWXx337mAaG46K
	LPJir7QUEw5Sre6z/D3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETXE-00000009cFG-0XoI;
	Mon, 12 May 2025 13:49:36 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESyJ-00000009UxH-0hm4
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 13:13:32 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A8BCAA0AC9;
	Mon, 12 May 2025 15:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=eV7fWU1o3gw8HSp86Nai
	7nFrbU7RbFJQ69HIGvP0aTo=; b=r3K5O2WRmoWPGuGTjLcwpelrrT2RzMKXyvkr
	pOshiTH/IcBtb3mKgfqLQ4IMHJgO1KUHu18jc6CXwGtTFRHplJUs1kWHgeCf/8y5
	KWzoLeqMFq6NG9pYZ/+4BkRVvcFWMjF4+oLrK+vQPOb+eutNnc32tB+SLZhZJKaK
	ohTJqfELrQWdvGHzgRgJZWfV0EVxxks439yk6SNCPbjNXMC5gXCctJ/XnQkxV5Rb
	imWAvZjbu8q56zKzJhES13O64qzeplKik7IPKqXkotd6SEDd6cctds+XItRsxHPa
	DOR9x4XylIq5PbR7qGyjD2+h8P/0MSiWMDuEGJGWMSJ4wQwYcIpefpqFNSryXyeP
	7afDC0QJeG5N01/jWhUHhbb5pCUMXuSGiJNFHWc/21q8VB9BU8hPVIOb3mVreTD4
	6GOC1IBN6i4et2NbhCSFF3c8GKX+JSvKtlhQhqJQQQ6Xaq2Bjwl3LEgy9/Wki/kp
	9MjLxI2CbrVqn9ePr6JyPMQO+LsO+vgXUkNznE2XD6Ix3cNuR+nn+9OnuUw26XOY
	bg1NZW+vpAbBMsG6jifU84dGzhp4R+Ab57i57YEml7w/yYUGi/E/V+E+gnGI8w2a
	Y0sHcduYOUZg+xx51KF4WGamGcCiiXe0odhO7SSjLWAxkKxg4UD1xUKNms1JhbB3
	Y/Mmz1g=
Message-ID: <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu>
Date: Mon, 12 May 2025 15:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
 <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
 <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
Content-Language: en-US
In-Reply-To: <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_061331_370563_77269F6B 
X-CRM114-Status: GOOD (  15.10  )
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

SGksCgpPbiAyMDI1LiAwNS4gMTIuIDE0OjQ3LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4g
LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJDc8Oza8OhcyBCZW5jZSIg
PGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Cj4+IFdlbGwsIHllcywgaW4gb3VyIGNhc2UuIEJ1dCB0
aGUgcG9pbnQgaXMsIHdlIGhhdmUgYSBzdHJpY3QgcmVxdWlyZW1lbnQKPj4gZm9yIGRhdGEgaW50
ZWdyaXR5LCB3aGljaCBpcyBub3QgdW5pcXVlIHRvIHVzIEkgYmVsaWV2ZS4gSSB3b3VsZCB0aGlu
awo+PiB0aGVyZSBhcmUgb3RoZXIgaW5kdXN0cmlhbCBjb250cm9sIGFwcGxpY2F0aW9ucyBsaWtl
IG91cnMsIHdoaWNoIGRpY3RhdGUKPj4gYSBoaWdoIGRhdGEgaW50ZWdyaXR5Lgo+IAo+IEluIHlv
dXIgbGFzdCBwYXRjaCBzZXQgeW91IHNhaWQgeW91ciBoYXJkd2FyZSBoYXMgYW4gaXNzdWUgdGhh
dCBldmVyeQo+IG5vdyBhbmQgdGhhdCBkYXRhIGlzIG5vdCBwcm9wZXJseSB3cml0dGVuLgo+IE5v
dyB5b3UgdGFsayBhYm91dCBkYXRhIGludGVncml0eSByZXF1aXJlbWVudHMuIEknbSBjb25mdXNl
ZC4KClRoZSB0d28gcHJvYmxlbXMgYXJlIG5vdCB0b28gZGlzc2ltaWxhcjogaW4gb25lIGNhc2Ug
eW91IGhhdmUgYSByYW5kb20sIAphbmQgX3ZlcnlfIGxvdyBjaGFuY2Ugb2YgZGF0YSBjb3JydXB0
aW9uLCBlLmcuIGJlY2F1c2Ugb2Ygbm9pc2UsIGFnaW5nIApoYXJkd2FyZSwgcG93ZXIgc3VwcGx5
IHJpcHBsZSBldGMuIEJ1dCB5b3Ugc3RpbGwgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCAKdGhlIHdy
aXR0ZW4gZGF0YSBpcyBhYnNvbHV0ZWx5IGNvcnJlY3Q7IG9yIGlmIGl0IGlzIG5vdCwgdGhlIHN5
c3RlbSB3aWxsIAppbW1lZGlhdGVseSBlbnRlciBzb21lIGZhaWwtc2FmZSBtb2RlLiBUaGlzIGlz
IHRoZSBwcm9ibGVtIHdlIHdhbnQgdG8gCnNvbHZlLCBmb3IgZXZlcnlib2R5IHVzaW5nIExpbnV4
IGluIGhpZ2ggcmVsaWFiaWxpdHkgZW52aXJvbm1lbnRzLgoKVGhlIHByb2JsZW0gd2UgX2hhdmVf
IHRob3VnaCBoYXBwZW5zIHRvIGJlIGEgYml0IGRpZmZlcmVudDogaGVyZSB3ZSBhcmUgCmJsdXJz
ZWQgd2l0aCBhIHN5c3RlbSB0aGF0IGNvcnJ1cHRzIGRhdGEgYXQgYSBub3RpY2VhYmxlIHByb2Jh
YmlsaXR5LiAKQnV0IHRoZSBtb2RlbCBpcyB0aGUgc2FtZTogYSBzdG9jaGFzdGljIHByb2Nlc3Mg
aW50cm9kdWNpbmcgYml0IGVycm9ycyAKb24gd3JpdGUuIEJ1dCBJIHNpbmNlcmVseSBob3BlIG5v
IG9uZSBlbHNlIGhhcyB0aGlzIHByb2JsZW0sIGFuZCB0aGlzIGlzIAoqbm90KiB0aGUgcHJpbWFy
eSBhaW0gb2YgdGhpcyBwYXRjaDsgaXQganVzdCBoYXBwZW5zIHRvIHNvbHZlIG91ciBpc3N1ZSAK
YXMgd2VsbC4gQnV0IEkgaW50ZW5kIGl0IHRvIGJlIHVzZWZ1bCBmb3IgdGhlIGxhcmdlciBMaW51
eCBjb21tdW5pdHksIAp0aHVzIHRoZSBwcmltYXJ5IGdvYWwgaXMgdG8gc29sdmUgdGhlIGZpcnN0
IGlzc3VlLgoKPiBNeSBwb2ludCBpcyB0aGF0IGF0IHNvbWUgbGV2ZWwgd2UgbmVlZCB0byB0cnVz
dCBoYXJkd2FyZSwKPiBpZiB5b3VyIGZsYXNoIG1lbW9yeSBpcyBzbyBicm9rZW4gdGhhdCB5b3Ug
Y2FuJ3QgcmVseSBvbiB0aGUgd3JpdGUKPiBwYXRoIHlvdSdyZSBpbiBkZWVwIHRyb3VibGUuCgpT
dXJlLCBidXQgYXQgdGhlIG1vbWVudCwgd2UncmUgbm90IGdpdmluZyBhbnkgcmV0dXJuIHBhdGgg
Zm9yIGhhcmR3YXJlLiAKV2UganVzdCBzaG92ZWwgbWVnYWJ5dGVzIGF0IGl0LCBhbmQgZG9uJ3Qg
ZXZlbiBhc2sgYmFjay4gSW4gY3JpdGljYWwgCnN5c3RlbXMsIHRoaXMgd2lsbCBub3QgZmx5LgoK
PiBXaGF0IGlzIHRoZSBuZXh0IHN0ZXAsIHJlYWRpbmcgaXQgYmFjayBldmVyeSBmaXZlIHNlY29u
ZHMgdG8gbWFrZQo+IHN1cmUgaXQgaXMgc3RpbGwgdGhlcmU/IChqdXN0IGtpZGRpbmcpLgoKKCgg
V2VsbCwgeW91J3JlIGtpZGRpbmcgbm93LCBidXQgdGhpcyBpcyB3aGF0IHdlIHdpbGwgaGF2ZSB0
byBkbyBpbiAKYW5vdGhlciBwcm9qZWN0LCBhIHJhaWwgaW50ZXJsb2NraW5nIHN5c3RlbS4gVGhv
dWdoIG9idmlvdXNseSBub3QgaW4gdGhlIAprZXJuZWwuIEJ1dCBJIGRpZ3Jlc3MuLi4gKSkKCkJl
bmNlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
