Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A49C5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYIIoaIo77i8p9Q24fIfEUqNIl5K+6ivjJRdE0avBNE=; b=0NF6EVH9Elhxqo
	6y0mkDgWrPd79bcvciCT5vEBiHsZm9z9+6PcibvHhcOiDj7OwUNlWZahGjb/yGII7j9vyOiTN42tU
	JhC5RWc4fqUqzbIfmA8CRkqlZZU/vsTo7qBpoRGziCgU8X7FKzFMvWvYkifS/xvUr+r9NDEdSx64I
	uZf5jTFmh+RBtK4V6ukOvFmSkEFvsIz0+mv3UTWuLiGLyQdRWLs45cNwSiQdJfyhWqtPavoOgEkvO
	AjUEo8qjitHQnMygI936P30XvOVa7/nh9EheD78WRMwyvRF7xtgdf1Gi2Q84cbiTzovmtmMrrcVRl
	cJpRj1iAUkh+PgMkIHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcEc-00000004CyK-2KDy;
	Mon, 09 Jun 2025 13:08:18 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcEY-00000004Cxx-1VSu
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 13:08:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235ae05d224so37721985ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749474493; x=1750079293; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JasdH9sO7B39h3KaOqP1P5iFcVzbxD74IewCCIgfbQI=;
        b=aPn3vp1rrrDxvVRT0acIW0KG47l+OiRxNFvvTyVxBTiUHYNmnn0Xgk9vVAiNrYE8f4
         y8aJAke0PRvfMZ1VTAfrJS3JpK4yf8ib25BSETQ3xoDjtMsOu/4/Nn+ff7CigUqCgBaO
         oxQY6hR8uTPXiNZWrJzZ3juUYFWF+xXON1RHd8Il6YD3J9R6lQj1i/6amqWlkSh+TU5S
         5ygFWs2Hz4z+LNdMTOl7nwrFGgHqyiEH3DHyvtycIfSlMkzgAmd8eXArb2cYNCQovPo6
         bbsQS10U4z1BLzp/UNWr1xNe0mVUNjWboLe02ezny8K0Q9I3deHr2acksKi24SI7pdA5
         4q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474493; x=1750079293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JasdH9sO7B39h3KaOqP1P5iFcVzbxD74IewCCIgfbQI=;
        b=ciEJDBcmeF953VVPborRWfI8E0c1/+I1JeWAnfqahNeP870iD3r8bUmSXP6llXHXwN
         6Bwxl6mD67+2XWzBS8KCIzUGMEF2WSTNje1V20NKuwpcyI10ZTHA2yLfXAwGFRmyOma2
         M3kjeKYiNrxL0+xM7N2GkVM4M2+irnZZAPXu9C8JDPJCxhtgKbY39ug8+RcbMvOCTc96
         RIgy/gIYdYJEvscjQ92DKhm6347xjujD1WqcYIAvZwRWVvoOCZWsQfeo2gwdXutUSleh
         GP9LQtAHA9Mi8tfYJpuT1LQi6EcvzxySF7qpuoJ7HlG511yJuSHtQQ7eYwckItWfRZFd
         XtqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsDeeW2JPw3DU3uAePK20caBtqml+yLD2lEvjm21h37lB/cWJvBjDLrkpNLdBtgMq5UU/IPde6H5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWlr99asyzeI/HndsMoxgxEjtB461/QTOQXZ2EDO5FdvAgyIrB
	XHlrevaixfFhK67ILm2XPGUrRlb5maiKVl0AGeFE5EzDpu6zt/mS9jE5
X-Gm-Gg: ASbGnctgtmMS3Xz1VMxEF4U35g2tWRqGKd/he/WuyqsZ4LMm4FyROIm+rdy1cVPQhsZ
	9nY3+ETPdRhRqOWDqzg4fhClWMl7S9/n6c82yMuRsb0ZQPvz0iWuRi09tCwakdnzaNtkwybo72j
	fzrUePD/HE0HGrUT36r1EoFXCGuBAPKO693Xsn+caY00HhxfHGcsdimnoDk1j9wuG5mC0oRXR5G
	kBIboyWRRfxhHRKn2WAUNXg6PFZriHeiU0UfNMZFUxhhwtR1Csv3cWoiAXGRQDHcoeOjvQr0gKV
	RPQO4XyOTJb4u8jTJd48DRIr4HwpYOYY+7ySp/oc14TOyK0m1k0FkS+PweEzIoHFmEMHCCo13Sy
	/vXOiy+pfPBdH0SCr87VaLHTm
X-Google-Smtp-Source: AGHT+IGLPIg4M72EaZClfJ0131IzZTUL6Xj38FgV1hP3MoBxkpUgOKd78G/eggsj6YV2UxQmc/nLxQ==
X-Received: by 2002:a17:902:cec1:b0:235:efbb:9537 with SMTP id d9443c01a7336-236135d1d6dmr119962225ad.3.1749474493294;
        Mon, 09 Jun 2025 06:08:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f17be8sm5702200a91.3.2025.06.09.06.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 06:08:12 -0700 (PDT)
Message-ID: <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
Date: Mon, 9 Jun 2025 06:08:10 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_060814_405018_9AD84056 
X-CRM114-Status: GOOD (  18.89  )
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

T24gNi85LzI1IDA1OjIzLCBVc3lza2luLCBBbGV4YW5kZXIgd3JvdGU6Cj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMDEvMTFdIG10ZDogY29yZTogYWx3YXlzIGNyZWF0ZSBtYXN0ZXIgZGV2aWNl
Cj4+Cj4+Cj4+Pj4+PiBTZXZlcmFsIG9mIG15IHFlbXUgYm9vdCB0ZXN0cyBmYWlsIHRvIGJvb3Qg
ZnJvbSBtdGQgZGV2aWNlcyB3aXRoIHRoaXMKPj4gcGF0Y2gKPj4+Pj4+IGluIHRoZSBtYWlubGlu
ZSBrZXJuZWwuIFJldmVydGluZyBpdCBmaXhlcyB0aGUgcHJvYmxlbS4gQXMgZmFyIGFzIEkgY2Fu
Cj4+Pj4+PiBzZWUgdGhpcyBhZmZlY3RzIGNvbmZpZ3VyYXRpb25zIHdpdGgKPj4gQ09ORklHX01U
RF9QQVJUSVRJT05FRF9NQVNURVI9eQo+Pj4+Pj4gd2hlbgo+Pj4+Pj4gdHJ5aW5nIHRvIGJvb3Qg
ZnJvbSBhbiBtdGQgcGFydGl0aW9uIG90aGVyIHRoYW4gbXRkYmxvY2swLCB3aXRoIHRoZQo+Pj4+
Pj4gbXRkIHBhcnRpdGlvbiBkYXRhIGluIGRldmljZXRyZWUgKC4uLi9hc3BlZWQvb3BlbmJtYy1m
bGFzaC1sYXlvdXQuZHRzaSkuCj4+Pj4+PiBJcyB0aGVyZSBhIGd1aWRhbmNlIGRlc2NyaWJpbmcg
dGhlIGNoYW5nZWQgYmVoYXZpb3IsIGJ5IGFueSBjaGFuY2UsCj4+Pj4+PiBhbmQgaG93IHRoZSBi
b290IGNvbW1hbmQgbGluZSBub3cgbmVlZHMgdG8gbG9vayBsaWtlIHdoZW4gdXNpbmcgb25lCj4+
IG9mCj4+Pj4+PiB0aGUgZmxhc2ggcGFydGl0aW9ucyBhcyByb290IGZpbGUgc3lzdGVtID8KPj4+
Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+PiBHdWVudGVyCj4+Pj4+Cj4+Pj4+IEkndmUgdHJpZWQg
dG8gbWFrZSBpcyBhcyB0cmFuc3BhcmVudCBhcyBwb3NzaWJsZSBmb3IgdGhlIGV4aXN0aW5nIHVz
ZXJzLgo+Pj4+PiBPbmx5IGNoYW5nZSBpcyB0aGF0IG5vdyBldmVyeSBwYXJ0aXRpb24gaGFzIG1h
c3RlciB0aGF0IGlzIG5vdCBwYXJ0aXRpb25lZC4KPj4+Pj4gSXMgdGhlIENPTkZJR19NVERfUEFS
VElUSU9ORURfTUFTVEVSPW4gZml4ZWQgdGhlIHByb2JsZW0gZm9yIHlvdT8KPj4+PiBObyBjaGFu
Z2UgaXMgZXhwZWN0ZWQsIGNhbiB5b3UgcGxlYXNlIGRlc2NyaWJlIHRoZSBkZXZpY2VzIHRoYXQg
eW91Cj4+Pj4gb2JzZXJ2ZSB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaD8gTWF5YmUgdGhlcmUg
aXMgc29tZXRoaW5nIHdyb25nIGluCj4+Pj4gdGhlIGNvcmUgbG9naWMuCj4+Pj4KPj4+Cj4+PiBJ
IGFtIHRyeWluZyB0byBib290IHN1cGVybWljcm8teDExc3BpLWJtYyBpbiBxZW11IGZyb20gZmxh
c2ggcGFydGl0aW9uIDYuCj4+PiBUaGUgcWVtdSBjb21tYW5kIGxpbmUgaXMgc29tZXRoaW5nIGxp
a2UKPj4+Cj4+PiAgICAgIHFlbXUtc3lzdGVtLWFybSAtTSBzdXBlcm1pY3JvLXgxMXNwaS1ibWMs
Zm1jLQo+PiBtb2RlbD1uMjVxMjU2YTEzLHNwaS1tb2RlbD1uMjVxMjU2YTEzIFwKPj4+IAkta2Vy
bmVsIGFyY2gvYXJtL2Jvb3QvekltYWdlIC1uby1yZWJvb3QgLXNuYXBzaG90IFwKPj4+IAktYXVk
aW8gbm9uZSBcCj4+PiAJLWRyaXZlIGZpbGU9L3RtcC9mbGFzaCxmb3JtYXQ9cmF3LGlmPW10ZCxp
bmRleD0xIFwKPj4+IAktbmljIHVzZXIgXAo+Pj4gCS0tYXBwZW5kICJyb290PS9kZXYvbXRkYmxv
Y2s2IHJvb3R3YWl0IGNvbnNvbGU9dHR5UzQsMTE1MjAwCj4+IGVhcmx5Y29uPXVhcnQ4MjUwLG1t
aW8zMiwweDFlNzg0MDAwLDExNTIwMG44IiBcCj4+PiAJLWR0YiBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQvYXNwZWVkLWJtYy1zdXBlcm1pY3JvLXgxMXNwaS5kdGIKPj4gXAo+Pj4gCS1ub2dyYXBo
aWMgLW1vbml0b3IgbnVsbCAtc2VyaWFsIHN0ZGlvCj4+Pgo+Pj4gVGhpcyBpcyB3aXRoIGFzcGVl
ZF9nNV9kZWZjb25maWcuIE5vdGUgdGhhdCB0aGUgZmxhc2ggbW9kZWxzIG5lZWQgdG8gYmUKPj4g
c3BlY2lmaWVkLgo+Pj4gVGhlIGRlZmF1bHQgZmxhc2hlcyBhcmUgbm8gbG9uZ2VyIHJlY29nbml6
ZWQgd2hlbiBib290aW5nIGZyb20gcWVtdSBzaW5jZQo+PiBjb21taXQKPj4+IDk0N2M4NmU0ODFh
MCAoIm10ZDogc3BpLW5vcjogbWFjcm9uaXg6IERyb3AgdGhlIHJlZHVuZGFudCBmbGFzaCBpbmZv
Cj4+IGZpZWxkcyIpLgo+Pj4KPj4+IFRoZSBhYm92ZSBvbmx5IHdvcmtzIHdpdGggdGhpcyBwYXRj
aCByZXZlcnRlZCAob3Igd2l0aCB2Ni4xNSBhbmQgb2xkZXIsIG9mCj4+IGNvdXJzZSkuCj4+Pgo+
Pj4gR3VlbnRlcgo+Pgo+PiBBbGV4YW5kZXIsIGNhbiB5b3UgcGxlYXNlIGludmVzdGlnYXRlPyBX
ZSBuZWVkIGEgZml4IGJlY2F1c2UgR3VlbnRlcgo+PiBtaWdodCBub3QgYmUgdGhlIG9ubHkgYWZm
ZWN0ZXIgdXNlci4gT3RoZXJ3aXNlIHRoaXMgcGF0Y2ggY2FuJ3Qgc3RhbmQsCj4+IHVuZm9ydHVu
YXRlbHkuCj4+Cj4+IFRoYW5rcywKPj4gTWlxdcOobAo+IAo+IE1heWJlIHNvbWV0aGluZyBpcyBt
b3ZlZCwgYW5kIGl0IGlzIG5vdCAvZGV2L210ZGJsb2NrNiBub3cuCj4gCgpXaXRoIHRoaXMgcGF0
Y2g6CgojIGxzIC1sIC9kZXYvKm10ZCoKY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAg
ICAgOTAsICAgMCBKYW4gIDEgMDA6MDAgL2Rldi9tdGQwCmNydy0tLS0tLS0gICAgMSByb290ICAg
ICByb290ICAgICAgIDkwLCAgIDEgSmFuICAxIDAwOjAwIC9kZXYvbXRkMHJvCmNydy0tLS0tLS0g
ICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgIDIgSmFuICAxIDAwOjAwIC9kZXYvbXRkMQpj
cnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICAzIEphbiAgMSAwMDowMCAv
ZGV2L210ZDFybwpjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgIDI0NCwgICAwIEph
biAgMSAwMDowMCAvZGV2L210ZF9tYXN0ZXIwCmNydy0tLS0tLS0gICAgMSByb290ICAgICByb290
ICAgICAgMjQ0LCAgIDEgSmFuICAxIDAwOjAwIC9kZXYvbXRkX21hc3RlcjEKYnJ3LS0tLS0tLSAg
ICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEsICAgMCBKYW4gIDEgMDA6MDAgL2Rldi9tdGRibG9j
azAKYnJ3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEsICAgMSBKYW4gIDEgMDA6
MDAgL2Rldi9tdGRibG9jazEKfiAjIGxzIC9wcm9jL210ZAovcHJvYy9tdGQKfiAjIGNhdCAvcHJv
Yy9tdGQKZGV2OiAgICBzaXplICAgZXJhc2VzaXplICBuYW1lCm10ZDA6IDAyMDAwMDAwIDAwMDEw
MDAwICJibWMiCm10ZDE6IDAyMDAwMDAwIDAwMDEwMDAwICJwbm9yIgoKQWZ0ZXIgcmV2ZXJ0aW5n
IGl0OgoKIyBscyAtbCAvZGV2L210ZCoKY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAg
ICAgOTAsICAgMCBKYW4gIDEgMDA6MDAgL2Rldi9tdGQwCmNydy0tLS0tLS0gICAgMSByb290ICAg
ICByb290ICAgICAgIDkwLCAgIDEgSmFuICAxIDAwOjAwIC9kZXYvbXRkMHJvCmNydy0tLS0tLS0g
ICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgIDIgSmFuICAxIDAwOjAwIC9kZXYvbXRkMQpj
cnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICAzIEphbiAgMSAwMDowMCAv
ZGV2L210ZDFybwpjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICA0IEph
biAgMSAwMDowMCAvZGV2L210ZDIKY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAg
OTAsICAgNSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQycm8KY3J3LS0tLS0tLSAgICAxIHJvb3QgICAg
IHJvb3QgICAgICAgOTAsICAgNiBKYW4gIDEgMDA6MDAgL2Rldi9tdGQzCmNydy0tLS0tLS0gICAg
MSByb290ICAgICByb290ICAgICAgIDkwLCAgIDcgSmFuICAxIDAwOjAwIC9kZXYvbXRkM3JvCmNy
dy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgIDggSmFuICAxIDAwOjAwIC9k
ZXYvbXRkNApjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICA5IEphbiAg
MSAwMDowMCAvZGV2L210ZDRybwpjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5
MCwgIDEwIEphbiAgMSAwMDowMCAvZGV2L210ZDUKY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJv
b3QgICAgICAgOTAsICAxMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQ1cm8KY3J3LS0tLS0tLSAgICAx
IHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAxMiBKYW4gIDEgMDA6MDAgL2Rldi9tdGQ2CmNydy0t
LS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgMTMgSmFuICAxIDAwOjAwIC9kZXYv
bXRkNnJvCmJydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDAgSmFuICAx
IDAwOjAwIC9kZXYvbXRkYmxvY2swCmJydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAg
IDMxLCAgIDEgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2sxCmJydy0tLS0tLS0gICAgMSByb290
ICAgICByb290ICAgICAgIDMxLCAgIDIgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2syCmJydy0t
LS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDMgSmFuICAxIDAwOjAwIC9kZXYv
bXRkYmxvY2szCmJydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDMxLCAgIDQgSmFu
ICAxIDAwOjAwIC9kZXYvbXRkYmxvY2s0CmJydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAg
ICAgIDMxLCAgIDUgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2s1CmJydy0tLS0tLS0gICAgMSBy
b290ICAgICByb290ICAgICAgIDMxLCAgIDYgSmFuICAxIDAwOjAwIC9kZXYvbXRkYmxvY2s2Cn4g
IyBjYXQgL3Byb2MvbXRkCmRldjogICAgc2l6ZSAgIGVyYXNlc2l6ZSAgbmFtZQptdGQwOiAwMjAw
MDAwMCAwMDAxMDAwMCAiYm1jIgptdGQxOiAwMDA2MDAwMCAwMDAxMDAwMCAidS1ib290IgptdGQy
OiAwMDAyMDAwMCAwMDAxMDAwMCAidS1ib290LWVudiIKbXRkMzogMDA0NDAwMDAgMDAwMTAwMDAg
Imtlcm5lbCIKbXRkNDogMDE3NDAwMDAgMDAwMTAwMDAgInJvZnMiCm10ZDU6IDAwNDAwMDAwIDAw
MDEwMDAwICJyd2ZzIgptdGQ2OiAwMjAwMDAwMCAwMDAxMDAwMCAicG5vciIKCkkgYW0gdHJ5aW5n
IHRvIGJvb3QgZnJvbSAicG5vciIuIEl0IGxvb2tzIGxpa2UgdGhlIHBhcnRpdGlvbiBkYXRhIChm
cm9tIGRldmljZXRyZWUpCmlzIG5vdyBpZ25vcmVkLiBtdGRibG9jazYgdXNlZCB0byBiZSB0aGUg
c2Vjb25kIGZsYXNoLgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
