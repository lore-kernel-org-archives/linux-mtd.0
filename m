Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4241D3C53E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpdQaXTZsEURvuMVosGVW59JErlzmwBmkp+62VRV8AM=; b=nssL1ALbxlgpTpf1tbRYc0ysX/
	MAxGM1jiZ+nzmgePl9UWCCcya9OjCX43GiBl6/ZDoV7w2p0Ag4coB2A3xTdULH5x3WQEjjqowVAj4
	T8oEs6nejaEWakd4cCXocrG6mdqzJ05iwca6Bp09Tl7jXmulpCUH633kWGp1LoCuZJ2NWCwMYMgfN
	I0GSFdTBAfKtXmlOWwK0840LWTVdQXygKI4ESoJFRN0hmt8F1MmKsyZuYLwgLYW8ouW8VoZfi5pqE
	HSybyof4xYUdD/Uy5/gvFFzaP7o4SS8Qj5oRzXsJzJyBAuwTDGp/bvx6PvxVJDDoq/QNuDm3LutsU
	Y7V0KJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bzK-0000000Gao1-2tqT;
	Fri, 18 Oct 2024 01:41:10 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bzH-0000000GamG-3zEt
	for linux-mtd@lists.infradead.org;
	Fri, 18 Oct 2024 01:41:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XV6pN6jkDz20qQy;
	Fri, 18 Oct 2024 09:40:12 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D2C731A0188;
	Fri, 18 Oct 2024 09:40:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Oct 2024 09:40:58 +0800
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Waqar Hameed <waqar.hameed@axis.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
 <5173d3d2-4a6b-8b0b-c8f7-8034c9763532@huawei.com> <pnd7ca9r0pt.fsf@axis.com>
 <239af2ee-c18d-414f-099f-2c82f98d9671@huawei.com> <pnd7ca6wp9r.fsf@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b3b80d1c-6c99-5d47-cba0-3be14ff79c36@huawei.com>
Date: Fri, 18 Oct 2024 09:40:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <pnd7ca6wp9r.fsf@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_184108_449158_BC74C32E 
X-CRM114-Status: GOOD (  23.87  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xMC8xOCAyOjM2LCBXYXFhciBIYW1lZWQg0LS1wDoKPiBPbiBXZWQsIE9jdCAxNiwg
MjAyNCBhdCAxMDoxMSArMDgwMCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
PiB3cm90ZToKPiAKPiBbLi4uXQo+IAo+PiBCVFcsIHdoYXQgaXMgdGhlIGNvbmZpZ3VyYXRpb24g
b2YgeW91ciBmbGFzaD8oZWcuIGVyYXNlIHNpemUsIHBhZ2Ugc2l6ZSk/Cj4gCj4gJCBtdGRpbmZv
IC9kZXYvbXRkMgo+ICAgIG10ZDIKPiAgICBOYW1lOiAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZpcm13YXJlCj4gICAgVHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICBuYW5kCj4gICAg
RXJhc2VibG9jayBzaXplOiAgICAgICAgICAgICAgICAxMzEwNzIgYnl0ZXMsIDEyOC4wIEtpQgo+
ICAgIEFtb3VudCBvZiBlcmFzZWJsb2NrczogICAgICAgICAgMTgzMiAoMjQwMTIzOTA0IGJ5dGVz
LCAyMjkuMCBNaUIpCj4gICAgTWluaW11bSBpbnB1dC9vdXRwdXQgdW5pdCBzaXplOiAyMDQ4IGJ5
dGVzCj4gICAgU3ViLXBhZ2Ugc2l6ZTogICAgICAgICAgICAgICAgICAyMDQ4IGJ5dGVzCj4gICAg
T09CIHNpemU6ICAgICAgICAgICAgICAgICAgICAgICA2NCBieXRlcwo+ICAgIENoYXJhY3RlciBk
ZXZpY2UgbWFqb3IvbWlub3I6ICAgOTA6NAo+ICAgIEJhZCBibG9ja3MgYXJlIGFsbG93ZWQ6ICAg
ICAgICAgdHJ1ZQo+ICAgIERldmljZSBpcyB3cml0YWJsZTogICAgICAgICAgICAgdHJ1ZQo+IAo+
ICQgdWJpbmZvIC9kZXYvdWJpMF8wCj4gICAgVm9sdW1lIElEOiAgIDAgKG9uIHViaTApCj4gICAg
VHlwZTogICAgICAgIGR5bmFtaWMKPiAgICBBbGlnbm1lbnQ6ICAgMQo+ICAgIFNpemU6ICAgICAg
ICA2NjEgTEVCcyAoODM5MzExMzYgYnl0ZXMsIDgwLjAgTWlCKQo+ICAgIFN0YXRlOiAgICAgICBP
Swo+ICAgIE5hbWU6ICAgICAgICB0ZXN0LXZvbAo+ICAgIENoYXJhY3RlciBkZXZpY2UgbWFqb3Iv
bWlub3I6IDI0NDoxCj4gCj4gWy4uLl0KClRoYW5rcywgSSB3aWxsIGNoYW5nZSBteSBuYW5kc2lt
IGNvbmZpZ3VyYXRpb25zIHRvIGdlbmVyYXRlIGEgbXRkIGRldmljZSAKdGhlIHNhbWUgbW9kZWwu
Cj4gCj4+IFdlbGwsIGxldCdzIGRvIGEgcHJlbGltaW5hcnkgYW5hbHlzaXMuCj4+IFRoZSB6bm9k
ZS0+Y3BhcmVudFt6bm9kZS0+Y2lpcF0gaXMgYSBmcmVlZCBhZGRyZXNzIGluIHdyaXRlX2luZGV4
KCksIHdoaWNoCj4+IG1lYW5zOgo+PiAxLiAnem5vZGUtPmNpaXAnIGlzIHZhbGlkLCB6bm9kZS0+
Y3BhcmVudCBpcyBmcmVlZCBieSB0bmNfZGVsZXRlLCBob3dldmVyIHpub2RlCj4+IGNhbm5vdCBi
ZSBmcmVlZCBpZiB6bm9kZS0+Y25leHQgaXMgbm90IE5VTEwsIHdoaWNoIG1lYW5zOgo+PiAgICBh
KSAnem5vZGUtPmNwYXJlbnQnIGlzIG5vdCBkaXJ0eSwgd2Ugc2hvdWxkIGFkZCBhbiBhc3NlcnRp
b24gbGlrZQo+PiAgICB1Ymlmc19hc3NlcnQoYywgdWJpZnNfem5fZGlydHkoem5vZGUtPmNwYXJl
bnQpKSBpbiBnZXRfem5vZGVzX3RvX2NvbW1pdCgpLgo+PiAgICBOb3RlLCBwbGVhc2UgY2hlY2sg
dGhhdCAnem5vZGUtPmNwYXJlbnQnIGlzIG5vdCBOVUxMIGJlZm9yZSB0aGUgYXNzZXJ0aW9uLgo+
PiAgICBiKSAnem5vZGUtPmNwYXJlbnQnIGlzIGRpcnR5LCBidXQgaXQgaXMgbm90IGFkZGVkIGlu
dG8gbGlzdCAnYy0+Y25leHQnLCB3ZQo+PiAgICBzaG91bGQgdHJhdmVyc2UgdGhlIGVudGlyZSBU
TkMgaW4gZ2V0X3pub2Rlc190b19jb21taXQoKSB0byBtYWtlIHN1cmUgdGhhdCBhbGwKPj4gICAg
ZGlydHkgem5vZGVzIGFyZSBjb2xsZWN0ZWQgaW50byBsaXN0ICdjLT5jbmV4dCcsIHNvIGFub3Ro
ZXIgYXNzZXJ0aW9uIGlzCj4+ICAgbmVlZGVkLgo+PiAyLiAnem5vZGUtPmNpaXAnIGlzIGludmFs
aWQsIGFuZCB0aGUgdmFsdWUgYmV5b25kcyB0aGUgbWVtb3J5IGFyZWEgb2YKPj4gem5vZGUtPmNw
YXJlbnQuIEFsbCB6bm9kZXMgYXJlIGFsbG9jYXRlZCB3aXRoIHNpemUgb2YgJ2MtPm1heF96bm9k
ZV9zeicsIHdoaWNoCj4+IG1lYW5zIHRoYXQgJ3pub2RlLT5jaWlwJyBleGNlZWRzIHRoZSAnYy0+
ZmFudG91dCcsIHNvIHdlIGNhbiBhZGQgYW4gYXNzZXJ0aW9uCj4+IGxpa2UgdWJpZnNfYXNzZXJ0
KGMsIHpub2RlLT5jaWlwIDwgYy0+ZmFudG91dCkgaW4gZ2V0X3pub2Rlc190b19jb21taXQoKS4K
Pj4KPj4gVGhhdCdzIHdoYXQgSSBjYW4gdGhpbmsgb2YsIGFyZSB0aGVyZSBhbnkgb3RoZXIgcG9z
c2liaWxpdGllcz8KPiAKPiBJIGxvb2tlZCBhIGxpdHRsZSBtb3JlIGF0IGBnZXRfem5vZGVzX3Rv
X2NvbW1pdCgpYCB3aGVuIGFkZGluZyB0aGUKPiBhc3NlcnRzIHlvdSBzdWdnZXN0LCBhbmQgSSBo
YXZlIGEgcXVlc3Rpb246IHdoYXQgaGFwcGVucyB3aGVuCj4gYGZpbmRfbmV4dF9kaXJ0eSgpYCBy
ZXR1cm5zIGBOVUxMYD8gSW4gdGhhdCBjYXNlCj4gCj4gYGBgCj4gem5vZGUtPmNuZXh0ID0gYy0+
Y25leHQ7Cj4gYGBgCj4gCj4gYnV0IGB6bm9kZS0+Y3BhcmVudGAgYW5kIGB6bm9kZS0+Y2lpcGAg
YXJlIG5vdCB1cGRhdGVkLiBTaG91bGRuJ3QgdGhleT8KCkdvb2QgdGhpbmtpbmcuCkFjY29yZGlu
ZyB0byB0aGUgaW1wbGVtZW50YXRpb24gb2YgZmluZF9uZXh0X2RpcnR5KCksIHRoZSBvcmRlciBv
ZiBkaXJ0eSAKem5vZGVzIGNvbGxlY3Rpb24gaXMgYm90dG9tLXVwLCB3aGljaCBtZWFucyB0aGF0
IHRoZSBsYXN0IGRpcnR5IHpub2RlIGlzIAp0aGUgcm9vdCB6bm9kZSwgc28gaXQgZG9lc24ndCBo
YXZlIGEgcGFyZW50LiBZb3UgY2FuIHZlcmlmeSB0aGF0IGJ5IAphZGRpbmcgYXNzZXJ0aW9uIHRv
IGNoZWNrIHdoZXRoZXIgdGhlIGxhc3QgZGlydHkgem5vZGUgaXMgdGhlIHJvb3QuCj4gCj4gQnkg
dGhlIHdheSwgSSBsZWZ0IGEgdGVzdCBydW5uaW5nLCBhbmQgaXQgYWN0dWFsbHkgdHJpZ2dlcmVk
IHRoZSBzYW1lCj4gS0FTQU4gcmVwb3J0IGFmdGVyIDgwMCBpdGVyYXRpb25zLi4uIFNvIHdlIG5v
dyBhdCBsZWFzdCBrbm93IHRoYXQgdGhpcwo+IHBhdGNoIGRvZXNuJ3QgaW5kZWVkIGZpeCB0aGUg
cHJvYmxlbS4KPiAKPiBJIGFsc28gZm91bmQgYW5vdGhlciBtaW5vciB0aGluZyByZWdhcmRpbmcg
dGhlIHVwZGF0ZSBvZiBgY250YCBpbgo+IGBnZXRfem5vZGVzX3RvX2NvbW1pdGAuIEknbGwgc2Vu
ZCBhIHNlcGFyYXRlIHBhdGNoIGZvciB0aGF0Lgo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
