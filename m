Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B66C0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 09:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/u4MxKpoPD6UckrvdGgifvlAnOWI+b9NwTGfJK8gck=; b=hzXOnm1i7ybIMO
	Hwzms7AVgVnrR8cCmr3csBaZ3UHzh0HQ4GTdH5p0wGp5mdfVih8o242xADbOx/V0jxKtgQ9bbPeQK
	JVknRDvGp5H5kMzDrZC7Sy8x/pDOcTxq0GVeXKCngW3y52kJSz/v6BBXWl8oUNEJPYdq+4ujOCxvd
	+JW419dk+JBAiU9V7uvBryYRuE/pDXGdOukK3F6bQPb3rx/SvO/a0AofIo1yz+9zqcyRhxFm6E2hg
	H5s3qq1xawzX0fsbzhJnLfdY+lQx36lNmBu/R1GaGeyjmb4zgXxY71AbajfnJcSLxqGBnnc5KWXsQ
	GWnOWH3dCMVIjIcmhkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4gt-00000006gHV-45XM;
	Wed, 29 Jan 2025 09:48:59 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4gq-00000006gGi-24nW
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 09:48:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5D4C43315;
	Wed, 29 Jan 2025 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738144130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVuTnPCAKwBS/56T6+nHjnL7KVAXlq5ifzpL9W0xdGc=;
	b=ohWyyJbW9yvb8lNnxzxXHrJQwwJBvbzdYapsglHzzBA+kJQrfHrWoHl7ingGsr/jY1GmlH
	yDFZJR1zQ++ejCSW4/3L5LihddHaG7TzxerIAU+CLJvjY27mi64B6q0bkdp36ojGcLG23v
	R4PslEJ2xVTtiShsNmEJnMAdKeEuwU5+T4Kgs+uCS+4YnNr5t8Yr2KSHDgMoi0A6h+hnEH
	siYeltGLgQztVJwPT+o17LYgQtU2e2244uaZnZoMS+4k7N7n0bcUQLqxH7LwOSd4Mftmgx
	QArq09wenyO1C6s2BDiLa/wSqKQO0w9M7mjoNXF5k5R5RS/HkK7aswM3IfhNpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: cadence: fix incorrect dev context
 in dma_unmap_single
In-Reply-To: <BL3PR11MB653275BDFAB8FAA2EC499666A2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Wed, 29 Jan 2025 08:58:56 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-4-niravkumar.l.rabara@intel.com>
	<875xm8pk4n.fsf@bootlin.com>
	<BL3PR11MB653275BDFAB8FAA2EC499666A2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 29 Jan 2025 10:48:47 +0100
Message-ID: <878qqu2bnk.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnihhrrghvkhhumhgrrhdrlhdrrhgrsggrrhgrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorhhgpdhrtghpthhtohepshhhvghnlhhitghhuhgrnhesvhhivhhordgtohhmpdhrtghpthhtoheprhhurghnjhhinhhji
 hgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_014856_830866_287522D1 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgo+PiA+IGRtYV9tYXBfc2luZ2xlIGlzIHVzaW5nIGRtYV9kZXYtPmRldiwgaG93ZXZl
ciBkbWFfdW5tYXBfc2luZ2xlIGlzCj4+ID4gdXNpbmcgY2Ruc19jdHJsLT5kZXYsIHdoaWNoIGlz
IGluY29ycmVjdC4KPj4gPiBVc2VkIHRoZSBjb3JyZWN0IGRldmljZSBjb250ZXh0IGRtYV9kZXYt
PmRldiBmb3IgZG1hX3VubWFwX3NpbmdsZS4KPj4gCj4+IEkgZ3Vlc3Mgb24gaXMgdGhlIHBoeXNp
Y2FsL2J1cyBkZXZpY2UgYW5kIHRoZSBvdGhlciB0aGUgZnJhbWV3b3JrIGRldmljZT8gSXQKPj4g
d291bGQgYmUgbmljZSB0byBjbGFyaWZ5IHRoaXMgaW4gdGhlIGNvbW1pdCBsb2cuCj4+IAo+Cj4g
Tm90ZWQuIElzIHRoZSBjb21taXQgbWVzc2FnZSBiZWxvdyBhY2NlcHRhYmxlPyAKPgo+IGRtYV9t
YXBfc2luZ2xlIGlzIHVzaW5nIHBoeXNpY2FsL2J1cyBkZXZpY2UgKERNQSkgYnV0IGRtYV91bm1h
cF9zaW5nbGUKPiBpcyB1c2luZyBmcmFtZXdvcmsgZGV2aWNlKE5BTkQgY29udHJvbGxlciksIHdo
aWNoIGlzIGluY29ycmVjdC4KPiBGaXhlZCBkbWFfdW5tYXBfc2luZ2xlIHRvIHVzZSBjb3JyZWN0
IHBoeXNpY2FsL2J1cyBkZXZpY2UuCgpPayBmb3IgbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
