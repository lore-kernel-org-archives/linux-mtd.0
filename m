Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CDEC43219
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa3cnNAdkE3D14E0e+iax0C/W2OFMdzxZYsmlyweof8=; b=QWoqdok/nPVjriIXZuja3EYfuH
	sAHr9up5YerQwxGWx1QaxWViEX6MAl19Od1hhXD95Ega3frXeEWLGcGTY0OKFiI8pd7JqIq5tpFSV
	aOs5RbQhpmfhq1c0WfwnLL0vJ9YTWjg2uaCge1Ea0sA5KN2uq6VO2/JZyl9NnWgDlBRlfYYxtwLEy
	CEkV7IfTKPpOBk8SHNMwvcET4NU3ZSKqx8Cd6jAK4Hq9U1kqaBQtf2CtbEf5exoXDYK2A3Gb23C0e
	xUl8wEgaxmiwJ6K2ZpNYtTNCwDzbo+DVx8tByMfYyGlH0M8qs5SASMlTvj8dk8zg4FAnzunYbAq5X
	XIWtNL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6ET-000Fr7-Gh; Wed, 19 Oct 2022 10:23:29 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6EP-000FeR-Vt
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 10:23:27 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 35C101D1E;
	Wed, 19 Oct 2022 12:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1666175002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdGIaEcZtyU5pPGSMfXan4IZw9UXyG5z5ZP2c3+GG/o=;
	b=GYfkPWhHQI1u1Eu13Xp8yDik3OsF2DoWbYRGtftUGBlKGAs+lYecZsOZrVTjeR4l7bPrpI
	fjrVLWMP7x3ljbhg96FFgqrSub0yK0TL2Nm9Ikxk60l8z1QKvQlqPlysSoRV438MKXpClE
	cIce6nfsj0Ny25F6FJRQLwvG5QxJSY3f+wZLwA/fmT2UoJWxYXpAlhGP9Dey1BD98XaLp3
	3s8nP5KC79Vtuzo4FNtpy1QAINSocsIcHs/tBLOaE+RyKtovdIBR5xOZ76AxDNtG+tetbA
	jbFyXpjIAIbTl+11yiTHVU1OxDMthX3Ar6xix1EHeJeq8MDHuwsrBiMjPet4eA==
MIME-Version: 1.0
Date: Wed, 19 Oct 2022 12:23:22 +0200
From: Michael Walle <michael@walle.cc>
To: "Farber, Eliav" <farbere@amazon.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 talel@amazon.com, jonnyc@amazon.com, hhhawa@amazon.com, hanochu@amazon.com,
 itamark@amazon.com, shellykz@amazon.com, amitlavi@amazon.com, dkl@amazon.com
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: micron-st: Enable locking for
 n25q256ax1/mt25qu256a
In-Reply-To: <01dfdbec-1a1f-6118-23fb-8b8f7b827c82@amazon.com>
References: <20221019071631.15191-1-farbere@amazon.com>
 <73bfa5ae90e2269387540019806c2839@walle.cc>
 <1ba2e7ff-cf6c-1292-72e0-14b5b5b9282c@amazon.com>
 <f489048bd1fa65db1a050f1321c640de@walle.cc>
 <01dfdbec-1a1f-6118-23fb-8b8f7b827c82@amazon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <41a05a89cd30b21dce866bc3209fe836@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_032326_194390_16A7B204 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0xMC0xOSAxMTo1Miwgc2NocmllYiBGYXJiZXIsIEVsaWF2Ogo+IE9uIDEwLzE5LzIw
MjIgMTI6MzggUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEFtIDIwMjItMTAtMTkgMTE6MjUs
IHNjaHJpZWIgRmFyYmVyLCBFbGlhdjoKPj4+IE9uIDEwLzE5LzIwMjIgMTE6MjEgQU0sIE1pY2hh
ZWwgV2FsbGUgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4gCj4+Pj4gQW0gMjAyMi0xMC0xOSAwOToxNiwg
c2NocmllYiBFbGlhdiBGYXJiZXI6Cj4+Pj4+IG4yNXEyNTZheDEgWzFdIGFuZCBtdDI1cXUyNTZh
IFsyXSAoYm90aCBoYXZlIHNhbWUgamVkZWNfaWQgLQo+Pj4+PiAweDIwYmIxOSkKPj4+Pj4gdXNl
IHRoZSA0IGJpdCBCbG9jayBQcm90ZWN0aW9uIHNjaGVtZSBhbmQgc3VwcG9ydCBUb3AvQm90dG9t
Cj4+Pj4+IHByb3RlY3Rpb24KPj4+Pj4gdmlhIHRoZSBCUCBhbmQgVEIgYml0cyBvZiB0aGUgU3Rh
dHVzIFJlZ2lzdGVyLgo+Pj4+PiBCUDMgaXMgbG9jYXRlZCBpbiBiaXQgNiBvZiB0aGUgU3RhdHVz
IFJlZ2lzdGVyLgo+Pj4+PiBUZXN0ZWQgb24gYm90aCBuMjVxMjU2YXgxIGFuZCBtdDI1cXUyNTZh
Lgo+Pj4+PiAKPj4+Pj4gWzFdCj4+Pj4+IGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9j
bGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9zZXJp
YWwtbm9yL24yNXEvbjI1cV8yNTZtYl8zdi5wZGYgCj4+Pj4+IFsyXQo+Pj4+PiBodHRwczovL3d3
dy5taWNyb24uY29tLy0vbWVkaWEvY2xpZW50L2dsb2JhbC9kb2N1bWVudHMvcHJvZHVjdHMvZGF0
YS1zaGVldC9ub3ItZmxhc2gvc2VyaWFsLW5vci9tdDI1cS9kaWUtcmV2LWEvbXQyNXFfcWxqc191
XzI1Nl9hYmFfMC5wZGYKPj4+PiAKPj4+PiBJZiB5b3UgcmVzcGluLCB5b3UgY2FuIHVzZSBhICJM
aW5rOiIgdGFnIGZvciB0aGUgVVJMIGFib3ZlLgo+Pj4gCj4+PiBBY2suCj4+PiAKPj4+Pj4gU2ln
bmVkLW9mZi1ieTogRWxpYXYgRmFyYmVyIDxmYXJiZXJlQGFtYXpvbi5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiB4eGQgLXAKPj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4MjAwMC5zcGkv
c3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL3NmZHAgCj4+Pj4+IDUzNDY0NDUwMDYwMTAx
ZmYwMDA2MDExMDMwMDAwMGZmODQwMDAxMDI4MDAwMDBmZmZmZmZmZmZmZmZmZgo+Pj4+PiBmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIwZmJmZmZmZmZmZjBmMjllYjI3NmIK
Pj4+Pj4gMjczYjI3YmJmZmZmZmZmZmZmZmYyN2JiZmZmZjI5ZWIwYzIwMTBkODBmNTIwMDAwMjQ0
YTk5MDA4YjhlCj4+Pj4+IDAzZDRhYzAxMjczODdhNzU3YTc1ZmJiZGQ1NWM0YTBmODJmZjgxYmQz
ZDM2ZmZmZmZmZmZmZmZmZmZmZgo+Pj4+PiBmZmZmZmZmZmZmZmZmZmZmZmZlN2ZmZmYyMWRjZmZm
Zgo+Pj4+PiAKPj4+Pj4gbWQ1c3VtCj4+Pj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmQ4
ODIwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3BpLW5vci9zZmRwIAo+Pj4+PiA1ZWE3
MzgyMTZmNjhjOWY5ODk4N2JiMzcyNTY5OWEzMgo+Pj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0v
c29jL2ZkODgyMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3Ivc2ZkcCAKPj4+
Pj4gY2F0Cj4+Pj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmQ4ODIwMDAuc3BpL3NwaV9t
YXN0ZXIvc3BpMC9zcGkwLjAvc3BpLW5vci9qZWRlY19pZCAKPj4+Pj4gMjBiYjE5MTA0NDAwCj4+
Pj4+IAo+Pj4+PiBjYXQKPj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4MjAwMC5z
cGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL3BhcnRuYW1lIAo+Pj4+PiBtdDI1cXUy
NTZhCj4+Pj4+IAo+Pj4+PiBjYXQKPj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4
MjAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL21hbnVmYWN0dXJlciAKPj4+
Pj4gc3QKPj4+PiAKPj4+PiBUaGF0J3MgdGhlIG10MjVxdTI1NmEgU0ZEUC4gV2hhdCBhYm91dCB0
aGUgbjI1cTI1NmF4MT8KPj4+IAo+Pj4gT24gdGhlIHNhbWUgY2FyZCwgd2l0aCBzYW1lIE5PUiBm
bGFzaCBtZW1vcnkgSSdtIHJ1bm5pbmcgdHdvIAo+Pj4gZGlmZmVyZW50Cj4+PiBrZXJuZWwgdmVy
c2lvbnMuCj4+PiBGaXJzdCB2ZXJzaW9uIGlzIHF1aXRlIG9sZCAtIDQuMTkuMjM5IHdoaWNoIGRv
ZXMgbm90IHN1cHBvcnQgCj4+PiBtdDI1cXUyNTZhCj4+PiBhbmQgdGhlcmVmb3JlIGRldmljZSBp
cyBkZXRlY3RlZCBhcyBuMjVxMjU2YXgxLgo+Pj4gU2Vjb25kIHZlcnNpb24gaXMgNi4xLjAtcmMx
IGFuZCBpdCBkZXRlY3RzIHRoZSBzYW1lIGRldmljZSBhcwo+Pj4gbXQyNXF1MjU2YS4KPj4+IFNv
IEkgd2FzIGFibGUgdG8gZHVtcCBTRkRQIHdoZW4gcnVubmluZyB2ZXJzaW9uIDYuMS4wLXJjMSwg
YnV0IG5vdCAKPj4+IHdoZW4KPj4+IHJ1bm5pbmcgNC4xOS4yMzkgd2hpY2ggZG9lcyBub3Qgc3Vw
cG9ydCB0aGUgc3lzZnMgdG8gZHVtcCB0aGUgU0ZQRAo+Pj4gaW5mb3JtYXRpb24uCj4+PiBJIGNo
ZWNrZWQgdGhhdCBsb2NraW5nIHdvcmtzIHdpdGggbXkgY2hhbmdlcyB3aGVuIHJ1bm5pbmcgb24g
Ym90aAo+Pj4ga2VybmVsCj4+PiB2ZXJzaW9ucy4KPj4gCj4+IFNvIHlvdSd2ZSBvbmx5IHRlc3Rl
ZCBvbiBhbiBtdDI1cXUyNTZhLCBjb3JyZWN0PyBUaGVuIHlvdSBzaG91bGQgb25seQo+PiBhZGQg
dGhlIGxvY2tpbmcgdG8gdGhpcyBmbGFzaCBkZXZpY2UuIChhbmQgbWF5YmUgYmFja3BvcnQgdGhl
IAo+PiBtdDI1cXUyNTZhCj4+IHRvIHlvdXIgb2xkZXIga2VybmVsKS4KPiAKPiBJIGR1bXBlZCBT
RkRQIHRhYmxlcyBvbmx5IGZvciBtdDI1cXUyNTZhLCBidXQgYXMgSSBtZW50aW9uZWQgSSB0ZXN0
ZWQKPiBsb2NraW5nIGZ1bmN0aW9uYWxpdHkgZm9yIGJvdGggKG9uIDQuMTkuMjM5IHdoaWNoIGRl
dGVjdHMgdGhlIGRldmljZSBhcwo+IG4yNXEyNTZheDEgYW5kIG9uIDYuMS4wLXJjMcKgIHdoaWNo
IGRldGVjdHMgdGhlIGRldmljZSBhcyBtdDI1cXUyNTZhKS4KPiBUaGlzIGlzIHRoZSBmbG93IEkg
dXNlZCBmb3IgdGVzdGluZyB0aGUgY2hhbmdlIG9uIGJvdGggdmVyc2lvbnM6CgpZb3Ugc2FpZCB5
b3UndmUgdGVzdGVkIG9uIHRoZSBzYW1lIGJvYXJkLCB0aHVzIGl0IGhhcyB0aGUgc2FtZSBmbGFz
aApkZXZpY2UuIEJ1dCB3aXRoIHRoZSBvbGRlciBrZXJuZWwgaXQgd2FzIGRldGVjdGVkIGFzIGEg
ZGlmZmVyZW50IHBhcnQuCgpTbyB0aGUgcXVlc3Rpb24gaXMsIHdoYXQgaXMgdGhlIGNvcnJlY3Qg
cGFydCBudW1iZXI/IEkuZS4gd2hhdCBpcyB0aGUKX2FjdHVhbF8gZmxhc2ggZGV2aWNlIHNvbGRl
cmVkIG9uIHlvdXIgYm9hcmQ/CgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
