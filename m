Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3087BC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:06:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DFC2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9RuAMYD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="FO3qqrMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3DFC2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k1gkis+voibxveIwaLGHWf3bcr0fOQVlajKVUtkz0ME=; b=l9RuAMYDFkmuTQ464lT2HGU2u
	Tl/Ab2ZetpA5icopf2gjSbr95F/QpIxcIhbv6NXQBOsxoBorM5RWF+gey5H4UDa59U2fPktF/AXYo
	p0m/P0a5uBPzhiFi17USBn1QLEyTKidmnUS8bsn7QEJ8k48rN7PmiT2KubogGPUojlDnG2zXmGdxn
	bgHgZA2M9a8GcACrWO8kkJ3cuB+PXv5WEXPu70eo9Ovq8+dX2pbqn/UyMAPwRIYu0uQd3dhL71p2F
	vjwCG9fJxm+KTsa/ln7dkc8//Ehs8grqEpkHIN5H3Nunn1o8c5hRwZjPeSbZlMZgW4cQ3nuN9lIfq
	+xfLDU6ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6VJJ-0003lZ-9u; Wed, 20 Mar 2019 07:06:49 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VJE-0003lC-I3
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:06:47 +0000
Received: by mail-lf1-x141.google.com with SMTP id y62so998042lfc.13
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 00:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yU0coPYCofRAUFSzVSsBwb6SADTPP4pLRbSUN2cn47w=;
 b=FO3qqrMhJUdNV9KYe0rDYxbNNhSNk6oBgBnzoCkV2HT8vppOey2aLUNiggbCaDGLZG
 nMWWIPzzs1/3BmoqfxQQ7exSdPMbsfhq95/TC3j8gDDGBjUalwI3JUkkhzfq2fb7ZYv2
 XMq8WV6JxKJLloLNk3neKMWmPamzNkWMEVJ29d5TUVFz/UIOHK2tFQELWGKJ9+iAbEn/
 DanvQjilDRdqS/ELFo8q1PojCSO0+LX6vUqnx1cAYz23/LkGULiHpyhtRAB+3ngbU7St
 pwxoB4aop9FiMfPV0EMQPoPlYVLMNrwx5xKBNSvtP5ul7VyMJpXM4bRgCzm+t4avkmf2
 Bi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yU0coPYCofRAUFSzVSsBwb6SADTPP4pLRbSUN2cn47w=;
 b=X/De4VqlOCmayKP0GPdgf27IBuivbKZlyFu390i/ExPcGGDfWFkUNVkSXdGI+dlUN0
 RSZIGmCD8Hbd0g+qtRlBVyAwe6crzd6nGMjssHWckLp6YSxQud2tux0bnS7CXE7KaSvq
 qa2AMpC1YuQRaHDIn0FWkzk4gNMKP87XB3tuKTy5i4crCtuYbpIoi5fYDEMdERf/FSR2
 9142/RHpeH87fvaASYqnJTLkjMEGebKSfcsmBuMWK4rBRC47Ah/oFTTPwdxxyILY/s6h
 u5Y9prF/5SA8q6jWqsmldcNdMt+L0klgVHxYwvwnYYILh6uF3YRRnQzWTvcL4brFzUMk
 3JKA==
X-Gm-Message-State: APjAAAV9XnpQxgo/t3IRuoUZMEQ2AE3HomZ+fcJM1whzS4Elz3ljsOSY
 GzzYbbpHJhh11MtcEyMEPLHJFA==
X-Google-Smtp-Source: APXvYqye/CXuaeFUrJiW7124KlfBLZrZy5j3sM/+oFAO1wY42xi5YmUOK2UZP9SUMDSCOzoOkcGHWA==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr7352337lff.100.1553065602432; 
 Wed, 20 Mar 2019 00:06:42 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id
 v13sm190829lje.84.2019.03.20.00.06.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 00:06:41 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
To: Tudor.Ambarus@microchip.com, Yong.Qin@cypress.com,
 James.Tomasetta@cypress.com
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
 <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
 <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
 <9fcc328f-ae13-a294-a56c-0b5a6247b26a@norrbonn.se>
 <64b52a54-94a0-4b0b-683c-41eb07d5b09a@microchip.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <37e1a622-1bb9-0104-c35d-8d7b6c6fcd73@norrbonn.se>
Date: Wed, 20 Mar 2019 08:06:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <64b52a54-94a0-4b0b-683c-41eb07d5b09a@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_000644_741747_0029DCBA 
X-CRM114-Status: GOOD (  27.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyMC8wMy8yMDE5IDA3OjMzLCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6
Cj4gSm9uYXMsCj4gCj4gT24gMDMvMTkvMjAxOSAwOToxMyBBTSwgSm9uYXMgQm9ubiB3cm90ZToK
Pj4KPj4gT24gMTkvMDMvMjAxOSAwNzo1OSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdy
b3RlOgo+Pj4gSm9uYXMsIFlvbmcsCj4+Pgo+Pj4gT24gMDMvMTIvMjAxOSAwOToyNyBQTSwgWW9u
ZyBRaW4gd3JvdGU6Cj4+Pj4gSGkgVHVkb3IsCj4+Pj4KPj4+PiBHb29kIHF1ZXN0aW9uLgo+Pj4+
Cj4+Pj4gVGhlIFdQIyBmdW5jdGlvbiBpcyBub3QgYXZhaWxhYmxlIHdoZW4gdGhlIFF1YWQgbW9k
ZSBpcyBlbmFibGVkIChDUlsxXT0xKS4gVGhlIFdQIyBmdW5jdGlvbiBpcyByZXBsYWNlZCBieSBJ
TzIgZm9yIGlucHV0IGFuZCBvdXRwdXQgZHVyaW5nIFF1YWQgbW9kZS4gV2l0aCB0aGF0IHNhaWQs
IGlmIENSWzFdIGlzIHNldCB0byAxIChRdWFkIG1vZGUgZW5hYmxlZCksIHRoZSByZWdpc3RlcnMg
d2lsbCBub3QgYmUgcHJvdGVjdGVkLgo+Pj4+Cj4+Pj4gVGVjaG5pY2FsbHkgZGVmYXVsdCBTUldE
IGJpdCBjYW4gYmUgc2V0IGFzIGVpdGhlciAwIG9yIDEuIEhvd2V2ZXIsIGFzIG1vc3QgY3VzdG9t
ZXJzIChhcHBsaWNhdGlvbnMpIGRvbid0IHVzZSB0aGlzIGZlYXR1cmUgdG8gcHJvdGVjdCByZWdp
c3RlcnMsIHRoZSBkZWZhdWx0IFNSV0QgYml0IHNldCB0byAwIG1pZ2h0IGJlIGEgYmV0dGVyIGNo
b2ljZSwgYW5kIHJlc2VydmUgdGhlIG9wdGlvbiB0byBjaGFuZ2UgdG8gMSBmb3IgdGhlIGFwcGxp
Y2F0aW9ucyBkbyBuZWVkIHRoaXMgZmVhdHVyZS4KPj4+Cj4+PiBJIHRoaW5rIEkgZm91bmQgdGhl
IHJlYXNvbiB3aHkgU1JXRCBiaXQgaXMgY29uZmlndXJhYmxlLCBhbmQgZGlzYWJsZWQgYnkKPj4+
IGRlZmF1bHQ6ID0+IHRvIGFsbG93IHRoZSBpbnN0YWxsYXRpb24gb2YgdGhlIGZsYXNoIGluIGEg
c3lzdGVtIHdpdGggYSBncm91bmRlZAo+Pj4gV1AjIHBpbiB3aGlsZSBzdGlsbCBlbmFibGluZyB3
cml0ZSB0byB0aGUgQlAgYml0cy4KPj4KPj4gSSB0aGluayB0aGlzIGlzIGJvZ3VzLsKgIFdoeSB3
b3VsZCB5b3UgZ3JvdW5kIHRoZSBTUldEIHBpbj/CoCBUaGF0J3MgYSBkZXNpZ24gZXJyb3IuCj4g
Cj4gSSd2ZSB0YWxrZWQgd2l0aCBNaWNyb2NoaXAgaGFyZHdhcmUgdGVhbSwgd2UgaGF2ZSB0aGlz
IGZlYXR1cmUgb24gc3N0MjYgZmxhc2hlcyB0b28uCj4gCj4gR3JvdW5kaW5nIFdQIHdvdWxkIG5v
dCBuZWNlc3NhcmlseSBiZSBhIGRlc2lnbiBlcnJvci4gVGhlIGludGVudGlvbiBpcyB0aGF0IHNv
bWUKPiB1c2VycyBtaWdodCBjaG9vc2UgdG8gcG9wdWxhdGUgdGhlIEZsYXNoIGNoaXAgb250byB0
aGVpciBQQ0IsIHByb2dyYW0gdGhlIG1lbW9yeQo+IGluLWNpcmN1aXQsIGFuZCB0aGVuIGxvY2sg
ZG93biB0aGUgd3JpdGUgcHJvdGVjdGlvbiB0byB1c2UgdGhlIGNoaXAgbGlrZSBhIFJPTS4KPiBH
cm91bmRpbmcgV1AgYWxsb3dzIHRoZW0gdG8gZG8gdGhpcy4gU2luY2UgU1JXRCBpcyBzZXQgdG8g
JzAnIGZyb20gdGhlIGZhY3RvcnksCj4gc28gdXNlcnMgY2FuIHByb2dyYW0gdGhlIG1lbW9yeSwg
c2V0IHRoZSBibG9jayBwcm90ZWN0aW9uIChCUCkgYml0cyB0byBwcm90ZWN0Cj4gdGhlIG1lbW9y
eSwgYW5kIHRoZW4gc2V0IHRoZSBTUldEIGJpdCB0byBlbmFibGUgdGhlIGdyb3VuZGVkIFdQIGlu
cHV0IGFuZAo+IHByZXZlbnQgY2hhbmdpbmcgdGhlIEJQIGJpdHMuCgpBZ2FpbiwgdGhpcyBpcyBi
b2d1cy4gIFRoZSBTUldEIGJpdCBpcyBub24tdm9sYXRpbGUgc28ganVzdCByZXNldHRpbmcgCnRo
ZSBmbGFzaCBjbGVhcnMgdGhlIGJpdCBhbmQgdGhlIEJQIGJpdHMgY2FuIGJlIGNoYW5nZWQuICBU
aGlzIGRvZXMgbm90IAptYWdpY2FsbHkgdHVybiB0aGUgZmxhc2ggaW50byBhIFJPTS4gIEdyb3Vu
ZGVkIG9yIG5vdCwgdGhlIFdQIyBpcyBOT1QgCnJlc3BlY3RlZCB1bnRpbCB0aGUgU1JXRCBiaXQg
aXMgc2V0OyB3aGF0IHlvdSd2ZSBkZXNjcmliZWQgaXMgeWV0IAphbm90aGVyIHJlYXNvbiB0byBk
ZWZhdWx0IHRoZSBTUldEIHRvIHNldC4KCldpdGggdGhlIEJQTlYgYml0IChzZWUgcGF0Y2ggMyB0
aGF0IEkgcG9zdGVkIGluIHRoZSB2MiBzZXJpZXMpLCBhdCBsZWFzdCAKdGhlIGZsYXNoIGNhbiBi
ZSBtYWRlIHRvIHN0YXJ0IHVwIHdyaXRlLXByb3RlY3RlZDsgaG93ZXZlciwgdGhlcmUgaXMgCm5v
dGhpbmcgcHJldmVudGluZyBtb2RpZmljYXRpb24gb2YgdGhlIFBST1RlY3Rpb24gYml0cyB1bnRp
bCBTUldEIGlzIHNldCAKQU5EIFdQIyBpcyBhc3NlcnRlZCAodGhyb3VnaCBncm91bmRpbmcgb3Ig
b3RoZXJ3aXNlKS4gIExpbnV4IGN1cnJlbnRseSAKZGVmYXVsdHMgU1JXRCB0byBjbGVhcmVkIHdo
aWNoIGlzICJ1bnByb3RlY3RlZCIsIGlycmVnYXJkbGVzcyBvZiB0aGUgCnN0YXRlIG9mIFdQIy4K
Cj4gCj4gVGhlIGdyb3VuZGVkIFdQIHBpbiArIFNSV0QgYml0IG1ldGhvZCBpcyBhbiBvbGRlciwg
bGVnYWN5IGFwcHJvYWNoIHRvIHRoZQo+IHByb2JsZW0uIFdlIGRvbid0IGtub3cgaG93IG1hbnkg
dXNlcnMgYWN0dWFsbHkgZ3JvdW5kIHRoZSBXUCBwaW4gaW4gdGhpcyBtYW5uZXIsCj4gYnV0IHRo
ZXJlIGFyZSBwcm9iYWJseSBzb21lIHVzZXJzIG91dCB0aGVyZSB3aG8gZG8uCgpJZiB0aGV5IGRv
IHNvLCB0aGV5IGFyZSBmb29saW5nIHRoZW1zZWx2ZXMuLi4gb3IgdGhleSBhcmUgcnVubmluZyBh
IApwYXRjaGVkIGtlcm5lbCEgOikKCi9Kb25hcwoKCgoKPiAKPiBDaGVlcnMsCj4gdGEKPiAKPj4K
Pj4gL0pvbmFzCj4+Cj4+Pgo+Pj4gSm9uYXMsIFlvbmcsIHdoYXQgZG8geW91IHRoaW5rPwo+Pj4K
Pj4+IENoZWVycywKPj4+IHRhCj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+IFlvbmcKPj4+Pgo+
Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogVHVkb3IuQW1iYXJ1c0Bt
aWNyb2NoaXAuY29tIDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4+Pj4gU2VudDogVHVl
c2RheSwgTWFyY2ggMTIsIDIwMTkgNTozMCBBTQo+Pj4+IFRvOiBZb25nIFFpbiA8WW9uZy5RaW5A
Y3lwcmVzcy5jb20+OyBqb25hc0Bub3JyYm9ubi5zZTsgSmFtZXMgVG9tYXNldHRhIDxKYW1lcy5U
b21hc2V0dGFAY3lwcmVzcy5jb20+Cj4+Pj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBiYnJlemlsbG9uQGtlcm5lbC5vcmc7IHJpY2hhcmRAbm9kLmF0OyBtYXJlay52YXN1dEBn
bWFpbC5jb207IGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbTsgZHdtdzJAaW5mcmFkZWFkLm9y
Zwo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8zXSBtdGQ6IHNwaS1ub3I6IGFsd2F5cyBy
ZXNwZWN0IHdyaXRlLXByb3RlY3QgaW5wdXQKPj4+Pgo+Pj4+IEhpLCBZb25nLAo+Pj4+Cj4+Pj4g
VGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24uIFRoZXJlIGFyZSBzdGlsbCBmZXcgdGhpbmdz
IHRvIGNsYXJpZnkuCj4+Pj4KPj4+PiBPbiAwMy8xMS8yMDE5IDEwOjE0IFBNLCBZb25nIFFpbiB3
cm90ZToKPj4+Pj4gU1JXRCBiaXQgKGFsb25nIHdpdGggV1AjKSBwcm92aWRlcyBhIHdheSB0byBw
cm90ZWN0IFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiBSZWdpc3RlcnMgZnJvbSBiZWVuIG1vZGlm
aWVkIHVuaW50ZW5kZWRseSBvciBieSBhIG1hbGljaW91cyBhY3Rvci4KPj4+Pj4KPj4+Pj4gQnkg
ZGVmYXVsdCwgU1JXRCBiaXQgaXMgMCwgd2hpY2ggbWVhbnMgbm8gcHJvdGVjdGlvbiBvbiByZWdp
c3RlcnMgYWx0ZXJuYXRpb25zLiBSZWdpc3RlcnMgY2FuIGJlIG1vZGlmaWVkIGVhc2lseSBieSBX
UlIgY29tbWFuZC4gKHRoaXMgaXMgbW9zdCBvZiB0aGUgYXBwbGljYXRpb24gdXNlIGNhc2VzKS4K
Pj4+Pj4KPj4+Pj4gSWYgc2V0IFNSV0QgYml0IHRvIDEsIHRoZW4gd2hlbiBXUCMgaXMgZHJpdmVu
IGxvdyBkdXJpbmcgV1JSIGNvbW1hbmQsIFdSUiBjb21tYW5kIHdpbGwgYmUgaWdub3JlZCBhbmQg
UmVnaXN0ZXJzIGNhbid0IGJlIG1vZGlmaWVkLiBUaGlzIHByb3ZpZGVzIGEgd2F5IHRvIHByb3Rl
Y3QgUmVnaXN0ZXJzLCBtZWFud2hpbGUgc3RpbGwgcmVzZXJ2ZSB0aGUgY2FwYWJpbGl0eSB0byBt
b2RpZnkgUmVnaXN0ZXJzIHdoZW4gbmVjZXNzYXJ5IGJ5IGRyaXZpbmcgV1AjIHRvIGhpZ2ggZHVy
aW5nIFdSUiBjb21tYW5kLgo+Pj4+Cj4+Pj4gRG9lcyB0aGUgU1JXRCBiaXQgcHJvdGVjdCB0aGUg
U3RhdHVzIGFuZCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyIGJpdHMgZXZlbiB3aGVuIGluIFF1YWQg
TW9kZT8gV1AjIGZ1bmN0aW9uIGlzIG5vdCBhdmFpbGFibGUgaW4gUXVhZCBtb2RlLiBIb3cgY2Fu
IG9uZSByZWxlYXNlIHRoaXMgcHJvdGVjdGlvbiB3aGVuIGluIFF1YWQgTW9kZSBhbmQgU1JXRCBz
ZXQgdG8gMT8KPj4+Pgo+Pj4+IElmIFNSV0QgYml0IGlzIGlnbm9yZWQgaW4gUXVhZCBNb2RlLCB0
aGVuIHdoeSBkaWRuJ3QgQ3lwcmVzcyBlbmFibGUgU3RhdHVzIGFuZCBDb25maWd1cmF0aW9uIFJl
Z2lzdGVyIGJpdHMgcHJvdGVjdGlvbiBieSBkZWZhdWx0PyBJLmUuLCByZW1vdmUgU1JXRCBiaXQg
ZnJvbSBTUjEsIG1ha2UgQklUKDcpIGEgTk9QLCBhbmQgY29uc2lkZXIgdGhlIFN0YXR1cyBhbmQg
Q29uZmlndXJhdGlvbiBSZWdpc3RlciBiaXRzIHByb3RlY3Rpb24gZW5hYmxlZCBieSBkZWZhdWx0
IHdoZW4gbm90IGluIFF1YWQgTW9kZS4KPj4+Pgo+Pj4+IENoZWVycywKPj4+PiB0YQo+Pj4+Cj4+
Pj4gVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50
aWFsIGluZm9ybWF0aW9uIGZyb20gQ3lwcmVzcyBvciBpdHMgc3Vic2lkaWFyaWVzLiBJZiBpdCBo
YXMgYmVlbiByZWNlaXZlZCBpbiBlcnJvciwgcGxlYXNlIGFkdmlzZSB0aGUgc2VuZGVyIGFuZCBp
bW1lZGlhdGVseSBkZWxldGUgdGhpcyBtZXNzYWdlLgo+Pj4+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
