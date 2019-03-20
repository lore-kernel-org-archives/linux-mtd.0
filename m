Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEECC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:40:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363772184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="REXUbOZ4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="sBJL6JxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363772184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3yxHTnZFr6j30H2C29FJVAJqHr0A4j6PGA+jjCEoaTY=; b=REXUbOZ44sBLRu1IdPnOJJZgV
	xWGvA+ESXMdK2VPrKQ+QA8Dv0BQNjOt5XZDavQSsO6FetbR09+i/eaxTE+iDpYDKiI+5vlb0H3UuC
	QHDQeiChNt65IZaZsl4UuYk4UJdsLZ5dNzDgBrjQkm/q/e1tnEq4zC7/k+zAsoP7aeF8w69WMYefU
	ZZZb4PEwxX13pES35lwc0wXKNci4TdlTVNv2r3gjC/+XjN70VqzDrnUHPBacjbkL3oHlmkl14qLKC
	yldoyYvtXzNY0puvOzv0UPfJCX0mlQ6SASviA3PIyLzbmF2lRTLxLqkB+j6Ecmp6Ysxayc2tzse20
	fU8pw++ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6VpV-00005Q-Ke; Wed, 20 Mar 2019 07:40:05 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VpT-0007vb-LY
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:40:04 +0000
Received: by mail-lj1-x243.google.com with SMTP id f18so1195840lja.10
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 00:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yOS2ZaG/hljf+j4euSm0COSRgQig4FPIaMT8hXgcM1o=;
 b=sBJL6JxVcddLUrEEmXEoms2Lxlr1HgjF96/OuJVEuXCGuAq4265xPpvPBlIhIe2Pvc
 +TFs2JHGrJSrtECHTDe9wmSmJxUR6ZMmNotZGcy00LOKbuGhIAq02hNnEGkU5OA/ykBM
 ckOxEvE7rx3fYTcHnmqU9A7msraWldIzbpHwj5KvGS/Bu4yRxTUi1mqskn/ohIm0iVKK
 fKLtkC3hvm3/0gZ49qAvmdiK5h7py+q0PPhYRIaAn0B1AVGQCrixSKmBksV7f9w9Moyj
 Ocvs/y9o9DTJsHT+UUzZ/VGsfuVDODWYQ3KCrqYt6QgjAXbcfaIX3vG3A85Og8vAiyaZ
 3SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOS2ZaG/hljf+j4euSm0COSRgQig4FPIaMT8hXgcM1o=;
 b=jgDXekmb2u3feGeDJpbsRvXg256etGFyeoh4+p6irwN8hs3G42f1vCYvWwgDEUQTvF
 U7YfXrgwnBPzkIxgV5YJMJb+Lgc+WiUzFT04Eupi5hI2bOyzC7N5GADQk628ZWAindXX
 o6eFMcuCRv9TNFdbhJ7fjQ0wR1LK978u/jT2eOXXZwmH9G0/UxpPtmAInmWNbI27scL8
 cjgtNNzGEeXoZYqZaHZSRod0ggI2NPl5llMkqcKXYoQvqLWamO3vMz7xwty5UisLlJXE
 qNyS+L9vL6KYnt1exBFvScWkuJHjXhQ/O9CbuQF+6rZnbNpbkvG3PDOyhxkYjjSDjAMo
 A7BA==
X-Gm-Message-State: APjAAAXRZ1JuLbeqYSodyUVY2HGTHwmdi8Tfp9ZyXBje6fti1KN9Tgix
 2QQzeXz7A4mRlwtNU2imHHzOhw==
X-Google-Smtp-Source: APXvYqzC5ZXt8rv+g8qKjwAjRqH5aS395G6LCjBgWUEd9hF9QAS9Vlz6B0w7DK5J+8JLG0akBo7qkw==
X-Received: by 2002:a2e:9655:: with SMTP id z21mr14276431ljh.60.1553067600433; 
 Wed, 20 Mar 2019 00:40:00 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id
 m1sm236922lfh.36.2019.03.20.00.39.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 00:39:59 -0700 (PDT)
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
 <37e1a622-1bb9-0104-c35d-8d7b6c6fcd73@norrbonn.se>
 <5d342253-1ca2-4673-7560-6698cc71696e@microchip.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <71b64bdf-73f7-03b7-14a6-5fb2750b84a1@norrbonn.se>
Date: Wed, 20 Mar 2019 08:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5d342253-1ca2-4673-7560-6698cc71696e@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_004003_707437_5C7D967C 
X-CRM114-Status: GOOD (  26.82  )
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

CgpPbiAyMC8wMy8yMDE5IDA4OjMzLCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6
Cj4gCj4gCj4gT24gMDMvMjAvMjAxOSAwOTowNiBBTSwgSm9uYXMgQm9ubiB3cm90ZToKPj4gRXh0
ZXJuYWwgRS1NYWlsCj4+Cj4+Cj4+Cj4+IE9uIDIwLzAzLzIwMTkgMDc6MzMsIFR1ZG9yLkFtYmFy
dXNAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4+IEpvbmFzLAo+Pj4KPj4+IE9uIDAzLzE5LzIwMTkg
MDk6MTMgQU0sIEpvbmFzIEJvbm4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiAxOS8wMy8yMDE5IDA3OjU5
LCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+Pj4+IEpvbmFzLCBZb25nLAo+
Pj4+Pgo+Pj4+PiBPbiAwMy8xMi8yMDE5IDA5OjI3IFBNLCBZb25nIFFpbiB3cm90ZToKPj4+Pj4+
IEhpIFR1ZG9yLAo+Pj4+Pj4KPj4+Pj4+IEdvb2QgcXVlc3Rpb24uCj4+Pj4+Pgo+Pj4+Pj4gVGhl
IFdQIyBmdW5jdGlvbiBpcyBub3QgYXZhaWxhYmxlIHdoZW4gdGhlIFF1YWQgbW9kZSBpcyBlbmFi
bGVkIChDUlsxXT0xKS4gVGhlIFdQIyBmdW5jdGlvbiBpcyByZXBsYWNlZCBieSBJTzIgZm9yIGlu
cHV0IGFuZCBvdXRwdXQgZHVyaW5nIFF1YWQgbW9kZS4gV2l0aCB0aGF0IHNhaWQsIGlmIENSWzFd
IGlzIHNldCB0byAxIChRdWFkIG1vZGUgZW5hYmxlZCksIHRoZSByZWdpc3RlcnMgd2lsbCBub3Qg
YmUgcHJvdGVjdGVkLgo+Pj4+Pj4KPj4+Pj4+IFRlY2huaWNhbGx5IGRlZmF1bHQgU1JXRCBiaXQg
Y2FuIGJlIHNldCBhcyBlaXRoZXIgMCBvciAxLiBIb3dldmVyLCBhcyBtb3N0IGN1c3RvbWVycyAo
YXBwbGljYXRpb25zKSBkb24ndCB1c2UgdGhpcyBmZWF0dXJlIHRvIHByb3RlY3QgcmVnaXN0ZXJz
LCB0aGUgZGVmYXVsdCBTUldEIGJpdCBzZXQgdG8gMCBtaWdodCBiZSBhIGJldHRlciBjaG9pY2Us
IGFuZCByZXNlcnZlIHRoZSBvcHRpb24gdG8gY2hhbmdlIHRvIDEgZm9yIHRoZSBhcHBsaWNhdGlv
bnMgZG8gbmVlZCB0aGlzIGZlYXR1cmUuCj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgSSBmb3VuZCB0aGUg
cmVhc29uIHdoeSBTUldEIGJpdCBpcyBjb25maWd1cmFibGUsIGFuZCBkaXNhYmxlZCBieQo+Pj4+
PiBkZWZhdWx0OiA9PiB0byBhbGxvdyB0aGUgaW5zdGFsbGF0aW9uIG9mIHRoZSBmbGFzaCBpbiBh
IHN5c3RlbSB3aXRoIGEgZ3JvdW5kZWQKPj4+Pj4gV1AjIHBpbiB3aGlsZSBzdGlsbCBlbmFibGlu
ZyB3cml0ZSB0byB0aGUgQlAgYml0cy4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBpcyBib2d1cy7C
oCBXaHkgd291bGQgeW91IGdyb3VuZCB0aGUgU1JXRCBwaW4/wqAgVGhhdCdzIGEgZGVzaWduIGVy
cm9yLgo+Pj4KPj4+IEkndmUgdGFsa2VkIHdpdGggTWljcm9jaGlwIGhhcmR3YXJlIHRlYW0sIHdl
IGhhdmUgdGhpcyBmZWF0dXJlIG9uIHNzdDI2IGZsYXNoZXMgdG9vLgo+Pj4KPj4+IEdyb3VuZGlu
ZyBXUCB3b3VsZCBub3QgbmVjZXNzYXJpbHkgYmUgYSBkZXNpZ24gZXJyb3IuIFRoZSBpbnRlbnRp
b24gaXMgdGhhdCBzb21lCj4+PiB1c2VycyBtaWdodCBjaG9vc2UgdG8gcG9wdWxhdGUgdGhlIEZs
YXNoIGNoaXAgb250byB0aGVpciBQQ0IsIHByb2dyYW0gdGhlIG1lbW9yeQo+Pj4gaW4tY2lyY3Vp
dCwgYW5kIHRoZW4gbG9jayBkb3duIHRoZSB3cml0ZSBwcm90ZWN0aW9uIHRvIHVzZSB0aGUgY2hp
cCBsaWtlIGEgUk9NLgo+Pj4gR3JvdW5kaW5nIFdQIGFsbG93cyB0aGVtIHRvIGRvIHRoaXMuIFNp
bmNlIFNSV0QgaXMgc2V0IHRvICcwJyBmcm9tIHRoZSBmYWN0b3J5LAo+Pj4gc28gdXNlcnMgY2Fu
IHByb2dyYW0gdGhlIG1lbW9yeSwgc2V0IHRoZSBibG9jayBwcm90ZWN0aW9uIChCUCkgYml0cyB0
byBwcm90ZWN0Cj4+PiB0aGUgbWVtb3J5LCBhbmQgdGhlbiBzZXQgdGhlIFNSV0QgYml0IHRvIGVu
YWJsZSB0aGUgZ3JvdW5kZWQgV1AgaW5wdXQgYW5kCj4+PiBwcmV2ZW50IGNoYW5naW5nIHRoZSBC
UCBiaXRzLgo+Pgo+PiBBZ2FpbiwgdGhpcyBpcyBib2d1cy7CoCBUaGUgU1JXRCBiaXQgaXMgbm9u
LXZvbGF0aWxlIHNvIGp1c3QgcmVzZXR0aW5nIHRoZSBmbGFzaCBjbGVhcnMgdGhlIGJpdCBhbmQg
dGhlIEJQIGJpdHMgY2FuIGJlIGNoYW5nZWQuwqAgVGhpcyBkb2VzIG5vdCBtYWdpY2FsbHkgdHVy
biB0aGUgZmxhc2ggaW50byBhIFJPTS7CoCBHcm91bmRlZCBvciBub3QsIHRoZSBXUCMgaXMgTk9U
IHJlc3BlY3RlZCB1bnRpbCB0aGUgU1JXRCBiaXQgaXMgc2V0OyB3aGF0IHlvdSd2ZSBkZXNjcmli
ZWQgaXMgeWV0IGFub3RoZXIgcmVhc29uIHRvIGRlZmF1bHQgdGhlIFNSV0QgdG8gc2V0Lgo+IAo+
IFNSV0QgaXMgYSBub24tdm9sYXRpbGUgYml0OiBkZWZhdWx0IGF0IHBvd2VyLXVwIHdpbGwgYmUg
dGhlIHNldHRpbmcgcHJpb3IgdG8KPiBwb3dlci1kb3duLgoKQWgsIHJpZ2h0IHlvdSBhcmUhIDop
CgpCeSBncm91bmRpbmcgdGhlIFdQIyBwaW4sIHlvdSBhcmUgZWZmZWN0aXZlbHkgdHVybmluZyB0
aGUgU1JXRCBiaXQgaW50byAKYW4gT1RQIGJpdC4gIE5vdGUgdGhhdCB3aGF0IHlvdSBkZXNjcmli
ZWQgYWJvdmUgYWxzbyByZXF1aXJlcyBzZXR0aW5nIAp0aGUgQlBOViBiaXQsIG90aGVyd2lzZSBw
cm90ZWN0aW9uIGlzIGlycmV2b2NhYmx5IHJlc2V0IHRvICJ1bnByb3RlY3RlZCIgCmF0IHJlc2V0
LiAgVGhlIEJQTlYgYml0IGNhbm5vdCBiZSBzZXQgZnJvbSBMaW51eCBzbyB3aG9ldmVyIGlzIHVz
aW5nIHRoZSAKImdyb3VuZGVkIHBpbiIgbWV0aG9kIG11c3QgYmUgcHJvZ3JhbW1pbmcgdGhlIGJv
YXJkIGluLWZhY3RvcnkgZnJvbSAKYW5vdGhlciBzeXN0ZW0gdGhhbiBMaW51eC4gIFRoZXJlZm9y
ZSBpdCdzIE9LIGZvciBMaW51eCB0byBkZWZhdWx0IFNSV0QgCnRvIGFzc2VydGVkLCBpcnJlZ2Fy
ZGxlc3Mgb2YgdGhlIHN0YXRlIG9mIFdQIy4KCi9Kb25hcwoKCgo+IAo+IENoZWVycywKPiB0YQo+
IAo+Pgo+PiBXaXRoIHRoZSBCUE5WIGJpdCAoc2VlIHBhdGNoIDMgdGhhdCBJIHBvc3RlZCBpbiB0
aGUgdjIgc2VyaWVzKSwgYXQgbGVhc3QgdGhlIGZsYXNoIGNhbiBiZSBtYWRlIHRvIHN0YXJ0IHVw
IHdyaXRlLXByb3RlY3RlZDsgaG93ZXZlciwgdGhlcmUgaXMgbm90aGluZyBwcmV2ZW50aW5nIG1v
ZGlmaWNhdGlvbiBvZiB0aGUgUFJPVGVjdGlvbiBiaXRzIHVudGlsIFNSV0QgaXMgc2V0IEFORCBX
UCMgaXMgYXNzZXJ0ZWQgKHRocm91Z2ggZ3JvdW5kaW5nIG9yIG90aGVyd2lzZSkuwqAgTGludXgg
Y3VycmVudGx5IGRlZmF1bHRzIFNSV0QgdG8gY2xlYXJlZCB3aGljaCBpcyAidW5wcm90ZWN0ZWQi
LCBpcnJlZ2FyZGxlc3Mgb2YgdGhlIHN0YXRlIG9mIFdQIy4KPj4KPj4+Cj4+PiBUaGUgZ3JvdW5k
ZWQgV1AgcGluICsgU1JXRCBiaXQgbWV0aG9kIGlzIGFuIG9sZGVyLCBsZWdhY3kgYXBwcm9hY2gg
dG8gdGhlCj4+PiBwcm9ibGVtLiBXZSBkb24ndCBrbm93IGhvdyBtYW55IHVzZXJzIGFjdHVhbGx5
IGdyb3VuZCB0aGUgV1AgcGluIGluIHRoaXMgbWFubmVyLAo+Pj4gYnV0IHRoZXJlIGFyZSBwcm9i
YWJseSBzb21lIHVzZXJzIG91dCB0aGVyZSB3aG8gZG8uCj4+Cj4+IElmIHRoZXkgZG8gc28sIHRo
ZXkgYXJlIGZvb2xpbmcgdGhlbXNlbHZlcy4uLiBvciB0aGV5IGFyZSBydW5uaW5nIGEgcGF0Y2hl
ZCBrZXJuZWwhIDopCj4+Cj4+IC9Kb25hcwo+Pgo+Pgo+Pgo+Pgo+Pj4KPj4+IENoZWVycywKPj4+
IHRhCj4+Pgo+Pj4+Cj4+Pj4gL0pvbmFzCj4+Pj4KPj4+Pj4KPj4+Pj4gSm9uYXMsIFlvbmcsIHdo
YXQgZG8geW91IHRoaW5rPwo+Pj4+Pgo+Pj4+PiBDaGVlcnMsCj4+Pj4+IHRhCj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4gWW9uZwo+Pj4+Pj4KPj4+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+Pj4+PiBGcm9tOiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gPFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4KPj4+Pj4+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDEy
LCAyMDE5IDU6MzAgQU0KPj4+Pj4+IFRvOiBZb25nIFFpbiA8WW9uZy5RaW5AY3lwcmVzcy5jb20+
OyBqb25hc0Bub3JyYm9ubi5zZTsgSmFtZXMgVG9tYXNldHRhIDxKYW1lcy5Ub21hc2V0dGFAY3lw
cmVzcy5jb20+Cj4+Pj4+PiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGJicmV6
aWxsb25Aa2VybmVsLm9yZzsgcmljaGFyZEBub2QuYXQ7IG1hcmVrLnZhc3V0QGdtYWlsLmNvbTsg
Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tOyBkd213MkBpbmZyYWRlYWQub3JnCj4+Pj4+PiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gbXRkOiBzcGktbm9yOiBhbHdheXMgcmVzcGVjdCB3
cml0ZS1wcm90ZWN0IGlucHV0Cj4+Pj4+Pgo+Pj4+Pj4gSGksIFlvbmcsCj4+Pj4+Pgo+Pj4+Pj4g
VGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24uIFRoZXJlIGFyZSBzdGlsbCBmZXcgdGhpbmdz
IHRvIGNsYXJpZnkuCj4+Pj4+Pgo+Pj4+Pj4gT24gMDMvMTEvMjAxOSAxMDoxNCBQTSwgWW9uZyBR
aW4gd3JvdGU6Cj4+Pj4+Pj4gU1JXRCBiaXQgKGFsb25nIHdpdGggV1AjKSBwcm92aWRlcyBhIHdh
eSB0byBwcm90ZWN0IFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiBSZWdpc3RlcnMgZnJvbSBiZWVu
IG1vZGlmaWVkIHVuaW50ZW5kZWRseSBvciBieSBhIG1hbGljaW91cyBhY3Rvci4KPj4+Pj4+Pgo+
Pj4+Pj4+IEJ5IGRlZmF1bHQsIFNSV0QgYml0IGlzIDAsIHdoaWNoIG1lYW5zIG5vIHByb3RlY3Rp
b24gb24gcmVnaXN0ZXJzIGFsdGVybmF0aW9ucy4gUmVnaXN0ZXJzIGNhbiBiZSBtb2RpZmllZCBl
YXNpbHkgYnkgV1JSIGNvbW1hbmQuICh0aGlzIGlzIG1vc3Qgb2YgdGhlIGFwcGxpY2F0aW9uIHVz
ZSBjYXNlcykuCj4+Pj4+Pj4KPj4+Pj4+PiBJZiBzZXQgU1JXRCBiaXQgdG8gMSwgdGhlbiB3aGVu
IFdQIyBpcyBkcml2ZW4gbG93IGR1cmluZyBXUlIgY29tbWFuZCwgV1JSIGNvbW1hbmQgd2lsbCBi
ZSBpZ25vcmVkIGFuZCBSZWdpc3RlcnMgY2FuJ3QgYmUgbW9kaWZpZWQuIFRoaXMgcHJvdmlkZXMg
YSB3YXkgdG8gcHJvdGVjdCBSZWdpc3RlcnMsIG1lYW53aGlsZSBzdGlsbCByZXNlcnZlIHRoZSBj
YXBhYmlsaXR5IHRvIG1vZGlmeSBSZWdpc3RlcnMgd2hlbiBuZWNlc3NhcnkgYnkgZHJpdmluZyBX
UCMgdG8gaGlnaCBkdXJpbmcgV1JSIGNvbW1hbmQuCj4+Pj4+Pgo+Pj4+Pj4gRG9lcyB0aGUgU1JX
RCBiaXQgcHJvdGVjdCB0aGUgU3RhdHVzIGFuZCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyIGJpdHMg
ZXZlbiB3aGVuIGluIFF1YWQgTW9kZT8gV1AjIGZ1bmN0aW9uIGlzIG5vdCBhdmFpbGFibGUgaW4g
UXVhZCBtb2RlLiBIb3cgY2FuIG9uZSByZWxlYXNlIHRoaXMgcHJvdGVjdGlvbiB3aGVuIGluIFF1
YWQgTW9kZSBhbmQgU1JXRCBzZXQgdG8gMT8KPj4+Pj4+Cj4+Pj4+PiBJZiBTUldEIGJpdCBpcyBp
Z25vcmVkIGluIFF1YWQgTW9kZSwgdGhlbiB3aHkgZGlkbid0IEN5cHJlc3MgZW5hYmxlIFN0YXR1
cyBhbmQgQ29uZmlndXJhdGlvbiBSZWdpc3RlciBiaXRzIHByb3RlY3Rpb24gYnkgZGVmYXVsdD8g
SS5lLiwgcmVtb3ZlIFNSV0QgYml0IGZyb20gU1IxLCBtYWtlIEJJVCg3KSBhIE5PUCwgYW5kIGNv
bnNpZGVyIHRoZSBTdGF0dXMgYW5kIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgYml0cyBwcm90ZWN0
aW9uIGVuYWJsZWQgYnkgZGVmYXVsdCB3aGVuIG5vdCBpbiBRdWFkIE1vZGUuCj4+Pj4+Pgo+Pj4+
Pj4gQ2hlZXJzLAo+Pj4+Pj4gdGEKPj4+Pj4+Cj4+Pj4+PiBUaGlzIG1lc3NhZ2UgYW5kIGFueSBh
dHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBDeXBy
ZXNzIG9yIGl0cyBzdWJzaWRpYXJpZXMuIElmIGl0IGhhcyBiZWVuIHJlY2VpdmVkIGluIGVycm9y
LCBwbGVhc2UgYWR2aXNlIHRoZSBzZW5kZXIgYW5kIGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGlzIG1l
c3NhZ2UuCj4+Pj4+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
