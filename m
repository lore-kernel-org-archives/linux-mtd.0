Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4560DC4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 09:07:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F2C20665
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 09:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFGxmWzN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vJwZODdh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F2C20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y3auNDQRbLDYYHjBFPMYcBfWA+s27lLmG+QDPqzd6bc=; b=oFGxmWzNs+3OjZWqIbxpZlHgO
	NwMfrrqQlNmt7QPCg+iGa35WKbCoG0KCu9CwPeX7FK7xNWUTzo2SlMh97tBYCAINdvWFUWZejrnMK
	1HdrzP/D80f1y65gwLnvnY6I14QCoaL7TRPOB/g9XKzAevHRddpF7pvPwNV+Ugic6koP9WU7vgB4t
	eKPvEYA+0HAJ8+rcADS7mj+7ECwNTP1gw1um3GMMF9uMpxr4dNJX7E/A7PFlTSXELEmXqYMahwvOu
	obrAW7YC1/ZE+5EMkw1sf43btM6Ef/7NnRsUQJ8twlQ+wdpsHRlcvOmHqKI0qhQgWAZ13mJzk8YRX
	IntkK4giA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPMRw-0005nk-Na; Mon, 05 Oct 2020 09:06:28 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPMRt-0005nG-Rv
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 09:06:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09596Mj1118638;
 Mon, 5 Oct 2020 04:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601888782;
 bh=HoTeAQPf8XqcdWmvOwmB3iZVaJnUmk44g2g1ZMAPtVY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vJwZODdhwdw2Vh4ZzjibgvDbs/kkmswHguHeosMamERJElsMYASHN+FbwLDcZViaD
 WNZ4B3mbg1lLIqgqHGXl+beBI8xU+E1HyxYxtaF4vQ2ayjT4ve44ycS+B+JWvCb44C
 3L7WVNYLxHi2cV+h3B8CI7h2aHBT2EgXdmITpNV4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09596M5t007304
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Oct 2020 04:06:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 04:06:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 04:06:21 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09596IY2110551;
 Mon, 5 Oct 2020 04:06:19 -0500
Subject: Re: [PATCH] mtd: spi-nor: Prefer asynchronous probe
To: Michael Walle <michael@walle.cc>, Doug Anderson <dianders@chromium.org>
References: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
 <20201003150633.23416-1-michael@walle.cc>
 <CAD=FV=VB-ML0=kmN-yAH7sD-sMiX9Cq1_9B9QwVL=Ed5ZrGnbg@mail.gmail.com>
 <b376b3f2e41662237d50d589e3696b06@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ccf3c162-4f2b-914f-725d-d15eb10819a4@ti.com>
Date: Mon, 5 Oct 2020 14:36:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b376b3f2e41662237d50d589e3696b06@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_050625_990748_53E66898 
X-CRM114-Status: GOOD (  24.19  )
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
Cc: richard@nod.at, tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk9uIDEwLzMvMjAgMTA6MjQgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4g
SGkgRG91Z2xhcywKPiAKPiBBbSAyMDIwLTEwLTAzIDE4OjI3LCBzY2hyaWViIERvdWcgQW5kZXJz
b246Cj4+IEhpLAo+Pgo+PiBPbiBTYXQsIE9jdCAzLCAyMDIwIGF0IDg6MjIgQU0gTWljaGFlbCBX
YWxsZSA8bWljaGFlbEB3YWxsZS5jYz4gd3JvdGU6Cj4+Pgo+Pj4gSGkgRG91Z2xhcywKPj4+Cj4+
PiA+IE9uIG15IHN5c3RlbSB0aGUgc3BpX25vcl9wcm9iZSgpIHRvb2sgfjYgbXMgYXQgYm9vdHVw
LsKgIFRoYXQncyBub3QgYQo+Pj4gPiBsb3QsIGJ1dCBldmVyeSBsaXR0bGUgYml0IGFkZHMgdXAg
dG8gYSBzbG93IGJvb3R1cC7CoCBXaGlsZSB3ZSBjYW4gZ2V0Cj4+PiA+IHRoaXMgb3V0IG9mIHRo
ZSBib290IHBhdGggYnkgbWFraW5nIGl0IGEgbW9kdWxlLCB0aGVyZSBhcmUgdGltZXMgd2hlcmUK
Pj4+ID4gaXQgaXMgY29udmVuaWVudCAob3IgZXZlbiByZXF1aXJlZCkgZm9yIHRoaXMgdG8gYmUg
YnVpbHRpbiB0aGUga2VybmVsLgo+Pj4gPiBMZXQncyBzZXQgdGhhdCB3ZSBwcmVmZXIgYXN5bmMg
cHJvYmUgc28gdGhhdCB3ZSBkb24ndCBibG9jayBvdGhlcgo+Pj4gPiBkcml2ZXJzIGZyb20gcHJv
YmluZyB3aGlsZSB3ZSBhcmUgcHJvYmluZy4KPj4+ID4KPj4+ID4gVGhpcyBpcyBhIHRpbnkgbGl0
dGxlIGNoYW5nZSB0aGF0IGlzIGFsbW9zdCBndWFyYW50ZWVkIHRvIGJlIHNhZmUgZm9yCj4+PiA+
IGFueXRoaW5nIHRoYXQgaXMgYWJsZSB0byBydW4gYXMgYSBtb2R1bGUsIHdoaWNoIFNQSV9OT1Ig
aXMuCj4+PiA+IFNwZWNpZmljYWxseSBtb2R1bGVzIGFyZSBhbHJlYWR5IHByb2JlZCBhc3luY2hy
b25vdXNseS7CoCBBbHNvOiBzaW5jZQo+Pj4gPiBvdGhlciB0aGluZ3MgaW4gdGhlIHN5c3RlbSBt
YXkgaGF2ZSBlbmFibGVkIGFzeW5jaHJvbm91cyBwcm9iZSB0aGUKPj4+ID4gc3lzdGVtIG1heSBh
bHJlYWR5IGJlIGRvaW5nIG90aGVyIHRoaW5ncyBkdXJpbmcgb3VyIHByb2JlLgo+Pj4gPgo+Pj4g
PiBUaGVyZSBpcyBhIHNtYWxsIHBvc3NpYmlsaXR5IHRoYXQgc29tZSBvdGhlciBkcml2ZXIgdGhh
dCB3YXMgYSBjbGllbnQKPj4+ID4gb2YgU1BJX05PUiBkaWRuJ3QgaGFuZGxlIC1FUFJPQkVfREVG
RVIgYW5kIHdhcyByZWx5aW5nIG9uIHByb2JlCj4+PiA+IG9yZGVyaW5nIGFuZCBvbmx5IHdvcmtl
ZCB3aGVuIHRoZSBTUElfTk9SIGFuZCB0aGUgU1BJIGJ1cyB3ZXJlCj4+PiA+IGJ1aWx0aW4uwqAg
SW4gdGhhdCBjYXNlIHRoZSBvdGhlciBkcml2ZXIgaGFzIGEgYnVnIHRoYXQncyB3YWl0aW5nIHRv
Cj4+PiA+IGhpdCBhbmQgdGhlIG90aGVyIGRyaXZlciBzaG91bGQgYmUgZml4ZWQuCj4+Pgo+Pj4g
bGludXgtbmV4dCBub3cgdHJpZ2dlcnMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGluIGtlcm5lbC9r
bW9kLmM6MTM2IG9uIG15Cj4+PiBib2FyZC4gSSd2ZSBiaXNlY3RlZCB0aGlzIHRvIHRoaXMgcGF0
Y2guCj4+PgpbLi4uXQo+Pgo+PiBUaGFua3MgZm9yIHlvdXIgcmVwb3J0IcKgIE15IHZvdGUgd291
bGQgYmUgdG8gcmV2ZXJ0IG15IHBhdGNoIGFuZCB0aGVuCj4+IHRoaXMgd291bGQgbmVlZCB0byBi
ZSByZXNvbHZlZCBiZWZvcmUgaXQgY291bGQgYmUgYWRkZWQgYmFjayBpbi4KPj4gV2l0aG91dCBk
b2luZyB0b25zIG9mIHJlc2VhcmNoLCBtYXliZSB0aGUgcmlnaHQgYW5zd2VyIGhlcmUgaXMgdGhh
dAo+PiBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyKCkgc2hvdWxkIGJlIG1vdmVkIGludG8gYSBz
ZXBhcmF0ZSB0YXNrIHNvCj4+IGl0J3Mgbm90IGJsb2NraW5nIHByb2JlP8KgIEkgcHJvYmFibHkg
d29uJ3QgdHJ5IHRvIHRhY2tsZSB0aGlzCj4+IGltbWVkaWF0ZWx5LCBidXQgdGhlIGV2ZW50dWFs
IGdvYWwgaXMgdGhhdCBhc3luYyBpcyBkZWZhdWx0LCBzbyBJCj4+IHRoaW5rIHRoaXMgd291bGQg
bmVlZCB0byBiZSByZXNvbHZlZCBiZWZvcmUgdGhlbi4KPiAKPiBPay4gVmlnbmVzaCwgd2lsbCB5
b3UgdGFrZSBjYXJlIG9mIHRoYXQ/CgpUaGFua3MgZm9yIHRoZSByZXBvcnQhIEkgaGF2ZSBwb3N0
ZWQgYSBwYXRjaCByZXZlcnRpbmcgdGhpcyBjb21taXQuIFdpbGwKbWVyZ2UgaW50byBzcGktbm9y
L25leHQgc2hvcnRseQoKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
