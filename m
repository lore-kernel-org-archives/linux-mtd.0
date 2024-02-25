Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C259CC47DD9
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Feb 2024 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uH9QovD8UDFdFVm5hYYSigigM/mWgXgUKuk1cGL5ubc=; b=JSen1U36g8I9cK
	nACZkGPuJT4g7RqRXTqycumy47Y/Hix+UnvV/q62CTN1BfwyUL6wFRkHIisdWQunaUaHRNkE9E4cl
	LWv2LhLB2hEoN19oc8N6zgJ2l/Oker9Bt5Os7NlUhcz1MVALNHnwdc8/4FqevVLfYutnuPa/LeG5k
	gNrBpPm8h44VLfnnBLgnJmBBzw0gLJCUU3AVvlRBN0zWfWi23MqN66q1epTcsdRQfYF7MznR9/QrL
	Y3XjCEwnBjdHuugSZ3JEAzn13QchvWnQjs2bg3I1TA86ypMvJAypF6tkIoaV3jL+QrkbAIHN9Z+Xa
	MCDvZfH36YWMXX/uywsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reKvN-0000000Fdwn-3jfz;
	Sun, 25 Feb 2024 20:16:37 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reKvJ-0000000FdwO-3cTM
	for linux-mtd@lists.infradead.org;
	Sun, 25 Feb 2024 20:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1708892190; x=1709151390;
	bh=cPbPG3uOvlFXj7CQ8vLSlhfo46pBPzqgKu0g5fXAYM8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=P29IpmflpJfyZiJQm3j6juYz6/e+zOKi0E5LqEKSENaPU84I9QtxcGWjezFQ1Ko3j
	 aBBjjH47hs1inq9Xgp+jNJlVrXGxDAV9QxI18jq4e3UhUvtV/RJWNQxYfPQRRO4zPK
	 JLaHyQ68hkZr2PNk8CfyYq1i8OKg2B5nViM83iAtWyOCiKXlPFYXC4Jw4dtX0SmtaW
	 B2kamzYH2BXF4Aqbj5sUWTRE5MODkLjHtLvHYRDR+7Okqka9N/zuA2IYK3QlmYXIV+
	 lxZeMupsQSeFo1jtRncvPawNHdFsSHF1YjnsR/YUSgn4kwBzOPZ3HmdLR220Tmt2HF
	 qntk5mKjDEhbQ==
Date: Sun, 25 Feb 2024 20:16:08 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Michael Pratt <mcpratt@pm.me>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, saravanak@google.com, abel.vesa@linaro.org, alexander.stein@ew.tq-group.com, andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com, brgl@bgdev.pl, colin.foster@in-advantage.com, djrscally@gmail.com, dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru, frowand.list@gmail.com, geert@linux-m68k.org, heikki.krogerus@linux.intel.com, kernel@pengutronix.de, linus.walleij@linaro.org, linux@roeck-us.net, luca.weiss@fairphone.com, magnus.damm@gmail.com, martin.kepplinger@puri.sm, rafal@milecki.pl, ansuelsmth@gmail.com, richard@nod.at, sakari.ailus@linux.intel.com, sudeep.holla@arm.com, tglx@linutronix.de, tony@atomide.com, vigneshr@ti.com, dianders@chromium.org, jpb@kernel.org, rafael@kernel.org
Subject: Re: [PATCH v1 2/4] driver core: fw_devlink: Link to supplier ancestor if no device
Message-ID: <iAkBSgwuEqM4V5DeWWTplkq23zj8zBgHebmwIbpQl7MiojKNiMDtJxN_SaQ2F4CjD42K2gR5wxG-63JiUX0mcZ48UrZY2augArDt-II5_TQ=@pm.me>
In-Reply-To: <20240205160011.42d1cf80@xps-13>
References: <20240123014517.5787-1-mcpratt@pm.me> <20240123014517.5787-3-mcpratt@pm.me> <20240205160011.42d1cf80@xps-13>
Feedback-ID: 27397442:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_121634_140215_E4F81EE3 
X-CRM114-Status: GOOD (  29.35  )
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

SGkgTWlxdWVsLAoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIGF0IHdoYXQgSSBoYXZlIHNvIGZh
ci4KCk9uIE1vbmRheSwgRmVicnVhcnkgNXRoLCAyMDI0IGF0IDEwOjAwLCBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gCj4gCj4gSGkgTWljaGFlbCwK
PiAKPiBtY3ByYXR0QHBtLm1lIHdyb3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQgMDE6NDY6NDAgKzAw
MDA6Cj4gCj4gPiBJZiBhIGZ3bm9kZSBpcyBmbGFnZ2VkIGFzIEZXTk9ERV9GTEFHX05PVF9ERVZJ
Q0UKPiA+IGJ5IHRoZSB0aW1lIGEgZGV2aWNlIGxpbmsgaXMgdG8gYmUgbWFkZSB3aXRoIGl0LAo+
ID4gYnV0IG5vdCBmbGFnZ2VkIGFzIEZXTk9ERV9GTEFHX1BBUkVOVF9JU19ERVYsCj4gPiB0aGUg
bGluayBpcyBkcm9wcGVkLCBvdGhlcndpc2UgdGhlIGRldmljZSBsaW5rCj4gPiBpcyBzdGlsbCBt
YWRlIHdpdGggdGhlIG9yaWdpbmFsIHN1cHBsaWVyIGZ3bm9kZS4KPiA+IFRoZW9yZXRpY2FsbHks
IHdlIGNhbiBhbHNvIGhhbmRsZSBsaW5raW5nIHRvIGFuIGFuY2VzdG9yCj4gPiBvZiB0aGUgc3Vw
cGxpZXIgZndub2RlIHdoZW4gZm9ybWluZyBkZXZpY2UgbGlua3MsIGJ1dCB0aGVyZQo+ID4gYXJl
IHN0aWxsIGNhc2VzIHdoZXJlIHRoZSBuZWNlc3NhcnkgZndub2RlIGZsYWdzIGFyZSBzdGlsbCBt
aXNzaW5nCj4gPiBiZWNhdXNlIHRoZSByZWFsIHN1cHBsaWVyIGRldmljZSBkaWQgbm90IHByb2Jl
IHlldC4KPiAKPiAKPiBJIGFtIG5vdCBzdXJlIEkgZm9sbG93IHRoaXMuIEluIHRoZSBmb2xsb3dp
bmcgY2FzZSwgSSB3b3VsZCBleHBlY3QgYW55Cj4gZGVwZW5kZW5jeSB0b3dhcmRzIG5vZGUtYyB0
byBiZSBtYWRlIGFnYWluc3Qgbm9kZS1hLiBCdXQgdGhlIGFib3ZlCj4gcGFyYWdyYXBoIHNlZW1z
IHRvIHRlbGwgb3RoZXJ3aXNlOiB0aGF0IHRoZSBsaW5rIHdvdWxkIGJlIGRyb3BwZWQKPiAoYW5k
IHRodXMsIG5vdCBlbmZvcmNlZCkgYmVjYXVzZSByZWN1cnNpdmVseSBzZWFyY2hpbmcgZm9yIGEg
cGFyZW50Cj4gdGhhdCB3b3VsZCBiZSBhIGRldmljZSBjb3VsZCBiZSBlbmRsZXNzPyBJdCBmZWVs
cyB3cm9uZywgc28gSSBwcm9iYWJseQo+IG1pcwo+IAo+IG5vZGUtYSB7Cj4JIyBJUyBERVYKPglu
b2RlLWIgewo+CQkjIFBBUkVOVCBJUyBERVYKPgkJbm9kZS1jIHsKPgkJCSMgUEFSRU5UIElTIERF
Vgo+CQl9Owo+CX07Cj59Owo+Cj4gQmVzaWRlcyB0aGF0LCB0aGUgY29tbWl0IGZlZWxzIGxpa2Ug
YSBnb29kIGlkZWEuCgoKVGhlIGxpbmsgaXMgZHJvcHBlZCBfaW4gb3JkZXIgdG9fIG1ha2UgdGhl
IGRlcGVuZGVuY3kgdG93YXJkcyBub2RlLWMKYmVjb21lIGEgZGVwZW5kZW5jeSB0b3dhcmRzIG5v
ZGUtYSBpbnN0ZWFkLgoKVGhlICJyZWN1cnNpdmUgc2VhcmNoaW5nIiBoYXBwZW5zIGFmdGVyIGxp
bmtzIGFyZSBkcm9wcGVkIGluIG9yZGVyIHRvCmNyZWF0ZSB0aGUgbmV3IGZ3bm9kZSBsaW5rcywg
YW5kIGl0IGRlcGVuZHMgb24gdGhlIG5ldyBmbGFnCmJlaW5nIHBsYWNlZCB3aGVuIHRoZSBzdXBw
bGllciBkZXZpY2UgKG5vZGUtYSkgcHJvYmVzLCB3aGljaCBjYW4gaGFwcGVuCmJlZm9yZSB0aGUg
bGlua3MgYXJlIHJlLWF0dGVtcHRlZCwgb3IgYWZ0ZXIgYSBzaW5nbGUgcHJvYmUgZGVmZXIgb2Yg
dGhlIGNvbnN1bWVyLgoKSSBwbGFjZWQgYWxsIHRoZSBsb2dpYyB0aGF0IGRlY2lkZXMgd2hldGhl
ciB0byBkcm9wIGxpbmtzIGFuZCByZXRyeSBsaW5raW5nCnRvIHRoZSBjb25zdW1lciBpbW1lZGlh
dGVseSBiZWZvcmUgYSBwcm9iZSBkZWZlciBvZiB0aGUgY29uc3VtZXIgd291bGQgb2NjdXIuClRo
YXQgbG9naWMgY291bGQgYmUgZGlzdHJpYnV0ZWQgYXJvdW5kIG11bHRpcGxlIGZ1bmN0aW9ucyBm
b3IgZndfZGV2bGluaywKYnV0IEknbSBjb25jZXJuZWQgYWJvdXQgZmFsc2UgcG9zaXRpdmVzLiBU
aGUgb25seSByZWFzb24gSSBkaWRuJ3QgdXNlIG9yIG1ha2UKYSBuZXcgZnVuY3Rpb24gaW4gb3Jk
ZXIgdG8gIm1vdmUiIHRoZSBsaW5rcyBpcyB0aGF0IGluIHRoaXMgcG9zaXRpb24gaW4gdGhlIGRy
aXZlciBjb3JlCndoaWNoIEkgYmVsaWV2ZSBpcyB0aGUgcmlnaHQgcGxhY2UgdG8gZG8gdGhlIGZp
eHVwIGZ1bmN0aW9uLCB3ZSBkb24ndCBoYXZlIGRpcmVjdCBhY2Nlc3MKdG8gdGhlIGZ3bm9kZSB0
aGF0IHRoZSBsaW5rcyBzaG91bGQgZ28gdG8sIGl0IHdvdWxkIGhhdmUgdG8gYmUgZGlzY292ZXJl
ZCBieSByZWN1cnNpdmVseQp3YWxraW5nIHVwIHRoZSB0cmVlIGxvb2tpbmcgZm9yIHRoZSBmbGFn
IGluIHRoZSBuZXcgZml4dXAgZnVuY3Rpb24KaW5zdGVhZCBvZiB3aGVyZSB0aGUgZndub2RlIGxp
bmtzIGFyZSBtYWRlLgoKVG8gbWUsIGl0IGRvZXNuJ3QgbWF0dGVyIHdoaWNoIG9yZGVyIHdlIGNh
bGwgdGhlIGZ1bmN0aW9ucywKYnV0IGlmIHdlIGFyZSBzdGFydGluZyB3aXRoIGZ3bm9kZSBsaW5r
cyB0aGF0IHJlZnVzZQp0byBiZSBjb252ZXJ0ZWQgdG8gZGV2aWNlIGxpbmtzLCB3ZSBuZWVkIHRv
IGRvIG1vcmUgdGhhbiBqdXN0IG1vdmUgdGhlIGZ3bm9kZSBsaW5rcwpiZWNhdXNlIGFmdGVyIGEg
cHJvYmUgZGVmZXIgdGhlcmUgaXMgbm8gaG9vayB0byBhdXRvbWF0aWNhbGx5IHRyeSBzd2l0Y2hp
bmcgdGhlbQp0byBkZXZpY2UgbGlua3MgYWdhaW4uIERyaXZlciBjb3JlIGV4cGVjdHMgdGhhdCB0
byBoYXZlIGFscmVhZHkgaGFwcGVuZWQgYnkgdGhlbi4KSSBpbWFnaW5lIHRoYXQgd2l0aG91dCBo
YXZpbmcgdG8gYWRkIGEgbG90IG1vcmUgY29kZSBpbiBhIGxvdCBvZiBwbGFjZXMsCkkgd291bGQg
aGF2ZSB0byBjYWxsIGZ3X2RldmxpbmtfbGlua19kZXZpY2UoKSBhZnRlciAibW92aW5nIiBsaW5r
cyBhbnl3YXkuLi4KCkl0J3MgcG9zc2libGUgdG8gY2FsbCB0aGF0IGZ1bmN0aW9uIG9ubHkgd2hl
biB0aGUgYmFkIGxpbmsgaXMgc3RpbGwgYSBmd25vZGVfbGluawphbmQgZG8gYSAibW92ZSIgZnVu
Y3Rpb24gd2hlbiB0aGUgYmFkIGxpbmsgaXMgYSBkZXZpY2VfbGluaywgdGhhdCBpcywKaWYgIm1v
dmluZyIgYSBmaW5pc2hlZCBkZXZpY2VfbGluayBpcyBwb3NzaWJsZSBvciBnb29kIHByYWN0aWNl
IGF0IGFsbApzaW5jZSBpdCB3b3VsZCBiZSBza2lwcGluZyBxdWl0ZSBhIGZldyBjaGVja3MgdGhh
dCBvY2N1ciBiZWZvcmUgYSBkZXZpY2VfbGluayBpcyBtYWRlLgpJdCBzZWVtcyB0byBtZSB0aGF0
IG1ha2luZyBhIGRldmljZV9saW5rIGlzIGEgbXVsdGlwbGUtc3RlcCBwcm9jZXNzLCBzbyBhIG5l
dyBmdW5jdGlvbgp0byBvbmx5IG1vdmUgdGhlIHN1cHBsaWVyIG9mIGEgZGV2aWNlX2xpbmsgbWln
aHQgYmUgYSBiaWcgb25lIGFzIHdlbGwuCkkgdGVuZCB0byB0cnkgdG8gcmV1c2UgYXMgbWFueSBj
b3JlIGZ1bmN0aW9ucyBhcyBJIGNvdWxkLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKLS0KTUNQ
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
