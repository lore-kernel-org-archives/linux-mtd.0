Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA556D6100C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdiO3W06+3x9IJk3VDLjRGrXHByg5Y97uXjxWTSiM8Q=; b=xQEqJaxVzNi/cN
	TOIwCPpt8SJKbVWP0VYVQLjjMq7pVbryN6kSyXsLtau8NXn/nvoHdw5XoOfz4CFdWrt8b6UpXTRtL
	iBUUee3jwd6OrCKBdMoqy40vJw2Ku+ffUnTrsh/9mKMc5DYA6FoAIAhRkH5M24f/3GKCWi5klHywg
	3zC1IcKwfHv5b3Ki2534FpGkea02WKNRp/5j9sFuwD1mYTkQl1N0Qxr/q6ayZOJaoBPuKSb4wEWzw
	iOSMWd3v1EnFnaSvxxdWI6w40aMtFhjjwuTb8FYNhf9/PXNE0wKcMyUIeQqVl41a4mhNZo7/3pH4q
	kiktu+d6+mkE2XO/iz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRRm-000000007Ni-0fA7;
	Thu, 29 Jan 2026 12:48:30 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRRi-000000007NI-0ELx
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 12:48:27 +0000
X-QQ-mid: zesmtpgz9t1769690855t60ab1644
X-QQ-Originating-IP: wYyPjWPI//T2UB90xXQhGRavoGv4dQM9a2sofjs/Waw=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jan 2026 20:47:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1389357313924058083
EX-QQ-RecipientCnt: 10
Message-ID: <2397C90D8A633438+88e8956b-5753-4842-a1c7-b0f6a78580c1@radxa.com>
Date: Thu, 29 Jan 2026 20:47:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MgDzoWPZpMu1Vduoi8VZqzB1qT3rNCGCxMjS4QKsCZieNWylTA2vYZ+3
	Q8rwTLRvZlv1kdKoMKszowVLNOTz73m/9hzv6cGXruE6DT4RpW0Wsw8NwA2PbMYO4ndgjOV
	Z6MCBWm1XE7iJ+fMn2HtP/4+YnanhDm/hd8b4ATUzmehhP3WsYAEiDIR0uNV06CL1O9veIF
	v9hIqGoMfKzN2W1UJr+3tPISguM5OQl1C9ZcwgB+lDWlYz6c04I7XhrBMFlbgTm6r0Y8UAV
	EUcbPp9srh+Kgi5LZc0r+tEZFq/P44ayPY+dg+lpODglAj88T2+lVsqRKLNX1zlRyL9pyE/
	d2dBgHGheB57yTXVEX0vef3HdedyRU0D1fYW8Lc2HCAwUgEYjzU+wqcMCUyS+3ZTABQsPL+
	8ozSaeoHcqbK9yIUGW+UKAOlqFNetV6NMl8+Czrokoch8LLQEml/9YDNCGeu5ht3todY8sz
	h8r+pGr084RErVCpSPMd+OoSXJeLqbH0JSf8QUBn9tadh2avp73k4wZIzeuEipZhtR/VRMM
	n29ptyDfAN6UanHJu26inUHe5q6zV+j2C+w2RZnm/QmrNOQnsDH68r+J6DvRnA7E5HnkXz7
	8Z6h8i2fW+jmqBgdOK4TlavftzW+6037F2zeIlUYX3sFCe3mSay8HdLvdRyQ2SCI6JjajxI
	+RiOZEN3fbZGf6wepkXQXxYq3BpzRZkcLSfS7rfmifAiz18nGxtNuwyRFX1sRw4sVmpjDlZ
	r18CFiyWpFaeLO7v8lRDCw6WU2RB1U0yJFXTb+V26y2YNtefFO+7kQCS/xCfuRhx+VEwkWX
	X/PB0lt4egYL8ZslHu/AHopxiE2o10ZMgB0YyGldfQwT12sCTFq9NNKDJv5hG2pX8eGk5rV
	YPKj6wTjTWzzZpIECjvbSRrgrWGNKKAvQhhkKPRzLdnlyBbKzFyGPxedPnjx5pU294ZdF1O
	U0p4ZJ1IQF6jfQedIYjCPxb+FUDTD5TMHfKu+eTCpnurtXzRf69nHM+16/1KQueaBXYAR3U
	pqMRTopf9yhaDfUkfx
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_044826_609413_6CBADAAC 
X-CRM114-Status: GOOD (  18.23  )
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

T24gMjAyNi8xLzI5IDU6NDMsIFRyaWxvayBTb25pIHdyb3RlOgoKPiBPbiAxLzI2LzIwMjYgMzo0
NCBBTSwgSnVuaGFvIFhpZSB3cm90ZToKPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0
IGZvciBhY2Nlc3Npbmcgc3RvcmFnZSBkZXZpY2VzIG1hbmFnZWQgYnkKPj4gUXVhbGNvbW0gVHJ1
c3Rab25lIGZpcm13YXJlIHZpYSBTQ00gKFNlY3VyZSBDaGFubmVsIE1hbmFnZXIpIGJ5Cj4+IGlu
dHJvZHVjaW5nIGEgbmV3IE1URCBkcml2ZXIuCj4+Cj4+IE9uIHNvbWUgUXVhbGNvbW0gcGxhdGZv
cm1zLCBmaXJtd2FyZSBvciBCSU9TLXJlbGF0ZWQgc3RvcmFnZSAodHlwaWNhbGx5Cj4+IFNQSSBO
T1IgZmxhc2gpIGlzIG5vdCBkaXJlY3RseSBhY2Nlc3NpYmxlIGZyb20gdGhlIG5vbi1zZWN1cmUg
d29ybGQuCj4+IEFsbCByZWFkLCB3cml0ZSwgYW5kIGVyYXNlIG9wZXJhdGlvbnMgbXVzdCBiZSBw
ZXJmb3JtZWQgdGhyb3VnaCBTQ00KPj4gaW50ZXJmYWNlcyBwcm92aWRlZCBieSB0aGUgc2VjdXJl
IGZpcm13YXJlLiBBcyBhIHJlc3VsdCwgZXhpc3RpbmcgTVRECj4+IFNQSSBOT1IgZHJpdmVycyBj
YW5ub3QgYmUgdXNlZCBkaXJlY3RseSBvbiB0aGVzZSBzeXN0ZW1zLgo+Pgo+PiBUaGlzIHNlcmll
cyBpbnRyb2R1Y2VzIGEgbmV3IE1URCBkZXZpY2UgZHJpdmVyIHRoYXQgZXhwb3NlcyBzdWNoCj4+
IGZpcm13YXJlLW1hbmFnZWQgc3RvcmFnZSBhcyBhIHN0YW5kYXJkIE1URCBkZXZpY2UgaW4gdGhl
IExpbnV4IGtlcm5lbC4KPj4gVGhlIGRyaXZlciBpcyBidWlsdCBvbiB0b3Agb2YgdGhlIGV4aXN0
aW5nIFF1YWxjb21tIFNDTSBpbmZyYXN0cnVjdHVyZQo+PiBhbmQgaW50ZWdyYXRlcyB3aXRoIHRo
ZSBNVEQgc3Vic3lzdGVtIHRvIHByb3ZpZGUgYSB1bmlmb3JtIGludGVyZmFjZSB0bwo+PiB1c2Vy
c3BhY2UuCj4+Cj4+IFRoaXMgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCBvbiBSYWR4YSBEcmFnb24g
UTZBLCBiYXNlZCBvbiB0aGUgUXVhbGNvbW0KPj4gUUNTNjQ5MCBTb0MsIHdpdGggYSBXaW5ib25k
IFcyNVEyNTZKV1BJUSBTUEkgTk9SIGZsYXNoIGRldmljZS4KPj4KPj4gTm90ZSB0aGF0IHRoaXMg
cGxhdGZvcm0gcHJldmlvdXNseSB1c2VkIHRoZSBzdGFuZGFyZCBRdWFsY29tbSBMaW51eAo+PiBm
aXJtd2FyZSwgd2hpY2ggYWxsb3dlZCBkaXJlY3QgYWNjZXNzIHRvIHRoZSBRU1BJIGNvbnRyb2xs
ZXIgd2l0aG91dAo+PiBuZWVkaW5nIHRoaXMgZHJpdmVyLiBIb3dldmVyLCB3ZSBwbGFuIHRvIG1p
Z3JhdGUgdG8gYSBXaW5kb3dzLWNvbXBhdGlibGUKPj4gZmlybXdhcmUgd2hpY2ggaXMgbW9yZSBm
ZWF0dXJlLWNvbXBsZXRlIGJ1dCByZXN0cmljdHMgZGlyZWN0IGFjY2Vzcy4KPj4gRGV2aWNlIHRy
ZWUgY2hhbmdlcyBmb3IgdGhpcyB0cmFuc2l0aW9uIHdpbGwgYmUgc2VudCBzZXBhcmF0ZWx5Lgo+
Pgo+PiBJZiBrZXJuZWwgYm9vdHMgd2l0aCBFTDIsIGFjY2VzcyB0byB0aGUgU0NNIHN0b3JhZ2Ug
d2lsbCBiZSBkZW5pZWQuIFRoaXMKPj4gbmVlZHMgbW9yZSBpbnZlc3RpZ2F0aW9uLgo+IFNvIHlv
dSBwbGFuIHRvIGVuYWJsZSB0aGlzIGRyaXZlciBvbmx5IHcvIHRoZSBHdW55YWggYmFzZWQgY29u
ZmlndXJhdGlvbgo+IGFuZCBkaXNhYmxlIGZvciB0aGUgS1ZNIG9uZSB0aHJvdWdoIHRoZSBkZXZp
Y2V0cmVlIG92ZXJsYXkgPyBJIGp1c3QKPiBkb24ndCB3YW50IHRvIGJyZWFrIHRoZSBLVk0gYm9v
dCBmbG93IG9uIG90aGVyIHBsYXRmb3JtcyBzdXBwb3J0aW5nCj4gcWNzNjQ5MC4KCk9uIHN5c3Rl
bXMgYm9vdGVkIHdpdGggRUwyL0tWTSwgdGhlIFNDTSBzdG9yYWdlIEdFVF9JTkZPIGNhbGwgY3Vy
cmVudGx5CnJldHVybnMgLUVJTlZBTC4gSWYgYSBwbGF0Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IFNQ
SS1OT1Igb3IgU0NNIHN0b3JhZ2UsCl9fcWNvbV9zY21faXNfY2FsbF9hdmFpbGFibGUoKSB3aWxs
IGNhdXNlIHRoZSBpbml0aWFsaXphdGlvbiB0byBiYWlsIG91dCAKZWFybHkuCgpUaGVyZSBpcyBu
byBEVC1iYXNlZCBlbmFibGUvZGlzYWJsZSBtZWNoYW5pc20sIGFuZCB0aGlzIHNob3VsZCBub3Qg
YWZmZWN0CktWTSBib290IGZsb3cgb24gb3RoZXIgcGxhdGZvcm1zLgoKT3RoZXIgUUNTNjQ5MCBM
RSBwbGF0Zm9ybXMgZG8gbm90IHN1cHBvcnQgU0NNIHN0b3JhZ2UsIGFzIHRoZSBMRSBmaXJtd2Fy
ZQpkb2VzIG5vdCBzdXBwb3J0IFNQSS1OT1IgYm9vdC4gUmFkeGEgRHJhZ29uIFE2QSB1c2VzIFdQ
IGZpcm13YXJlIGFuZCBib290cwpmcm9tIFNQSS1OT1IuCgpUaGUgcm9vdCBjYXVzZSBvZiBTQ00g
c3RvcmFnZSBiZWluZyB1bmF2YWlsYWJsZSB1bmRlciBFTDIvS1ZNIGlzIHN0aWxsIHVuZGVyCmlu
dmVzdGlnYXRpb24uCgpbwqAgwqAgMC43NzAxMjRdIHFjb21fc2NtOiBjb252ZW50aW9uOiBzbWMg
YXJtIDY0ClvCoCDCoCAwLjc3NTAwNV0gcWNvbV9zY20gZmlybXdhcmU6c2NtOiBxc2VlY29tOiBm
b3VuZCBxc2VlY29tIHdpdGggCnZlcnNpb24gMHgxNDAyMDAwClvCoCDCoCAwLjc4Mjk5MF0gcWNv
bV9zY20gZmlybXdhcmU6c2NtOiBzY20gc3RvcmFnZSBnZXQgaW5mbyBmYWlsZWQ6IC0yMgpbwqAg
wqAgMC45OTkwOTVdIHFjb21fcXNlZWNvbSBxY29tX3FzZWVjb206IHNldHRpbmcgdXAgY2xpZW50
IGZvciAKcWNvbS50ei51ZWZpc2VjYXBwCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuCkJlc3QgcmVn
YXJkcywKSnVuaGFvIFhpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
