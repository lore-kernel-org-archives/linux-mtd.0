Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735B2C3F2D2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451E424695
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FF2uxb8R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 451E424695
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEv81EqfR2zmKj65WSgycfFzUI1i6XaBFtvQUS/yhiw=; b=FF2uxb8R9S6SFr
	hrJd45cdajiHrorpQKYJf5/KcWhnrm13AQgA5YDFUbvAfmFnDEkExyrh9tfQYAPIfUp75wXJO8yKv
	3n8M2iIP9sreGVGOaqVb0dN3UpfnjdHnQ29KoowaZ/s5JxZqLB8TDeB4+4HmR0cpJ9DoR0cjfU4yt
	Ym9AJnf1kG3J99PWicfMkk7ud0S9KvHKhiZX4QAQcZI9HTR+7UC2g4rB5BQ6b1gFHTfPuMORs0gdO
	8EFgO4dQCuZydJvVdaohKM4rJxeoJXqOoYYtr/EhthVZrohGzzhqo2PINBvy/VbSgNTJNj4WMacGr
	bycFvfDkMnOSHl2RFxNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hLg-0005p0-Vj; Mon, 02 Mar 2020 09:26:52 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hLd-0005nl-OS
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 09:26:51 +0000
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0E16D10000F;
 Mon,  2 Mar 2020 09:26:42 +0000 (UTC)
Date: Mon, 2 Mar 2020 10:26:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix unmet dependency if
 COMPILE_TEST
Message-ID: <20200302102642.1191e8b1@xps13>
In-Reply-To: <20200229160443.11208-1-paul@crapouillou.net>
References: <20200229160443.11208-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_012649_934694_8BCF0D26 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: od@zcrc.me, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBT
YXQsIDI5IEZlYiAyMDIwIDEzOjA0OjQzCi0wMzAwOgoKPiBDb21taXQgN2M3NzljZjdjMWY3ICgi
bXRkOiByYXduYW5kOiBpbmdlbmljOiBBbGxvdyB0byBjb21waWxlIHRlc3QgdGhlCj4gbmV3IElu
Z2VuaWMgZHJpdmVyIikgZHJvcHBlZCB0aGUgZGVwZW5kZW5jeSBvbiBKWjQ3ODBfTkVNQyB3aGVu
Cj4gQ09NUElMRV9URVNUIHdhcyBzZXQsIHdoaWNoIGlzIHdyb25nLCBhcyB0aGUgZHJpdmVyIHJl
cXVpcmVzIHN5bWJvbHMKPiBwcm92aWRlZCBieSB0aGUgano0NzgwLW5lbWMgZHJpdmVyLgo+IAo+
IENoYW5nZSB0aGUgZGVwZW5kZW5jeSB0byAoTUlQUyB8fCBDT01QSUxFX1RFU1QpICYmIEpaNDc4
MF9ORU1DIHRvCj4gYWRkcmVzcyB0aGUgaXNzdWUuCgpUaGF0IHdhcyBzaW1wbGUgYWN0dWFsbHks
IHRoYW5rcyBmb3IgZmluZGluZyB0aGUgc29sdXRpb24uIEFjdHVhbGx5IEkKZG9uJ3QgdGhpbmsg
SSBtZXJnZWcgbXkgb3duIHBhdGNoIGFzIGl0IHdhcyBjcmVhdGluZyB0aGlzIGJ1aWxkIGlzc3Vl
Cih1bmxlc3MgSSBtZXNzZWQgd2l0aCBzb21ldGhpbmcgOikgKSBzbyBjYW4geW91IHBsZWFzZSBz
ZW5kIGEgcGF0Y2gKanVzdCBhZGRpbmcgQ09NUElMRV9URVNUIHN1cHBvcnQgd2l0aG91dCBhbnkg
Rml4ZXMgbWVudGlvbj8KCj4gCj4gRml4ZXM6IDdjNzc5Y2Y3YzFmNyAoIm10ZDogcmF3bmFuZDog
aW5nZW5pYzogQWxsb3cgdG8gY29tcGlsZSB0ZXN0IHRoZSBuZXcgSW5nZW5pYyBkcml2ZXIiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVp
bCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2lu
Z2VuaWMvS2NvbmZpZyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5n
ZW5pYy9LY29uZmlnIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9LY29uZmlnCj4gaW5k
ZXggNDg1YWJmYTNmODBiLi45NmM1YWU4YjFiYmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW5nZW5pYy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5n
ZW5pYy9LY29uZmlnCj4gQEAgLTEsNyArMSw4IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQo+ICBjb25maWcgTVREX05BTkRfSlo0NzgwCj4gIAl0cmlzdGF0ZSAi
Slo0NzgwIE5BTkQgY29udHJvbGxlciIKPiAtCWRlcGVuZHMgb24gSlo0NzgwX05FTUMgfHwgQ09N
UElMRV9URVNUCj4gKwlkZXBlbmRzIG9uIE1JUFMgfHwgQ09NUElMRV9URVNUCj4gKwlkZXBlbmRz
IG9uIEpaNDc4MF9ORU1DCj4gIAloZWxwCj4gIAkgIEVuYWJsZXMgc3VwcG9ydCBmb3IgTkFORCBG
bGFzaCBjb25uZWN0ZWQgdG8gdGhlIE5FTUMgb24gSlo0NzgwIFNvQwo+ICAJICBiYXNlZCBib2Fy
ZHMsIHVzaW5nIHRoZSBCQ0ggY29udHJvbGxlciBmb3IgaGFyZHdhcmUgZXJyb3IgY29ycmVjdGlv
bi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
