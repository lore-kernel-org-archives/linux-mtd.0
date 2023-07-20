Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F850EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLoN7/6EEuW8EdhcikCMbz5FA3ewvaMkBpvAgzrp4v0=; b=sP9VpNrtYsfkyP
	6+UXDb/F2laS4WQyccSHL2N1reU1+wVj57YDC0cbIey4U82vL1Q/le2wUBgG8sELttHZ3ap7/v9TH
	WnePPHsYlGjBUKgH4OOdNN0xiL2dV1JnMscqXg4F2qBI0vcclUWZ38q2WVBMZLYL8wBbhwXMDNv6C
	jbPNF6HiYOmRaqPwawKobyslVJKnyWpQr4+BVUdFmn82/SJMLwZ9EiQCemt6DyYYGF5QZdP4hY4xH
	qD8dThM3YLkUDcXDA1rA1X4GOeARW0babct7Ajm0XP3fE2ZalNMQzZssN8LqqhYicPPVQzKSuuaKB
	fznC6IaKOHKpXa3k174w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYNG-00Btit-0j;
	Thu, 20 Jul 2023 18:27:38 +0000
Received: from smtp-13.smtpout.orange.fr ([80.12.242.13] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYND-00Bti3-0U
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 18:27:37 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id MYN6qe0Rt0OAIMYN6qkOaB; Thu, 20 Jul 2023 20:27:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1689877651;
	bh=UVg6F1y2Q2FFEhRMC2xd/+XsbKnoIhgMbd1GyecoDlM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U7wK9LvGTP2opWVebdBt+WXqwKGWNTD4uyb0v9jcyLDSbG1BYcsW1j2RfH8QQ4U6m
	 uCorT1iLC/po/N0CH9dQJvv+NvfCgccrXMsg211C2stZ74ZYxJGe3zHaH3xeK2juRM
	 Ya8qpuYq5EViqODYOmv8fd0TTZIsQg50TSzpzTaN27qQ5wj4Zqgtt7Pkguj3Ewn0Rp
	 YPTjdEu3oKUf/9F0nsSeUXGjD9Esiwtq4/0kKFQVTn2bXP0OvBrmABaBNTCI7lwNM0
	 6cZJJW1wD6VqxiC7cinhYe/Rr3Jb6+4aUaFMnLzZgKLPQ4YTAQt1J+y8ZsZfvUBzpY
	 ErWyE8SYqzwHg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Jul 2023 20:27:31 +0200
X-ME-IP: 86.243.2.178
Message-ID: <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
Date: Thu, 20 Jul 2023 20:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in
 fun_exec_op()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
 <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_112735_604344_EEEE7F65 
X-CRM114-Status: GOOD (  14.91  )
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

TGUgMjAvMDcvMjAyMyDDoCAwOTowNCwgRGFuIENhcnBlbnRlciBhIMOpY3JpdMKgOgo+IE9uIFdl
ZCwgSnVsIDE5LCAyMDIzIGF0IDExOjU1OjAxUE0gKzAyMDAsIENocmlzdG9waGUgSkFJTExFVCB3
cm90ZToKPj4gJ29wLWNzJyBpcyBjb3BpZWQgaW4gJ2Z1bi0+bWNoaXBfbnVtYmVyJyB3aGljaCBp
cyB1c2VkIHRvIGFjY2VzcyB0aGUKPj4gJ21jaGlwX29mZnNldHMnIGFuZCB0aGUgJ3JuYl9ncGlv
JyBhcnJheXMuCj4+IFRoZXNlIGFycmF5cyBoYXZlIE5BTkRfTUFYX0NISVBTIGVsZW1lbnRzLCBz
byB0aGUgaW5kZXggbXVzdCBiZSBiZWxvdyB0aGlzCj4+IGxpbWl0Lgo+Pgo+PiBGaXggdGhlIHNh
bml0eSBjaGVjayBpbiBvcmRlciB0byBhdm9pZCB0aGUgTkFORF9NQVhfQ0hJUFMgdmFsdWUuIFRo
aXMKPj4gd291bGQgbGVhZCB0byBvdXQtb2YtYm91bmQgYWNjZXNzZXMuCj4+Cj4+IEZpeGVzOiA1
NDMwOWQ2NTc3NjcgKCJtdGQ6IHJhd25hbmQ6IGZzbF91cG06IEltcGxlbWVudCBleGVjX29wKCki
KQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxl
dEB3YW5hZG9vLmZyPgo+PiAtLS0KPiAKPiBSZXZpZXdlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+IAo+IEdvb2QgZXllLiAgSSdtIGFzc3VtaW5nIHlvdSBk
aWQgc29tZXRoaW5nIGxpa2UgdGhpczoKPiAKPiAjIS9iaW4vYmFzaAo+IAo+IEZJTEU9JDEKPiBX
T1JEUz0kKGNhdCAkRklMRSB8IHBlcmwgLW5lICdpZiAoJF8gPX4gL1xbKFtcd19dKylcXTsvKSB7
IHByaW50ICIkMVxuIiB9JyB8IHNvcnQgLXUpCj4gZm9yIGkgaW4gJFdPUkRTIDsgZG8KPiAgICAg
IGdyZXAgLUhuICIgPiAkaSIgJEZJTEUKPiBkb25lCj4gCj4gcmVnYXJkcywKPiBkYW4gY2FycGVu
dGVyCj4gCgpJIGRpZCB3aXRoIHRoZSBoZWxwIG9mIGEgY29jY2luZWxsZSBzY3JpcHQuCih3aGlj
aCBjYW4gY2VydGFpbmx5IGJlIGltcHJvdmVkLCBzbyBhZGRpbmcgSnVsaWEgaW4gY2M6IDopICkK
ClRoaXMgZ2l2ZXMgZGVjZW50IHJlc3VsdHMuIEkgb25seSBwb3N0IHBhdGNoZXMgZm9yIHdoYXQg
SSBjb25maXJtIGFzIGFuIAppc3N1ZS4gU28gaXQgaXMgbGlrZWx5IHRoYXQgc29tZSBnb29kIGNh
bmRpZGF0ZXMgd2lsbCBiZSBsZWZ0IGFzLWlzLgoKU28gaWYgYW55b25lIHdhbnRzIHRvIGdpdmUg
aXQgYSB0cnksIHlvdSBhcmUgd2VsY29tZWQgOikKCkNKCgoKY29jY2k6Cj09PT09CkBydWxlMUAK
aWRlbnRpZmllciBDID1+ICJbQS1aXSsiOwpleHByZXNzaW9uIGU7CnN0YXRlbWVudCBTOwpAQAoJ
aWYgKGUgPCBDKQoJCVMKCkBvazEgZGVwZW5kcyBvbiBydWxlMUAKaWRlbnRpZmllciBDID0gcnVs
ZTEuQzsKZXhwcmVzc2lvbiBlOwpzdGF0ZW1lbnQgUzsKQEAKKglpZiAoZSA8PSBDKQoJCVMKCgoK
QHJ1bGUyQAppZGVudGlmaWVyIEMgPX4gIltBLVpdKyI7CmV4cHJlc3Npb24gZTsKc3RhdGVtZW50
IFM7CkBACglpZiAoZSA8PSBDKQoJCVMKCkBvazIgZGVwZW5kcyBvbiBydWxlMkAKaWRlbnRpZmll
ciBDID0gcnVsZTIuQzsKZXhwcmVzc2lvbiBlOwpzdGF0ZW1lbnQgUzsKQEAKKglpZiAoZSA8IEMp
CgkJUwoKCgpAcnVsZTNACmlkZW50aWZpZXIgQyA9fiAiW0EtWl0rIjsKZXhwcmVzc2lvbiBlOwpz
dGF0ZW1lbnQgUzsKQEAKCWlmIChlID4gQykKCQlTCgpAb2szIGRlcGVuZHMgb24gcnVsZTNACmlk
ZW50aWZpZXIgQyA9IHJ1bGUzLkM7CmV4cHJlc3Npb24gZTsKc3RhdGVtZW50IFM7CkBACioJaWYg
KGUgPj0gQykKCQlTCgoKCkBydWxlNEAKaWRlbnRpZmllciBDID1+ICJbQS1aXSsiOwpleHByZXNz
aW9uIGU7CnN0YXRlbWVudCBTOwpAQAoJaWYgKGUgPj0gQykKCQlTCgpAb2s0IGRlcGVuZHMgb24g
cnVsZTRACmlkZW50aWZpZXIgQyA9IHJ1bGU0LkM7CmV4cHJlc3Npb24gZTsKc3RhdGVtZW50IFM7
CkBACioJaWYgKGUgPiBDKQoJCVMKCgpDSgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
