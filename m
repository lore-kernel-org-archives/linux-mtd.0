Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE63CF397E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuvPYe2+h+1xbtz3apkGbCnMYvvDj1VU7OAqKtI5OwM=; b=VhdlGK5QXu8dLM
	F8nG6lLCThq40zsxrUHCCn8PsIvkFY8kYKIgp4tbtEOAGqRHTnHPhC3MJN01gZ7+0sTCuL64wZQ4i
	ucMWQtY/u8RPzZIjHgGH3lAicaRzra5BDGdE/wlx0JHaJP22Ov1shLLqpENUMJK7PYmLV1CEgCpdn
	vhq4ir+m6tdp+oo8XatZt5cTCKn1LZMW1wr1o01Cmu9URC5HzUOKYGrcnptvNbqioq4wqccfAjLE8
	lWEzyV68mT//5pqhIlXMU/Uk0tOvL65JwnB3TRD1eRRQzLKSR9rmWmV8MQzYA7X1PvMADDbJreAIa
	3oC6GgimMxlOKY2gnnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm5t-00000004ACd-1zEK;
	Wed, 19 Nov 2025 17:35:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm5p-00000004A93-0e6C
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 17:35:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DB851A1BBE;
	Wed, 19 Nov 2025 17:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23A3260699;
	Wed, 19 Nov 2025 17:35:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ACE510371739;
	Wed, 19 Nov 2025 18:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763573742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rF28Pbs77AhuXC+S9VeRzylQ5MN3PM7kjXAHE+zhARc=;
	b=hkCS2Pd3AU3R3wlUlX/iR32CzQUm3UAvCGfJOsk0lybfoCRwY9RtFz0oidnKpzOUFWVgIB
	zrwFv++vjdJ4V1pj2iESA6wacwgUCAZAN5cfgAduiIXx09IlqA5N2lT/hDA/wT7YiWjFwo
	50+5JhdPO+2dPhve1tH/nWE47st8Pg4an48j0ZhPQIDkRyqp4/1mbd67m6QGbfErRrg0Zw
	PNlWYnZQK1NRSV9yi1msl8k6eyQRAAhhmACDCROPZXO81HU7Tz0IcxF/b2Q1w9xNcmnLML
	nk9WJduO8FOuLWUB3yw9OTRe6cSRHZL7cX8eIKRgyRPe/ucRSqz8n3lj1LAIwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking support
In-Reply-To: <DECLLWEB1UTF.JO173TKNZ28M@kernel.org> (Michael Walle's message
	of "Wed, 19 Nov 2025 11:27:27 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
	<DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org> <87tsyqcqcl.fsf@bootlin.com>
	<DECLLWEB1UTF.JO173TKNZ28M@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:35:38 +0100
Message-ID: <878qg2apsl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_093545_323658_4EA1452B 
X-CRM114-Status: GOOD (  17.40  )
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

Pj4gNSkgSWYgeW91ciBmbGFzaCBzdXBwb3J0cyBsb2NraW5nLCBwbGVhc2UgZ290IHRocm91Z2gg
dGhlIGZvbGxvd2luZyB0ZXN0Cj4+ICAgIHByb2NlZHVyZSB0byBtYWtlIHN1cmUgaXQgY29ycmVj
dGx5IGJlaGF2ZXMuCj4+Cj4+ICAgIFdhcm5pbmc6IFRoZXNlIHRlc3RzIG1heSBoYXJkIGxvY2sg
eW91ciBkZXZpY2UhIE1ha2Ugc3VyZToKPj4gICAgLSBUaGUgZGV2aWNlIGlzIG5vdCBoYXJkIGxv
Y2tlZCBhbHJlYWR5ICgjV1Agc3RyYXBwZWQgdG8gbG93IGFuZAo+PiAgICAgIFNSX1NSV0QgYml0
IHNldCkKPj4gICAgLSBJZiB5b3UgaGF2ZSBhICNXUCBwaW4sIHlvdSBtYXkgd2FudCB0byBzZXQg
YG5vLXdwYCBpbiB5b3VyIERUIGZvcgo+PiAgICAgIHRoZSB0aW1lIG9mIHRoZSB0ZXN0LCB0byBv
bmx5IG1ha2UgdXNlIG9mIHNvZnR3YXJlIHByb3RlY3Rpb24uCj4KPiBZZXMgdGhhdCBpcyBtdWNo
IGJldHRlci4gQlRXLCBJJ3ZlIG5ldmVyIHNlZW4gIiNzaWduYWwiIGJ1dCBvbmx5Cj4gU0lHIywg
blNJRywgU0lHbiBvciAvU0lHLCBtYXliZSBJIGhhdmVuJ3QgcGFpZCB0b28gbXVjaCBhdHRlbnRp
b24uCgpBaCwgcmlnaHQuIEknbSBmaW5lIGVpdGhlciB3YXlzLiBJJ2xsIGxvb2sgZm9yIG9jY3Vy
cmVuY2VzIGFuZCB1c2Ugb25lCm9mIHlvdXIgc3VnZ2VzdGlvbnMuCgo+PiBQbGVhc2UgYW1lbmQg
dGhpcyB0ZXh0IGlmIHlvdSBzdGlsbCB0aGluayBpdCBpcyBtaXNzaW5nIGhpcyBnb2FsLgo+Cj4g
V2hhdCBhYm91dAo+Cj4gICAgIC0gSWYgeW91IGhhdmUgYSBXUG4gcGluLCB5b3UgbWF5IHdhbnQg
dG8gc2V0IGBuby13cGAgaW4geW91ciBEVCBmb3IKPiAgICAgICB0aGUgdGltZSBvZiB0aGUgdGVz
dCwgdG8gb25seSBtYWtlIHVzZSBvZiBzb2Z0d2FyZSBwcm90ZWN0aW9uLgo+ICAgICAgIE90aGVy
d2lzZSwgY2xlYXJpbmcgdGhlIGxvY2tpbmcgc3RhdGUgZGVwZW5kcyBvbiB0aGUgV1BuCj4gICAg
ICAgc2lnbmFsIGFuZCBpZiBpdCBpcyB0aWVkIHRvIGxvdywgdGhlIGZsYXNoIHdpbGwgYmUgcGVy
bWFuZW50bHkKPiAgICAgICBsb2NrZWQuCgpZZXAsIEknbGwgdXNlIHRoYXQuCgo+Pj4+ICsgICAg
cm9vdEAxOn4jIGZsYXNoX2xvY2sgLXUgL2Rldi9tdGQwCj4+Pj4gKyAgICByb290QDE6fiMgZmxh
c2hfbG9jayAtbCAvZGV2L210ZDAgJCgoJHNpemUgLSAoMiAqICRicykpKSAyICMgbGFzdCB0d28K
Pj4+PiArICAgIHJvb3RAMTp+IyBzaG93X3NlY3RvcnMKPj4+PiArICAgIHNvZnR3YXJlIGxvY2tl
ZCBzZWN0b3JzCj4+Pj4gKyAgICAgcmVnaW9uIChpbiBoZXgpICAgfCBzdGF0dXMgICB8ICNibG9j
a3MKPj4+PiArICAgICAtLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLQo+Pj4+
ICsgICAgIDAwMDAwMDAwLTAzZmRmZmZmIHwgdW5sb2NrZWQgfCAxMDIyCj4+Pj4gKyAgICAgMDNm
ZTAwMDAtMDNmZmZmZmYgfCAgIGxvY2tlZCB8IDIKPj4+PiArICAgIHJvb3RAMTp+IyBmbGFzaF9s
b2NrIC11IC9kZXYvbXRkMCAkKCgkc2l6ZSAtICgyICogJGJzKSkpIDEgIyBsYXN0IG9uZQo+Pj4K
Pj4+IGh1aD8gc2hvdWxkbid0IHRoYXQgYmUgMSAqICRicz8KPj4KPj4gSSBkb24ndCB0aGluayBz
bzoKPj4gLSBmaXJzdCB3ZSBsb2NrIHRoZSBsYXN0IHR3byBibG9ja3MgKG9mZnNldDogc2l6ZSAt
IDIgYmxvY2tzLCBsZW5ndGg6IDIKPj4gICBibG9ja3MpCj4+IC0gdGhlbiB3ZSB1bmxvY2sgdGhl
IHBlbnVsdGltYXRlIGJsb2NrIHNvIHRoYXQgb25seSB0aGUgbGFzdCBibG9jawo+PiAgIHJlbWFp
bnMgbG9ja2VkIChvZmZzZXQ6IHNpemUgLSAyIGJsb2NrcywgbGVuZ3RoIDEpLgo+Cj4gWWVzIHlv
dSdyZSBjb3JyZWN0LiBJJ3ZlIHJlYWQgdGhlIC11IGZvciBhIC1sIChhbmQgc29tZWhvdyBhc3N1
bWVkCj4gYSBjb21wbGV0ZSB1bmxvY2sgaW4gYmV0d2VlbikuCgpZb3UgY2Fubm90IGltYWdpbmUg
aG93IG1hbnkgdGltZXMgdGhpcyBoYXBwZW5lZCB0byBtZSB3aGlsZQp3cml0aW5nL3Rlc3Rpbmcv
ZG9jdW1lbnRpbmcgYWxsIHRoaXMgOi0pCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
