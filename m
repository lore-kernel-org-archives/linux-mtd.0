Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C17C2BBCA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 22:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhByzzXWVbCnDk9NM0jeVdk8FwTsFYB1l95MCcsFHhI=; b=CJFUMTzquhrxsD
	Jv3kgBC898EoQiJPTUArPEdobAVGI4S5/KhgJK5wHyS99wCejijqxTEkw/uaveqCbVSFXUeWl33p6
	od+lbDD+YBj7O37zl3ShLQZRkA/LWfosYAn7xxIhOEP7URTzQ2EYN597w7PO3b7n6ZWLN9mwfCHiq
	OHKYhMmAIKlYhzAm+swSJABOL+9VkJXBwAVH256yCLvFK4jDy19d4GzLwkVqoU6/QPKmyAJDTdjUT
	2Z9JeV+U61JsCj/uut6LOIGVP24fYl52G9qMAQatBuVYHZMjabxBQf3lDItjCbW2bJp3P/SuFzWvI
	uWHwmgIZl8DrQtVV/obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKPvL-00000006syE-3JuY;
	Thu, 20 Jun 2024 22:06:31 +0000
Received: from qs51p00im-qukt01072102.me.com ([17.57.155.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKPvI-00000006sxa-3JMB
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 22:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
	t=1718921182; bh=RlqKdkifPzJNyVFZdKuDYBTnjv4N3Vl4EqLMDScJvWs=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=aU9ZmrSV7pifIU9rsgI2B4SpepfRE+AwQhm+DQIBMz2WOABFNb8bz2dgmabxl5QDt
	 /R6P5G7UCY7rDzO6xzsvzvdBApXF69JckhHm8owlCIjhkbH2Az82YKt+ILizPTo4Zz
	 Apdk9Q5xxo15/qXBryLXmunsk2sunbMk1Pfn6DCCHMToW0H/uDv1ov/G8vAvZBxqxn
	 Lw1maU5ANLiFviuyTjzghJrNGt6hpPmHNS0Y1qchNp4QTyyb9BZZ1u6RAyGDJPNJMM
	 19B57f2yPYkroiJ07HK6Ot9v5yN5UKZj0bp64DjaUcVtbkEIOdeSLBDYVlVj9VnV4D
	 FlBuJBhcNp42Q==
Received: from [172.20.144.1] (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072102.me.com (Postfix) with ESMTPSA id 61596340252;
	Thu, 20 Jun 2024 22:06:15 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
From: Gagan Sidhu <broly@mac.com>
In-Reply-To: <251ae039-9f46-081b-a7ee-fe47de268865@huawei.com>
Date: Thu, 20 Jun 2024 16:06:11 -0600
Cc: Daniel Golle <daniel@makrotopia.org>,
 Richard Weinberger <richard@nod.at>,
 ZhaoLong Wang <wangzhaolong1@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 yangerkun <yangerkun@huawei.com>,
 yi zhang <yi.zhang@huawei.com>
Message-Id: <EFEC7C06-A3B2-46D6-99F4-ADA7F7199188@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
 <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com>
 <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com>
 <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com>
 <303502000.252057.1718647746641.JavaMail.zimbra@nod.at>
 <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com>
 <296007365.252185.1718649153090.JavaMail.zimbra@nod.at>
 <3841F21D-CA54-456C-9D9C-F06EEA332A30@mac.com>
 <136290141.252319.1718650375432.JavaMail.zimbra@nod.at>
 <ZnCcsPA-flVcxiAT@makrotopia.org>
 <C20708FB-0626-475E-A996-DE42ACF57A8B@mac.com>
 <C7514984-8CEB-4D1F-A896-BD6E653D311B@mac.com>
 <251ae039-9f46-081b-a7ee-fe47de268865@huawei.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Proofpoint-GUID: aBMcI18K3s8DbCMnieoX6MXPFPbwhYhe
X-Proofpoint-ORIG-GUID: aBMcI18K3s8DbCMnieoX6MXPFPbwhYhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_10,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406200163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_150628_914231_51913588 
X-CRM114-Status: GOOD (  24.63  )
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

aGkgemhpaGFvLAoKc28gaSBhc3N1bWUgbXkgY3J1ZGUgcGFyYXBocmFzZSBpcyBjb3JyZWN0PyB0
aGF0IGkgbWF5IGhhdmUgdW5pbnRlbnRpb25hbGx5IHBvaW50ZWQgdGhlIGZpbmdlciBhdCB5b3Us
IGJ1dCB0aGUgcmVhbCBpc3N1ZSBpcyBHTFVFQkkgZXhpc3Rpbmcgd2l0aCBCTE9DSyBvbiB0aGUg
c2FtZSB2b2x1bWU/CgppIHdhcyBqdXN0IGpva2luZyBhYm91dCB5b3UgYmVpbmcgYSBzcHkgYnkg
dGhlIHdheS4gaXQgd2FzIHBvc3QtZml4IGV1cGhvcmlhIDspCgptYXN0ZXIgcmljaCwgc2hlcGhl
cmQgd2VpbmJlcmdlciwgd2hhdCBzYXkgeWU/Cgp5b3VyIHdpc2RvbSBhbmQgaW5zaWdodCB3b3Vs
ZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIGFzIGNsb3N1cmUgYW5kIG1heWJlIGV2ZW4gYSBwYXRj
aCB0byByZWZsZWN0IHRoZSBiZWF1dHkgb2YgY29sbGFib3JhdGluZyBvdmVyIGN1cnJlbnQgOykK
ClRoYW5rcywKR2FnYW4KCj4gT24gSnVuIDE3LCAyMDI0LCBhdCAxMDowMyBQTSwgWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gCj4g5ZyoIDIwMjQvNi8xOCA2
OjEzLCBHYWdhbiBTaWRodSDlhpnpgZM6Cj4gSGksCj4+IHNwb2tlIHRvIGEgdXNlciwgZ2F2ZSBo
aW0gYSBidWlsZCB3aXRob3V0IE1URF9HTFVFQkksIHJlc3RvcmluZyBjaGFuZ2VzIG1hZGUgYnkg
KEhBSEFIQSB5b3UgYXJlISBodWF3ZWkpLCBpdCBib290ZWQgZmluZS4KPiAKPiBNYXkgSSBoYXZl
IHRoZSBsYXllcnMnIGluZm9ybWF0aW9uIGFib3V0IG10ZC91YmksIHlvdSBjYW4gZ2V0IGl0IGJ5
ICdtdGRpbmZvIC1hJyBhbmQgJ3ViaW5mbyAtYScgYWZ0ZXIgYm9vdGluZyB0aGUgZGV2aWNlLgo+
IEkgZ3Vlc3MgeW91ciBkZXZpY2UgYm9vdHMgZnJvbSB1YmlibG9jazBfMC4gVGhlcmUgYXJlIHR3
byB3YXlzIGxvYWRpbmcgYm9vdGluZyBkZXZpY2U6Cj4gMS4gbXRkKG5hbmQpCj4gICB1YmkoaG9s
ZHMgdm9sdW1lIHViaTBfMCkKPiAgIG10ZDEyIChnbHVlYmkpCj4gICBtdGRibG9jazEyICAoVGhp
cyB3YXkgaXMgY3V0IGJ5IHRoaXMgcGF0Y2gsIHNvIG10ZGJsb2NrMTIgaXMgbm90IGdlbmVyYXRl
ZCwganVzdCBsaWtlIERhbmllbCZSaWNoYXJkIGFuYWx5emVkKQo+IDIuIG10ZChuYW5kKQo+ICAg
dWJpKGhvbGRzIHZvbHVtZSB1YmkwXzApCj4gICB1YmlibG9jazBfMAo+IAo+PiBzbyB3ZSBuZWVk
IHRvIHRoaW5rIGFib3V0IGVpdGhlciBkZXByZWNhdGluZyBHTFVFQkkgb3Igc2V0dGluZyBhbiBv
cHRpb24gaW4gdGhlIEtjb25maWcgdGhhdCBlbnN1cmVzIHRoZXkgYXJlIG11dHVhbGx5IGV4Y2x1
c2l2ZS4KPj4gZ2x1ZWJpIGlzIGRlZmluaXRlbHkgaGlnaGphY2tpbmcgdGhlIGJsb2NrIGRldmlj
ZSBjcmVhdGVkIGJ5IFVCSV9CTE9DSyBhbmQgYWRkaW5nIHRoZSBNVERfVUJJVk9MVU1FIGZsYWcg
dG8gaXQuCj4gCj4gVGhlIGdsdWViaShtdGQpIGFuZCB1YmlibG9jayBjb3VsZCBleGlzdCBvbiB0
aGUgc2FtZSBVQkkgdm9sdW1lIGF0IHRoZSBzYW1lIHRpbWUsIGJ1dCB0aGV5IGNhbm5vdCBiZSBv
cGVuZWQgYXQgdGhlIHNhbWUgdGltZS4gSGVyZSBpcyBhbiBleGFtcGxlIEkgdGVzdGVkIG9uIHRo
ZSBsb2NhbCBtYWNoaW5lOgo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAg4oaXIHViaWJsb2NrMF8wCj4gbXRkMChuYW5kc2ltKSAtPiB1YmkwIChob2xkcyB2
b2x1bWUgdWJpMF8wKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAg4oaYIGdsdWViaShtdGQxKQo+IAo+IFtyb290QGxvY2FsaG9zdCB+XSMgdWJpbmZvIC1hCj4g
VUJJIHZlcnNpb246ICAgICAgICAgICAgICAgICAgICAxCj4gQ291bnQgb2YgVUJJIGRldmljZXM6
ICAgICAgICAgICAxCj4gVUJJIGNvbnRyb2wgZGV2aWNlIG1ham9yL21pbm9yOiAxMDo2MQo+IFBy
ZXNlbnQgVUJJIGRldmljZXM6ICAgICAgICAgICAgdWJpMAo+IAo+IHViaTAKPiBWb2x1bWVzIGNv
dW50OiAgICAgICAgICAgICAgICAgICAgICAgICAgIDEKPiBMb2dpY2FsIGVyYXNlYmxvY2sgc2l6
ZTogICAgICAgICAgICAgICAgIDEyNjk3NiBieXRlcywgMTI0LjAgS2lCCj4gVG90YWwgYW1vdW50
IG9mIGxvZ2ljYWwgZXJhc2VibG9ja3M6ICAgICA4MTkyICgxMDQwMTg3MzkyIGJ5dGVzLCA5OTIu
MCBNaUIpCj4gQW1vdW50IG9mIGF2YWlsYWJsZSBsb2dpY2FsIGVyYXNlYmxvY2tzOiAwICgwIGJ5
dGVzKQo+IE1heGltdW0gY291bnQgb2Ygdm9sdW1lcyAgICAgICAgICAgICAgICAgMTI4Cj4gQ291
bnQgb2YgYmFkIHBoeXNpY2FsIGVyYXNlYmxvY2tzOiAgICAgICAwCj4gQ291bnQgb2YgcmVzZXJ2
ZWQgcGh5c2ljYWwgZXJhc2VibG9ja3M6ICAxNjAKPiBDdXJyZW50IG1heGltdW0gZXJhc2UgY291
bnRlciB2YWx1ZTogICAgIDIKPiBNaW5pbXVtIGlucHV0L291dHB1dCB1bml0IHNpemU6ICAgICAg
ICAgIDIwNDggYnl0ZXMKPiBDaGFyYWN0ZXIgZGV2aWNlIG1ham9yL21pbm9yOiAgICAgICAgICAg
IDI0NjowCj4gUHJlc2VudCB2b2x1bWVzOiAgICAgICAgICAgICAgICAgICAgICAgICAwCj4gCj4g
Vm9sdW1lIElEOiAgIDAgKG9uIHViaTApCj4gVHlwZTogICAgICAgIGR5bmFtaWMKPiBBbGlnbm1l
bnQ6ICAgMQo+IFNpemU6ICAgICAgICA4MDI2IExFQnMgKDEwMTkxMDkzNzYgYnl0ZXMsIDk3MS44
IE1pQikKPiBTdGF0ZTogICAgICAgT0sKPiBOYW1lOiAgICAgICAgdm9sX2EKPiBDaGFyYWN0ZXIg
ZGV2aWNlIG1ham9yL21pbm9yOiAyNDY6MQo+IFtyb290QGxvY2FsaG9zdCB+XSMgbXRkaW5mbyAt
YQo+IENvdW50IG9mIE1URCBkZXZpY2VzOiAgICAgICAgICAgMgo+IFByZXNlbnQgTVREIGRldmlj
ZXM6ICAgICAgICAgICAgbXRkMCwgbXRkMQo+IFN5c2ZzIGludGVyZmFjZSBzdXBwb3J0ZWQ6ICAg
ICAgeWVzCj4gCj4gbXRkMAo+IE5hbWU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgTkFORCBz
aW11bGF0b3IgcGFydGl0aW9uIDAKPiBUeXBlOiAgICAgICAgICAgICAgICAgICAgICAgICAgIG5h
bmQKPiBFcmFzZWJsb2NrIHNpemU6ICAgICAgICAgICAgICAgIDEzMTA3MiBieXRlcywgMTI4LjAg
S2lCCj4gQW1vdW50IG9mIGVyYXNlYmxvY2tzOiAgICAgICAgICA4MTkyICgxMDczNzQxODI0IGJ5
dGVzLCAxMDI0LjAgTWlCKQo+IE1pbmltdW0gaW5wdXQvb3V0cHV0IHVuaXQgc2l6ZTogMjA0OCBi
eXRlcwo+IFN1Yi1wYWdlIHNpemU6ICAgICAgICAgICAgICAgICAgNTEyIGJ5dGVzCj4gT09CIHNp
emU6ICAgICAgICAgICAgICAgICAgICAgICA2NCBieXRlcwo+IENoYXJhY3RlciBkZXZpY2UgbWFq
b3IvbWlub3I6ICAgOTA6MAo+IEJhZCBibG9ja3MgYXJlIGFsbG93ZWQ6ICAgICAgICAgdHJ1ZQo+
IERldmljZSBpcyB3cml0YWJsZTogICAgICAgICAgICAgdHJ1ZQo+IAo+IG10ZDEKPiBOYW1lOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZvbF9hCj4gVHlwZTogICAgICAgICAgICAgICAgICAg
ICAgICAgICB1YmkKPiBFcmFzZWJsb2NrIHNpemU6ICAgICAgICAgICAgICAgIDEyNjk3NiBieXRl
cywgMTI0LjAgS2lCCj4gQW1vdW50IG9mIGVyYXNlYmxvY2tzOiAgICAgICAgICA4MDI2ICgxMDE5
MTA5Mzc2IGJ5dGVzLCA5NzEuOCBNaUIpCj4gTWluaW11bSBpbnB1dC9vdXRwdXQgdW5pdCBzaXpl
OiAyMDQ4IGJ5dGVzCj4gU3ViLXBhZ2Ugc2l6ZTogICAgICAgICAgICAgICAgICAyMDQ4IGJ5dGVz
Cj4gQ2hhcmFjdGVyIGRldmljZSBtYWpvci9taW5vcjogICA5MDoyCj4gQmFkIGJsb2NrcyBhcmUg
YWxsb3dlZDogICAgICAgICBmYWxzZQo+IERldmljZSBpcyB3cml0YWJsZTogICAgICAgICAgICAg
dHJ1ZQo+IAo+IFtyb290QGxvY2FsaG9zdCB+XSMgbHNibGsgfCBncmVwIHViaQo+IHViaWJsb2Nr
MF8wIDI1MTowICAgIDAgOTcxLjlNICAwIGRpc2sKPiAKPj4gdGhlcmUgaXMgbm8gb3RoZXIgZXhw
bGFuYXRpb24uCj4+IGxvb2tzIGxpa2UgdGhpcyB3YXMgYW4gYWJzb2x1dGVseSBhbWF6aW5nIGV4
Y2hhbmdlIHRoYXQgZXZlbiBmdXJ0aGVyZWQgb3VyIHVuZGVyc3RhbmRpbmcgb2Ygd3RmIGlzIGdv
aW5nIG9uLgo+PiB0aGFua3MgZm9yIGJlaW5nIGEgZ3JlYXQgbW9kZXJhdG9yIGZvciBNVEQgcmlj
aAo+PiBUaGFua3MsCj4+IEdhZ2FuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
