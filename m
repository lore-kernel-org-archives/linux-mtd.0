Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A63BC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 09:57:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B551B2310B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 09:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B551B2310B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=is1HEhNSjgxWuFNw8htW1soLpu250wj5K6BLMsyGoxk=; b=aAgqnr8D6RwxImXrEv0mds3NX
	DkiPuXD8BRgsoSN1PDCIxC+DUigItVjF3PFax6JlgxLUJuqeuyRQGl7YzYZJHkegDhZwlbHSkQxuQ
	SgHxGaZ3xeGekLNuBAiXLpzU2WptkFKyfjR4pB4p+0fBCP21QifD4rUp9Ye/5nHkNnA8jz8DKGFh0
	euYTBSepNHmqhLTfmODD4FWIlpnqTJc3KKskohZyBbiwZtWaJS6cgBeM67Mk8xR51BLsX1HhDLFAN
	hAhTDQY5XKYQiWruVz99KViEuQ/AM6+f6PiqgRbzPNX/CPHK6jx+Wkvly8cyWO9GDHuGsXL94vJVB
	Bo+zfSY0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDG9-00027I-9h; Mon, 07 Dec 2020 09:56:45 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDG4-00025e-BH; Mon, 07 Dec 2020 09:56:41 +0000
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B4E16200005;
 Mon,  7 Dec 2020 09:56:33 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:56:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v15 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
Message-ID: <20201207105632.6ea2c7ce@xps13>
In-Reply-To: <259fe1ce-6bcb-3a26-493d-87bbd2eaff5e@gmail.com>
References: <20201130100031.22083-1-yifeng.zhao@rock-chips.com>
 <20201130100031.22083-3-yifeng.zhao@rock-chips.com>
 <0abf1dbd-13bb-cd92-907c-849f05ea887c@gmail.com>
 <259fe1ce-6bcb-3a26-493d-87bbd2eaff5e@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045640_514724_F48F709E 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPiB3cm90ZSBvbiBTdW4sIDYg
RGVjIDIwMjAgMTU6MTA6NTcKKzAxMDA6Cgo+IEhpIFlpZmVuZywKPiAKPiBNZWFud2hpbGUsIGNv
dWxkIHlvdSBwb3N0IGEgUkZDIHZlcnNpb24gZm9yIFVib290IGJhc2VkIG9uIHRoaXMgdmVyc2lv
bgo+IHBsdXMgY29tbWVudHMsIHNvIHBlb3BsZSBjYW4gdGVzdCB0aGUgd2hvbGUgcHJvY2VzcyBm
cm9tIHByb2dyYW1taW5nLAo+IGJvb3RpbmcgYW5kIGtlcm5lbD8KPiAKPiBPbiAxMS8zMC8yMCAx
OjQ5IFBNLCBKb2hhbiBKb25rZXIgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gTG9va3MgZ29vZCB0
byBtZS4KPiA+IERvIHRoZSBtYWludGFpbmVycyBvciBzb21lb25lIGVsc2UgaGF2ZSBhbnkgbWFq
b3IgaXNzdWVzPwo+ID4gQ291bGQgTWlxdWVsIGluZGljYXRlIGlmIGEgdmVyc2lvbiAxNiBtdXN0
IGJlIHNlbmQgZm9yIHRoYXQgJ3JldCcKPiA+IHZhcmlhYmxlIGFsb25lIG9yIGlzIGl0IE9LIG5v
dz8KPiA+IAo+ID4gCj4gPiBPbiAxMS8zMC8yMCAxMTowMCBBTSwgWWlmZW5nIFpoYW8gd3JvdGU6
ICAKPiA+PiBUaGlzIGRyaXZlciBzdXBwb3J0cyBSb2NrY2hpcCBORkMgKE5BTkQgRmxhc2ggQ29u
dHJvbGxlcikgZm91bmQgb24gUkszMzA4LAo+ID4+IFJLMjkyOCwgUktQWDMwLCBSVjExMDggYW5k
IG90aGVyIFNPQ3MuIFRoZSBkcml2ZXIgaGFzIGJlZW4gdGVzdGVkIHVzaW5nCj4gPj4gOC1iaXQg
TkFORCBpbnRlcmZhY2Ugb24gdGhlIEFSTSBiYXNlZCBSSzMzMDggcGxhdGZvcm0uICAKPiAKPiBb
Li5dCj4gCj4gPj4gKy8qKgo+ID4+ICsgKiBzdHJ1Y3QgcmtfZWNjX2NudF9zdGF0dXM6IHJlcHJl
c2VudCBhIGVjYyBzdGF0dXMgZGF0YS4gIAo+IAo+IHJlcHJlc2VudCB0aGUgRUNDIHN0YXR1cyBk
YXRhLgoKVGhlIGRyaXZlciBsb29rcyBnb29kIHRvIG1lIG5vdywgY2FuIHlvdSBwbGVhc2Ugc2Vu
ZCBhIHYxNiB3aXRoIHRoZQpsYXN0IGNvbW1lbnRzIGZyb20gSm9oYW4gKHRoYW5rcyBmb3IgcmV2
aWV3aW5nIHNvIGNhcmVmdWxseSBidHchKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
