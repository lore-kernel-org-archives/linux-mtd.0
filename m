Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FD0D44171
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjxpGNPXU4uJQbFoGigTcz/gAAV62TGBSSkkji/v9Is=; b=tvZtgTDk36Ar6a
	HHJJ01y48f4f2V2RJiO4cHJen0Hwneyh1MvmV+hjkvLkWRmssQ8cJ+blsxDWNxU3oxy3JeBtVgVYa
	fTClshK/3yDpIrbBIdsaTgmRb6g0X0uLPhyssprLoPjuEqPVjNw/5917dovmvOXdrCO4UT6jc6ieq
	k54mE4fKgZu8WuMYq0GyjwS+BAVRqMBnUMirNThi94DN0cmIPn0L/9t+wgr6AOdClFD6rrUxnat07
	gVYU8NK1ZLWDpM8LYvn9cchRyrvSDGl9yxgrkxAb+tkitvbuNFh+MRb5r5uyAizQw3hDpPZNitnLZ
	PEDkcEL+WmGepWjDzbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhQ0-0000000EyQF-3MwR;
	Wed, 20 Nov 2024 09:54:40 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhOA-0000000Ey4c-18mK;
	Wed, 20 Nov 2024 09:52:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCCB60005;
	Wed, 20 Nov 2024 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732096361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjSe/U+nzv9GiQYKnA55TJmWIVaBLG17HklLuP9BQuo=;
	b=UMsqcLqizhfjcdodWKdRRxIHV/G24AKIsGNrdAAq4ZT9e/a9MVuhkV/AOZQ0kRe+iAF131
	xWlc7VGm++AIHwxvSi1cFpq8y3AfypDdpXPHg+R8zytnvRnc/lXI4CndJZ+clFyZkMNUkB
	K4rSmJ+GW3cgI/j0F0Ziev7Q82q8O/t9yiUr50dDIellFUW7jQcHAjB3R7E1NepRa1KImD
	zdXTwbQ4eOAIk2e9JAty7V91bo9Bvg3JKqBs7gJs9pV6bIjkqcrbzasIiMFj3N6nPUXPjS
	hwLeJt9Ro2U3gRa7a/vAyOWgyPSCxvuhhqafKFS9d0uH3b3+344AeSnRRue/Ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
  "michael@walle.cc" <michael@walle.cc>,  "broonie@kernel.org"
 <broonie@kernel.org>,  "pratyush@kernel.org" <pratyush@kernel.org>,
  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
  "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
  "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
  "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,  "Simek, Michal"
 <michal.simek@amd.com>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>,  "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>,  "git (AMD-Xilinx)" <git@amd.com>,
  "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
  "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
In-Reply-To: <IA0PR12MB76994483BBB757BD9F691513DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Tue, 19 Nov 2024 17:02:33 +0000")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
	<87frnoy8na.fsf@bootlin.com>
	<IA0PR12MB76994483BBB757BD9F691513DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 10:52:38 +0100
Message-ID: <87sermxme1.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_015246_738141_411C87EA 
X-CRM114-Status: GOOD (  14.79  )
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

T24gMTkvMTEvMjAyNCBhdCAxNzowMjozMyBHTVQsICJNYWhhcGF0cmEsIEFtaXQgS3VtYXIiIDxh
bWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKCj4gSGVsbG8gTWlxdWVsLAo+ICAK
Pj4gPiBUaGlzIGFwcHJvYWNoIHdhcyBzdWdnZXN0ZWQgYnkgUm9iIFsxXSBkdXJpbmcgYSBkaXNj
dXNzaW9uIG9uIE1pcXVlbCdzCj4+ID4gaW5pdGlhbCBhcHByb2FjaCBbMl0gdG8gZXh0ZW5kIHRo
ZSBNVEQtQ09OQ0FUIGRyaXZlciB0byBzdXBwb3J0Cj4+ID4gc3RhY2tlZCBtZW1vcmllcy4KPj4g
PiBEZWZpbmUgZWFjaCBmbGFzaCBub2RlIHNlcGFyYXRlbHkgd2l0aCBpdHMgcmVzcGVjdGl2ZSBw
YXJ0aXRpb25zLCBhbmQKPj4gPiBhZGQgYSAnY29uY2F0LXBhcnRzJyBiaW5kaW5nIHRvIGxpbmsg
dGhlIHBhcnRpdGlvbnMgb2YgdGhlIHR3byBmbGFzaAo+PiA+IG5vZGVzIHRoYXQgbmVlZCB0byBi
ZSBjb25jYXRlbmF0ZWQuCj4+ID4KPj4gPiBmbGFzaEAwIHsKPj4gPiAgICAgICAgIGNvbXBhdGli
bGUgPSAiamVkZWMsc3BpLW5vciIKPj4gPiAgICAgICAgIC4uLgo+PiA+ICAgICAgICAgICAgICAg
ICBwYXJ0aXRpb25zIHsKPj4gCj4+IFdyb25nIGluZGVudGF0aW9uIGhlcmUgYW5kIGJlbG93IHdo
aWNoIG1ha2VzIHRoZSBleGFtcGxlIGhhcmQgdG8gcmVhZC4KPgo+IFNvcnJ5IGFib3V0IHRoYXQu
IEkgYW0gcmVkZWZpbmluZyBib3RoIHRoZSBmbGFzaCBub2RlcyBoZXJlIHdpdGggcHJvcGVyIAo+
IGluZGVudGF0aW9uLgo+Cj4gZmxhc2hAMCB7Cj4gCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5v
ciIKPiAJLi4uCj4gCXBhcnRpdGlvbnMgewo+IAkJY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRp
b25zIjsKPiAJCWNvbmNhdC1wYXJ0aXRpb24gPSA8JmZsYXNoMF9wYXJ0aXRpb24gJmZsYXNoMV9w
YXJ0aXRpb24+Owo+IAkJCj4gCQlmbGFzaDBfcGFydGl0aW9uOiBwYXJ0aXRpb25AMCB7Cj4gCQkJ
bGFiZWwgPSAicGFydDBfMCI7Cj4gCQkJcmVnID0gPDB4MCAweDgwMDAwMD47Cj4gCQl9Owo+IAl9
Owo+IH07Cj4KPiBmbGFzaEAxIHsKPiAJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIgo+IAku
Li4KPiAJcGFydGl0aW9ucyB7Cj4gCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+
IAkJY29uY2F0LXBhcnRpdGlvbiA9IDwmZmxhc2gwX3BhcnRpdGlvbiAmZmxhc2gxX3BhcnRpdGlv
bj47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgCj4gCQlmbGFzaDFfcGFydGl0aW9uOiBwYXJ0
aXRpb25AMCB7Cj4gCQkJbGFiZWwgPSAicGFydDBfMSI7Cj4gCQkJcmVnID0gPDB4MCAweDgwMDAw
MD47Cj4gCQl9Owo+IAl9Owo+IH07Cj4KPj4gCj4+ID4gICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29u
Y2F0LXBhcnRpdGlvbiA9IDwmZmxhc2gwX3BhcnRpdGlvbiAmZmxhc2gxX3BhcnRpdGlvbj47Cj4+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgZmxhc2gwX3BhcnRpdGlvbjogcGFydGl0aW9uQDAg
ewo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAicGFydDBfMCI7
Cj4+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAw
PjsKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+ID4gICAgICAgICAgICAgICAgIH0K
Pj4gPiB9Cj4+ID4gZmxhc2hAMSB7Cj4+ID4gICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNw
aS1ub3IiCj4+ID4gICAgICAgICAuLi4KPj4gPiAgICAgICAgICAgICAgICAgcGFydGl0aW9ucyB7
Cj4+ID4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29uY2F0LXBhcnRpdGlvbiA9IDwmZmxhc2gwX3Bh
cnRpdGlvbiAmZmxhc2gxX3BhcnRpdGlvbj47Cj4+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
Zmxhc2gxX3BhcnRpdGlvbjogcGFydGl0aW9uQDAgewo+PiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGFiZWwgPSAicGFydDBfMSI7Cj4+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAwPjsKPj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4+ID4gICAgICAgICAgICAgICAgIH0KPj4gPiB9Cj4+IAo+PiBUaGlzIGFwcHJvYWNo
IGhhcyBhIGxpbWl0YXRpb24gSSBkaWRuJ3QgdGhpbmsgYWJvdXQgYmVmb3JlOiB5b3UgY2Fubm90
IHVzZSBhbnl0aGluZwo+PiBlbHNlIHRoYW4gZml4ZWQgcGFydGl0aW9ucyBhcyBwYXJ0aXRpb24g
cGFyc2VyLgo+Cj4gWWVzLCB0aGF0J3MgY29ycmVjdOKAlGl0IHdvbid0IGZ1bmN0aW9uIHdoZW4g
cGFydGl0aW9ucyBhcmUgZGVmaW5lZCB2aWEgdGhlIAo+IGNvbW1hbmQgbGluZS4gSW4gbXkgb3Bp
bmlvbiwgd2Ugc2hvdWxkIHN0YXJ0IGJ5IGFkZGluZyBzdXBwb3J0IGZvciBmaXhlZCAKPiBwYXJ0
aXRpb25zLCBhZGQgY29tbWVudHMgaW4gY29kZSBzdGF0aW5nIHRoZSBzYW1lLiBJZiBuZWVkZWQs
IHdlIGNhbiBsYXRlciAKPiBleHRlbmQgdGhlIHN1cHBvcnQgdG8gZHluYW1pYyBwYXJ0aXRpb25z
IGFzIHdlbGwuCgpOZXcgdGhvdWdodC4gV2hhdCBpZiBpdCB3YXMgYSBwdXJlIGZpeGVkLXBhcnRp
dGlvbiBjYXBhYmlsaXR5PyBUaGF0J3MKYWN0dWFsbHkgd2hhdCB3ZSB3YW50OiBkZWZpbmluZyBm
aXhlZCBwYXJ0aXRpb25zIHRocm91Z2ggZGV2aWNlCmJvdW5kYXJpZXMuIEl0IGF1dG9tYXRpY2Fs
bHkgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgZnVydGhlciBkeW5hbWljCnBhcnRpdGlvbiBleHRlbnNp
b25zLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
