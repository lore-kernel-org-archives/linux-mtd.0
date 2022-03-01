Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AC4C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2gNa0ZqsCIzQ5o2gb+B0afpHrwQeKriD42XgliYsLg=; b=KaWGG8fH+rQ1e/rLV/LO/wj5oB
	+6SBtQbKO6LYPpaRqvQsG1nTL8ffS/zyRYwDXwG/kcIxLkTwIeBcUsbzqZNxYHNOucxuJ4uhnVrlM
	1GgqhgYJxb3t/nifLe87zVUq/ZTXSTrwkx37j5gXJFoaUjc0i1065FCw77CS5UhOgOWsi86w34FMy
	xWn8TD8dXG/gHheMsqMiE7D0MJXSLL0ac6ESVN6P+95QfqVKn0HtuZaWbhQyBYnGaiscSxTZJyhI7
	HhdYVF/Fm3OOLuFnEzXd1dh+vr0UC6qWOVM1Glco6gURt5/XPQ0RRqTVCwf8ZTdaPzHasGM1sqPr5
	TEZWaNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP1ko-00GaGr-GG; Tue, 01 Mar 2022 12:37:22 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP1kT-00Ga9W-M9; Tue, 01 Mar 2022 12:37:03 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3AAC122239;
 Tue,  1 Mar 2022 13:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646138219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iztniPoIGbsTohI0SxtqXSWpW8VeM+mx7S7Q/3gFqFI=;
 b=dS/P1ugPkrY/zcSGeCSDMST6ePmdqAp1NBF3nvEmqocX21nhov9y9aaog73Sq04JwWQtF4
 ANtplyQWNZ9eHE1iNQ9TJMqgMa1Yatv1u1wLc8omyhf1OBBi7+evCaSFtXtkuMtANNapmm
 nFlAdf/pTPdpsWurGo1tBCs56Bo1lfI=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 13:36:58 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: heiko.thiery@gmail.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
In-Reply-To: <0210b628-a331-d935-6319-bc9fe737fe15@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <ba3a7bd546934ee0174480a01c505663@walle.cc>
 <0210b628-a331-d935-6319-bc9fe737fe15@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <f04908c3d761220d8efad70ac244bb84@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_043701_938164_EEE9A80A 
X-CRM114-Status: GOOD (  10.27  )
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

QW0gMjAyMi0wMy0wMSAxMTo1Miwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy8xLzIyIDEyOjM4LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIyLTAzLTAxIDExOjI5LCBzY2hy
aWViIEhlaWtvIFRoaWVyeToKPj4+IEhpIFR1ZG9yLAo+Pj4gCj4+PiBBbSBEaS4sIDEuIE3DpHJ6
IDIwMjIgdW0gMTA6NTYgVWhyIHNjaHJpZWIgVHVkb3IgQW1iYXJ1cwo+Pj4gPHR1ZG9yLmFtYmFy
dXNAbWljcm9jaGlwLmNvbT46Cj4+Pj4gCj4+Pj4gSGksIEhlaWtvLAo+Pj4+IAo+Pj4+IFdvdWxk
IHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBzZXQgb24gdG9wIG9mOgo+Pj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIyMDIyODEzNDUwNS4yMDMyNzAtMS10dWRvci5h
bWJhcnVzQG1pY3JvY2hpcC5jb20vCj4+PiAKPj4+IFdoZW4gYXBwbHlpbmcgdGhhdCBzZXJpZXMg
dGhlIGZsYXNoIHdpbGwgYmUgcHJvcGVybHkgZGV0ZWN0ZWQuCj4+PiAKPj4+IFvCoMKgwqAgMS4z
MjI2NTVdIHNwaS1ub3Igc3BpMC4wOiBteDI1bDEyODM1ZiAoMTYzODQgS2J5dGVzKQo+Pj4gCj4+
PiBUaGFua3MKPj4gCj4+IEJ1dCBkb2Vzbid0IHRoYXQgbWVhbiB0aGF0IHRoZSBwcmV2aW91cyBz
ZXJpZXMgaW50cm9kdWNlcwo+PiBwb3NzaWJsZSByZWdyZXNzaW9ucyBmb3Igb3RoZXIgZmxhc2hl
cywgdG9vPwo+PiAKPiBubywgYmVjYXVzZSB0aGUgb3RoZXIgZmxhc2hlcyBhcmUgdXNpbmcgdGhl
IGRlcHJlY2F0ZWQgd2F5IG9mIAo+IGluaXRpYWxpemluZwo+IHBhcmFtZXRlcnMgd2hpY2ggY2Fs
bHMgZGVmYXVsdF9pbml0KCkgaG9va3MuCgphaGggcmlnaHQhCgpCdXQgd2Ugc2hvdWxkIGNsZWFy
IHRoZSBxdWFkX2VuYWJsZSBpbiB0aGUgY2FzZSB0aGUgU0ZEUCBkb2Vzbid0CnNwZWNpZnkgaXQu
IFJpZ2h0IG5vdywgd2UgYXJlIGZhbGxpbmcgYmFjayB0byBhIGZ1bmN0aW9uCndoaWNoIGRvZXNu
J3QgbWFrZSBzZW5zZSwgYW5kIG1pZ2h0IGV2ZW4gYmUgaGFybWZ1bC4KCi1taWNoYWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
