Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED70C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6mqRQ91obqDfnw6kQ4ii9mMB94nVaygFwqbvugY2MU=; b=Lse++XI8Udrd/gA2ku7XEuAKHu
	Rm60LlKNnzHW0yhzafgvHWtjN4C+602Qm27nlhpad6Rf2CfRMIBgVANBQe6CqbAhvLNjOxKIOMTaR
	HlsO8B6nn4sQS2WpDsQwhjoEM2noOpJQ5TaIUs1QAoLmLdoN2bao+BYtMzUvEvfydsNIGd+jnV2bO
	8YGVJduExbdPZ7vDZjvZRxGGaNwkPzWeBsq+l85abA/Xxkm8na1tID1AtTvMhIgvazPm16yp1hNI6
	eQj5U/wH71jtydXI1odjwl0IMqINyiadhtAH6fgzdxj859AqrnCVZLX8pUkNbD6opw1Nt1K+tnL5s
	kZn7Juag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCps-0000000B10j-0NDL;
	Mon, 17 Jun 2024 13:55:52 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCpn-0000000B0yT-0xRk
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 13:55:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4W2rsh5rwlzPrHv;
	Mon, 17 Jun 2024 21:52:08 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 8199218006C;
	Mon, 17 Jun 2024 21:55:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 21:55:38 +0800
Subject: Re: Lots of fastmap writes
To: Rickard x Andersson <rickaran@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <rickard314.andersson@gmail.com>
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
 <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
 <f92bb95d-05a1-315b-000c-5189004175d5@huawei.com>
 <aad1b520-ee9e-476f-911b-45be9eb09195@axis.com>
 <a8bf10e3-009f-3d4b-fa4b-43bbc6e1bebc@huawei.com>
 <0a53be8a-6d21-0ae3-a013-e1155140c889@axis.com>
 <ab27b215-8069-02cf-6bfa-9c8d85aea697@huawei.com>
 <60ebb822-3161-f9b1-59df-fcc9b5e0e24e@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9cf2cb43-e5e1-0ed9-f795-ffd9f58bae6d@huawei.com>
Date: Mon, 17 Jun 2024 21:55:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <60ebb822-3161-f9b1-59df-fcc9b5e0e24e@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_065547_581209_23683226 
X-CRM114-Status: GOOD (  11.92  )
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

5ZyoIDIwMjQvNi8xNyAyMTo0OCwgUmlja2FyZCB4IEFuZGVyc3NvbiDlhpnpgZM6Cj4gT24gNi8x
Ny8yNCAxNToyMSwgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiDlnKggMjAyNC82LzE3IDE5OjIwLCBS
aWNrYXJkIHggQW5kZXJzc29uIOWGmemBkzoKPj4+IE9uIDYvMTQvMjQgMTQ6MjgsIFpoaWhhbyBD
aGVuZyB3cm90ZToKPj4+PiDlnKggMjAyNC82LzE0IDE5OjQyLCBSaWNrYXJkIFggQW5kZXJzc29u
IOWGmemBkzoKPj4+Pj4gT24gNi80LzI0IDAzOjUyLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+Pj4K
Pj4+PiBbLi4uXQo+Pj4+Pj4KPj4+Pj4+IEJUVywgYWZ0ZXIgYXBwbHlpbmcgdGhlIHBhdGNoZXMs
IHRoZSBrZXJuZWwgc2hvdWxkIHJ1biBvbiBhIG5ldyAKPj4+Pj4+IGZsYXNoLCB0aGUgaW1wcm92
ZWQgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0gY2Fubm90IHJlc2N1ZSB0aGUgd29ybiAKPj4+Pj4+
IG91dCBpbWFnZS4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5rcyBmb3IgdGhlIHBhdGNoZXMhCj4+
Pj4+Cj4+Pj4+IEkgaGF2ZSBiYWNrcG9ydGVkIHRoZSBwYXRjaGVzIHRvIExpbnV4IGtlcm5lbCA2
LjEuIERvIHlvdSB0aGluayB0aGUgCj4+Pj4+IHBhdGNoZXMgYXJlIHNhZmUgdG8gYXBwbHkgdG8g
TGludXgga2VybmVsIDYuMT8KPj4+Pgo+Pj4+IFllcywgaXQncyBva2F5LiBJIGhhdmUgYmFja3Bv
cnRlZCB0aGUgcGF0Y2hlcyB0byBvdXIgcHJvZHVjdChrZXJuZWwgCj4+Pj4gdjUuMTApIGFuZCBp
dCB3b3JrcyBmaW5lLgo+Pj4KPj4+IFRoYW5rcyEgSSBiYWNrcG9ydGVkIHRoZSBwYXRjaGVzIHRv
IExpbnV4IDYuMSBhbmQgZGlkIHJ1biBteSBvd24gCj4+PiBzdHJlc3MgdGVzdCBmb3IgYSBmZXcg
ZGF5cy4gKE9uIGFub3RoZXIgZGV2aWNlIHdpdGggZnJlc2ggZmxhc2ggCj4+PiBtZW1vcnkuKSBJ
dCBzZWVtcyBsaWtlIHRoZSB3ZWFyIG9mIHRoZSBmYXN0bWFwIHBoeXNpY2FsIGJsb2NrcyAoMC02
MykgCj4+PiBpcyBhIGxvdCBsZXNzIG5vdyB3aXRoIHRoZSBwYXRjaGVzIGFwcGxpZWQsIHdoaWNo
IGlzIGdvb2QuCj4+Pgo+Pj4gSG93ZXZlciBJIGdvdCB0aGlzIHByb2JsZW0gYWZ0ZXIgYWxtb3N0
IDMgZGF5cyBvZiBzdHJlc3MgdGVzdGluZyAKPj4+IChmaWxlIHN5c3RlbSBpcyBzZXQgdG8gcmVh
ZCBvbmx5IG1vZGUpOgo+Pj4KPj4+Cj4+PiBbIDc4ODUuMDM2NTc3XVvCoCBUMTgyXSB1YmkyOiBz
Y3J1YmJlZCBQRUIgMjkwNCAoTEVCIDA6MjI5KSwgZGF0YSAKPj4+IG1vdmVkIHRvIFBFQiA2MjcK
Pj4+IFs4MzcyMS43MjQ2MjFdW8KgIFQxODJdIHViaTI6IHNjcnViYmVkIFBFQiA5ODMgKExFQiAw
OjMyNDApLCBkYXRhIAo+Pj4gbW92ZWQgdG8gUEVCIDcKPj4+IFs4MzcyMS44MzI1MjFdW8KgIFQx
ODJdIHViaTI6IHNjcnViYmVkIFBFQiA5OTcgKExFQiAwOjI4MTkpLCBkYXRhIAo+Pj4gbW92ZWQg
dG8gUEVCIDUKPj4+IFs4Mzc4NC43NTA3MTRdW8KgIFQxODJdIHViaTI6IHNjcnViYmVkIFBFQiAx
OTI3IChMRUIgMDoxMCksIGRhdGEgbW92ZWQgCj4+PiB0byBQRUIgMgo+Pj4gWzE2NTgxMi42NTc5
MzRdW8KgIFQxODJdIHViaTI6IHNjcnViYmVkIFBFQiAzNjkxIChMRUIgMDoxMSksIGRhdGEgCj4+
PiBtb3ZlZCB0byBQRUIgMTgKPj4+IFsxNjY3NDguMDU1MjQyXVvCoCBUMTgyXSB1YmkyOiBzY3J1
YmJlZCBQRUIgMzA0NSAoTEVCIDA6MiksIGRhdGEgbW92ZWQgCj4+PiB0byBQRUIgODM3Cj4+PiBb
MTY2ODM0Ljc0MjQ1MV1bwqAgVDE4Ml0gdWJpMjogc2NydWJiZWQgUEVCIDkxOCAoTEVCIDA6Miks
IGRhdGEgbW92ZWQgCj4+PiB0byBQRUIgNDMKPj4KPj4gTG9va3MgbGlrZSB0aGF0IHNvbWUgb2Yg
UEVCcyBoYXZlIG1ldCB0aGUgYml0ZmxpcCBlcnJvcnMuCj4gCj4gT25lIHRoaW5nIHRoYXQgc3Ry
dWNrIG1lLiBXaGVuIGxvb2tpbmcgYXQgdGhlIHNjcnViYmluZyBiZWluZyBkb25lIAo+IGFib3Zl
LCBpcyBpdCBub3Qgc3RyYW5nZSB0aGF0IGRhdGEgaXMgbW92ZWQgZnJvbSBwaHlzaWNhbCBQRUJz
IG91dHNpZGUgCj4gZmFzdG1hcCBhcmVhIGludG8gdGhlIGZhc3RtYXAgYXJlYT8gRm9yIGV4YW1w
bGUgZnJvbSBQRUIgOTk3IHRvIFBFQiA1PwoKWWVzLCBpdCBpcyBleHBlY3RlZC4gVGhlIGZpcnN0
IDY0IFBFQnMgdXNhbGx5IGhhdmUgYmlnZ2VyIGVyYXNlIGNvdW50ZXIsIApzbyBVQkkgbW92ZXMg
Y29sZCBkYXRhIGludG8gYmlnZ2VyIGVjIFBFQiwgaXQgaXMgdGhlIHBhcnQgb2YgCndlYXItbGV2
ZWxpbmcgYWxnb3JpdGhtLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
