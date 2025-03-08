Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47834C282EC
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Mar 2025 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjERdohOh4ya5rJq0pmGySw/zVGEhRUr93iR9A1govQ=; b=TzqoFlY4Hnyvk9
	70ITvBIz/ti6pfZjM61ORC9bEZKctFWUluixsuYXOh1QYjEQqvg3FS0ee7wKEwtFGYmDAVSVZwmdc
	HYg5Kf8ilb3q7UCcxhx+tHf/JtUD/8bzylHXG2eu3/BsiCWIHf5bjZRLrfpqi53ChuGc8lsGEvg1Z
	QUdbQ8X0BeJmcaBjHA8W2Vv7slGGPQa6CMkmIQdScwUFHGbWw/QUoScUAR4JD/dAIkr8EKO4L7LlT
	opyCdnTdMMcFssn+SrNu55fhv6+hQXi463kI7Ju0i7fDx1ufnXoiYOVNaB7ZB6O0S3V4Xi8d7MtvT
	P9k4MZNj7lXd/+vCrlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzcj-0000000H5Wk-2dKW;
	Sat, 08 Mar 2025 19:14:13 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz6U-0000000H1ZN-39F4
	for linux-mtd@lists.infradead.org;
	Sat, 08 Mar 2025 18:40:56 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B0444240027
	for <linux-mtd@lists.infradead.org>; Sat,  8 Mar 2025 19:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1741459248; bh=otfbaXRx0KCNwf5peLoJ1CCs5/Kof2zck2m5p70R2NE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mTBtVL1TWiC8G4clZSZq+BE6ABeCrUGM7K0jQBhRzIPo7NmAjPNhD0py6m7frpeLp
	 PItpcLoQIg2hinHO/Z9QW3ARnQo/UIFRTVRWX/C3JZHSHrnskoLf1yJs7C1NsBwCbw
	 KIABpO4Bgm7f/bVPvVjIDroJpUqd+3b4zHezCF6jBqKikmVHITZPVRwxdsBEkFl2gc
	 wLX1gAz2/2B5ARv4uXa3Z30MEQ4dtIkh9cw7Va9JQcrBkoSzIzCgzdU61YitpynTM9
	 grmeKFm6j45bnS4EMu5MPE0gDS4RAOHTxZS8x4ljAG9tlQuqEi3n393+TGJ+6flnsR
	 eJ1XtRhmsfOtg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z9Bmr3JbPz9rxB;
	Sat,  8 Mar 2025 19:40:43 +0100 (CET)
Date: Sat,  8 Mar 2025 18:40:43 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Richard Weinberger <richard@nod.at>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Crystal Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <Z8yPKx1U-sT1OGeb@probook>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
 <174059551678.3319332.12055848852503108874.robh@kernel.org>
 <20250303140021.GA1732495-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303140021.GA1732495-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_104055_079326_6D72B3FA 
X-CRM114-Status: GOOD (  21.92  )
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

TWlxdWVsLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCBSb2IncyBzdWdnZXN0aW9uIGJlbG93PwoK
T24gTW9uLCBNYXIgMDMsIDIwMjUgYXQgMDg6MDA6MjFBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMTI6NDU6MTdQTSAtMDYwMCwgUm9iIEhlcnJp
bmcgKEFybSkgd3JvdGU6Cj4gPiAKPiA+IE9uIFdlZCwgMjYgRmViIDIwMjUgMTg6MDE6NDEgKzAx
MDAsIEouIE5ldXNjaMOkZmVyIHdyb3RlOgo+ID4gPiBGb3JtYWxpemUgdGhlIGJpbmRpbmcgYWxy
ZWFkeSBzdXBwb3J0ZWQgYnkgdGhlIGZzbF9lbGJjX25hbmQuYyBkcml2ZXIKPiA+ID4gYW5kIHVz
ZWQgaW4gc2V2ZXJhbCBkZXZpY2UgdHJlZXMgaW4gYXJjaC9wb3dlcnBjL2Jvb3QvZHRzLy4KPiA+
ID4gCj4gPiA+IHJhdy1uYW5kLWNoaXAueWFtbCBpcyByZWZlcmVuY2VkIGluIG9yZGVyIHRvIGFj
Y29tbW9kYXRlIHNpdHVhdGlvbnMgaW4KPiA+ID4gd2hpY2ggdGhlIEVDQyBwYXJhbWV0ZXJzIHNl
dHRpbmdzIGFyZSBzZXQgaW4gdGhlIGRldmljZSB0cmVlLiBPbmUgc3VjaAo+ID4gPiBleGFtcGxl
IGlzIGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy90dXJyaXMxeC5kdHM6Cj4gPiA+IAo+ID4gPiAJ
LyogTVQyOUYyRzA4QUJBRUFXUDpFIE5BTkQgKi8KPiA+ID4gCW5hbmRAMSwwIHsKPiA+ID4gCQlj
b21wYXRpYmxlID0gImZzbCxwMjAyMC1mY20tbmFuZCIsICJmc2wsZWxiYy1mY20tbmFuZCI7Cj4g
PiA+IAkJcmVnID0gPDB4MSAweDAgMHgwMDA0MDAwMD47Cj4gPiA+IAkJbmFuZC1lY2MtbW9kZSA9
ICJzb2Z0IjsKPiA+ID4gCQluYW5kLWVjYy1hbGdvID0gImJjaCI7Cj4gPiA+IAo+ID4gPiAJCXBh
cnRpdGlvbnMgeyAuLi4gfTsKPiA+ID4gCX07Cj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOk
ZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gVjM6Cj4gPiA+IC0g
cmVtb3ZlIHVubmVjZXNzYXJ5ICNhZGRyZXNzL3NpemUtY2VsbHMgZnJvbSBuYW5kIG5vZGUgaW4g
ZXhhbXBsZQo+ID4gPiAtIGFkZCBGcmFuayBMaSdzIHJldmlldyB0YWcKPiA+ID4gLSBhZGQgbWlz
c2luZyBlbmQgb2YgZG9jdW1lbnQgbWFya2VyICguLi4pCj4gPiA+IC0gZXhwbGFpbiBjaG9pY2Ug
dG8gcmVmZXJlbmNlIHJhdy1uYW5kLWNoaXAueWFtbAo+ID4gPiAKPiA+ID4gVjI6Cj4gPiA+IC0g
c3BsaXQgb3V0IGZyb20gZnNsLGVsYmMgYmluZGluZyBwYXRjaAo+ID4gPiAtIGNvbnN0cmFpbiAj
YWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMKPiA+ID4gLSBhZGQgYSBnZW5lcmFsIGRlc2Ny
aXB0aW9uCj4gPiA+IC0gdXNlIHVuZXZhbHVhdGVkUHJvcGVydGllcz1mYWxzZSBpbnN0ZWFkIG9m
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzPWZhbHNlCj4gPiA+IC0gZml4IHByb3BlcnR5IG9yZGVyIHRv
IGNvbXBseSB3aXRoIGR0cyBjb2Rpbmcgc3R5bGUKPiA+ID4gLSBpbmNsdWRlIHJhdy1uYW5kLWNo
aXAueWFtbCBpbnN0ZWFkIG9mIG5hbmQtY2hpcC55YW1sCj4gPiA+IC0tLQo+ID4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgfCA2OCArKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+
ID4gPiAKPiA+IAo+ID4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRp
bmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4gPiAKPiA+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9y
czoKPiA+IAo+ID4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiA+IC9idWlsZHMvcm9i
aGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9mc2wsZWxiYy1mY20tbmFuZC5leGFtcGxlLmR0YjogbmFuZEAxLDA6ICRub2RlbmFt
ZTowOiAnbmFuZEAxLDAnIGRvZXMgbm90IG1hdGNoICdebmFuZEBbYS1mMC05XSQnCj4gPiAJZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvZnNsLGVsYmMt
ZmNtLW5hbmQueWFtbCMKPiAKPiBEcm9wIHRoZSB1bml0IGFkZHJlc3MgaW4gcmF3LW5hbmQtY2hp
cC55YW1sLiBTbzogCj4gCj4gcHJvcGVydGllczoKPiAgICRub2RlbmFtZToKPiAgICAgcGF0dGVy
bjogIl5uYW5kQCIKPiAKCl5eXgoKCgpCZXN0IFJlZ2FyZHMsCkouIE5ldXNjaMOkZmVyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
