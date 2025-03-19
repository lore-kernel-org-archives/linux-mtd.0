Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09749C35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ff0LgBysps83cp3qmOmIKdv08EK7F9jUAfVk+RaH/s=; b=Td0HJuFwZszaia
	hVAjJ79vXFhIbWBjKJR+OJQ7bwi8jNM+wLZkruRjuRe1W+YvYPd5lix7MqIz/oiiIVN1HjBlHz8IV
	1Hy1ltKa6IOPd2a19fza9mkLKkEkvCWQGmN+j6AB/DGeNeSoqOFdvXYOFXungrDFZuF/q1Kld1DcX
	L1KqqnXCw5kR2IBAI14PRAapR7JXnBKZvOBH1XgMopTImpQ9errhTr00gjDUpdEfUXfOTQgWh8cM/
	QE9NKnWwD8zKDX90aXZSHyFbLAAZUxE0w53hhhYuAMdCCz4/cL8US1vwP/H8FkoCZSKP7QZFmriaR
	bJe3/eJnMT/YSgINDgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuogU-00000008KNq-1dlQ;
	Wed, 19 Mar 2025 08:21:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuofz-00000008KJz-3Sr1
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 08:21:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8599843214;
	Wed, 19 Mar 2025 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742372480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+li3VJN1jkxERZLWTNPHaOMZTpe2H6m5wVIrNKLoMY=;
	b=jq/0SFTbB0DqTIk6jgz9+JIMiRX2v42uordG7LZrw21p1NT989w+Ad2jwL7bOVHGxAiKUE
	lZpDSgfXar49+B+qcp3zOgyDv2ND9ccISl9nhB5mdUGemRgPmiwUDCNgkIktUFDAlsj/oj
	xhdCy4KnUw6kImhvObGjpv/sUjYFLl3ZrESr828HFSC9/HKD6jGvJm+saGv7kNPUFFMXCc
	681QqfiQ78h+el8TYnR9gAr+EvT/4RoWoGkyF1bfrAV68zweAXXEoKEzh58CTVp/W3K1B+
	lPKvblwiQXKdE5l/vkJk0cmdgCfDUAp9KIocRKNlG+V1todppirSuOjiGpYawg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  "git
 (AMD-Xilinx)" <git@amd.com>,  "amitrkcian2002@gmail.com"
 <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <IA0PR12MB769956849D2B41827F0B5B53DCD92@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Wed, 19 Mar 2025 06:17:50 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB769956849D2B41827F0B5B53DCD92@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Mar 2025 09:21:19 +0100
Message-ID: <87h63p5t34.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeegkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeeftdefledvieegvdejlefgleegjefhgfeuleevgfdtjeehudffhedvheegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_012124_513013_6DFEC0C8 
X-CRM114-Status: GOOD (  15.35  )
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

T24gMTkvMDMvMjAyNSBhdCAwNjoxNzo1MCBHTVQsICJNYWhhcGF0cmEsIEFtaXQgS3VtYXIiIDxh
bWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKCj4gW0FNRCBPZmZpY2lhbCBVc2Ug
T25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KPgo+IEhlbGxvIE1pcXVlbCwK
Pgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxOCwgMjAy
NSA5OjIzIFBNCj4+IFRvOiBNYWhhcGF0cmEsIEFtaXQgS3VtYXIgPGFtaXQua3VtYXItbWFoYXBh
dHJhQGFtZC5jb20+Cj4+IENjOiByaWNoYXJkQG5vZC5hdDsgdmlnbmVzaHJAdGkuY29tOyByb2Jo
QGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsKPj4gY29ub3IrZHRAa2VybmVsLm9yZzsg
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
Owo+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBnaXQgKEFNRC1YaWxpbngpIDxnaXRA
YW1kLmNvbT47Cj4+IGFtaXRya2NpYW4yMDAyQGdtYWlsLmNvbTsgQmVybmhhcmQgRnJhdWVuZGll
bnN0IDxrZXJuZWxAbm9zcGFtLm9iZWxpa3MuZGU+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEy
IDMvM10gbXRkOiBBZGQgZHJpdmVyIGZvciBjb25jYXRlbmF0aW5nIGRldmljZXMKPj4KPj4gT24g
MDUvMDIvMjAyNSBhdCAxOTowNzozMCArMDUzMCwgQW1pdCBLdW1hciBNYWhhcGF0cmEgPGFtaXQu
a3VtYXItCj4+IG1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKPj4KPj4gPiBJbnRyb2R1Y2luZyBD
T05GSUdfVklSVF9DT05DQVQgdG8gc2VwYXJhdGUgdGhlIGxlZ2FjeSBmbG93IGZyb20gdGhlCj4+
ID4gbmV3Cj4+Cj4+IENPTkZJR19NVERfVklSVF9DT05DQVQKPj4KPj4gPiBhcHByb2FjaCwgd2hl
cmUgaW5kaXZpZHVhbCBwYXJ0aXRpb25zIHdpdGhpbiBhIGNvbmNhdGVuYXRlZCBwYXJ0aXRpb24K
Pj4gPiBhcmUgbm90IHJlZ2lzdGVyZWQsIGFzIHRoZXkgYXJlIGxpa2VseSBub3QgbmVlZGVkIGJ5
IHRoZSB1c2VyLgo+Pgo+PiBJIGFtIG5vdCBhIGJpZyBmYW4gb2YgdGhpcyBjaG9pY2UuIFdlIGhh
ZCBpc3N1ZXMgd2l0aCBoaWRpbmcgdGhpbmdzIHRvIHRoZSB1c2VyIGluIHRoZQo+PiBmaXJzdCBw
bGFjZS4gQ291bGQgd2UgZmluZCBhIHdheSB0byBleHBvc2UgYm90aCB0aGUgb3JpZ2luYWwgbXRk
IGRldmljZXMgYXMgd2VsbCBhcwo+PiB0aGUgdmlydHVhbGx5IGNvbmNhdGVuYXRlZCBwYXJ0aXRp
b25zPwo+Cj4gU3VyZSwgSSB0aGluayB0aGF0IGNhbiBiZSBkb25lLCBidXQgSSB0b29rIHRoaXMg
YXBwcm9hY2ggdG8gaGlkZSB0aGUKPiBvcmlnaW5hbCBkZXZpY2VzIGJlY2F1c2UgQm9yaXMgbWVu
dGlvbmVkIGluIFsxXSB0aGF0IHdlIGFyZSBjcmVhdGluZwo+IHRoZSBvcmlnaW5hbCBwYXJ0aXRp
b25zIGV2ZW4gdGhvdWdoIHRoZSB1c2VyIHByb2JhYmx5IGRvZXNuJ3QgbmVlZAo+IHRoZW0uIEkg
YmVsaWV2ZSBoZSBpcyByaWdodCwgYXMgSSBjYW4ndCB0aGluayBvZiBhbnkgdXNlIGNhc2Ugd2hl
cmUKPiB0aGUgdXNlciB3b3VsZCByZXF1aXJlIHRoZSBpbmRpdmlkdWFsIGRldmljZXMgaW5zdGVh
ZCBvZiB0aGUKPiBjb25jYXRlbmF0ZWQgZGV2aWNlLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8yMDE5MTIwOTExMzUwNi40MTM0MWVkNEBjb2xsYWJvcmEuY29tLwoK
SGUgd2FzIHN1Z2dlc3Rpbmcgbm90IHRvIGNyZWF0ZSB0aGUgaW50ZXJtZWRpYXRlIHBhcnRpdGlv
bnMsIGFuZCBJIGFncmVlCml0IGlzIG5vdCBzdXBlciByZWxldmFudCwgYnV0IHRoZSBmbGFzaCBk
ZXZpY2VzIHRoZW1zZWx2ZXMgYXJlIHJlbGV2YW50LgoKSW4gdGhpcyBleGFtcGxlOgoKY29uY2F0
ZW5hdGUgPSA8JnBhcnQyPiwgPCZwYXJ0Mz47CgpmbGFzaEAwIHsKICAgICAgICBwYXJ0MSB7IH0K
ICAgICAgICBwYXJ0MiB7IH0KfTsKCmZsYXNoQDAgewogICAgICAgIHBhcnQzIHsgfQogICAgICAg
IHBhcnQ0IHsgfQp9OwoKcGFydDEsIHBhcnQyLCBwYXJ0MywgcGFydDQgYXJlIHBhcnRpdGlvbnMs
IGF0IGxlYXN0IHBhcnQxIGFuZCBwYXJ0NApzaG91bGQgYXBwZWFyIGxpa2UgbXRkIGRldmljZXMu
CkJvcmlzIHdhcyBzdWdnZXN0aW5nIHRvIG5vdCBleHBvc2UgcGFydDIgYW5kIHBhcnQzIGluZGl2
aWR1YWxseSB3aGVuCmNvbmNhdGVuYXRpbmcgdGhlbSwgSSdtIGZpbmUgd2l0aCB0aGF0LgoKV2hh
dCBJIGFtIHNheWluZywgaXMgdGhhdCBmbGFzaEAwIGFuZCBmbGFzaEAxIHNoYWxsIGJlIHJlcHJl
c2VudGVkIGJ5CnR3byBtdGQgZGV2aWNlcyBhbmQgbm90IGhpZGRlbi9za2lwcGVkLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
