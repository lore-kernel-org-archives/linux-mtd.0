Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29434CEDDB7
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2024 02:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmkk8eKfudlLzhB6vZ+781ey1UwhCnHvrY9XM6r+YLQ=; b=H8xjl/5/Q9OuL2BdCeP/4KwhfC
	evGsh/FW6NFGJZbVMVegB7s8pop8aZvAH4PnmKRVj+TBp5bHDrRcGtdK19X+YUO4t2PMSfUrEFFTG
	o2/69Yod/0ieVrAHfknut1LqxHwG11tYe6gWnM2l83kHdp5NiznvPeYoH5HqYORLYEdFZAxlHaJ1U
	GkNAC8x0ilxt6FvAlxiPwy0n+pw+zGtxX5Obd8EfTvQYEIziTEj/0crZpvfLcdetZp4waJpsOuv+G
	6RV4zLljihVSR4MZV3Mq1ge/NuA8a3OU84Ux7bvjhCQ7aVMXZzgvDyEazWVt5dZS7pgVl6L9+OGrg
	ntQqbolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syiwe-0000000BII6-35Pk;
	Thu, 10 Oct 2024 02:30:28 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syiwa-0000000BIGN-0w3E
	for linux-mtd@lists.infradead.org;
	Thu, 10 Oct 2024 02:30:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XPDGQ38Tyz2DdJt;
	Thu, 10 Oct 2024 10:29:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 85D871A016C;
	Thu, 10 Oct 2024 10:30:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Oct 2024 10:30:07 +0800
Subject: Re: [PATCH 1/1] ubifs: Try to recover from missing znode
To: Benedikt Spranger <b.spranger@linutronix.de>
CC: Richard Weinberger <richard@nod.at>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
References: <20241008133342.1937674-1-b.spranger@linutronix.de>
 <0840be30-63bc-449d-a9a4-c4e6b54c8885@huawei.com>
 <883601802.30668.1728453832223.JavaMail.zimbra@nod.at>
 <351bdd98-98ac-036f-4685-56e88a102cf3@huawei.com>
 <20241009144900.367f9cb4@mitra>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fe73967e-875b-590b-946d-33028cd43c9d@huawei.com>
Date: Thu, 10 Oct 2024 10:30:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241009144900.367f9cb4@mitra>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_193024_812870_F58C1CB5 
X-CRM114-Status: GOOD (  17.04  )
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

5ZyoIDIwMjQvMTAvOSAyMDo0OSwgQmVuZWRpa3QgU3ByYW5nZXIg5YaZ6YGTOgo+IE9uIFdlZCwg
OSBPY3QgMjAyNCAxODo0Njo0MyArMDgwMAo+IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+IHdyb3RlOgo+IAo+PiDlnKggMjAyNC8xMC85IDE0OjAzLCBSaWNoYXJkIFdlaW5i
ZXJnZXIg5YaZ6YGTOgo+Pj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4+IFZv
bjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+Pj4+IEFuOiAiQmVu
ZWRpa3QgU3ByYW5nZXIiIDxiLnNwcmFuZ2VyQGxpbnV0cm9uaXguZGU+LCAibGludXgta2VybmVs
Igo+Pj4+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiBDQzogImxpbnV4LW10ZCIKPj4+
PiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9k
LmF0Pgo+Pj4+IEdlc2VuZGV0OiBNaXR0d29jaCwgOS4gT2t0b2JlciAyMDI0IDA0OjIzOjAyIEJl
dHJlZmY6IFJlOiBbUEFUQ0gKPj4+PiAxLzFdIHViaWZzOiBUcnkgdG8gcmVjb3ZlciBmcm9tIG1p
c3Npbmcgem5vZGUKPj4+Cj4+Pj4g5ZyoIDIwMjQvMTAvOCAyMTozMywgQmVuZWRpa3QgU3ByYW5n
ZXIg5YaZ6YGTOgo+Pj4+PiBBZnRlciBwb3dlcmN1dCBvbiBhIHN5c3RlbSB1c2luZyB1YmlmcyBt
b3VudGluZyBmYWlsZWQ6Cj4+Pj4+Cj4+Pj4+IDIwMjQtMDktMzBUMTI6Mzg6MjYuODgwNDg3KzAy
OjAwIHNvbmphIGtlcm5lbDogVUJJRlMgZXJyb3IKPj4+Pj4gKHViaTA6MCBwaWQgMjE3OCk6IHVi
aWZzX3JlYWRfbm9kZSBbdWJpZnNdOiBiYWQgbm9kZSB0eXBlICgyNTUKPj4+Pj4gYnV0IGV4cGVj
dGVkIDkpIDIwMjQtMDktMzBUMTI6Mzg6MjYuODgwNTA2KzAyOjAwIHNvbmphIGtlcm5lbDoKPj4+
Pj4gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMjE3OCk6IHViaWZzX3JlYWRfbm9kZSBbdWJpZnNd
OiBiYWQgbm9kZQo+Pj4+PiBhdCBMRUIgMTAzOjQ2OTIwLCBMRUIgbWFwcGluZyBzdGF0dXMgMAo+
Pj4+PiAyMDI0LTA5LTMwVDEyOjM4OjI2Ljg4MDUwOSswMjowMCBzb25qYSBrZXJuZWw6IE5vdCBh
IG5vZGUsIGZpcnN0Cj4+Pj4+IDI0IGJ5dGVzOiAyMDI0LTA5LTMwVDEyOjM4OjI2Ljg4MDUxMCsw
MjowMCBzb25qYSBrZXJuZWw6Cj4+Pj4+IDAwMDAwMDAwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgo+Pj4+PiBmZiBmZiBmZiBmZiBmZiBmZiAu
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4KPj4+Pj4KPj4+Pj4gV2hpbGUgdHJhdmVyc2luZyBvdmVy
IHpicmFuY2hlcyBkdXJpbmcgdGhlIGpvdXJuYWwgcmVwbGF5IG9uZQo+Pj4+PiB6YnJhbmNoIHBv
aW50cyB0byBhIHpub2RlLCB3aGljaCB3YXMgbm90IHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZAo+
Pj4+PiB0aGVyZWZvcmUgdGhlIGZsYXNoIGlzIGVtcHR5Lgo+Pj4+Cj4+Pj4gVUJJRlMgZ3VhcmFu
dGVlcyB0d28gdGhpbmdzIGZvciB6bm9kZXM6Cj4+Pj4gMSkgYWxsIGluZGV4IG5vZGVzKGluIGNv
bW1pdCBzZXEgTikgYXJlIHdyaXR0ZW4gb24gZmxhc2ggYmVmb3JlCj4+Pj4gbWFzdGVyIG5vZGVz
KGZvciBjb21taXQgc2VxIE4pIGFyZSB3cml0dGVuLgo+Pj4+IDIpIGFsbCBpbmRleCBub2Rlcyhp
biBjb21taXQgc2VxIE4pIHdvbid0IGJlIGVyYXNlZCBmcm9tIGZsYXNoCj4+Pj4gYmVmb3JlIG1h
c3RlciBub2Rlcyhmb3IgY29tbWl0IHNlcSBOKzEpIGFyZSB3cml0dGVuLgo+Pj4+IFNvLCBJIGRv
bid0IHVuZGVyc3RhbmQgdGhhdCB3aHkgem5vZGVzIG5vdCBleGlzdCBkdXJpbmcgam91cm5hbAo+
Pj4+IHJlcGxheWluZz8KPj4+Cj4+PiBJbiBhZGRpdGlvbiB0byB0aGF0LCBpcyBqdXN0IG9uZSB6
bm9kZSBtaXNzaW5nIG9yIGFyZSBsYXJnZXIgcGFydHMKPj4+IG9mIHRoZSBmbGFzaCBlbXB0eT8K
PiAKPiBTb21lIGJhY2tncm91bmQ6Cj4gVGhlIHN5c3RlbSBwcm9kdWNpbmcgdGhlIGJyb2tlbiBp
bWFnZSBydW5zIG9uIGFuIG9sZGVyIGtlcm5lbCB2ZXJzaW9uCj4gKDQuOS4yODYtcnQxODkpLiBB
dHRhY2hpbmcgVUJJIHBlcmZvcm1zIHdpdGhvdXQgYW55IGVycm9yLiBJdCBzZWVtcywKPiB0aGF0
IHRoZXJlIGlzIG9ubHkgb25lIHpub2RlIG1pc3NpbmcuIFRoZXJlIGFyZSBlbXB0eSBwYXJ0cyBv
biB0aGUKPiBmbGFzaCwgYnV0IGFzIGZhciBhcyBJIGNhbiBzZWUgYWxsIFBFQnMgaGF2ZSBVQkkg
aGVhZGVyIEluZm9ybWF0aW9uLgo+IFRoZSBtaXNzaW5nIHpub2RlIGlzIHNvbWV3aGVyZSBpbiB0
aCBtaWRkbGUgb2YgYW4gUEVCIGFuZCBvdGhlciB6bm9kZXMKPiBhcmUgaW4gdGhhdCBQRUIuCj4g
Cj4+IEFmdGVyIHJldmlld2luZyB0aGUgVE5DIHJlbGF0ZWQgY29kZSwgSSBjYW5ub3QgZmluZCBv
dXQgYW55IGlsbGVnYWwKPj4gYmVoYXZpb3JzIHRvIG1ha2Ugem5vZGUgbG9zdCBvciB2YWxpZCBp
bmRleCBMRUIgZXJhc2VkLgo+IE9LLiBJcyBpdCBwb3NzaWJsZSwgdGhhdCB0aGlzIGJlaGF2aW91
ciBpcyBjYXVzZWQgYnkgYSBhbHJlYWR5IGZpeGVkCj4gYnVnPyBUaGlzIGhhcHBlbmQgb24gYSBz
eXN0ZW0gcnVubmluZyA0LjkuMjg2LXJ0MTg5LgoKSSBmb3VuZCBvbmUgcGF0Y2ggWzFdLCB3aGlj
aCBmaXhlcyBhIGRhdGEgbG9zdCBwcm9ibGVtIHdoaWxlIHdyaXRpbmcgZmFpbGVkLgoKWzFdIApo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9oPXY2LjEyLXJjMiZpZD0zMWExNDlkNWMxM2M0Y2JjZjk3ZGUzNDM1
ODE3MjYzYTJkOGM5ZDZlCj4gCj4+IEhpIEJlbmVkaWt0LCBjb3VsZCB5b3UgcHJvdmlkZSBhIGNv
cnJ1cHRlZCBVQklGUyBpbWFnZT8gTGV0IG1lIHRyeQo+PiBnZXR0aW5nIG1vcmUgaW5mb3JtYXRp
b24uCj4gSSBuZWVkIHRvIGNsYXJpZnkgdGhpcy4KPiAKPiBSZWdhcmRzCj4gICAgICBCZW5lZGlr
dCBTcHJhbmdlcgo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
