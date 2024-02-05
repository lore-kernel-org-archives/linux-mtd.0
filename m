Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B28C48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ra6vUI7rWXSkSTptpqcaAmd0UQ1jCyZLK7wdeHM+LY=; b=cQ/OAFjzaE/Q1E
	7WePc0m3HvaJKTpCCSOLFxY6E7XhLDTlqbGQzRji10cdcVmYrYXyXYXZ8EJ6KkXyYvPjIZbGwotkz
	ASWwWemNzh6tn53Y5m5kAN5xv8VBR38N036Xyoz74Ozgq5L392zOnR/snf5wlg2wlUguwBqnmXcUP
	kx1gzRW0Uw0ePpp3QWDTjfKDFwxYKgrBOtYiYYZhKpslKEtFB9nMJLpJ2Iwcs9qifMp+MzSdGNF0i
	kzd/eqneOn/uWTj0wmCIi1ohC3JGdxinyIo3HcT2whKn28+Sk0Ua2ixz5jw7C1MueY6g2cvTj3gEq
	q4+Vs2Rqs4Pfl8ot1SIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0dF-00000003jWn-2muu;
	Mon, 05 Feb 2024 15:11:37 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0dC-00000003jWN-3CUp
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 15:11:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0264C60004;
	Mon,  5 Feb 2024 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707145892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=or1mC3Cf+BGWdRGGha8GQZG8rLMB4ONTBBAhWbyuCyU=;
	b=LRqzQoMwi0LqJMn0BW7k9Q1PJnJOdm0smu8g8xANoGjCCjB4wSIO9lrD0rzsjkaW0mL4he
	Rrh0x+s78SdEpCrUOfDzXTvS1f6SvnfCoKy6cpXrqkgORMC60KGC8oQ1K76cy0nv1FDwcp
	nJx3hC9Du2oCn4qyDqL9IOYfRslZRh38kJ0tNH1hC+EQYpRSvOKhAk4FO7CF+hpyQrYvEb
	YbCVk0glppCgwpO3sEVsbCh8IjonYY2p4WiLvOZ88SQJT9z8waw/Yl/Z8eelCF+F1Wl6Eu
	i1X+9h5/XoETw2OMXInCqaxmaw2GU59MhKQcwdPb2dzKyldyOCRgcInWBTRmwQ==
Date: Mon, 5 Feb 2024 16:11:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Pratt <mcpratt@pm.me>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 saravanak@google.com, abel.vesa@linaro.org,
 alexander.stein@ew.tq-group.com, andriy.shevchenko@linux.intel.com,
 bigunclemax@gmail.com, brgl@bgdev.pl, colin.foster@in-advantage.com,
 djrscally@gmail.com, dmitry.baryshkov@linaro.org, festevam@gmail.com,
 fido_max@inbox.ru, frowand.list@gmail.com, geert@linux-m68k.org,
 heikki.krogerus@linux.intel.com, kernel@pengutronix.de,
 linus.walleij@linaro.org, linux@roeck-us.net, luca.weiss@fairphone.com,
 magnus.damm@gmail.com, martin.kepplinger@puri.sm, rafal@milecki.pl,
 ansuelsmth@gmail.com, richard@nod.at, sakari.ailus@linux.intel.com,
 sudeep.holla@arm.com, tglx@linutronix.de, tony@atomide.com,
 vigneshr@ti.com, dianders@chromium.org, jpb@kernel.org, rafael@kernel.org
Subject: Re: [PATCH v1 4/4] mtd: mtdpart: Allow fwnode links to NVMEM
 compatible fwnodes
Message-ID: <20240205161129.1889a943@xps-13>
In-Reply-To: <20240123014517.5787-5-mcpratt@pm.me>
References: <20240123014517.5787-1-mcpratt@pm.me>
	<20240123014517.5787-5-mcpratt@pm.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_071134_963679_4FF025EA 
X-CRM114-Status: GOOD (  13.49  )
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

SGkgTWljaGFlbCwKCm1jcHJhdHRAcG0ubWUgd3JvdGUgb24gVHVlLCAyMyBKYW4gMjAyNCAwMTo0
NzoyMSArMDAwMDoKCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBmYjQyMzc4ZGNjN2YyNDdkZjU2ZjBl
Y2RkZmRhZTg1NDg3NDk1ZmJjCj4gKCJtdGQ6IG10ZHBhcnQ6IERvbid0IGNyZWF0ZSBwbGF0Zm9y
bSBkZXZpY2UgdGhhdCdsbCBuZXZlciBwcm9iZSIpLgo+IAo+IFRoYXQgY29tbWl0IGlzIGEgbWFu
dWFsIG5hbWVkIGV4Y2VwdGlvbiBpbiBvcmRlciB0byBhdm9pZCBmd19kZXZsaW5rIGxpbmtzCj4g
dG8gYW4gIm52bWVtLWNlbGxzIiBjb21wYXRpYmxlIG5vZGUgd2hpY2ggaXMgYSBkZXNjZW5kYW50
IG9mIHRoZSBmd25vZGUKPiB0aGF0IHJlcHJlc2VudHMgdGhlIHJlYWwgc3VwcGxpZXIgZGV2aWNl
IHRoYXQgcHJvYmVzLgo+IAo+IFRoZSBjb21taXQgZG9lcyBub3Qgd29yayBmb3IgbmV3ZXIgY2Fz
ZXMsIGxpa2UgdGhlICJmaXhlZC1sYXlvdXQiCgpEbyB5b3UgaGF2ZSBwbGFucyBmb3IgaXQ/IEJl
Y2F1c2UgaXQgaXMgdGhlIG1vZGVybiBkZXNjcmlwdGlvbiB0aGF0IGlzCm5vdyBleHBlY3RlZCwg
c28gSSBkb24ndCBmZWVsIGNvbnZpbmNlZCBieSBhbGwgdGhpcyB3b3JrICh3aGljaCBpcwpuZXZl
cnRoZWxlc3MgY29uc2lkZXJhYmxlKSBpZiBmaXhlZC1sYXlvdXRzIGFyZSBzdGlsbCBicm9rZW4/
Cgo+IGNvbXBhdGlibGUgbm9kZXMsIGJ1dCBpbnN0ZWFkIG9mIGFkZGluZyBhbm90aGVyIGNvbXBh
dGlibGUgc3RyaW5nLAo+IHJlbW92ZSB0aGlzIHdvcmthcm91bmQgYXMgaXQgaXMgbm8gbG9uZ2Vy
IG5lZWRlZCBhZnRlcgo+IHRoZSBwcmV2aW91cyBmZXcgY29tbWl0cyB3aGljaCBoYW5kbGUgdGhl
IHNpdHVhdGlvbiBpbiBhIGdlbmVyaWMgd2F5Cj4gZm9yIGFsbCBzdXBwbGllciBub2RlcyB0aGF0
IGFyZSBhIGNoaWxkIG9yIGZ1cnRoZXIgZGVzY2VuZGFudCBmd25vZGUKPiBvZiBhIHBhcmVudCBk
ZXZpY2UgdGhhdCBjYW4gcHJvYmUsIGluY2x1ZGluZyB3aGVuIHRoZSBjb25zdW1lciBkZXZpY2UK
PiBoYXMgYSBwcm9iZSBhdHRlbXB0IGJlZm9yZSB0aGUgc3VwcGxpZXIgZGV2aWNlLCBieSB1c2lu
ZyBhbiBleGlzdGluZwo+IGluY29ycmVjdCBmd25vZGUgb3IgZGV2aWNlIGxpbmsgdG8gcmVjcmVh
dGUgdGhlIGNvcnJlY3Qgb25lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUHJhdHQgPG1j
cHJhdHRAcG0ubWU+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
