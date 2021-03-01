Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C53C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:43:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C216146D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C216146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+/lRjR6yZCxY0dzy/0fuOlU61yabB3463lVYyi6jH5c=; b=sBUE+ISFqQs9hZjU1uuCBphPg
	suQTHXI4kqfP4NKjCtJ6UrgVYUV+9pBAIjnJgDMDegdU/ZXd43iyHpYeVC/38IZdv9Gud4oJEsKoj
	vrtP2sAdrAqzQGbenQ3jvcKNo8UGk6ZHFNXJG/3NFhaBndCp0ByXBZB2KLLYa00vHNMoedrPoYERi
	ae9jPbrv3n1DibJ3U39gVMr8HJ6VcqG1hgME9Dk0o7w+KvdGwvg6xvPC8gQcPZwPERe4MCEbgTZO6
	xLCRWhLV+A/5elY5UQK1V+0s3nhnCQrYLhJXeD/xivYuYN3+nHJHW6gLmQCn9h2tHNOj/c2oqirQO
	jzZA2NsmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjkr-0003Jk-J9; Mon, 01 Mar 2021 14:42:37 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjko-0003Ii-8l
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 14:42:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D8C1322178;
 Mon,  1 Mar 2021 15:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614609752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dP9OXEQ/61KVN8mgAZF9hFExCuSUVuGvOpKi25vrm0=;
 b=uOQmkStDHG9PKZ9jhzNVndrBOMuIfbIcBaQf8xSbJfOsfyaGvXIu+j7vBsT3P2AsQHeYcN
 XhxoEzo0aZnJpuAPVSLXy4aBYMnMsrZ1ktUvNOYlQwX/blEF7BIEpB+UpRoU2YGS2d9k9J
 47SxcE/7nZjdKQ3NB9oF7uQY9cjAmtk=
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 15:42:31 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: spi-nor: maxronix MX25L12835F support
In-Reply-To: <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <729a56daea261808db672472e47d8c20@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_094234_422953_0EF2CE91 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, p.yadav@ti.com,
 zhengxunli@mxic.com.tw
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wMy0wMSAxNTowOSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy8xLzIxIDM6NTAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgCj4+IHRoZSBjb250ZW50IGlzIHNhZmUKPj4gCj4+IEFtIDIwMjEtMDMtMDEgMTQ6MzYsIHNj
aHJpZWIgUHJhdHl1c2ggWWFkYXY6Cj4+PiBJIHRoaW5rIHByaW50aW5nIHRoZSBjb3JyZWN0IGZs
YXNoIG5hbWUgaXMgc29tZXdoYXQgaW1wb3J0YW50LiBPdGhlcgo+Pj4gdGhhbiB0aGUgaGFuZGZ1
bCBvZiBwZW9wbGUgd2hvIGFyZSByZWFkaW5nIHRoaXMgdGhyZWFkLCBmZXcgd291bGQgCj4+PiBr
bm93Cj4+PiB0aGF0IFNQSSBOT1IgY2FsbHMgbXgyNWwxMjgzNWYgYXMgbXgyNWwxMjgwNWQgb3Ig
dmljZSB2ZXJzYS4gVGhpcyBjYW4KPj4+IGNhdXNlIGEgbG90IG9mIGNvbmZ1c2lvbiBhbW9uZyBw
ZW9wbGUgdHJ5aW5nIHRvIGRlYnVnIGFueSBpc3N1ZXMuCj4+IAo+PiBVbmZvcnR1bmF0ZWx5LCB0
aGlzIGlzIGtpbmQgb2YgYSBtZXNzLiBJZiBtdWx0aXBsZSBmbGFzaCBkZXZpY2VzCj4+IHNoYXJl
IHRoZSBzYW1lIGlkLCBpdCBzZWVtcyB0byBiZSBmaXJzdCBjb21lIGZpcnN0IHNlcnZlLiBUaGUg
a2VybmVsCj4+IHdpbGwgcHJpbnQgdGhlIG5hbWUgd2hpY2ggd2FzIGludHJvZHVjZWQgZmlyc3Qu
Cj4+IAo+PiBUaGlzIGlzbid0IHRoZSBvbmx5IGZsYXNoIHdoaWNoIGlzIGFmZmVjdGVkLiBIYXZl
IGEgbG9vayBhdAo+PiDCoCBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+PiBUaGVyZSBh
cmUgYWxsIGtpbmQgb2YgZmxhc2ggbmFtZXMsIHNvbWUgb2YgdGhlbSBhcmUgbm90IGV2ZW4gZXhp
c3RpbmcKPj4gYXMgdGhpcyBwYXJ0aWN1bGFyIHN0cmluZywgZWcuIHRha2UgdzI1cTY0andtLCBp
dHMgYWN0dWFsbHkgIldpbmJvbmQKPj4gVzI1UTY0SlctSU0gb3IgVzI1UTY0SlctSk0iLgo+PiAK
Pj4gU28geWVzLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgc3VjaCBhIHRoaW5nLCBidXQgZm9y
IG5vdywgSSB3aWxsCj4+IHRha2UgdGhlIGtlcm5lbCBvdXRwdXQgYXMgYSByb3VnaCBlc3RpbWF0
aW9uIHdoYXQgbWlnaHQgcmVhbGx5IGJlCj4+IHVzZWQgb24gdGhlIGJvYXJkLgo+PiAKPiAKPiBI
b3cgYWJvdXQgbmFtaW5nIHRoZW0gc29tZXRoaW5nIGxpa2UgInVwZGF0ZWQtZmxhc2gtbmFtZSB8
fCAKPiBmaXJzdC1uYW1lIi4KPiBBbnl3YXksIHRoZXNlIGFyZSBqdXN0IHdvcmthcm91bmRzLiBN
YW51ZmFjdHVyZXJzIHNob3VsZG4ndCB1c2UgdGhlIAo+IHNhbWUKPiBKRURFQyBJRCBmb3IgbmV3
IGZsYXNoZXMuIFRoZXkgc2hvdWxkIGF0IGxlYXN0IGFkZCBhbiBleHRlbmRlZCBJRC4KCk1oLCB3
aGF0IGFib3V0IGEgbGlzdCBvZiBuYW1lcz8gSSBtZWFuIHllcyBpdCBpcyBhIHdvcmthcm91bmQs
IGJ1dAp0aGVyZSBpcyBhY3R1YWwgaGFyZHdhcmUgZG9pbmcgdGhpcywgc28gSU1ITyBsaW51eCBo
YXMgdG8gZGVhbCB3aXRoCml0IGluIHNvbWUgd2F5LiBPVE9IIHRoYXQgbGlzdCBtaWdodCBiZSBs
b25nIGFuZCBkb2Vzbid0IGxvb2sgZ29vZAppbiBkbWVzZyAob3Igd2hlcmV2ZXIgdGhhdCBzdHJp
bmcgbWlnaHQgYmUgdXNlZCkuCgpJdCBtaWdodCBjb21lIGluIGhhbmR5IHRvIGhhdmUgYSBtZWNo
YW5pc20gaW4gcGxhY2UgaWYgc29tZW9uZQpyZWFsbHkgY2FyZXMgYWJvdXQgaXQgdGhvdWdoLgoK
LW1pY2hhZWwKCi0tIAotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
