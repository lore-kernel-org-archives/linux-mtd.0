Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519BBC4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:39:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF592075F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSvgy4Yh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="cmw/hv4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF592075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LVE2EGBQm3ax0fSiaqWOQiyucd4lW56DUf7sde00ZVU=; b=rSvgy4Yhe0pn4d3WIkZHU8D5L
	J4GcyeYoFIDtkTsjEPhw+GLudTjgcqJxE29FKgYNhjl4Y88r1Cki1wLq0uZqw5cZeUuXdoBgxrUiq
	VWYuB7HRVRxQn333tdC0oFfn/0UUWr6jBukj//MTseJj1YRZTbKDFj2HCJcwTcjMcB7/Oxqc6h1mw
	0sOGbWE7s9/qWQRns3RLBiFmDF1lgCgINXNQdWX3q6Uf+9IwDF5KPKbDI6wRgFsRdSYg/0LqXbc6B
	va6XW7bPOCvrdEWDs9nmVK02ZFF7K1H3nX8ACbswakprAs6RbmOLODBsBHpdwg7EqU02NRlCXzjIj
	H/HqmGWdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtAk-0001Rw-Ka; Thu, 01 Oct 2020 07:38:38 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtAg-0001R0-Nq
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:38:37 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DD4FB22FAD;
 Thu,  1 Oct 2020 09:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601537910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGiNXcRQBc+sNSbaF8m1s0WNFrWOF68BnQu0iDZn9pk=;
 b=cmw/hv4c9znNY6TbviqoEmAKKfgSZC1jz21XE9H7Jm97NmK1ktjRaomZ8+snhETVlkuZAY
 /NWWQVwtqgeodoSx7Re86i99NxqJyoPySYvBttm2DB6twt8oBf/GAnMNUKFpreI/cn1OaT
 8+fEbNjNNPpqt6xmClnXqWZ75CtdsDY=
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 09:38:29 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3] mtd: spi-nor: keep lock bits if they are non-volatile
In-Reply-To: <bec5b899-fbd2-1c29-611c-654f17e63dbf@microchip.com>
References: <20200327155939.13153-1-michael@walle.cc>
 <e56c5f60-2f59-f913-6eea-3bf8dd4c0774@microchip.com>
 <a82d1ce203383af149ed77c5fd6c8985@walle.cc>
 <bec5b899-fbd2-1c29-611c-654f17e63dbf@microchip.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <8cbaef6c7565deed1109fe958291d9e0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_033835_053264_ACEF527E 
X-CRM114-Status: GOOD (  25.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpBbSAyMDIwLTEwLTAxIDA5OjA3LCBzY2hyaWViIFR1ZG9yLkFtYmFydXNAbWlj
cm9jaGlwLmNvbToKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4+IGluZGV4IGNjNjhlYTg0MzE4ZS4uZmQx
YzM2ZDcwYTEzIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+
Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+PiBAQCAtMjkxNiwyMCArMjkx
NiwzOCBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcXVhZF9lbmFibGUoc3RydWN0IAo+Pj4+IHNwaV9u
b3IKPj4+PiAqbm9yKQo+Pj4+IMKgfQo+Pj4+IAo+Pj4+IMKgLyoqCj4+Pj4gLSAqIHNwaV9ub3Jf
dW5sb2NrX2FsbCgpIC0gVW5sb2NrcyB0aGUgZW50aXJlIGZsYXNoIG1lbW9yeSBhcnJheS4KPj4+
PiArICogc3BpX25vcl9nbG9iYWxfdW5wcm90ZWN0KCkgLSBQZXJmb3JtIGEgZ2xvYmFsIHVucHJv
dGVjdCBvZiB0aGUKPj4+PiBtZW1vcnkgYXJlYS4KPj4+PiDCoCAqIEBub3I6wqDCoMKgIHBvaW50
ZXIgdG8gYSAnc3RydWN0IHNwaV9ub3InLgo+Pj4+IMKgICoKPj4+PiDCoCAqIFNvbWUgU1BJIE5P
UiBmbGFzaGVzIGFyZSB3cml0ZSBwcm90ZWN0ZWQgYnkgZGVmYXVsdCBhZnRlciBhCj4+Pj4gcG93
ZXItb24gcmVzZXQKPj4+PiDCoCAqIGN5Y2xlLCBpbiBvcmRlciB0byBhdm9pZCBpbmFkdmVydGVu
dCB3cml0ZXMgZHVyaW5nIHBvd2VyLXVwLgo+Pj4+IEJhY2t3YXJkCj4+Pj4gwqAgKiBjb21wYXRp
YmlsaXR5IGltcG9zZXMgdG8gdW5sb2NrIHRoZSBlbnRpcmUgZmxhc2ggbWVtb3J5IGFycmF5IGF0
Cj4+Pj4gcG93ZXItdXAKPj4+PiAtICogYnkgZGVmYXVsdC4KPj4+PiArICogYnkgZGVmYXVsdC4g
RG8gaXQgb25seSBmb3IgZmxhc2hlcyB3aGVyZSB0aGUgYmxvY2sgcHJvdGVjdGlvbiAKPj4+PiBi
aXRzCj4+Pj4gKyAqIGFyZSB2b2xhdGlsZSwgdGhpcyBpcyBpbmRpY2F0ZWQgYnkgU05PUl9GX05F
RURfVU5QUk9URUNULgo+Pj4+ICsgKgo+Pj4+ICsgKiBXZSBjYW5ub3QgdXNlIHNwaV9ub3JfdW5s
b2NrKG5vci0+cGFyYW1zLnNpemUpIGhlcmUgYmVjYXVzZSAKPj4+PiB0aGVyZQo+Pj4+IGFyZQo+
Pj4+ICsgKiBsZWdhY3kgZGV2aWNlcyAoZWcuIEFUMjVERjA0MUEpIHdoaWNoIG5lZWQgYSAiZ2xv
YmFsIHVucHJvdGVjdCIKPj4+PiBjb21tYW5kLgo+Pj4+ICsgKiBUaGlzIGlzIGRvbmUgYnkgd3Jp
dGluZyAwYjB4MDAwMHh4IHRvIHRoZSBzdGF0dXMgcmVnaXN0ZXIuIFRoaXMKPj4+PiB3aWxsIGFs
c28KPj4+PiArICogd29yayBmb3IgYWxsIG90aGVyIGZsYXNoZXMgd2hpY2ggaGF2ZSB0aGVzZSBi
aXRzIG1hcHBlZCB0byBCUDAgCj4+Pj4gdG8KPj4+PiBCUDMuCj4+Pj4gKyAqIFRoZSB0b3AgbW9z
dCBiaXQgaXMgdXN1c2FsbHkgc29tZSBraW5kIG9mIGxvY2sgYml0IGZvciB0aGUgYmxvY2sKPj4+
PiArICogcHJvdGVjdGlvbiBiaXRzLgo+Pj4+IMKgICovCj4+Pj4gLXN0YXRpYyBpbnQgc3BpX25v
cl91bmxvY2tfYWxsKHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25v
cl9nbG9iYWxfdW5wcm90ZWN0KHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4gwqB7Cj4+Pj4gLcKg
wqDCoCBpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNfTE9DSykKPj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gc3BpX25vcl91bmxvY2soJm5vci0+bXRkLCAwLCBub3ItPnBhcmFt
cy0+c2l6ZSk7Cj4+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+Pj4+IAo+Pj4+IC3CoMKgwqAgcmV0dXJu
IDA7Cj4+Pj4gK8KgwqDCoCBkZXZfZGJnKG5vci0+ZGV2LCAidW5wcm90ZWN0aW5nIGVudGlyZSBm
bGFzaFxuIik7Cj4+Pj4gK8KgwqDCoCByZXQgPSBzcGlfbm9yX3JlYWRfc3Iobm9yLCBub3ItPmJv
dW5jZWJ1Zik7Cj4+Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgbm9yLT5ib3VuY2VidWZbMF0gJj0g
flNSX0dMT0JBTF9VTlBST1RFQ1RfTUFTSzsKPj4+PiArCj4+Pj4gK8KgwqDCoCAvKgo+Pj4+ICvC
oMKgwqDCoCAqIERvbid0IHVzZSBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfY2hlY2soKSBiZWNhdXNl
IHdyaXRpbmcgdGhlCj4+Pj4gc3RhdHVzCj4+Pj4gK8KgwqDCoMKgICogcmVnaXN0ZXIgbWlnaHQg
ZmFpbCBpZiB0aGUgZmxhc2ggaXMgaGFyZHdhcmUgd3JpdGUgCj4+Pj4gcHJvdGVjdGVkLgo+Pj4+
ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgcmV0dXJuIHNwaV9ub3Jfd3JpdGVfc3Iobm9yLCBu
b3ItPmJvdW5jZWJ1ZiwgMSk7Cj4+Pj4gwqB9Cj4+PiAKPj4+IFRoaXMgd29uJ3Qgd29yayBmb3Ig
YWxsIHRoZSBmbGFzaGVzLiBZb3UgdXNlIGEgR0VOTUFTSyg1LCAyKSB0byBjbGVhcgo+Pj4gdGhl
IFN0YXR1cyBSZWdpc3RlciBldmVuIGZvciBCUDAtMiBmbGFzaGVzIGFuZCB5b3UgZW5kIHVwIGNs
ZWFyaW5nCj4+PiBCSVQoNSkKPj4+IHdoaWNoIGNhbiBsZWFkIHRvIHNpZGUgZWZmZWN0cy4KPj4+
IAo+Pj4gV2Ugc2hvdWxkIGluc3RlYWQgaW50cm9kdWNlIGEgCj4+PiBub3ItPnBhcmFtcy0+bG9j
a2luZ19vcHMtPmdsb2JhbF91bmxvY2soKQo+Pj4gaG9vawo+Pj4gZm9yIHRoZSBmbGFzaGVzIHRo
YXQgaGF2ZSBzcGVjaWFsIG9wY29kZXMgdGhhdCB1bmxvY2sgYWxsIHRoZSBmbGFzaAo+Pj4gYmxv
Y2tzLAo+Pj4gb3IgZm9yIHRoZSBmbGFzaGVzIHRoYXQgZGV2aWF0ZSBmcm9tIHRoZSAiY2xlYXIg
anVzdCB5b3VyIEJQIGJpdHMiCj4+PiBydWxlLgo+PiAKPj4gV291bGRuJ3QgaXQgbWFrZSBtb3Jl
IHNlbnNlIHRvIGp1c3Qgc2V0IHBhcmFtcy0+bG9ja2luZ19vcHMgZm9yIHRoZXNlCj4+IGZsYXNo
ZXMKPj4gdG8gZGlmZmVyZW50IGZ1bmN0aW9ucz8gb3IgZXZlbiBwcm92aWRlIGEgc3BpX25vcl9n
bG9iYWxfdW5wcm90ZWN0X29wcwo+PiBpbgo+PiBjb3JlLmMgYW5kIHRoZXNlIGZsYXNoZXMgd2ls
bCBqdXN0IHNldCB0aGVtLiB0aGVyZSBpcyBubyBpbmRpdmlkdWFsCj4+IHNlY3Rvcgo+PiByYW5n
ZSBsb2NrIGZvciB0aGVzZSBjaGlwcy4ganVzdCBhIGxvY2sgYWxsIG9yIG5vdGhpbmcuCj4gCj4g
SSBsaWtlIHRoZSBpZGVhIG9mIGhhdmluZyBhbGwgbG9ja2luZyByZWxhdGVkIGZ1bmN0aW9ucyBw
bGFjZWQgaW4gYSAKPiBzaW5nbGUKPiBwbGFjZSwgdGh1cyB0aGUgZ2xvYmFsX3VubG9jaygpIHNo
b3VsZCBiZSBpbnNpZGUgbG9ja2luZ19vcHMgc3RydWN0LgoKTXkgcG9pbnQgd2FzIHRoYXQgdGhp
cyBnbG9iYWwgdW5sb2NrIHNob3VsZG4ndCBiZSBhIHNwZWNpYWwgY2FzZSBmb3IgdGhlCmN1cnJl
bnQgc3BpX25vcl91bmxvY2soKSBidXQganVzdCBhbm90aGVyICJob3cgdG8gdW5sb2NrIHRoZSBm
bGFzaCIgCmZ1bmN0aW9uCmFuZCB0aHVzIHNob3VsZCByZXBsYWNlIHRoZSBvcmlnaW5hbCB1bmxv
Y2sgb3AuIEZvciBleGFtcGxlLCBpdCBpcyBhbHNvIApsaWtlbHkKdGhhdCB5b3UgbmVlZCBhIHNw
ZWNpYWwgZ2xvYmFsIGxvY2sgKGkuZS4gd3JpdGUgYWxsIDEncykuCgpzdGF0aWMgaW50IHNwaV9u
b3JfZ2xvYmFsX3VubG9jaygpCnsKICAgd3JpdGVfc3IoMCk7IC8qIGFjdHVhbGx5IGl0IHdpbGwg
YmUgYSByZWFkLW1vZGlmeSB3cml0ZSAqLwp9CgpzdGF0aWMgaW50IHNwaV9ub3JfZ2xvYmFsX2xv
Y2soKQp7CiAgIHdyaXRlX3NyKDB4MWMpOwp9CgpzdGF0aWMgaW50IHNwaV9ub3JfaXNfZ2xvYmFs
X2xvY2tlZCgpCnsKICAgcmV0dXJuIHJlYWRfc3IoKSAmIDB4MWM7Cn0KCmNvbnN0IHN0cnVjdCBz
cGlfbm9yX2xvY2tpbmdfb3BzIHNwaV9ub3Jfc3JfbG9ja2luZ19vcHMgPSB7CiAgICAgICAgIC5s
b2NrID0gc3BpX25vcl9nbG9iYWxfdW5sb2NrLAogICAgICAgICAudW5sb2NrID0gc3BpX25vcl9n
bG9iYWxfbG9jaywKICAgICAgICAgLmlzX2xvY2tlZCA9IHNwaV9ub3JfaXNfZ2xvYmFsX2xvY2tl
ZCwKfTsKCkhhdmluZyB0aGUgc3BpX25vcl91bmxvY2sgZGVjaWRlIHdoYXQgb3AgdG8gY2hvb3Nl
IGludHJvZHVjZXMganVzdAphbm90aGVyIGluZGlyZWN0aW9uLiBFc3AuIGlmIHlvdSB0aGluayBh
Ym91dCBoYXZpbmcgc3VwcG9ydCBmb3IKaW5kaXZpZHVhbCBzZWN0b3IgcHJvdGVjdGlvbiB3aGlj
aCBhbHNvIG5lZWRzIG5ldyBvcHMuIEJ0dy4gdG8gbWUKaXQgc2VlbXMgdGhhdCAiZ2xvYmFsICh1
bilsb2NrIiBpcyBhbG1vc3QgYWx3YXlzIHVzZWQgZm9yIHRoZQppbmRpdmlkdWFsIHNlY3RvciBw
cm90ZWN0aW9uIHNjaGVtZSwgaS5lLiBsaWtlIGEgc2hvcnRjdXQgdG8gYWxsb3cgYWxsCnNlY3Rv
cnMgYmUgdW5sb2NrZWQgYXQgb25jZS4KCj4gWW91IGNhbiB1cGRhdGUgcGFyYW1zLT5sb2NraW5n
X29wcy4gSWYgd2UgaGF2ZSB2ZW5kb3Igc3BlY2lmaWMgCj4gbG9ja2luZ19vcHMKPiB3ZSBjYW4g
c2V0IHRoZW0gdmlhOgo+IAlub3ItPm1hbnVmYWN0dXJlci0+Zml4dXBzLT5kZWZhdWx0X2luaXQo
bm9yKTsKPiBvciBpZiB0aGV5IGFyZSBmbGFzaCBzcGVjaWZpYywgd2l0aCBhIHNtYWxsZXIgZ3Jh
bnVsYXJpdHksIHZpYToKPiAJbm9yLT5pbmZvLT5maXh1cHMtPmRlZmF1bHRfaW5pdChub3IpOwoK
b2suCgo+PiBJZiBpdCBpcyBtb3JlIGNvbW1vbiBhbmQgbm90IGp1c3Qgb25lIHZlbmRvciBpdCBt
aWdodCBhbHNvIG1ha2Ugc2Vuc2UgCj4+IHRvCj4+IGFkZAo+PiBhIHNlcGVyYXRlIGZsYWcgd2hp
Y2ggd2lsbCB0aGVuIHNldCB0aGUgbG9ja2luZyBvcHMgdG8KPj4gc3BpX25vcl9nbG9iYWxfdW5w
cm90ZWN0X29wcywgYWxzbyBpdCBzZWVtcyB0aGF0IHRoZXJlIGhhdmUgdG8gYmUgdHdvCj4gCj4g
SSBkb24ndCBsaWtlIHRoYXQgd2UgaGF2ZSBzbyBtYW55IGZsYWdzLCBzbyBJIHRyeSB0byBhdm9p
ZCBpbnRyb2R1Y2luZyAKPiBuZXcKPiBvbmVzIGFzIGJlc3QgYXMgSSBjYW4uIENoZWNraW5nIGZv
ciBudWxsIHBvaW50ZXIgc2hvdWxkIHN1ZmZpY2UuCgpZZWFoLCBJIGFscmVhZHkgZ3Vlc3NlZCB0
aGF0IHRoaXMgd291bGQgYmUgdGhlIGFuc3dlciA7KQoKLW1pY2hhZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
