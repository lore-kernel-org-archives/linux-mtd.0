Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4019C678DA
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NMjr0o6dN/BSqfmCc4ElUKT6jXWdHHf4/VzOxGI8YM=; b=XrrGfNf2dvLXSg
	Qa5XxF2q1TZMvLfT8vok5Mvu/mNPJIVNqSqa9NbS5XTg7Sj95F+4b0gQrepbWkzdapWfHy9cuzIPU
	BWPS9xB4j7K3y0VP/WzIU8LfskUtf6JSW3n2VxU4ZYRJ2kg0+wPtzjskPIcThqLDDJ6xZtnxcJiU3
	zUgqVlbezO0rpPQS07mQB3O4kUDrTYOHplJ08ua3kTldspb4KqRB34UDGwuOmQd6MmGMRwReMTybA
	KKf/hQ6C4Wd2iqqnUwQ2uEz7jKPvHmif4BlfiBbmm6r4Xh1XNeXWL8tp0BRJWhyzip8BGh3BFC3NR
	9Y0BFqFiBmnAGOTo1Igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfRF-00000004gOv-3l6F;
	Mon, 09 Jun 2025 16:33:33 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeo7-00000004aEJ-3qEx
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 15:53:08 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so2981997a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749484387; x=1750089187; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9k5+Ykngl8b7HVjIc8RfX/THRGAxyweF7cixLGl/oLQ=;
        b=SWXiaNttaWfZePqibd2g/OMJMZ+Ojmr1Z4d/BKPDXQWkKc3vf8uYg7OTKYPxwYjStd
         8WwmF0BUJVUoo1p88PVP0b4NJbEQ00JGKnfWXswr7ZnjbPpxctd2OWkISgxp3zPVnDUK
         +0SMuFM7yIj5TgNka4pd+v95uxO23F9idVGpYtnPd8BNJGUc9kwjQdDCtDGrPtQtxyaW
         NVHdTm+METJ/KmOSOyLfB4AYFdtws9fC+2hYVccY+MruJEULNJmxaSStLwZWo4Skgdy9
         393fM3tqz2zH5fdPDPdrG7eD0yCflsd5cQ0I74+RvkeR3IVP0+RSGu0UCkz20vZQ8YCe
         g9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484387; x=1750089187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9k5+Ykngl8b7HVjIc8RfX/THRGAxyweF7cixLGl/oLQ=;
        b=QZyJgl1SZKrydJ4d6AzLDY9UdFKW4lFYXrq8qtMdTfBNr7rsSTSD6RPGPrEf112F3W
         x8LW3y4k8GnRbYQhEFWJ0V/hk2ca2bXOZ5I6kW/o7w8JYHdmh3rXo42/r7OnN+z0JFnu
         ziZRdkmT4bNYz81f4yfwcJz2n+CtVpoIAoAx9lmK0EmT/rK1AlOWRNWDjd/Ie2Jv2h+L
         8xlGu33tw08MlzS2LmYjNRvZ3qx5YEepaQVWehmokgYP7R5qsy9SDJnb3WK/+IlCqbBx
         lXzggrpV6mivWR2ygwBvyKIFsDF08XBcIFTegibK8sjAXURaMsuXzWdVh0oL48dC16tc
         e/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWLtvoATEqpOAvd04jtMpLsWrUf6G+kGaar4J4FdjuHziPdpLHLhTmNr7cWAcI1Cu9rSr6x9e3/zeM=@lists.infradead.org
X-Gm-Message-State: AOJu0YypEEEcaORz90NcnVlVwUmAQqe+O87+3X9X/FdwLvuFis3mAkll
	FL8sLQxVmCmMWU3lYhHVxn6XDpHBX5UYk8tWUJp5iBfAJUdYZBNwCrV4
X-Gm-Gg: ASbGncsTY9L1Up6pd3gLxvhCYrGcbD/Bv+9m6Bb6Gt9RkflwNLgHQ5OMRvjQTCBa3qC
	3dXihg095VZyT5AZlv164dENdUXYDz8ooatpB8xlViRXHDekmpsDXIOlD/3ropdu+1BQSp9ElJn
	w76uw8lifPixltKmYxlTTysb5x0NAjtMWkXUWZkBu/sqgIbS6KjeTm1IzDraZ3xuA8jAMzTqp2u
	g8PUR0nmoh3iulFsW1+lIIchrdhlvCxObfwjTp+0PlFPo2ShvP8Mt+5/aDrJiXCWIEtw0asChvE
	kEaa4c9xTsk+TcHu1uNpebi1zCa90jBZ6A3qYvz3GZwCoxsHLc1szeAjvfCny4rCWOXpgc//kPC
	jCLnf1NLdpW0vdtmn41oZzDofZt7ZUVZfK9U=
X-Google-Smtp-Source: AGHT+IHn6XGqRb0r+PScKvY1/LXjodqC4uuhJh/N8+E16Q0KZPbEdLymBASG89/eXT0jhBGc4IFnsQ==
X-Received: by 2002:a05:6a21:6009:b0:21c:fa68:b47c with SMTP id adf61e73a8af0-21ee25b3bb4mr21289655637.18.1749484386972;
        Mon, 09 Jun 2025 08:53:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f66a88dsm5448241a12.40.2025.06.09.08.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:53:06 -0700 (PDT)
Message-ID: <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
Date: Mon, 9 Jun 2025 08:53:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_085307_958488_E6417809 
X-CRM114-Status: GOOD (  25.15  )
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

T24gNi85LzI1IDA4OjE2LCBVc3lza2luLCBBbGV4YW5kZXIgd3JvdGU6Cj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMDEvMTFdIG10ZDogY29yZTogYWx3YXlzIGNyZWF0ZSBtYXN0ZXIgZGV2aWNl
Cj4+Cj4+IE9uIDYvOS8yNSAwNToyMywgVXN5c2tpbiwgQWxleGFuZGVyIHdyb3RlOgo+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDEvMTFdIG10ZDogY29yZTogYWx3YXlzIGNyZWF0ZSBtYXN0
ZXIgZGV2aWNlCj4+Pj4KPj4+Pgo+Pj4+Pj4+PiBTZXZlcmFsIG9mIG15IHFlbXUgYm9vdCB0ZXN0
cyBmYWlsIHRvIGJvb3QgZnJvbSBtdGQgZGV2aWNlcyB3aXRoIHRoaXMKPj4+PiBwYXRjaAo+Pj4+
Pj4+PiBpbiB0aGUgbWFpbmxpbmUga2VybmVsLiBSZXZlcnRpbmcgaXQgZml4ZXMgdGhlIHByb2Js
ZW0uIEFzIGZhciBhcyBJIGNhbgo+Pj4+Pj4+PiBzZWUgdGhpcyBhZmZlY3RzIGNvbmZpZ3VyYXRp
b25zIHdpdGgKPj4+PiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj15Cj4+Pj4+Pj4+IHdo
ZW4KPj4+Pj4+Pj4gdHJ5aW5nIHRvIGJvb3QgZnJvbSBhbiBtdGQgcGFydGl0aW9uIG90aGVyIHRo
YW4gbXRkYmxvY2swLCB3aXRoIHRoZQo+Pj4+Pj4+PiBtdGQgcGFydGl0aW9uIGRhdGEgaW4gZGV2
aWNldHJlZSAoLi4uL2FzcGVlZC9vcGVuYm1jLWZsYXNoLQo+PiBsYXlvdXQuZHRzaSkuCj4+Pj4+
Pj4+IElzIHRoZXJlIGEgZ3VpZGFuY2UgZGVzY3JpYmluZyB0aGUgY2hhbmdlZCBiZWhhdmlvciwg
YnkgYW55IGNoYW5jZSwKPj4+Pj4+Pj4gYW5kIGhvdyB0aGUgYm9vdCBjb21tYW5kIGxpbmUgbm93
IG5lZWRzIHRvIGxvb2sgbGlrZSB3aGVuIHVzaW5nCj4+IG9uZQo+Pj4+IG9mCj4+Pj4+Pj4+IHRo
ZSBmbGFzaCBwYXJ0aXRpb25zIGFzIHJvb3QgZmlsZSBzeXN0ZW0gPwo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBUaGFua3MsCj4+Pj4+Pj4+IEd1ZW50ZXIKPj4+Pj4+Pgo+Pj4+Pj4+IEkndmUgdHJpZWQgdG8g
bWFrZSBpcyBhcyB0cmFuc3BhcmVudCBhcyBwb3NzaWJsZSBmb3IgdGhlIGV4aXN0aW5nIHVzZXJz
Lgo+Pj4+Pj4+IE9ubHkgY2hhbmdlIGlzIHRoYXQgbm93IGV2ZXJ5IHBhcnRpdGlvbiBoYXMgbWFz
dGVyIHRoYXQgaXMgbm90Cj4+IHBhcnRpdGlvbmVkLgo+Pj4+Pj4+IElzIHRoZSBDT05GSUdfTVRE
X1BBUlRJVElPTkVEX01BU1RFUj1uIGZpeGVkIHRoZSBwcm9ibGVtIGZvcgo+PiB5b3U/Cj4+Pj4+
PiBObyBjaGFuZ2UgaXMgZXhwZWN0ZWQsIGNhbiB5b3UgcGxlYXNlIGRlc2NyaWJlIHRoZSBkZXZp
Y2VzIHRoYXQgeW91Cj4+Pj4+PiBvYnNlcnZlIHdpdGggYW5kIHdpdGhvdXQgdGhlIHBhdGNoPyBN
YXliZSB0aGVyZSBpcyBzb21ldGhpbmcgd3JvbmcgaW4KPj4+Pj4+IHRoZSBjb3JlIGxvZ2ljLgo+
Pj4+Pj4KPj4+Pj4KPj4+Pj4gSSBhbSB0cnlpbmcgdG8gYm9vdCBzdXBlcm1pY3JvLXgxMXNwaS1i
bWMgaW4gcWVtdSBmcm9tIGZsYXNoIHBhcnRpdGlvbiA2Lgo+Pj4+PiBUaGUgcWVtdSBjb21tYW5k
IGxpbmUgaXMgc29tZXRoaW5nIGxpa2UKPj4+Pj4KPj4+Pj4gICAgICAgcWVtdS1zeXN0ZW0tYXJt
IC1NIHN1cGVybWljcm8teDExc3BpLWJtYyxmbWMtCj4+Pj4gbW9kZWw9bjI1cTI1NmExMyxzcGkt
bW9kZWw9bjI1cTI1NmExMyBcCj4+Pj4+IAkta2VybmVsIGFyY2gvYXJtL2Jvb3QvekltYWdlIC1u
by1yZWJvb3QgLXNuYXBzaG90IFwKPj4+Pj4gCS1hdWRpbyBub25lIFwKPj4+Pj4gCS1kcml2ZSBm
aWxlPS90bXAvZmxhc2gsZm9ybWF0PXJhdyxpZj1tdGQsaW5kZXg9MSBcCj4+Pj4+IAktbmljIHVz
ZXIgXAo+Pj4+PiAJLS1hcHBlbmQgInJvb3Q9L2Rldi9tdGRibG9jazYgcm9vdHdhaXQgY29uc29s
ZT10dHlTNCwxMTUyMDAKPj4+PiBlYXJseWNvbj11YXJ0ODI1MCxtbWlvMzIsMHgxZTc4NDAwMCwx
MTUyMDBuOCIgXAo+Pj4+PiAJLWR0YiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWJt
Yy1zdXBlcm1pY3JvLXgxMXNwaS5kdGIKPj4+PiBcCj4+Pj4+IAktbm9ncmFwaGljIC1tb25pdG9y
IG51bGwgLXNlcmlhbCBzdGRpbwo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIHdpdGggYXNwZWVkX2c1X2Rl
ZmNvbmZpZy4gTm90ZSB0aGF0IHRoZSBmbGFzaCBtb2RlbHMgbmVlZCB0byBiZQo+Pj4+IHNwZWNp
ZmllZC4KPj4+Pj4gVGhlIGRlZmF1bHQgZmxhc2hlcyBhcmUgbm8gbG9uZ2VyIHJlY29nbml6ZWQg
d2hlbiBib290aW5nIGZyb20gcWVtdQo+PiBzaW5jZQo+Pj4+IGNvbW1pdAo+Pj4+PiA5NDdjODZl
NDgxYTAgKCJtdGQ6IHNwaS1ub3I6IG1hY3Jvbml4OiBEcm9wIHRoZSByZWR1bmRhbnQgZmxhc2gg
aW5mbwo+Pj4+IGZpZWxkcyIpLgo+Pj4+Pgo+Pj4+PiBUaGUgYWJvdmUgb25seSB3b3JrcyB3aXRo
IHRoaXMgcGF0Y2ggcmV2ZXJ0ZWQgKG9yIHdpdGggdjYuMTUgYW5kIG9sZGVyLCBvZgo+Pj4+IGNv
dXJzZSkuCj4+Pj4+Cj4+Pj4+IEd1ZW50ZXIKPj4+Pgo+Pj4+IEFsZXhhbmRlciwgY2FuIHlvdSBw
bGVhc2UgaW52ZXN0aWdhdGU/IFdlIG5lZWQgYSBmaXggYmVjYXVzZSBHdWVudGVyCj4+Pj4gbWln
aHQgbm90IGJlIHRoZSBvbmx5IGFmZmVjdGVyIHVzZXIuIE90aGVyd2lzZSB0aGlzIHBhdGNoIGNh
bid0IHN0YW5kLAo+Pj4+IHVuZm9ydHVuYXRlbHkuCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTWlx
dcOobAo+Pj4KPj4+IE1heWJlIHNvbWV0aGluZyBpcyBtb3ZlZCwgYW5kIGl0IGlzIG5vdCAvZGV2
L210ZGJsb2NrNiBub3cuCj4+Pgo+Pgo+PiBXaXRoIHRoaXMgcGF0Y2g6Cj4+Cj4+ICMgbHMgLWwg
L2Rldi8qbXRkKgo+PiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICAw
IEphbiAgMSAwMDowMCAvZGV2L210ZDAKPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3Qg
ICAgICAgOTAsICAgMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQwcm8KPj4gY3J3LS0tLS0tLSAgICAx
IHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAgMiBKYW4gIDEgMDA6MDAgL2Rldi9tdGQxCj4+IGNy
dy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgIDMgSmFuICAxIDAwOjAwIC9k
ZXYvbXRkMXJvCj4+IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgMjQ0LCAgIDAg
SmFuICAxIDAwOjAwIC9kZXYvbXRkX21hc3RlcjAKPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAg
IHJvb3QgICAgICAyNDQsICAgMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGRfbWFzdGVyMQo+PiBicnct
LS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAzMSwgICAwIEphbiAgMSAwMDowMCAvZGV2
L210ZGJsb2NrMAo+PiBicnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAzMSwgICAx
IEphbiAgMSAwMDowMCAvZGV2L210ZGJsb2NrMQo+PiB+ICMgbHMgL3Byb2MvbXRkCj4+IC9wcm9j
L210ZAo+PiB+ICMgY2F0IC9wcm9jL210ZAo+PiBkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5h
bWUKPj4gbXRkMDogMDIwMDAwMDAgMDAwMTAwMDAgImJtYyIKPj4gbXRkMTogMDIwMDAwMDAgMDAw
MTAwMDAgInBub3IiCj4+Cj4+IEFmdGVyIHJldmVydGluZyBpdDoKPj4KPj4gIyBscyAtbCAvZGV2
L210ZCoKPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAgMCBKYW4g
IDEgMDA6MDAgL2Rldi9tdGQwCj4+IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAg
IDkwLCAgIDEgSmFuICAxIDAwOjAwIC9kZXYvbXRkMHJvCj4+IGNydy0tLS0tLS0gICAgMSByb290
ICAgICByb290ICAgICAgIDkwLCAgIDIgSmFuICAxIDAwOjAwIC9kZXYvbXRkMQo+PiBjcnctLS0t
LS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICAzIEphbiAgMSAwMDowMCAvZGV2L210
ZDFybwo+PiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICA0IEphbiAg
MSAwMDowMCAvZGV2L210ZDIKPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAg
OTAsICAgNSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQycm8KPj4gY3J3LS0tLS0tLSAgICAxIHJvb3Qg
ICAgIHJvb3QgICAgICAgOTAsICAgNiBKYW4gIDEgMDA6MDAgL2Rldi9tdGQzCj4+IGNydy0tLS0t
LS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgIDcgSmFuICAxIDAwOjAwIC9kZXYvbXRk
M3JvCj4+IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgIDggSmFuICAx
IDAwOjAwIC9kZXYvbXRkNAo+PiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5
MCwgICA5IEphbiAgMSAwMDowMCAvZGV2L210ZDRybwo+PiBjcnctLS0tLS0tICAgIDEgcm9vdCAg
ICAgcm9vdCAgICAgICA5MCwgIDEwIEphbiAgMSAwMDowMCAvZGV2L210ZDUKPj4gY3J3LS0tLS0t
LSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAxMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQ1
cm8KPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAxMiBKYW4gIDEg
MDA6MDAgL2Rldi9tdGQ2Cj4+IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkw
LCAgMTMgSmFuICAxIDAwOjAwIC9kZXYvbXRkNnJvCj4+IGJydy0tLS0tLS0gICAgMSByb290ICAg
ICByb290ICAgICAgIDMxLCAgIDAgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2swCj4+IGJydy0t
LS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDEgSmFuICAxIDAwOjAwIC9kZXYv
bXRkYmxvY2sxCj4+IGJydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDIg
SmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2syCj4+IGJydy0tLS0tLS0gICAgMSByb290ICAgICBy
b290ICAgICAgIDMxLCAgIDMgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2szCj4+IGJydy0tLS0t
LS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDQgSmFuICAxIDAwOjAwIC9kZXYvbXRk
YmxvY2s0Cj4+IGJydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDUgSmFu
ICAxIDAwOjAwIC9kZXYvbXRkYmxvY2s1Cj4+IGJydy0tLS0tLS0gICAgMSByb290ICAgICByb290
ICAgICAgIDMxLCAgIDYgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2s2Cj4+IH4gIyBjYXQgL3By
b2MvbXRkCj4+IGRldjogICAgc2l6ZSAgIGVyYXNlc2l6ZSAgbmFtZQo+PiBtdGQwOiAwMjAwMDAw
MCAwMDAxMDAwMCAiYm1jIgo+PiBtdGQxOiAwMDA2MDAwMCAwMDAxMDAwMCAidS1ib290Igo+PiBt
dGQyOiAwMDAyMDAwMCAwMDAxMDAwMCAidS1ib290LWVudiIKPj4gbXRkMzogMDA0NDAwMDAgMDAw
MTAwMDAgImtlcm5lbCIKPj4gbXRkNDogMDE3NDAwMDAgMDAwMTAwMDAgInJvZnMiCj4+IG10ZDU6
IDAwNDAwMDAwIDAwMDEwMDAwICJyd2ZzIgo+PiBtdGQ2OiAwMjAwMDAwMCAwMDAxMDAwMCAicG5v
ciIKPj4KPj4gSSBhbSB0cnlpbmcgdG8gYm9vdCBmcm9tICJwbm9yIi4gSXQgbG9va3MgbGlrZSB0
aGUgcGFydGl0aW9uIGRhdGEgKGZyb20KPj4gZGV2aWNldHJlZSkKPj4gaXMgbm93IGlnbm9yZWQu
IG10ZGJsb2NrNiB1c2VkIHRvIGJlIHRoZSBzZWNvbmQgZmxhc2guCj4+Cj4+IEd1ZW50ZXIKPiAK
PiBJcyB0aGlzIHdpdGggQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI/Cj4gCgpZZXMKCj4g
SSB0aGluayB0aGF0IG10ZF9pc19wYXJ0aXRpb24gaXMgYW1iaWd1b3VzIG5vdy4KPiBXZSBhbHdh
eXMgaGF2ZSBtYXN0ZXIgcGFydGl0aW9uIHdoZW4gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNU
RVIKPiBpcyBlbmFibGVkIGFuZCBwYXJlbnQgY2hlY2sgaXMgdXNlbGVzcy4KPiBXZSBtdXN0IGNo
ZWNrIGdyYW5kcGFyZW50IGluIHRoaXMgY2FzZS4KPiBNaXF1ZWwsIGFtIEkgcmlnaHQ/Cj4gCj4g
V2UgY2FuIHJldHVybiB0byBvbGRlciBwYXRjaCB2ZXJzaW9uIHRoYXQgaGF2ZSBjcmVhdGVkIHBh
cnRpdGlvbgo+IGluc3RlYWQgb2YgdGhlIG1hc3RlciBkZXZpY2UuCj4gT3IgdHJ5IHRvIGZpeCBt
dGRfaXNfcGFydGl0aW9uLCBsaWtlIGJlbG93Lgo+IEd1ZW50ZXIsIGlzIGJlbG93IHBhdGNoIGhl
bHBzPwo+IApObywgaXQgZG9lcyBub3QgbWFrZSBhIGRpZmZlcmVuY2UuIFBhcnRpdGlvbnMgYXJl
IHN0aWxsIG5vdCBjcmVhdGVkLgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
