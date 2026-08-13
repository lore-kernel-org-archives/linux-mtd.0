Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE56CC5CFCF
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlAMKR7DXFYB2VgzpgSIFy5UNok60+CJuflz2Tev0t8=; b=UhcrVUNjBMNqnS
	XQ7vNXf51Y0JEc9NPWbRKcWI8LYKwdd6a5riaIBlDrukdR7VDZHd8MZDWCSveK/W70bjh1clBiAQO
	l0kePbKNP4Xe1zkeWuTS10OEO1T/Lpk5+jiSsX/dtZpFoPQv4ZPN4HGhNsejTd09NBxmoj3Wnmvpr
	pz5+7ctiph08nIYlPI+YH6tij3pLZVmZwut0tklgaVYut6wrCjXn1jR9SyBMYlk+asEIIBX8JB4oE
	gIr2PCWLQ2pe4jafkx5tNiw5945/FTMk0RZzv1d3uQZfc9Kn3yNXdjQf0Phr8NqRYL6wZ9G8z4boQ
	cUqF/cfK9mK8t1oFBgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLD8-0000000HHn0-2GUh;
	Thu, 13 Aug 2026 02:30:26 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLD4-0000000HHlc-3ISU
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 02:30:25 +0000
X-UUID: e94d988896be11f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bc36ddf7-17e3-4ca7-972f-1ec92ae09724,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:610e7a24874f7a441ed3247224c58302,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e94d988896be11f1aa26b74ffac11d73-20260813
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 304537387; Thu, 13 Aug 2026 10:30:12 +0800
Message-ID: <00cf942e-4e0e-43b6-b4fb-3dc1e50a158a@kylinos.cn>
Date: Thu, 13 Aug 2026 10:30:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is
 zero
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: joern@lazybastard.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com,
 =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, stable@vger.kernel.org
References: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
 <871pc3msar.fsf@bootlin.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <871pc3msar.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_193023_137868_BD93ED95 
X-CRM114-Status: GOOD (  11.09  )
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

CgrlnKggMjAyNi84LzEyIDIwOjM0LCBNaXF1ZWwgUmF5bmFsIOWGmemBkzoKPiBPbiAxMi8wOC8y
MDI2IGF0IDA5OjUyOjQyICswOCwgUGVpIFhpYW8gPHhpYW9wZWkwMUBreWxpbm9zLmNuPiB3cm90
ZToKPiAKPj4gVGhlIGVyYXNlIHNpemUgaXMgcGFyc2VkIGZyb20gdGhlICJibG9jazJtdGQiIG1v
ZHVsZSBwYXJhbWV0ZXIgYW5kIGNhbgo+PiBiZSBzZXQgdG8gemVyby4gYWRkX2RldmljZSgpIHRo
ZW4gZXZhbHVhdGVzCj4+Cj4+ICAgICAgICAgaWYgKHNpemUgJSBlcmFzZV9zaXplKQo+Pgo+PiB3
aXRoIGEgemVybyBkaXZpc29yLCB3aGljaCB0cmlnZ2VycyBhIGRpdmlkZSBlcnJvcjoKPj4KPj4g
ICAgICAgICBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkKPj4gICAgICAg
ICBSSVA6IDAwMTA6YWRkX2RldmljZSBkcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jOjI5
NiBbaW5saW5lXQo+PiAgICAgICAgIFJJUDogMDAxMDpibG9jazJtdGRfc2V0dXAyKzB4NTkyLzB4
ZGEwIGRyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmM6NDU5Cj4+ICAgICAgICAgQ2FsbCBU
cmFjZToKPj4gICAgICAgICAgYmxvY2sybXRkX3NldHVwKzB4MjcvMHhlMCBkcml2ZXJzL210ZC9k
ZXZpY2VzL2Jsb2NrMm10ZC5jOjQ3Ngo+PiAgICAgICAgICBwYXJhbV9hdHRyX3N0b3JlKzB4MjE0
LzB4MzEwIGtlcm5lbC9wYXJhbXMuYzo1ODkKPj4gICAgICAgICAgbW9kdWxlX2F0dHJfc3RvcmUr
MHg2NS8weDkwIGtlcm5lbC9wYXJhbXMuYzo5MDQKPj4gICAgICAgICAga2VybmZzX2ZvcF93cml0
ZV9pdGVyKzB4M2E0LzB4NTQwIGZzL2tlcm5mcy9maWxlLmM6MzQ1Cj4+ICAgICAgICAgIC4uLgo+
Pgo+PiBSZWplY3QgYSB6ZXJvIGVyYXNlIHNpemUgYmVmb3JlIHBlcmZvcm1pbmcgdGhlIG1vZHVs
byBvcGVyYXRpb24gc28gdGhlCj4+IGV4aXN0aW5nICJlcmFzZXNpemUgbXVzdCBiZSBhIGRpdmlz
b3Igb2YgZGV2aWNlIHNpemUiIGVycm9yIHBhdGgKPj4gcmVwb3J0cyB0aGUgaW52YWxpZCBhcmd1
bWVudCBhbmQgZnJlZXMgdGhlIGRldmljZS4KPj4KPj4gV2hpbGUgYXQgaXQsIGRyb3AgdGhlIHVu
bmVjZXNzYXJ5IChsb25nKSBjYXN0IGZyb20gdGhlIHNpemUgb3BlcmFuZCBvZgo+PiB0aGUgbW9k
dWxvLgo+Pgo+PiBGaXhlczogZWE2ZDgzM2EzZmRkICgibXRkOiBibG9jazJtdGQ6IGNoZWNrIGRl
dmljZSBzaXplIikKPj4gUmVwb3J0ZWQtYnk6IHN5emJvdCtiMzIwYTRkNWY2NWE2MWRiYmY4OUBz
eXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC82YTdiNThiYS5hYzM2MWMwOS4yMmZmMGEuMDA0NS5HQUVAZ29vZ2xlLmNvbS8KPj4g
U3VnZ2VzdGVkLWJ5OiBKw7ZybiBFbmdlbCA8am9lcm5AYmFyZWx5c2VjdXJlLm9yZz4KPj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogUGVpIFhpYW8gPHhpYW9w
ZWkwMUBreWxpbm9zLmNuPgo+IAo+IEFwcGFyZW50bHksIHJlbW92aW5nIHRoZSBjYXN0IGxlYWRz
IHRvIGFuIHVuc3VwcG9ydGVkIG9wZXJhdGlvbiB3aXRoIGEKPiA2NC1iaXQgb3BlcmFuZCBvbiAz
Mi1iaXQgYXJjaGl0ZWN0dXJlcyAoU2VlIFNhc2hpa28gcmVwb3J0KS4KVXNpbmcgaTM4NiBmb3Ig
dGVzdGluZyBkb2VzIHJldmVhbCBjb21waWxhdGlvbiBpc3N1ZXM7IEkgd2lsbCByZXRhaW4KdGhp
cyAobG9uZykgY2FzdCBhbmQgc2VuZCB0aGUgdGhpcmQgdmVyc2lvbiBvZiB0aGUgcGF0Y2guCgpt
YWtlIEFSQ0g9aTM4NiAtaiQobnByb2MpCgpsZDogZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJt
dGQubzogaW4gZnVuY3Rpb24gYGJsb2NrMm10ZF9zZXR1cDInOgpibG9jazJtdGQuYzooLnRleHQr
MHgzMTUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX21vZGRpMycKbWFrZVsyXTogKioqIFtz
Y3JpcHRzL01ha2VmaWxlLnZtbGludXg6NzLvvJp2bWxpbnV4LnVuc3RyaXBwZWRdIOmUmeivryAx
Cgo+IAo+IEkgZ3Vlc3MgaXQgaXMgYmVzdCB0byBrZWVwIHRoYXQgY2FzdCBpbiB0aGUgZW5kLgo+
IAo+IFNvcnJ5IGZvciB0aGUgY2hhbmdlcyBiYWNrLWFuZC1mb3J0aC4KSXQgaXMgbXkgcGxlYXN1
cmUuCgpQZWkuCj4gCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
