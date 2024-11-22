Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56821E65D0E
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 01:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLzMhY5QiPMl+XaqIfJNOd7X7dwiDwRx0DIdCt4hs+M=; b=EFf57KSydVqwfRNfdyVpJ27vsf
	YS6iR3ZrpaYl9bHy7SrK/1d1QyO2LfoyIIfA6MHnxzRpuEKXETeH6SfD3dFjKpZig+sFpnp7btXOl
	nNCBJmGd3dDYnuAeZSZuYZSBVoOrt/V8pO5x+SuguiMXqpq8spWcf3E/aLitLfHcPgtLAL1r6bu5b
	NCgHa+eAs+d8ucJ6fx7CkdInh5CrkpnYhGPxOgqrngvPzUaDZ8pSktTOn+dwe7FuHnOCTa8C4NwhI
	ojE/huI0MnjsetvGVjDBGJslKwiFDDyLbe1WzXnc9DjqfGjTbKEZu+tjoyyJMkTjqt6veZj6SBo1r
	B553YfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEINj-00000001JAe-1nL2;
	Fri, 22 Nov 2024 01:22:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEINg-00000001JAB-1KGe
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 01:22:46 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xvcjb5tMCz10WQh;
	Fri, 22 Nov 2024 09:20:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 752EF1800DE;
	Fri, 22 Nov 2024 09:22:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 22 Nov 2024 09:22:38 +0800
Subject: Re: Parsing extracted i.MX NAND flash
To: Rogan Dawes <lists@dawes.za.net>
CC: <linux-mtd@lists.infradead.org>
References: <20241118173939.GA11581@lisa.dawes.za.net>
 <20241120155135.GA27335@lisa.dawes.za.net>
 <1ce8654c-27b8-5f07-f3ca-d8d17c779f73@huawei.com>
 <20241121181513.GA19519@lisa.dawes.za.net>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b6c95b5b-fc27-bf25-a433-c458e30ed08d@huawei.com>
Date: Fri, 22 Nov 2024 09:22:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241121181513.GA19519@lisa.dawes.za.net>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_172244_738462_2B5E09CD 
X-CRM114-Status: GOOD (  17.00  )
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

1NogMjAyNC8xMS8yMiAyOjE1LCBSb2dhbiBEYXdlcyDQtLXAOgo+IE9uIFRodSwgTm92IDIxLCAy
MDI0IGF0IDEyOjQyOjE2UE0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4gPyAyMDI0LzEx
LzIwIDIzOjUxLCBSb2dhbiBEYXdlcyA/PzoKPj4+IE9uIE1vbiwgTm92IDE4LCAyMDI0IGF0IDA3
OjM5OjM5UE0gKzAyMDAsIFJvZ2FuIERhd2VzIHdyb3RlOgo+Pj4+IEhpIGZvbGtzLAo+Pj4+Cj4+
Pj4gSSBoYXZlIGFuIGkuTVg2IHRhcmdldCBJIGFtIHRyeWluZyB0byBnZXQgYSBzaGVsbCBvbi4g
SXQgaXMgdXNpbmcgSGlnaAo+Pj4+IEFzc3VyYW5jZSBCb290IGFuZCB2YXJpb3VzIG90aGVyIGNv
bmZpZ3VyYXRpb25zIHRvIHByZXZlbnQgdGhpcy4gTXkKPj4+PiBjdXJyZW50IGFwcHJvYWNoIGlz
IHRvIHJlbW92ZSB0aGUgZmxhc2gsIGV4dHJhY3QgdGhlIGZpbGVzeXN0ZW1zLCBtb2RpZnkKPj4+
PiBvbmUgdGhhdCBpcyBub3Qgc3ViamVjdCB0byBIQUIsIHRoZW4gcHV0IGl0IGFsbCBiYWNrLCBp
biBvcmRlciB0byBlbmFibGUKPj4+PiBhIHNoZWxsLgo+Pj4+Cj4+Pj4gSSBoYXZlIHJlbW92ZWQg
dGhlIGZsYXNoLCBhbmQgZXh0cmFjdGVkIGl0cyBjb250ZW50cyB1c2luZyBhbiBYZ2VjdQo+Pj4+
IGZsYXNoIHJlYWRlci4gTm93IEkgbmVlZCB0byBwYXJzZSB0aGUgRkNCIGFuZCBleHRyYWN0IHRo
ZSBhY3R1YWwgZGF0YQo+Pj4+IGZyb20gdGhlIGR1bXAuIEkgaGF2ZSBmb3VuZCBpbXgtbmFuZC10
b29scywgYnV0IHRoaXMgZG9lc24ndCB3b3JrIGR1ZSB0bwo+Pj4+IGJpdHJvdCAodGhlIGJjaGxp
YiBkZXBlbmRlbmN5IGhhcyBtb3ZlZCBvbiB3aGlsZSBpbXgtbmFuZC10b29scyBoYXMgbm90Cj4+
Pj4gYmVlbiB1cGRhdGVkKS4KPj4+Cj4+PiBJIHdhcyBhYmxlIHRvIGdldCBpbXgtbmFuZC10b29s
cyB3b3JraW5nIGJ5IHBpbm5pbmcgdGhlIHZlcnNpb24gb2YgdGhlCj4+PiBiY2hsaWIgZGVwZW5k
ZW5jeSB0byB2MC4xNC4wLCBhbmQgaGF2ZSBiZWVuIGFibGUgdG8gb2J0YWluIGEgImNsZWFuIgo+
Pj4gZmxhc2ggaW1hZ2UuIFN0aWxsIHRyeWluZyB0byBtb3VudCB0aGUgdmFyaW91cyBVQkkgZmls
ZXN5c3RlbXMsIGFzIEkgZ2V0Cj4+PiB0aGUgZm9sbG93aW5nIGVycm9yczoKPj4+Cj4+PiBbMzYw
OTcyLjcxMDA1MF0gdWJpMDogZGVmYXVsdCBmYXN0bWFwIHBvb2wgc2l6ZTogOAo+Pj4gWzM2MDk3
Mi43MTAwNTVdIHViaTA6IGRlZmF1bHQgZmFzdG1hcCBXTCBwb29sIHNpemU6IDQKPj4+IFszNjA5
NzIuNzEwMDU2XSB1YmkwOiBhdHRhY2hpbmcgbXRkNQo+Pj4gWzM2MDk3Mi43MTAwOTldIHViaTAg
ZXJyb3I6IHZhbGlkYXRlX2VjX2hkciBbdWJpXTogYmFkIFZJRCBoZWFkZXIgb2Zmc2V0IDIwNDgs
IGV4cGVjdGVkIDUxMgo+Pgo+PiBIaSBSb2dhbiwKPj4gSG93IGRpZCB5b3UgdXNlIHViaWF0dGFj
aD8gdWJpYXR0YWNoIC1PIDUxMj8gIFRyeSAndWJpYXR0YWNoIC1PMjA0OCcuCj4gCj4gSGksCj4g
Cj4gSSBzaW1wbHkgcmFuIGl0IHdpdGhvdXQgYW55IHNwZWNpZmljIG9mZnNldCBvcHRpb25zOgo+
IAo+IHN1ZG8gdWJpYXR0YWNoIC1tIDUKPiAKPiB3aGljaCBwcm9kdWNlZCB0aGUgcGFuaWMgaW4g
bXkgcHJldmlvdXMgbWFpbC4uCj4gCj4gSWYgSSB0cnkgd2l0aCAtTyAyMDQ4LCB0aGlzIGlzIHdo
YXQgSSBnZXQ6Cj4gCj4gJCBzdWRvIHViaWF0dGFjaCAtTyAyMDQ4IC1tIDUKPiBbc3Vkb10gcGFz
c3dvcmQgZm9yIHJvZ2FuOgo+IHViaWF0dGFjaDogZXJyb3IhOiBjYW5ub3QgYXR0YWNoIG10ZDUK
PiAgICAgICAgICAgICBlcnJvciAyMiAoSW52YWxpZCBhcmd1bWVudCkKPiAKPiBbNjE0MDA2LjYy
MDUxN10gdWJpMDogZGVmYXVsdCBmYXN0bWFwIHBvb2wgc2l6ZTogOAo+IFs2MTQwMDYuNjIwNTIw
XSB1YmkwOiBkZWZhdWx0IGZhc3RtYXAgV0wgcG9vbCBzaXplOiA0Cj4gWzYxNDAwNi42MjA1MjFd
IHViaTA6IGF0dGFjaGluZyBtdGQ1Cj4gWzYxNDAwNi42MjA3NDldIHViaTA6IHNjYW5uaW5nIGlz
IGZpbmlzaGVkCj4gWzYxNDAwNi42MjA3ODddIHViaTAgZXJyb3I6IHZ0YmxfY2hlY2sgW3ViaV06
IGJhZCBDUkMgYXQgcmVjb3JkIDExOiAweGM4ZTVhYmIxLCBub3QgMHhmMTE2YzM2Ygo+IFs2MTQw
MDYuNjIwODE2XSBWb2x1bWUgdGFibGUgcmVjb3JkIDExIGR1bXA6Cj4gWzYxNDAwNi42MjA4MThd
IAlyZXNlcnZlZF9wZWJzICAgMAo+IFs2MTQwMDYuNjIwODE5XSAJYWxpZ25tZW50ICAgICAgIDAK
PiBbNjE0MDA2LjYyMDgyMF0gCWRhdGFfcGFkICAgICAgICAwCj4gWzYxNDAwNi42MjA4MjFdIAl2
b2xfdHlwZSAgICAgICAgMAo+IFs2MTQwMDYuNjIwODM0XSAJdXBkX21hcmtlciAgICAgIDAKPiBb
NjE0MDA2LjYyMDgzNV0gCW5hbWVfbGVuICAgICAgICAwCj4gWzYxNDAwNi42MjA4MzZdIAluYW1l
ICAgICAgICAgICAgTlVMTAo+IFs2MTQwMDYuNjIwODM4XSB1YmkwIGVycm9yOiB2dGJsX2NoZWNr
IFt1YmldOiBiYWQgQ1JDIGF0IHJlY29yZCAxMTogMHhjOGU1YWJiMSwgbm90IDB4ZjExNmMzNmIK
PiBbNjE0MDA2LjYyMDg0OF0gVm9sdW1lIHRhYmxlIHJlY29yZCAxMSBkdW1wOgo+IFs2MTQwMDYu
NjIwODQ5XSAJcmVzZXJ2ZWRfcGVicyAgIDAKPiBbNjE0MDA2LjYyMDg1MF0gCWFsaWdubWVudCAg
ICAgICAwCj4gWzYxNDAwNi42MjA4NTFdIAlkYXRhX3BhZCAgICAgICAgMAo+IFs2MTQwMDYuNjIw
ODUyXSAJdm9sX3R5cGUgICAgICAgIDAKPiBbNjE0MDA2LjYyMDg1Ml0gCXVwZF9tYXJrZXIgICAg
ICAwCj4gWzYxNDAwNi42MjA4NTNdIAluYW1lX2xlbiAgICAgICAgMAo+IFs2MTQwMDYuNjIwODU0
XSAJbmFtZSAgICAgICAgICAgIE5VTEwKPiBbNjE0MDA2LjYyMDg1NV0gdWJpMCBlcnJvcjogcHJv
Y2Vzc19sdm9sIFt1YmldOiBib3RoIHZvbHVtZSB0YWJsZXMgYXJlIGNvcnJ1cHRlZAo+IFs2MTQw
MDYuNjIwODcyXSB1YmkwIGVycm9yOiB1YmlfYXR0YWNoX210ZF9kZXYgW3ViaV06IGZhaWxlZCB0
byBhdHRhY2ggbXRkNSwgZXJyb3IgLTIyCj4gCgpBYm92ZSBtZXNzYWdlcyBtZWFucyB0aGF0Ogox
LiBUaGUgVUJJIGhhcyBzY2FubmVkIGFsbCBQRUJzLCB3aGljaCBpcyBmYWlsZWQgaW4gcHJldmlv
dXMgbWFpbC4KMi4gVGhlIFVCSSBjYW5ub3QgZmluZCBhIHZhbGlkIGxheW91dCB2b2x1bWUsIHRo
ZSBsYXlvdXQgdm9sdW1lIGhhcyB0d28gCkxFQnMsIGJvdGggb2YgdGhlbSBhcmUgY29ycnVwdGVk
KGRhdGEgaW4gTEVCIGlzIG5vdCBjb3JyZWN0LCBjcmMgCnZlcmlmeWluZyBmYWlscykuCj4gUmVn
YXJkcywKPiAKPiBSb2dhbgo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
