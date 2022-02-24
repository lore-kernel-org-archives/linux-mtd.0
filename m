Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB24FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vt9lPkLAlKh1GAcNotacMKrYf5IsnL0+e3DCvkjd5A=; b=1fbvw6d1Y9JkuT
	48hM3COmzMR7GlhezLP1+o99gzhuPMhqTJhCtNXm+nOhY1lNPHcWss9J8FyEC/lz/B7i2MvNJXMD1
	jqJnomSVY98BCB9LjIlL/V7iolSDZO5GUjetiSl2TAauePXkJ+ITn1bgG46yiusWWyT/3rOReyL/7
	g51a/OeuwBHSnbK1xh94Y79fxp/ohYUZ0YRDY09/K1X3B//niGrqeiMmF4pACzO0gcC5Kt5pXQt1j
	Sdyp3rZy0k0feoZwFPaPm5Gge7whk/hWx50HJkVU3U1PgZmWRC7KYwnTF6JhqGgn5OtCzFMTJvA9A
	NV9syBcdNadL8iGlQkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNGdr-001SvV-6M; Thu, 24 Feb 2022 16:06:56 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNGb5-001Rbe-IA
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 16:04:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA230240005;
 Thu, 24 Feb 2022 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645718638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDMzGodXOjLlZi8hkBin8PUPrQI2VyqMUvO5VUFybg8=;
 b=AtlMS3eEWezOB93brBT+6dglfacuAibLxR9k4UTWtg4Oxs0llotaCGYOZpQEvegnhSMEmy
 J9TX792lmSQ6cv9x4MDcsi97V2Xbc0qyuIvAp1Q5AuttmfT1BwhUJAHdWaqmSqCRTrq1+m
 ljmIpaFvAF+p529FxmprOq95Z3Du5d0Y/AhXVZ5uiGt87N9srMhbpNUCagBM7tDQFPhJLa
 aDiCFQZ6EImuX1hH2NeXv/GygkalVJ9QBu3SCP58lwut8yMpJI5Mj3HJGn94/Hz0XfDzMP
 j5zlfd0ZDWcCXNW39eDsf3wVCInMXpMxH5jrzQ/3xa/VK3uI97msG8+bPOWkNQ==
Date: Thu, 24 Feb 2022 17:03:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel =?UTF-8?B?R2zDtmNrbmVy?= <dg@emlix.com>
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org, Lothar
 =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <20220224170357.1f99a77a@xps13>
In-Reply-To: <0a5497bf-7716-e8c8-7e79-7df6602d5104@emlix.com>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
 <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
 <20220224162958.184079e4@xps13>
 <0a5497bf-7716-e8c8-7e79-7df6602d5104@emlix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_080403_835209_B5FF033D 
X-CRM114-Status: GOOD (  16.49  )
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

SGkgRGFuaWVsLAoKZGdAZW1saXguY29tIHdyb3RlIG9uIFRodSwgMjQgRmViIDIwMjIgMTY6NTU6
MjcgKzAxMDA6Cgo+IEFtIDI0LjAyLjIyIHVtIDE2OjI5IHNjaHJpZWIgTWlxdWVsIFJheW5hbDoK
PiA+IGRnQGVtbGl4LmNvbSB3cm90ZSBvbiBXZWQsIDIzIEZlYiAyMDIyIDExOjU5OjAyICswMTAw
OiAgCj4gPj4gQW0gMjIuMDIuMjIgdW0gMjM6MDIgc2NocmllYiBIYW4gWHU6Pj4+IENvdWxkIHlv
dSBwbGVhc2UgZGVzY3JpYmUgbW9yZSBkZXRhaWxzIGFib3V0IHdoYXQga2luZCBvZiBlcnJvciwg
aG93IHRvICAKPiA+Pj4gcmVwcm9kdWNlIGl0IGFuZCBvbiB3aGljaCBrZXJuZWwgdmVyc2lvbj8g
ICAgCj4gPj4KPiA+PiBZb3UgbmVlZCBhIGZsYXNoIHRoYXQgaGFzIG9uZSBiYWQgYmxvY2sgd2hl
cmUgcHJvZ3JhbW1pbmcgdGhlIEJCTSBzZXRzCj4gPj4gTkFORF9TVEFUVVNfRkFJTCBpbiBpdHMg
c3RhdHVzIHJlZ2lzdGVyLiBUaGUgbGF0ZXN0IGtlcm5lbHMgc2hvdWxkIHN0aWxsCj4gPj4gaGF2
ZSBwcm9ibGVtcyB3aGVuIHRoaXMgaGFwcGVucyBpbiBhIFVCSS4gIAo+ID4gCj4gPiBJIGJlbGll
dmUgd2Ugc2hvdWxkIHRyeSB0byB0YWNrbGUgIndoeSIgdGhpcyBoYXBwZW5zIG1vcmUgdGhhbiB0
cnkgdG8KPiA+IHdvcmthcm91bmQgaXRzIGNvbnNlcXVlbmNlcy4gQ2FuIHlvdSBnaXZlIG1vcmUg
ZGV0YWlscyBhYm91dCB3aHkgd2UgZ2V0Cj4gPiB0aGlzIHN0YXR1cz8gIAo+IAo+IFVobSwgdGhl
IGJsb2NrIGlzIGJhZCwgYnJva2VuLiBJdCBzaG93cyB0aGUgc2FtZSBiZWhhdmlvciBldmVuIGFm
dGVyCj4gcG93ZXIgY3ljbGluZy4gVGhlIG90aGVyIGJsb2NrcyBhcmUgb2suIEkgZG9uJ3QgdGhp
bmsgaXQgaXMgb3VyIGZhdWx0Cj4gdGhhdCBpdCBkaWVkIHNvIGVhcmx5LgoKQnV0IHdoeSBhZnRl
ciBhIHBvd2VyIGN5Y2xlIGFyZSB3ZSB0cnlpbmcgdG8gd3JpdGUgdGhlIEJCTT8gSXMgaXQKdGhh
dCB0aGVyZSBhcmUgdG9vIG1hbnkgRUNDIGVycm9ycyBhbmQgc28gd2hlbiByZWFkaW5nIHRoZSBi
bG9jayBpdAppcyBkZWNsYXJlZCBiYWQgYW5kIHRoZSBzeXN0ZW0gdHJpZXMgdG8gc2V0IHRoZSBC
Qk0vQkJUIGJpdD8gT3IgaXMgaXQKYWxyZWFkeSBtYXJrZWQgYmFkIHNvbWV3aGVyZSBhbmQgc29t
ZXRoaW5nIHNpbGx5IGhhcHBlbnMgd2hpY2ggYXQKc29tZSBwb2ludCB0cmllcyB0byByZS13cml0
ZSB0aGUgQkJNPwoKQXJlIHlvdSB1c2luZyBmYXN0bWFwPyBkbyB5b3UgdXNlIGEgQkJUPwoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
