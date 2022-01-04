Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7C2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEzv9Gj/kaV48JywFhefkoX2l7BPxkOmrTVgdwZsf1U=; b=XHNEvT0J7gK955
	2vJR3V82KKV7bVyFYNI1v0b2HZkGlLjHJRv/r/m/IizPTkm8JuDuioAlL6RgZO9pooAbUsFzTyNL/
	q+lK7mkXRt3EU3w8/m18xxQr2MlbKC7xXLDYEahLobkxYWHnyG2m31i4zMvYSybizyg1E+JVjIDes
	r8NASJDDXDSAVBD6XsRed2W68ZEK4nAQRVy6TWJpzlocuSsXe307+Oy8S3JpIHJQSYq4KMD0QFGyC
	foxoIOXwITCcysYtKsmEcW2Hbfg9guemp9zmckvkLh0BJmOdXzFx021CFm+btjUnD3EciJEJUuF+M
	i6cPQM/iP0cvw+/MwE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fDG-00Ajbl-W6; Tue, 04 Jan 2022 08:30:35 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fDE-00Ajb4-Iz
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 08:30:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 875BFE000B;
 Tue,  4 Jan 2022 08:30:26 +0000 (UTC)
Date: Tue, 4 Jan 2022 09:30:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Cai
 Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>, open
 list <linux-kernel@vger.kernel.org>, "open list:BROADCOM SPECIFIC AMBA
 DRIVER (BCMA)" <linux-wireless@vger.kernel.org>, "open list:BROADCOM STB
 NAND FLASH DRIVER" <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH 4/9] mtd: rawnand: brcmnand: Move OF operations out of
 brcmnand_init_cs()
Message-ID: <20220104093025.0fc39928@xps13>
In-Reply-To: <00d8af2f-45ff-48d7-43e7-14c59a0aca62@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-5-f.fainelli@gmail.com>
 <20220103175606.71a4eb93@xps13>
 <00d8af2f-45ff-48d7-43e7-14c59a0aca62@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_003032_792511_642ED444 
X-CRM114-Status: GOOD (  20.35  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMyBKYW4gMjAy
MiAwOToyNzoyOCAtMDgwMDoKCj4gT24gMS8zLzIwMjIgODo1NiBBTSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiA+IEhpIEZsb3JpYW4sCj4gPiAKPiA+IGYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3Rl
IG9uIFdlZCwgMjIgRGVjIDIwMjEgMTY6MjI6MjAgLTA4MDA6Cj4gPiAgIAo+ID4+IEluIG9yZGVy
IHRvIGluaXRpYWxpemUgYSBnaXZlbiBjaGlwIHNlbGVjdCBvYmplY3QgZm9yIHVzZSBieSB0aGUK
PiA+PiBicmNtbmFuZCBkcml2ZXIsIG1vdmUgYWxsIG9mIHRoZSBEZXZpY2UgVHJlZSBzcGVjaWZp
YyByb3V0aW5lcyBvdXRzaWRlCj4gPj4gb2YgYnJjbW5hbmRfaW5pdF9jcygpIGluIG9yZGVyIHRv
IG1ha2UgaXQgdXNhYmxlIGluIGEgcGxhdGZvcm0gZGF0YQo+ID4+IGNvbmZpZ3VyYXRpb24gd2hp
Y2ggd2lsbCBiZSBuZWNlc3NhcnkgZm9yIHN1cHBvcnRpbmcgQkNNQSBjaGlwcy4gIAo+ID4gCj4g
PiBUQkggSSdtIG5vdGUgYSBiaWcgZmFuIG9mIHRoZSBpZGVhLiBJJ20gbm90IHN1cmUgZ29pbmcg
YmFjayB0bwo+ID4gc3VwcG9ydGluZyBwbGF0Zm9ybSBkYXRhIHRoaXMgd2F5IHJlYWxseSBpcyBh
IGdvb2QgaWRlYS4uLiBUaGVyZSBhcmUgc28KPiA+IG11Y2ggdGhpbmdzIHRoYXQgYXJlIHdlbGwg
ZGVzY3JpYmVkIHdpdGggRFQgdGhhdCB3ZSBub3cgcmVseSB1cG9uIHRoYXQKPiA+IEkgYW0gbm90
IGVudGlyZWx5IGNvbnZpbmNlZCBieSB0aGVzZSBjaGFuZ2VzIDotLyBUaGUgbW92ZSBpcyBnZW5l
cmFsbHkKPiA+IGluIHRoZSBvdGhlciBkaXJlY3Rpb246IGdldHRpbmcgcmlkIG9mIHRoZSBsZWdh
Y3kgcGxhdGZvcm0gZGF0YS4gIAo+IAo+IEluIHRoZSBjb3ZlciBsZXR0ZXIgdGhlcmUgaXMgYW4g
ZXhwbGFuYXRpb24gYXMgdG8gd2h5IHdlIG5lZWQgdG8gaW50cm9kdWNlIHBsYXRmb3JtIGRhdGEv
ZGV2aWNlIHN1cHBvcnQgaGVyZTogdGhlIHBsYXRmb3JtcyBvbiB3aGljaCB0aGlzIE5BTkQgY29u
dHJvbGxlciBzaGltIGlzIHVzZWQgZG8gbm90IGhhdmUgRGV2aWNlIFRyZWUgc3VwcG9ydCwgYW5k
IHdvbid0IGhhdmUgaXQgaW4gdGhlIGZ1dHVyZSBlaXRoZXIuIFRoZXkgYXJlIG9sZCBwbGF0Zm9y
bXMgKGZpcnN0IFNvQyBzdXBwb3J0ZWQgYnkgYmNtNDd4eCBpcyBtYXliZSAxNSB5ZWFycyBvbGQg
bm93KSBidXQgdGhleSBhcmUgc3RpbGwgaW4gYWN0aXZlIGFuZCB3aWRlIHVzZSBieSB0aGUgT3Bl
bldydCwgZGQtd3J0IGNvbW11bml0aWVzLgoKWWVhaCwgSSByZWFkIHRoZSBjb3ZlciBsZXR0ZXIs
IEkgdW5kZXJzdGFuZCB0aGVzZSBwbGF0Zm9ybXMgd29uJ3QgZXZlcgpiZSB1cGRhdGVkIHNvIHlv
dSdyZSBzdHVjay4gSSdsbCBjbG9zZSBteSBleWVzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
