Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053CFC25B6F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7To09MrRdOUkaoK2G3Ed6v9iyo6UbYyKTQBDdMf4dFM=; b=r+1UvKhZ6tajhY
	p9q+c4+my+nUG6T4E/Bd3Il/G82Fl6tsVP5xWjpbTe/kyTusxW8LCtHZXEvG+zPiSfu6qHyR4ncXU
	Vn2l8nW8WGArj75tQqsZ7mM/GbregWX/Oyz1Z/mZOOttxDM46Yk57C3n5DjvGMjnIG5TbesNb2s2L
	EsuFIj68vBB8VdTBz/QCLgRWmUoFONm5nDlyZVlhVQ3c9VvY6r5wSuw8Q5L7kPnmiYBKrLWHBwc4Y
	k6aTQDIG9TyVKS68FVqvhCNCRzqigtnOdrHqJIrPurMNdk9BtC/r0m4GoqRJwLYU7yujn64trT2Ta
	Ez1XE/xok9/V7kSt935w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfGZ-00CZ4U-0h;
	Wed, 25 Oct 2023 14:53:51 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfGV-00CZ1x-0O
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 14:53:49 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0253F100048;
	Wed, 25 Oct 2023 17:53:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0253F100048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698245617;
	bh=AKaXrVnp5wObDD8weP6QzDDT60hIJPj/Pzxc3A40cz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Qm8uRIch39gETLUoMno1qEfgwedy3+8mk3kU5F4msvXFeOpYwHtMFY9Ot4JIO0h5O
	 RN5val+8Az8zAGmAXgIuLlV8sb5reovLSeRDHDpwxOxvqOGgkGzpIIqqYFBeHzkqn3
	 DHP+m6cNuirFUF87ymPQeHBLers7sZxE3opDCSS3dpfjp17R5cfTdq3hJ4XyTO2SHb
	 GsE/WLgoILy9LlLNaUKhZ8YJ+iXI1ZOIhyBvDUozULMOv6DLmYY/jXqSkVGJolVUqY
	 1ZGKnfTL3QGJJJGkBtb/DVW4dgPl+eEv21YyosRCMliKvEyDOtOutzEMEs8NMk5/EO
	 Z37rWMTm5jYAg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Oct 2023 17:53:36 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 25 Oct 2023 17:53:36 +0300
Message-ID: <06a5aebc-b90d-4c0b-b496-921e14452f9d@salutedevices.com>
Date: Wed, 25 Oct 2023 17:53:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] jffs2: make cleanmarker support option
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
CC: Christian Brauner <brauner@kernel.org>, Dave Chinner
	<dchinner@redhat.com>, Yu Zhe <yuzhe@nfschina.com>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>
References: <20231019073838.17586-1-mmkurbanov@salutedevices.com>
 <20231019073838.17586-3-mmkurbanov@salutedevices.com>
 <1258129392.18842.1697703134703.JavaMail.zimbra@nod.at>
 <3951ac21-a0a4-47b5-be94-edb0140c69a5@salutedevices.com>
 <cb1456a3fa874772a531c4885f0d204041ecf5bf.camel@infradead.org>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
In-Reply-To: <cb1456a3fa874772a531c4885f0d204041ecf5bf.camel@infradead.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180891 [Oct 25 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/25 13:08:00 #22292805
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_075347_848646_08A79F68 
X-CRM114-Status: GOOD (  22.68  )
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

SGkgRGF2aWQsIFRoYW5rIHlvdSBmb3IgcmVwbHkuCgpPbiAyMy4xMC4yMDIzIDIwOjU1LCBEYXZp
ZCBXb29kaG91c2Ugd3JvdGU6Cj4gT24gTW9uLCAyMDIzLTEwLTIzIGF0IDE3OjU0ICswMzAwLCBN
YXJ0aW4gS3VyYmFub3Ygd3JvdGU6Cj4+IEhlbGxvIFJpY2hhcmQsCj4+Cj4+IE9uIDE5LjEwLjIw
MjMgMTE6MTIsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPj4+PiBUaGlzIHBhdGNoIHN1cHBv
cnQgZm9yIGRpc2FibGUgY2xlYW5tYXJrZXIgb3B0aW9uLiBUaGlzIGlzIHVzZWZ1bCBvbgo+Pj4+
IHNvbWUgTkFORCBkZXZpY2VzIHdoaWNoIGVudGlyZSBPT0IgYXJlYSBpcyBwcm90ZWN0ZWQgYnkg
RUNDLiBQcm9ibGVtCj4+Pj4gZmlyZXMgd2hlbiBKRkZTMiBkcml2ZXIgd3JpdGVzIGNsZWFubWFy
a2VyIHRvIHNvbWUgcGFnZSBhbmQgbGF0ZXIgaXQKPj4+PiB0cmllcyB0byB3cml0ZSB0byB0aGlz
IHBhZ2UgLSB3cml0ZSB3aWxsIGJlIGRvbmUgc3VjY2Vzc2Z1bGx5LCBidXQgYWZ0ZXIKPj4+PiB0
aGF0IHN1Y2ggcGFnZSBiZWNvbWVzIHVucmVhZGFibGUgZHVlIHRvIGludmFsaWQgRUNDIGNvZGVz
LiBUaGlzIG9jY3Vycwo+Pj4+IGJlY2F1c2UgdGhlIHNlY29uZCB3cml0ZSBuZWNlc3NpdGF0ZXMg
YW4gdXBkYXRlIHRvIEVDQywgYnV0IGl0IGlzCj4+Pj4gaW1wb3NzaWJsZSB0byBkbyBpdCBjb3Jy
ZWN0bHkgd2l0aG91dCBibG9jayBlcmFzZS4KPj4+IEhtbSwgSSBtaXNzIGFuIGV4cGxhbmF0aW9u
IHdoeSB0aGlzIGNoYW5nZSBpcyBjb3JyZWN0IGFuZCBzYWZlLgo+Pj4gWW91IGV4cGxhaW4gd2h5
IHRoZSBPT0IgYXJlYSBjYW4ndCBiZSB1c2VkLCBva2F5LiBCdXQgeW91IG5lZWQgdG8KPj4+IGFk
ZCBtb3JlIGRldGFpbHMgb24gd2h5IHlvdSBjaGFuZ2UgaXMgc2FmZSBpbiB0ZXJtcyBvZiBmaWxl
c3lzdGVtCj4+PiBjb25zaXN0ZW5jeS4KPj4gwqAKPj4gSWYgeW91IGRpc2FibGUgdGhlIGNsZWFu
bWFya2VyLCB0aGUgZm91bmQgY2xlYW4gYmxvY2sgKGZpbGxlZCB3aXRoIDB4ZmYpCj4+IHdpbGwg
YmUgZXJhc2VkIGFnYWluIChzZWUgZnMvamZmczIvc2Nhbi5jI0wxNjIpLgo+PiBJbiBteSBvcGlu
aW9uLCBpdCBpcyBiZXR0ZXIgdG8gcGVyZm9ybSB0aGUgYmxvY2sgZXJhc3VyZSBhZ2FpbiB0aGFu
IHRvCj4+IG5vdCB3b3JrIHdpdGggc3VjaCBhIG5hbmQgZmxhc2ggYXQgYWxsLgo+IAo+IEVyYXNp
bmcgYWxsIHVudXNlZCBibG9ja3Mgb3ZlciBhbmQgb3ZlciBhZ2FpbiBvbiBldmVyeSByZWJvb3Qv
cmVtb3VudAo+IGlzIGdvaW5nIHRvIGRlc3Ryb3kgeW91ciBmbGFzaCBxdWl0ZSBxdWlja2x5LCBz
dXJlbHk/Cj4gCj4gSSB0aGluayB5b3UgbmVlZCB0byBjb21lIHVwIHdpdGggYSB3YXkgdG8gbG9n
IHRoZSBjbGVhbiBibG9ja3MgKG9yCj4gZXJhc2UgcmVxdWVzdHMpIGluIHRoZSBKRkZTMiBsb2cg
aXRzZWxmLgo+IAo+IFBlcmhhcHMgYSAnYmxvY2sgZXJhc2UgbG9nJyBub2RlIHR5cGUsIHdoaWNo
IGp1c3QgY29udGFpbnMgYSB2ZXJzaW9uIwo+IGFuZCBhIGxpc3Qgb2YgYmxvY2tzIHdoaWNoIGFy
ZSBjdXJyZW50bHkgYmVpbmcgZXJhc2VkLiBZb3Ugd3JpdGUgaXQgb3V0Cj4gYmVmb3JlIGRvaW5n
IGFueSBlcmFzZSBvcGVyYXRpb24uIEFuZCB0aGVuIGF0ICpzb21lKiBwb2ludCBhZnRlciB0aGUK
PiBlcmFzZSBjb21wbGV0ZXMgKGl0IGRvZXNuJ3QgbmVlZCB0byBiZSBpbW1lZGlhdGUpIHlvdSB3
cml0ZSBvdXQgYSBuZXcKPiBvbmUgKHdoaWNoIG1heSBiZSBlbXB0eSwgb3IgbWF5IGxpc3QgbmV3
IGJsb2NrcyB3aGljaCBhcmUgYWJvdXQgdG8gYmUKPiBlcmFzZWQpLgo+IAo+IE9uIG1vdW50LCB3
ZSBqdXN0IG5lZWQgdG8gcmUtZXJhc2UgYW55IGJsb2NrcyB3aGljaCBhcmUgaW5kaWNhdGVkIGFz
Cj4gYmVpbmcgZXJhc2VkIGluIHRoZSBsYXRlc3QgZXJhc2UgbG9nIG5vZGUuCgpXaGF0IGlmIHdl
IGRvbid0IGVyYXNlIHRoZSBmcmVlIGJsb2NrcyBkdXJpbmcgbW91bnRpbmcsIGJ1dCBpbnN0ZWFk
CmVyYXNlIHRoZW0gd2hlbiBhIGNsZWFuIGJsb2NrIGlzIG5lZWRlZCAoYmVmb3JlIHdyaXRpbmcp
PwoKLS0gCkJlc3QgUmVnYXJkcywKTWFydGluIEt1cmJhbm92CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
