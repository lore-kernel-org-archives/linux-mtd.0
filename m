Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBE8C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 21:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E9620719
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 21:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KnvmsgNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E9620719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT/xAxiy01LJ9Q0fBVlYwSOirvZr1xmdJCOobXtRupY=; b=KnvmsgNQV6W6lh
	5mQ+ydCpgPCzfaz/qgq1fCq6svEI2y2u55LDDyFiLSYmPFe/30FCzda48NxvpYQToOlq1VcA0i5Ij
	JimQB4EW15zmSxhmqrRaoYpMpmajucmyr0ErKlDABHU2RLx/7wcDndknAbyYiQ7Z5KI1lfX+BdKI+
	OoHbM1jedRZcwGB3PGQzIqfn0BmBb5QWc6gkLAGpVJFZ9UsknYn2t6mmoRX6al++t1wKYOMFSaw2u
	aYkpQ+aEWjg63cgVH2Z8OBGa6N9TmxchbVJMH/qeeDfpKxRKscCV+7aqUSByCP4NQAFPuSmmzg/oZ
	V6KwT5dXIXeH7nk0mUyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHDLr-0006kb-5u; Wed, 25 Mar 2020 21:14:15 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHDLo-0006k0-47
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 21:14:13 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BFA9F240005;
 Wed, 25 Mar 2020 21:14:07 +0000 (UTC)
Date: Wed, 25 Mar 2020 22:14:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.7
Message-ID: <20200325221406.6b93fa01@xps13>
In-Reply-To: <3920122.fqK6YPyDo2@192.168.0.120>
References: <3920122.fqK6YPyDo2@192.168.0.120>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_141412_298821_260F6C0E 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: vigneshr@ti.com, richard@nod.at, michael@walle.cc, broonie@kernel.org,
 linux-mtd@lists.infradead.org, js07.lee@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tLAoKPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlw
LmNvbT4gd3JvdGUgb24gVHVlLCAyNCBNYXIgMjAyMCAxNDowMjo0MSArMDAwMDoKCj4gSGksCj4g
Cj4gSGVyZSBpcyB0aGUgU1BJIE5PUiBQUiBmb3IgNS43Lgo+IAo+IEkgd291bGQgbGlrZSB0byB0
aGFuayBWaWduZXNoLCBNaWNoYWVsIGFuZCBKdW5nc2V1bmcgZm9yIHRoZWlyIGludm9sdmVtZW50
IGluIAo+IHJldmlld2luZyBwYXRjaGVzIGZvciB0aGlzIHJlbGVhc2UgY3ljbGUuIFlvdSBkaWQg
YSBncmVhdCBqb2IhCj4gCj4gUmljaGFyZCwKPiAKPiBQbGVhc2Ugbm90ZSB0aGF0IEkgbWVyZ2Vk
IHRhZyAnbXRrLW10ZC1zcGktbW92ZScgaW50byBzcGktbm9yL25leHQsIGluIG9yZGVyIAo+IHRv
IHNwYXJlIExpbnVzIG9mIHNvbHZpbmcgY29uZmxpY3RzIGR1cmluZyB0aGUgbWVyZ2Ugd2luZG93
LiBUaGUgbXRrLXF1YWRzcGkgCj4gZHJpdmVyIGlzIHJlcGxhY2VkIGJ5IHRoZSBuZXcgc3BpLW1l
bSBzcGktbXRrLW5vciBkcml2ZXIsIHdoaWNoIHdhcyB0YWtlbiAKPiB0aHJvdWdoIE1hcmsncyB0
cmVlLiBUaGVyZSB3YXMgYSBjb25mbGljdCBiZXR3ZWVuIHRoaXMgZHJpdmVyIG1vdmUgYW5kIHRo
ZSAKPiBtb3ZlIG9mIGFsbCB0aGUgU1BJIE5PUiBjb250cm9sbGVycyB1bmRlciBkcml2ZXJzL210
ZC9zcGktbm9yL2NvbnRyb2xsZXJzLy4KPiAKPiBDaGVlcnMsCj4gdGEKPiAKPiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDExYTQ4YTVhMThjNjNmZDc2MjFiYjA1MDIyOGNlYmYx
MzU2NmU0ZDg6Cj4gCj4gICBMaW51eCA1LjYtcmMyICgyMDIwLTAyLTE2IDEzOjE2OjU5IC0wODAw
KQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgc3No
Oi8vZ2l0QGdpdG9saXRlLmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9s
aW51eC5naXQgdGFncy8KPiBzcGktbm9yL2Zvci01LjcKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gZjNmMmI3ZWIyZjFjNTg4OWIwYTcxNjJiNmI1YTY5YzBmMzU3YmVmZDoKPiAK
PiAgIG10ZDogc3BpLW5vcjogRW5hYmxlIGxvY2tpbmcgZm9yIG4yNXE1MTJheDMvbjI1cTUxMmEg
KDIwMjAtMDMtMjQgMTE6NDc6NTIgCj4gKzAyMDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFNQSSBOT1IgY29y
ZSBjaGFuZ2VzOgo+IC0gbW92ZSBhbGwgdGhlIG1hbnVmYWN0dXJlciBzcGVjaWZpYyBxdWlya3Mv
Y29kZSBvdXQgb2YgdGhlIGNvcmUsCj4gdG8gbWFrZSB0aGUgY29yZSBsb2dpYyBtb3JlIHJlYWRh
YmxlIGFuZCB0aHVzIGVhc2UgbWFpbnRlbmFuY2UuCj4gLSBtb3ZlIHRoZSBTRkRQIGxvZ2ljIG91
dCBvZiB0aGUgY29yZSwgaXQgcHJvdmlkZXMgYSBiZXR0ZXIKPiBzZXBhcmF0aW9uIGJldHdlZW4g
dGhlIFNGRFAgcGFyc2luZyBhbmQgY29yZSBsb2dpYy4KPiAtIHRyaW0gd2hhdCBpcyBleHBvc2Vk
IGluIHNwaS1ub3IuaC4gVGhlIFNQSSBOT1IgY29udHJvbGxlcnMgZHJpdmVycwo+IG11c3Qgbm90
IGJlIGFibGUgdG8gdXNlIHN0cnVjdHVyZXMgdGhhdCBhcmUgbWVhbnQganVzdCBmb3IgdGhlCj4g
U1BJIE5PUiBjb3JlLgo+IC0gdXNlIHRoZSBzcGktbWVtIGRpcmVjdCBtYXBwaW5nIEFQSSB0byBs
ZXQgYWR2YW5jZWQgY29udHJvbGxlcnMKPiBvcHRpbWl6ZSB0aGUgcmVhZC93cml0ZSBvcGVyYXRp
b25zIHdoZW4gdGhleSBzdXBwb3J0IGRpcmVjdCBtYXBwaW5nLgo+IC0gYWRkIGdlbmVyaWMgZm9y
bXVsYSBmb3IgdGhlIFN0YXR1cyBSZWdpc3RlciBibG9jayBwcm90ZWN0aW9uCj4gaGFuZGxpbmcu
IEl0IGZpeGVzIHNvbWUgbG9uZyBzdGFuZGluZyBsb2NraW5nIGxpbWl0YXRpb25zIGFuZCBlYXNl
cwo+IHRoZSBhZGRpdGlvbiBvZiB0aGUgNGJpdCBibG9jayBwcm90ZWN0aW9uIHN1cHBvcnQuCj4g
LSBhZGQgYmxvY2sgcHJvdGVjdGlvbiBzdXBwb3J0IGZvciBmbGFzaGVzIHdpdGggNCBibG9jayBw
cm90ZWN0aW9uCj4gYml0cyBpbiB0aGUgU3RhdHVzIFJlZ2lzdGVyLgo+IAo+IFNQSSBOT1IgY29u
dHJvbGxlciBkcml2ZXJzIGNoYW5nZXM6Cj4gLSB0aGUgbXRrLXF1YWRzcGkgZHJpdmVyIGlzIHJl
cGxhY2VkIGJ5IHRoZSBuZXcgc3BpLW1lbQo+IHNwaS1tdGstbm9yIGRyaXZlci4gTWVyZ2UgdGFn
ICdtdGstbXRkLXNwaS1tb3ZlJyBpbnRvIHNwaS1ub3IvbmV4dAo+IHRvIGF2b2lkIGNvbmZsaWN0
cy4KPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCgpQdWxsZWQgaW50byBtdGQvbmV4dC4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
