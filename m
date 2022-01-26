Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC820C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GvES2eXRiJgNTqXV8TArHI7KWASOxmsxP39yX06/Ew=; b=wOACW0uwNtoVdl
	/lODyW9B1Ew1XYJrBZrdFd7D3uvhZJGY7K9S4SoVrH3bC7y77ZVwrbkECsJB5nceN7b8gcl4hDPV1
	tYyHwvVX7vpE4P33Bf/0wxAYhulIYey+qddGkfKAe2bgonFYT9TVapeZ7tIpZtrKT78eOW6IPgG1E
	XvNte/F+jcU/EGOE2QeSjJHNboTz7YmHHGtjssimeoHbc7KF9KX1jSMZDYQL7a+H332ZzePYjODvX
	xvSbrPiQQ6K+B75QHSSlG86PZWN6Ayi/rkt9YgIT2zWHAskJKDivUq0Sy6DTuS57OKw7Cx34/ueM5
	ekEHCJOwLnjshP1B+NmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeuA-00B4FY-Ge; Wed, 26 Jan 2022 09:47:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeu6-00B4E3-Co
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 09:47:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A0A42000D;
 Wed, 26 Jan 2022 09:47:47 +0000 (UTC)
Date: Wed, 26 Jan 2022 10:47:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: david regan <dregan@mail.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>, Joel Peshkin <joel.peshkin@broadcom.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC
 status
Message-ID: <20220126104746.225eb894@xps13>
In-Reply-To: <5ea1a3c7-a8fa-f88e-7575-8d8e96833398@gmail.com>
References: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
 <5ea1a3c7-a8fa-f88e-7575-8d8e96833398@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_014750_593322_EC89B9A2 
X-CRM114-Status: GOOD (  18.08  )
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

SGkgRGF2aWQsCgpmLmZhaW5lbGxpQGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDI1IEphbiAyMDIy
IDEwOjU5OjE5IC0wODAwOgoKPiArTWlxdWVsLAo+IAo+IE9uIDEvMTIvMjAyMiAxOjA4IFBNLCBk
YXZpZCByZWdhbiB3cm90ZToKPiA+IFRoZSBicmNtbmFuZCBkcml2ZXIgY29udGFpbnMgYSBidWcg
aW4gd2hpY2ggaWYgYSBwYWdlIChleGFtcGxlIDJrIGJ5dGUpCj4gPiBpcyByZWFkIGZyb20gdGhl
IHBhcmFsbGVsL09ORkkgTkFORCBhbmQgd2l0aGluIHRoYXQgcGFnZSBhIHN1YnBhZ2UgKDUxMgo+
ID4gYnl0ZSkgaGFzIGNvcnJlY3RhYmxlIGVycm9ycyB3aGljaCBpcyBmb2xsb3dlZCBieSBhIHN1
YnBhZ2Ugd2l0aAo+ID4gdW5jb3JyZWN0YWJsZSBlcnJvcnMsIHRoZSBwYWdlIHJlYWQgd2lsbCBy
ZXR1cm4gdGhlIHdyb25nIHN0YXR1cyBvZgo+ID4gY29ycmVjdGFibGUgKGFzIG9wcG9zZWQgdG8g
dGhlIGFjdHVhbCBzdGF0dXMgb2YgdW5jb3JyZWN0YWJsZS4pCj4gPiAKPiA+IFRoZSBidWcgaXMg
aW4gZnVuY3Rpb24gYnJjbW5hbmRfcmVhZF9ieV9waW8gd2hlcmUgdGhlcmUgaXMgYSBjaGVjayBm
b3IKPiA+IHVuY29ycmVjdGFibGUgYml0cyB3aGljaCB3aWxsIGJlIHByZWVtcHRlZCBpZiBhIHBy
ZXZpb3VzIHN0YXR1cyBmb3IKPiA+IGNvcnJlY3RhYmxlIGJpdHMgaXMgZGV0ZWN0ZWQuCj4gPiAK
PiA+IFRoZSBmaXggaXMgdG8gc3RvcCBjaGVja2luZyBmb3IgYmFkIGJpdHMgb25seSBpZiB3ZSBh
bHJlYWR5IGhhdmUgYSBiYWQKPiA+IGJpdHMgc3RhdHVzLgo+ID4gCj4gPiBGaXhlczogMjdjNWIx
N2NkMWIxICgibXRkOiBuYW5kOiBhZGQgTkFORCBkcml2ZXIgImxpYnJhcnkiIGZvciBCcm9hZGNv
bSBTVEIgTkFORCBjb250cm9sbGVyIikKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogZGF2aWQgcmVn
YW4gPGRyZWdhbkBtYWlsLmNvbT4gIAo+IAo+IE1pcXVlbCBzaW5jZSB5b3Ugd2VyZSBub3QgY29w
aWVkIGV4cGxpY2l0bHksIGFkZGluZyB5b3Ugbm93LiBSZS1zZW5kaW5nIG15IHRhZzoKPiAKPiBS
ZXZpZXdlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+CgpUaGlz
IGNoYW5nZSBkb2VzIG5vdCBhcHBseSB0byBteSB0cmVlLCBwbGVhc2UgbG9vayBhdCB0aGUgc2Vy
aWVzIGZyb20KRmxvcmlhbiBvbiBuYW5kL25leHQgKGtlcm5lbC5vcmcgcmVwb3NpdG9yeSBuYW1l
ZCBtdGQpLiBJZiBpdCBjb25mbGljdHMKd2l0aCB5b3VyIGZpeCwgdGhlbiByZWJhc2Ugb24gdG9w
IG9mIG5hbmQvbmV4dC4gT3RoZXJ3aXNlIHBsZWFzZSByZWJhc2UKb24gdG9wIG9mIG10ZC9maXhl
cy4KCkFuZCBkb24ndCBmb3JnZXQgdG8ga2VlcCB0aGUgUmV2aWV3ZWQtYnkgdGFnIGZyb20gRmxv
cmlhbiBhbmQgdG8ga2VlcAptZSBpbiBUby9DYyBvZiB5b3VyIHYyLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
