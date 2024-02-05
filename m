Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F9CC48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1V+6G5FLFWyJ5EGLsIPQ48r3G/T+pIBackl5xdClU4=; b=Ca4hQwhxDgU1N7
	nXU/EsAVb9kPSVL9OrAt8pnIoh6tOh5DaXo7OsV6iChTjcTm6Oh5UyTV+BiUVMYQNP6O+Kf9M/TPJ
	BHvNzZt0JUsGTqhcogDwAPGQ5mOQ4mbRVNe7O0cZLaRdkWQG+cSp1m22lAwKcIswHPjciLaXGY4EO
	vWr9KU9equu9WO3ws5Yt4znnW9n/4uqUBAsnZWY+g26n3YsqlBgs1PfLckmOI2aD5G1Ewn4MNpNfy
	cJAXGBSiqOZbFUc/Z4H5WTpX4ZeO0nIGktsNrp+saTp8cDPzhsYyN7QHuI8uNPfdnWcDkNPML8HOW
	26tXek454FrKQ8swPbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0SP-00000003iBJ-2wsA;
	Mon, 05 Feb 2024 15:00:25 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0SM-00000003i9p-2h1N
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 15:00:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 678FA60017;
	Mon,  5 Feb 2024 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707145218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WPodUhe/h+mqC6ZYnqckKI3xdNBGby9JuWEoJjCPXA=;
	b=Lf3Rbl7PyJ+xoxB5TMoTgADhXfAF+j3HyBn3Fd54N2T0hcnu2H+XNimSgEoJ28iOJNa52i
	BP8f8r3mm8ivXD5O95q2aUQ9MddM6hq/7yNLrGENLJoZrAcqFAKAES98soOM5Sp8k1VvrD
	XccJAMcJ7NF+HtHUfXTjbCrwiquhg+AuVDYOxhSeImQzbUu6wxERIW+YrevxKh8hCjWPdM
	HxFJ2dI4G7z1LjLd/f6IveA0Cv0WMEAstuJsFR4TXWVbYjh1vP0bAimJdX5Y3n7+lriAjN
	VxlcFjpralO/VadvUCI2Sv9VnSm+op07LZyouk71uEbrA6jGV/MEIiw+0p5yUQ==
Date: Mon, 5 Feb 2024 16:00:11 +0100
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
Subject: Re: [PATCH v1 2/4] driver core: fw_devlink: Link to supplier
 ancestor if no device
Message-ID: <20240205160011.42d1cf80@xps-13>
In-Reply-To: <20240123014517.5787-3-mcpratt@pm.me>
References: <20240123014517.5787-1-mcpratt@pm.me>
 <20240123014517.5787-3-mcpratt@pm.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_070022_984650_B3868435 
X-CRM114-Status: GOOD (  28.15  )
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

SGkgTWljaGFlbCwKCkZpcnN0LCBJIHdhbnQgdG8gc2F5LCB0aGlzIGlzIGEgZ3JlYXQgam9iIGFz
IGZ3X2RldmxpbmtzIGluIG10ZCBhbmQKbnZtZW0gYXJlIHJlYWxseSBub3QgZWFzeSB0byBoYW5k
bGUuIEkgYW0gd2lsbGluZyB0byBoZWxwLCBkZXNwaXRlIG15CnZlcnkgbGlnaHQgdW5kZXJzdGFu
ZGluZyBvZiB3aGF0IHRoZSBjb3JlIGFjdHVhbGx5IGRvZXMgd2l0aCB0aGVzZQpmbGFncy4KCm1j
cHJhdHRAcG0ubWUgd3JvdGUgb24gVHVlLCAyMyBKYW4gMjAyNCAwMTo0Njo0MCArMDAwMDoKCj4g
RHJpdmVyIGNvcmUgY3VycmVudGx5IHN1cHBvcnRzIGxpbmtpbmcgdG8gdGhlIG5leHQgcGFyZW50
IGZ3bm9kZSwKPiBidXQgaXMgbm90IHlldCBoYW5kbGluZyBjYXNlcyB3aGVyZSB0aGF0IHBhcmVu
dAo+IGlzIGFsc28gYSBmaXJtd2FyZSBjaGlsZCBub2RlIG5vdCByZXByZXNlbnRpbmcgYSByZWFs
IGRldmljZSwKPiB3aGljaCBjYW4gbGVhZCB0byBhbiBpbmRlZmluaXRlIGRlZmVycmVkIHByb2Jl
IGluIHNvbWUgY2FzZXMuCj4gSW4gdGhpcyBjYXNlLCB0aGUgZndub2RlIHRoYXQgc2hvdWxkIGFj
dHVhbGx5IGJlIGxpbmtlZCB0bwo+IGlzIG11bHRpcGxlIGFuY2VzdG9ycyB1cCB3aGljaCBwcmVz
ZW50cyBhIGNoYWxsZW5nZSB3aGVyZQo+IGl0IGlzIHVua25vd24gaG93IG1hbnkgYW5jZXN0b3Jz
IHVwIHRoZSBub2RlIHRoYXQKPiByZXByZXNlbnRzIHRoZSByZWFsIHByb2JpbmcgZGV2aWNlIGlz
LiBUaGlzIG1ha2VzIHRoZSB1c2FnZSBvZgo+IGZ3bm9kZV9nZXRfbmV4dF9wYXJlbnRfZGV2KCkg
aW5zdWZmaWNpZW50IGJlY2F1c2UgdGhlIHJlYWwgZGV2aWNlJ3MKPiBmd25vZGUgbWF5IG9yIG1h
eSBub3QgYmUgYW4gYW5jZXN0b3Igb2YgdGhlIG5leHQgcGFyZW50IGZ3bm9kZSBhcyB3ZWxsLgo+
IAo+IEludHJvZHVjZSBmbGFnIEZXTk9ERV9GTEFHX1BBUkVOVF9JU19ERVYKPiBpbiBvcmRlciB0
byBtYXJrIGNoaWxkIGZpcm13YXJlIG5vZGVzIG9mIGEgZGV2aWNlCj4gYXMgaGF2aW5nIGEgcGFy
ZW50IGRldmljZSB0aGF0IGNhbiBwcm9iZS4KPiAKPiBBbGxvdyBmd25vZGUgbGluayBjcmVhdGlv
biB0byB0aGUgb3JpZ2luYWwgc3VwcGxpZXIgZndub2RlJ3MgYW5jZXN0b3JzCj4gd2hlbiB0aGUg
b3JpZ2luYWwgc3VwcGxpZXIgZndub2RlIGFuZCBhbnkgZndub2RlcyBpbiBiZXR3ZWVuIGFyZSBm
bGFnZ2VkCj4gYXMgRldOT0RFX0ZMQUdfTk9UX0RFVklDRSBhbmQvb3IgRldOT0RFX0ZMQUdfUEFS
RU5UX0lTX0RFVgo+IHdpdGggYSBuZXcgZnVuY3Rpb24gX19md25vZGVfbGlua19hZGRfcGFyZW50
cygpIHdoaWNoIHRoZW4gY3JlYXRlcwo+IHRoZSBmd25vZGUgbGluayB0byBhIHJlYWwgZGV2aWNl
IHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBsaWVyJ3MgZnVuY3Rpb24uCj4gCj4gVGhpcyBkZXBlbmRz
IG9uIG90aGVyIGZ1bmN0aW9ucyB0byBsYWJlbCBhIHN1cHBsaWVyIGZ3bm9kZQo+IGFzIG5vdCBh
IHJlYWwgZGV2aWNlLCB3aGljaCBtdXN0IGJlIGRvbmUgYmVmb3JlIHRoZSBmd25vZGUgbGlua3MK
PiBhcmUgY3JlYXRlZCwgYW5kIGlmIGFmdGVyIHRoYXQsIHJlbGV2YW50IGxpbmtzIHRvIHRoZSBz
dXBwbGllcgo+IHdvdWxkIGhhdmUgdG8gYmUgZGVsZXRlZCBhbmQgaGF2ZSBsaW5rcyByZWNyZWF0
ZWQsIG90aGVyd2lzZSwKPiB0aGUgZndub2RlIGxpbmsgd291bGQgYmUgZHJvcHBlZCBiZWZvcmUg
dGhlIGRldmljZSBsaW5rIGlzIGF0dGVtcHRlZAo+IG9yIGEgZndub2RlIGxpbmsgd291bGQgbm90
IGJlIGFibGUgdG8gYmVjb21lIGEgZGV2aWNlIGxpbmsgYXQgYWxsLAo+IGJlY2F1c2UgdGhleSB3
ZXJlIGNyZWF0ZWQgYmVmb3JlIHRoZXNlIGZ3bm9kZSBmbGFncyBjYW4gaGF2ZSBhbnkgZWZmZWN0
Lgo+IAo+IEl0IGFsc28gZGVwZW5kcyBvbiB0aGUgc3VwcGxpZXIgZGV2aWNlIHRvIGFjdHVhbGx5
IHByb2JlIGZpcnN0Cj4gaW4gb3JkZXIgdG8gaGF2ZSB0aGUgZndub2RlIGZsYWdzIGluIHBsYWNl
IHRvIGtub3cgZm9yIGNlcnRhaW4KPiB3aGljaCBmd25vZGVzIGFyZSBub24tcHJvYmluZyBjaGls
ZCBub2Rlcwo+IG9mIHRoZSBmd25vZGUgZm9yIHRoZSBzdXBwbGllciBkZXZpY2UuCj4gCj4gVGhl
IHVzZSBjYXNlIG9mIGZ1bmN0aW9uIF9fZndfZGV2bGlua19waWNrdXBfZGFuZ2xpbmdfY29uc3Vt
ZXJzKCkKPiBpcyBkZXNpZ25lZCBzbyB0aGF0IHRoZSBwYXJhbWV0ZXJzIGFyZSBhbHdheXMgYSBz
dXBwbGllciBmd25vZGUKPiBhbmQgb25lIG9mIGl0J3MgcGFyZW50IGZ3bm9kZXMsIHNvIGl0IGlz
IHNhZmVyIHRvIGFzc3VtZSBhbmQgbW9yZSBzcGVjaWZpYwo+IHRoYXQgdGhlIGZsYWcgUEFSRU5U
X0lTX0RFViBzaG91bGQgYmUgYWRkZWQgdGhlcmUsIHJhdGhlciB0aGFuCj4gZGVjbGFyaW5nIHRo
ZSBvcmlnaW5hbCBzdXBwbGllciBmd25vZGUgYXMgTk9UX0RFVklDRSBhdCB0aGF0IHBvaW50Lgo+
IEJlY2F1c2UgdGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgd2hlbiB0aGUgcmVhbCBzdXBwbGllciBk
ZXZpY2UgcHJvYmVzCj4gYW5kIHJlY3Vyc2l2ZWx5IGNhbGxzIGl0c2VsZiBmb3IgYWxsIGNoaWxk
IG5vZGVzIG9mIHRoZSBkZXZpY2UncyBmd25vZGUsCj4gc2V0IHRoZSBuZXcgZmxhZyBoZXJlIGlu
IG9yZGVyIHRvIGxldCBpdCBwcm9wYWdhdGUgZG93bgo+IHRvIGFsbCBkZXNjZW5kYW50IG5vZGVz
LCB0aGVyZWJ5IHByb3ZpZGluZyB0aGUgaW5mbyBuZWVkZWQgbGF0ZXIKPiBpbiBvcmRlciB0byBs
aW5rIHRvIHRoZSBwcm9wZXIgZndub2RlIHJlcHJlc2VudGluZyB0aGUgc3VwcGxpZXIgZGV2aWNl
Lgo+IAo+IElmIGEgZndub2RlIGlzIGZsYWdnZWQgYXMgRldOT0RFX0ZMQUdfTk9UX0RFVklDRQo+
IGJ5IHRoZSB0aW1lIGEgZGV2aWNlIGxpbmsgaXMgdG8gYmUgbWFkZSB3aXRoIGl0LAo+IGJ1dCBu
b3QgZmxhZ2dlZCBhcyBGV05PREVfRkxBR19QQVJFTlRfSVNfREVWLAo+IHRoZSBsaW5rIGlzIGRy
b3BwZWQsIG90aGVyd2lzZSB0aGUgZGV2aWNlIGxpbmsKPiBpcyBzdGlsbCBtYWRlIHdpdGggdGhl
IG9yaWdpbmFsIHN1cHBsaWVyIGZ3bm9kZS4KPiBUaGVvcmV0aWNhbGx5LCB3ZSBjYW4gYWxzbyBo
YW5kbGUgbGlua2luZyB0byBhbiBhbmNlc3Rvcgo+IG9mIHRoZSBzdXBwbGllciBmd25vZGUgd2hl
biBmb3JtaW5nIGRldmljZSBsaW5rcywgYnV0IHRoZXJlCj4gYXJlIHN0aWxsIGNhc2VzIHdoZXJl
IHRoZSBuZWNlc3NhcnkgZndub2RlIGZsYWdzIGFyZSBzdGlsbCBtaXNzaW5nCj4gYmVjYXVzZSB0
aGUgcmVhbCBzdXBwbGllciBkZXZpY2UgZGlkIG5vdCBwcm9iZSB5ZXQuCgpJIGFtIG5vdCBzdXJl
IEkgZm9sbG93IHRoaXMuIEluIHRoZSBmb2xsb3dpbmcgY2FzZSwgSSB3b3VsZCBleHBlY3QgYW55
CmRlcGVuZGVuY3kgdG93YXJkcyBub2RlLWMgdG8gYmUgbWFkZSBhZ2FpbnN0IG5vZGUtYS4gQnV0
IHRoZSBhYm92ZQpwYXJhZ3JhcGggc2VlbXMgdG8gdGVsbCBvdGhlcndpc2U6IHRoYXQgdGhlIHRo
ZSBsaW5rIHdvdWxkIGJlIGRyb3BwZWQKKGFuZCB0aHVzLCBub3QgZW5mb3JjZWQpIGJlY2F1c2Ug
cmVjdXJzaXZlbHkgc2VhcmNoaW5nIGZvciBhIHBhcmVudAp0aGF0IHdvdWxkIGJlIGEgZGV2aWNl
IGNvdWxkIGJlIGVuZGxlc3M/IEl0IGZlZWxzIHdyb25nLCBzbyBJIHByb2JhYmx5Cm1pcwoKbm9k
ZS1hIHsKCSMgSVMgREVWCglub2RlLWIgewoJCSMgUEFSRU5UIElTIERFVgoJCW5vZGUtYyB7CgkJ
CSMgUEFSRU5UIElTIERFVgoJCX07Cgl9Owp9OwoKQmVzaWRlcyB0aGF0LCB0aGUgY29tbWl0IGZl
ZWxzIGxpa2UgYSBnb29kIGlkZWEuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
