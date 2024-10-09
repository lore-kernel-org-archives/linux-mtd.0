Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473B7CF044A
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et6Rt2n2ESR+jqXqOapO3ZNgdzj8nHdN4Sxkl+So6CY=; b=3qfWfTRY53mHybjEpXZZBDnZhT
	gxw6zOxJAFAZ3nnNP7J7UXjXlvaRazx3u5+mvMNICJya0putH2qtyYRtGtbPfxzG7DJNSs2N8RW41
	9r4ZroMXawDCayRjpEJSwoTkD3nAy0I9RGnbjonIIZNKgwULRbxkiVjQLQNN0oBaiZWmO2xThLw/j
	Iy3cEG2bCSLtsDb9NcNZLPVbJhF1ZqPdc6rNe3FjwkTAv62EOV2vE4d6IacDsUXFE9gPv5HngpLC0
	oAJKcSA2i9OU+W1qYU4N+Kg0T4JwSIfbtLtFLMAWMxLZtEW1VH458K8zZEP8V5mgnZKjEXfwZ2VKW
	RUGD/RHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUDn-00000008w6W-04d4;
	Wed, 09 Oct 2024 10:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUDl-00000008w6J-1eLM
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Oct 2024 10:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zZxU6cUFoJJMe75+bxcvRmqMPokAhwxHdxC/QSGXSn4=; b=rCzpK9aTVz2VTlLxYPHXDK+QTW
	faUFZSykMt5Zgdgp6MG2b9SXk0A00OAFme2MBN+RPLRdE6GjiRl77ZAW60JcoVqoaVxC7Ramv53JA
	hhL54hrlxet7A7JRcvXRa5NTqDKJEzyQgpyhwXHORJKrrLORNJ/5Ref7ZsfBREMLzSvQzPuD9iXhJ
	3VPyyzkwoeAjInDSvte/ko79wHl7RzITLk2+g0H9OUPytyXIyr7JdsvZ1D858dcB3+YFQzey9QwbO
	Z4tBeKcHTDpvC4DSEJ3k03x/W7SRA6REcdBrMOduMQhixb4MtIqk/lZEC2S0ebrq9bvEkAD7k+rKX
	QUGVN9rg==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUDg-00000004ubb-3QPl
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 10:47:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XNqK91XlHz1T8Rj;
	Wed,  9 Oct 2024 18:45:01 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 85C53140360;
	Wed,  9 Oct 2024 18:46:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Oct 2024 18:46:43 +0800
Subject: Re: [PATCH 1/1] ubifs: Try to recover from missing znode
To: Richard Weinberger <richard@nod.at>
CC: Benedikt Spranger <b.spranger@linutronix.de>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
References: <20241008133342.1937674-1-b.spranger@linutronix.de>
 <0840be30-63bc-449d-a9a4-c4e6b54c8885@huawei.com>
 <883601802.30668.1728453832223.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <351bdd98-98ac-036f-4685-56e88a102cf3@huawei.com>
Date: Wed, 9 Oct 2024 18:46:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <883601802.30668.1728453832223.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_114705_603088_9540688F 
X-CRM114-Status: GOOD (  10.26  )
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

5ZyoIDIwMjQvMTAvOSAxNDowMywgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgo+PiBBbjogIkJlbmVkaWt0IFNwcmFuZ2VyIiA8Yi5zcHJhbmdlckBs
aW51dHJvbml4LmRlPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+Cj4+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAi
cmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+PiBHZXNlbmRldDogTWl0dHdvY2gsIDkuIE9rdG9i
ZXIgMjAyNCAwNDoyMzowMgo+PiBCZXRyZWZmOiBSZTogW1BBVENIIDEvMV0gdWJpZnM6IFRyeSB0
byByZWNvdmVyIGZyb20gbWlzc2luZyB6bm9kZQo+IAo+PiDlnKggMjAyNC8xMC84IDIxOjMzLCBC
ZW5lZGlrdCBTcHJhbmdlciDlhpnpgZM6Cj4+PiBBZnRlciBwb3dlcmN1dCBvbiBhIHN5c3RlbSB1
c2luZyB1YmlmcyBtb3VudGluZyBmYWlsZWQ6Cj4+Pgo+Pj4gMjAyNC0wOS0zMFQxMjozODoyNi44
ODA0ODcrMDI6MDAgc29uamEga2VybmVsOiBVQklGUyBlcnJvciAodWJpMDowIHBpZCAyMTc4KToK
Pj4+IHViaWZzX3JlYWRfbm9kZSBbdWJpZnNdOiBiYWQgbm9kZSB0eXBlICgyNTUgYnV0IGV4cGVj
dGVkIDkpCj4+PiAyMDI0LTA5LTMwVDEyOjM4OjI2Ljg4MDUwNiswMjowMCBzb25qYSBrZXJuZWw6
IFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDIxNzgpOgo+Pj4gdWJpZnNfcmVhZF9ub2RlIFt1Ymlm
c106IGJhZCBub2RlIGF0IExFQiAxMDM6NDY5MjAsIExFQiBtYXBwaW5nIHN0YXR1cyAwCj4+PiAy
MDI0LTA5LTMwVDEyOjM4OjI2Ljg4MDUwOSswMjowMCBzb25qYSBrZXJuZWw6IE5vdCBhIG5vZGUs
IGZpcnN0IDI0IGJ5dGVzOgo+Pj4gMjAyNC0wOS0zMFQxMjozODoyNi44ODA1MTArMDI6MDAgc29u
amEga2VybmVsOiAwMDAwMDAwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKPj4+IGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+PiAuLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4KPj4+Cj4+PiBXaGlsZSB0cmF2ZXJzaW5nIG92ZXIgemJyYW5jaGVzIGR1cmlu
ZyB0aGUgam91cm5hbCByZXBsYXkgb25lIHpicmFuY2gKPj4+IHBvaW50cyB0byBhIHpub2RlLCB3
aGljaCB3YXMgbm90IHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZCB0aGVyZWZvcmUgdGhlCj4+PiBm
bGFzaCBpcyBlbXB0eS4KPj4KPj4gVUJJRlMgZ3VhcmFudGVlcyB0d28gdGhpbmdzIGZvciB6bm9k
ZXM6Cj4+IDEpIGFsbCBpbmRleCBub2RlcyhpbiBjb21taXQgc2VxIE4pIGFyZSB3cml0dGVuIG9u
IGZsYXNoIGJlZm9yZSBtYXN0ZXIKPj4gbm9kZXMoZm9yIGNvbW1pdCBzZXEgTikgYXJlIHdyaXR0
ZW4uCj4+IDIpIGFsbCBpbmRleCBub2RlcyhpbiBjb21taXQgc2VxIE4pIHdvbid0IGJlIGVyYXNl
ZCBmcm9tIGZsYXNoIGJlZm9yZQo+PiBtYXN0ZXIgbm9kZXMoZm9yIGNvbW1pdCBzZXEgTisxKSBh
cmUgd3JpdHRlbi4KPj4gU28sIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGF0IHdoeSB6bm9kZXMgbm90
IGV4aXN0IGR1cmluZyBqb3VybmFsIHJlcGxheWluZz8KPiAKPiBJbiBhZGRpdGlvbiB0byB0aGF0
LCBpcyBqdXN0IG9uZSB6bm9kZSBtaXNzaW5nIG9yIGFyZSBsYXJnZXIgcGFydHMgb2YgdGhlIGZs
YXNoCj4gZW1wdHk/Cj4gCgpBZnRlciByZXZpZXdpbmcgdGhlIFROQyByZWxhdGVkIGNvZGUsIEkg
Y2Fubm90IGZpbmQgb3V0IGFueSBpbGxlZ2FsIApiZWhhdmlvcnMgdG8gbWFrZSB6bm9kZSBsb3N0
IG9yIHZhbGlkIGluZGV4IExFQiBlcmFzZWQuCgpIaSBCZW5lZGlrdCwgY291bGQgeW91IHByb3Zp
ZGUgYSBjb3JydXB0ZWQgVUJJRlMgaW1hZ2U/IExldCBtZSB0cnkgCmdldHRpbmcgbW9yZSBpbmZv
cm1hdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
