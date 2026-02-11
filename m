Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A52EB596B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5cvjzVPU3UA8WPgR0ZQtESsJpzZ2JBpUqHrDeEhhvQ=; b=i+OS7yyQcKg/cih9cQ+1RvGt47
	GRJM68ra7L+OCGRATZcunZ963OBQ/ZZ0fpR+zmQ4bJ0d+tyIYavMXfkjMGYkIZUPZD4mmLKZT4O63
	Vm7KBOjRGcVc/P6DZ18yWc9oFw8Lx0Sxuu/oXy0epXZed/ki6RwU1DmHmAlrMiva+XNCgI0b7WvfH
	RUUd2qk4IQXXYD0+kmcnriqBtXLqWldccqTV6wkso9Q6xyEFEv13NNhRYy7pjNPRqKyyPGvUUs7hd
	ei3BOm8MHjGNPnxaOb/dfuMh9RD4+KnXVUy+iaiVPTPDYMKmWw5pHV4UyjRT7prg3WeaOoeYQdT9f
	dRU9eJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq4Ba-00000000J6R-3arr;
	Wed, 11 Feb 2026 06:58:54 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq4BY-00000000J5X-1dVx
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 06:58:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gUoUaHptdURpUV3BVUuXp73KhKQiSqCXzpAX7iLTJN0=;
	b=2Lu9FD3dlEmSgmDVIrrDWYxL/c1mUs3yS6CyPLonX/BzA5pXCvOIYPOhv0QBMTxq7/hyOIAEn
	/5A7EoTRpzT/IWgqYuLKM6oKniXR8JNJ3tsyo2toqo5oLv8E6AIXOSWT8zJNCR+fU45p2vBmIzq
	0fptzpAVj1FYDC6xqXuk4X8=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4f9q0R2vW9z1cyPc;
	Wed, 11 Feb 2026 14:53:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C77440561;
	Wed, 11 Feb 2026 14:58:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Feb 2026 14:58:37 +0800
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
 <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <abfe8c37-11ea-a76d-5aea-014b39fcdf2e@huawei.com>
Date: Wed, 11 Feb 2026 14:58:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_225853_080482_716EF4A0 
X-CRM114-Status: GOOD (  26.96  )
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

1NogMjAyNi8yLzExIDA6NDAsIFRvbWFzIEFsdmFyZXogVmFub2xpINC0tcA6Cj4+IElzIHRoZSB1
YmlmcyBtb3VudGVkIGluIHJlYWRvbmx5IG1vZGUgaW4gNC4xND8KPj4gSWYgbm90LCB0aGUgZG9f
a2lsbF9vcnBoYW4gcHJvY2VzcyB3aWxsIGJlIGNvbW1pdHRlZCBvbiBmbGFzaC4KPiAKPiBObywg
aXQgaXMgbm90IHJlYWQgb25seS4KPiAKPj4gVGhlIGNvbW1pdCAzYWYyZDNhOGM1NmZlN2RjMjRm
NjBjNGRmMGFiODViN2FjOTQxOTAyKCJ1YmlmczogRml4Cj4+IHVuYXR0YWNoZWQgaW5vZGUgd2hl
biBwb3dlcmN1dCBoYXBwZW5zIGluIGNyZWF0aW5nIikgW3Y2LjExXSBpcwo+PiBpbnRyb2R1Y2Vk
IGJldHdlZW4gNi4xIGFuZCA2LjEyLCB3aGljaCB3aWxsIGFkZCBldmVyeSBpbm9kZSBpbnRvIG9y
cGhhbgo+PiBhcmVhIGF0IHRoZSBiZWdpbmluZyBvZiBjcmVhdGlvbi4KPiAKPiBCeSBjcmVhdGlv
biB5b3UgbWVhbiB0aGUgZmlyc3Qgb2NjdXJlbmNlIG9mIGl0IG9yIHdoZW5ldmVyIHRoZXJlJ3Mg
YW4gdXBkYXRlPwo+IAo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHdoYXQgeW91IHN1Z2dl
c3QgaXMgdGhhdCBpdCdzIHBvc3NpYmxlIHRoYXQgYXMKPiB0aGUgbmV3IGlub2RlIGlzIGFkZGVk
IHRvIG9ycGhhbiBhcmVhIGFuZCB0aGUgYm9hcmQgaXMgcmVzZXQgYW5kIGJvb3RlZCBpbnRvIHRo
ZQo+IG9sZGVyIGtlcm5lbCwgd2hpY2ggdGhlbiBjbGVhbnMgYWxsIHRoZSBvcnBoYW5zIGV2ZW4g
aWYgdGhleSBoYXZlIGxpbmsgY291bnQsCj4gbGVhdmluZyB0aGUgZnMgYnJva2VuPwo+IAo+IFNv
LCBpbiBvdGhlciB3b3JkcywgbXkgdW5kZXJzdGFuZGluZyBvZiB3aGF0IHlvdSBzYXkgaXMgdGhh
dCBmb3IKPiAzYWYyZDNhOGM1NmZlN2RjMjRmNjBjNGRmMGFiODViN2FjOTQxOTAyIHRvIG5vdCBi
cmVhayBhbnl0aGluZywgYW55IGtlcm5lbCB0aGF0Cj4gbW91bnRzIHRoZSBzYW1lIHBhcnRpdGlv
biBuZWVkcyBlZTE0MzhjZTVkYzRkNjdkZDhkZDFmZjUxNTgzMTIyYTYxZjViZDllIGFuZAo+IDRh
YjI1YWM4YjJiNTUxNDE1MWQ1ZjkxY2Y5NTE0ZGYwOGRkMjY5MzggLgoKQ29ycmVjdC4KPiAKPj4g
U28sIHlvdSBtYXkgdHJ5IG9wdGlvbiAgMSBvciAyIGFuZCBjaGVjayB3aGV0aGVyIHRoZSBwcm9i
bGVtIGNvdWxkIGhhcHBlbjoKPj4gMS4gbW91bnQgNC4xNCByZWFkb25seQo+PiAyLiBiYWNrcG9y
dCBmaXggcGF0Y2hlcyBvbiA0LjE0Cj4gCj4gUG90ZW50aWFsbHkgYWxzbyByZXBsYWNpbmcgdGhl
IDQuMTQgYXBwbGljYXRpb24gd2l0aCBhbiBhcHBsaWNhdGlvbiBiYXNlZCBvbgo+IDYuMT8KCldo
YXQgZG9lcyAnYXBwbGljYXRpb24nIG1lYW4/Cj4gCj4gSSBhbSBhbHNvIGludGVyZXN0ZWQgaW4g
Y29uc2lzdGVudGx5IHJlcHJvZHVjaW5nIHRoaXMgYXQgbXkgZGVzay4gSSBoYXZlIGJlZW4KPiB0
aW5rZXJpbmcgd2l0aCBhZGRpbmcgYSBtZXNzYWdlICsgYSAxMCBzZWNvbmQgZGVsYXkgYXQgcG9p
bnRzIGluIHRoZSB1YmlmcyBjb2RlCj4gc28gdGhhdCBJIGNhbiByZXNldCB0aGUgYm9hcmQgYW5k
IGJvb3QgdGhlIG9sZCBrZXJuZWwgdG8gdHJpZ2dlciB0aGlzIGJlaGF2aW91ci4KPiBXb3VsZCB5
b3Uga25vdyBhdCB3aGljaCBleGFjdCBwb2ludC9jb25kaXRpb25zIGl0IHdvdWxkIG1ha2Ugc2Vu
c2UgdG8gYWRkIHRoaXM/Cj4gT3IgaXMgaXQgbm90IHBvc3NpYmxlPwo+IEkgZG8gbm90IGZ1bGx5
IHVuZGVyc3RhbmQgeW91ciB0aGVvcnksIEkgaGF2ZSByZWFkIHRoZSBkb2NzIGZvciB0aGUgZnMg
YnV0IEkKPiBoYXZlIGxpdHRsZSBleHBlcmllbmNlIHdpdGggZmlsZXN5c3RlbSBpbXBsZW1lbnRh
dGlvbiBpbiBnZW5lcmFsLCBzbyBJIGFtIG5vdAo+IHN1cmUgaG93IGZlYXNpYmxlIHRoaXMgImhh
Y2siIGlzLgoKQXBwbHkgZm9sbG93aW5nIHBhdGNoIGluIDYuMTI6CgoKQXBwbHkgZm9sbG93aW5n
IHBhdGNoIGluIDQuMTQ6CgoKUnVuOgpzdGFydCBrZXJuZWwgNi4xMgokIHRvdWNoICRNTlQvZmls
ZSAjIGNtZCB3aWxsIHN0dWNrLCAkTU5UIGlzIHRoZSB1YmlmcyBtbnRwb2ludAokIGRtZXNnICMg
eW91IHdpbGwgc2VlIGtlcm5lbCBtZXNzYWdlICd3YWl0IHN5bmMgYW5kIHdyaXRlIG9ycGhhbnMn
LCAKb3BlbiBhbm90aGVyIHRlcm1pbmFsCiQgc3luYyAjIG9wZW4gYW5vdGhlciB0ZXJtaW5hbCwg
eW91IHdpbGwgc2VlIGtlcm5lbCBtZXNzYWdlICd3cml0ZSAKb3JwaGFuIFhYJywgYW5kIHRoZSAn
dG91Y2gnIGNtZCBnb2VzIG9uCiQgZGQgaWY9L2Rldi9tdGQwIG9mPWZsYXNoIGJzPTFNCiQgc3lu
YyBhbmQgcG93ZXJvZmYKCnN0YXJ0IGtlcm5lbCA0LjE0CiQgZmxhc2hfZXJhc2VhbGwgL2Rldi9t
dGQwCiQgZGQgaWY9Zmxhc2ggb2Y9L2Rldi9tdGQwIGJzPTFNICMgbWFrZSBzdXJlIG10ZDAgaXMg
bm90IGF0dGFjaGVkIGJ5IHViaQokIHViaWF0dGFjaCAtbTAKJCBtb3VudCAvZGV2L3ViaTBfMCB0
ZW1wICMgZG1lc2cgd2lsbCBzaG93ICdyZW1vdmUgaW5vIFhYJwokIGxzIHRlbXAKbHM6IGNhbm5v
dCBhY2Nlc3MgJ3RlbXAvZmlsZSc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKZmlsZQokIGRt
ZXNnClsgICA2OS4yMDA2MzldIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDE1ODcpOiB1Ymlmc19p
Z2V0IFt1Ymlmc106IGZhaWxlZCAKdG8gcmVhZCBpbm9kZSA2NSwgZXJyb3IgLTIKWyAgIDY5LjIw
NjIxNF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTU4Nyk6IHViaWZzX2xvb2t1cCBbdWJpZnNd
OiBkZWFkIApkaXJlY3RvcnkgZW50cnkgJ2ZpbGUnLCBlcnJvciAtMgpbICAgNjkuMjA3NDgyXSBV
QklGUyB3YXJuaW5nICh1YmkwOjAgcGlkIDE1ODcpOiB1Ymlmc19yb19tb2RlIFt1Ymlmc106IApz
d2l0Y2hlZCB0byByZWFkLW9ubHkgbW9kZSwgZXJyb3IgLTIKWyAgIDY5LjIwODc4M10gQ1BVOiAy
IFBJRDogMTU4NyBDb21tOiBscyBOb3QgdGFpbnRlZCAKNC4xOS45MC0wMDAwNi1nMzMyMDQzNjMw
YWUxLWRpcnR5ICM1MApbICAgNjkuMjA5ODM3XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJk
IFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgCkJJT1MgPy0yMDE5MDcyN18wNzM4MzYtYnVpbGR2
bS1wcGM2NGxlLTE2LnBwYy5mZWRvcmFwcm9qZWN0Lm9yZy0zLmZjMzEgCjA0LzAxLzIwMTQKWyAg
IDY5LjIxMTU0NV0gQ2FsbCBUcmFjZToKWyAgIDY5LjIxMTkyMV0gIGR1bXBfc3RhY2srMHhiOC8w
eGVmClsgICA2OS4yMTIzNzBdICB1Ymlmc19yb19tb2RlKzB4NTQvMHg2MCBbdWJpZnNdClsgICA2
OS4yMTI5NTBdICB1Ymlmc19sb29rdXArMHgzYjYvMHg1NTAgW3ViaWZzXQpbICAgNjkuMjEzNTM1
XSAgX19sb29rdXBfc2xvdysweDllLzB4MjEwClsgICA2OS4yMTQwNDVdICBsb29rdXBfc2xvdysw
eDQ2LzB4NzAKWyAgIDY5LjIxNDQ5MV0gIHdhbGtfY29tcG9uZW50KzB4MjY1LzB4NGMwClsgICA2
OS4yMTUwMTNdICBwYXRoX2xvb2t1cGF0LmlzcmEuMCsweDllLzB4MzYwClsgICA2OS4yMTU1ODhd
ICBmaWxlbmFtZV9sb29rdXArMHhiNS8weDIzMApbICAgNjkuMjE2MTA3XSAgPyBfcmF3X3NwaW5f
dW5sb2NrX2lycXJlc3RvcmUrMHgzZi8weDgwClsgICA2OS4yMTY3NjldICA/IF9fdGhpc19jcHVf
cHJlZW1wdF9jaGVjaysweDE3LzB4MjAKWyAgIDY5LjIxNzM4Nl0gID8gX19sb2NhbF9iaF9lbmFi
bGVfaXArMHg2Mi8weDExMApbICAgNjkuMjE4MDM4XSAgPyBfcmF3X3NwaW5fdW5sb2NrX2JoKzB4
MmUvMHg0MApbICAgNjkuMjE4NzYxXSAgPyB3Yl93YWtldXBfZGVsYXllZCsweDU2LzB4OTAKWyAg
IDY5LjIxOTMwMV0gID8ga21lbV9jYWNoZV9hbGxvYysweDExMC8weDNkMApbICAgNjkuMjE5ODUy
XSAgdXNlcl9wYXRoX2F0X2VtcHR5KzB4NDMvMHg2MApbICAgNjkuMjIwMzkxXSAgdmZzX3N0YXR4
KzB4OTAvMHgxNTAKWyAgIDY5LjIyMDg0N10gID8gX19zYl9lbmRfd3JpdGUrMHg1Zi8weGIwClsg
ICA2OS4yMjEzNTRdICBfX3NlX3N5c19uZXdsc3RhdCsweDQ2LzB4YTAKWyAgIDY5LjIyMTg5Ml0g
ID8gX19zZV9zeXNfZ2V0ZGVudHMrMHhlMC8weDFjMApbICAgNjkuMjIyNDY1XSAgPyBmaWxsZGly
NjQrMHgzNDAvMHgzNDAKWyAgIDY5LjIyMjk1OF0gIF9feDY0X3N5c19uZXdsc3RhdCsweDFhLzB4
MzAKWyAgIDY5LjIyMzQ5OV0gIGRvX3N5c2NhbGxfNjQrMHg5NS8weDQ2MApbICAgNjkuMjI0MDA0
XSAgPyBwcmVwYXJlX2V4aXRfdG9fdXNlcm1vZGUrMHhhYS8weDE4MApbICAgNjkuMjI0NjUyXSAg
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NWMvMHhjMQoKPiAKPiBUaGFua3MgZm9y
IGFsbCB5b3VyIHN1cHBvcnQhCj4gQmVzdCByZWdhcmRzLAo+IFRvbWFzCj4gLgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
