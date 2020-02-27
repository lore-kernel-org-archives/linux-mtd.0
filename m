Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E73C4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF7724683
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZScmckcj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF7724683
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ii5N6fiqaYBVJeJqEf3gmHtYtd96A/Um9oWFlzkq1A4=; b=ZScmckcjFdCPvX
	FuW0LZpMf4qdzrzZ4SQqiRI19OrmoVqjre3WxdxfMR2ZFT+T3tYaus0u1xsduZDLR1eaukFD9PpjD
	c57dDPxCXTalFDXjdhSs7K7Drz9wrbCDpuTINA2MdZwxszkqq1Piwqey0Cqk+uymPnbvckP9iiaiJ
	KqFKbu78ozNfv450OhEi2W3nuKefqtj+bmuABx9bA835VWMUDBZdDkVJYPsU4qa2D3pVO4lIq54YN
	FMNnRNyXMObUf5kB1/Jyfw8+Zc7n8e2dMB/PypOZd2Syf+Q41hVjH8o5sG4Mw8PBeAhGDOTzzr98C
	wGlLhrO70FHtZb3lq2Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ClF-00015z-Nu; Thu, 27 Feb 2020 06:35:05 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ClC-0000ay-Cx
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 06:35:04 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E0E54D6F8C297B2B24C9;
 Thu, 27 Feb 2020 14:34:55 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.224) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 27 Feb 2020 14:34:54 +0800
Subject: Re: ubifs: read bad node type in ubifs_tnc_read_wbuf
To: =?UTF-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>, 
 Richard Weinberger <richard@nod.at>
References: <e2d34800d72243ed85e8df63bb80f7ab@shmbx04.spreadtrum.com>
 <ce621148db0e4f9c80f32c348975663a@shmbx04.spreadtrum.com>
 <ae16d475c0d24c1ba6ab18f1e766e928@shmbx04.spreadtrum.com>
 <46e2f6ca11a442f38d476d4346e8034c@shmbx04.spreadtrum.com>
 <733427970.19532.1578872935782.JavaMail.zimbra@nod.at>
 <5077cb7894bc4b95b09389059edf0ddc@shmbx04.spreadtrum.com>
 <1323907091.20398.1578989376426.JavaMail.zimbra@nod.at>
 <51cabef7ce104de097c2556a4a24d8a7@shmbx04.spreadtrum.com>
 <1741454272.21050.1579043778589.JavaMail.zimbra@nod.at>
 <c62bae00e0d741cc9be1752b139c42d6@shmbx04.spreadtrum.com>
 <fda84926-09d1-1fc7-4b78-99e0d04508bc@huawei.com>
 <e6df93725ef24b548eef69afbbfc15f8@shmbx04.spreadtrum.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <6cf2ba81-98ad-c03f-59b9-b871c7979df6@huawei.com>
Date: Thu, 27 Feb 2020 14:34:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e6df93725ef24b548eef69afbbfc15f8@shmbx04.spreadtrum.com>
Content-Language: en-US
X-Originating-IP: [10.133.219.224]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_223502_629364_D18D6943 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDIwLzIvMjcgOToxOCwg5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIpIHdyb3Rl
Ogo+IEhpIHRhbywKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guCj4+IGRpZmYgLS1naXQgYS9mcy91
Ymlmcy90bmMuYyBiL2ZzL3ViaWZzL3RuYy5jCj4+IGluZGV4IGU4ZTdiMGU5NTMyZS4uYWYzNWMx
ZmYxYWI0IDEwMDY0NAo+PiAtLS0gYS9mcy91Ymlmcy90bmMuYwo+PiArKysgYi9mcy91Ymlmcy90
bmMuYwo+PiBAQCAtMTQ3OCw3ICsxNDc4LDE2IEBAIGludCB1Ymlmc190bmNfbG9jYXRlKHN0cnVj
dCB1Ymlmc19pbmZvICpjLCBjb25zdCB1bmlvbiB1Ymlmc19rZXkgKmtleSwKPj4gbXV0ZXhfdW5s
b2NrKCZjLT50bmNfbXV0ZXgpOwo+IAo+PiBpZiAodWJpZnNfZ2V0X3didWYoYywgemJyLmxudW0p
KSB7Cj4+IC0vKiBXZSBkbyBub3QgR0Mgam91cm5hbCBoZWFkcyAqLwo+PiArLyoKPj4gKyAqIFdl
IGRvIG5vdCBHQyBqb3VybmFsIGhlYWRzLiBIb3dldmVyIGlmIHpici5sbnVtCj4+ICsgKiBpcyBH
QydlZCwgZnJlZWQgYW5kIHRoZW4gcmV1c2VkIGFzIEdDIGpvdXJuYWwgaGVhZCwKPj4gKyAqIHdl
IGFsc28gbmVlZCB0byBwcm90ZWN0IG5vZGUgcmVhZGluZyBieSB0bmNfbXV0ZXguCj4+ICsgKi8K
Pj4gK2lmIChtYXliZV9sZWJfZ2NlZChjLCB6YnIubG51bSwgZ2Nfc2VxMSkpIHsKPj4gK3NhZmVs
eSA9IDE7Cj4+ICtnb3RvIGFnYWluOwo+PiArfQo+PiArCj4+IGVyciA9IHViaWZzX3RuY19yZWFk
X25vZGUoYywgJnpiciwgbm9kZSk7Cj4+IHJldHVybiBlcnI7Cj4+IH0KPj4gLS0KPiAKPiBCdXQg
SSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgeW91ciBwYXRjaCBpZiBpdCBjYW4gZml4IHRoZSBwcm9i
bGVtIHdoZW4gaXQgaGFwcGVucwo+IGxpa2UgYmVsb3cuIFRoZSBMRUIgbWlnaHQgYmUgR0NlZCBp
biB1Ymlmc190bmNfcmVhZF9ub2RlLCBhbmQgdGhlcmUgaXMgYWxzbyBhCj4gdWJpZnNfZ2V0X3di
dWYuCj4gCj4+Pj4gQnkgdGhlIHdheSwgdGhlcmUgaXMgYW5vdGhlciB0aW1pbmcgdGhlIExFQiBt
aWdodCBiZSBnYXJiYWdlIGNvbGxlY3RlZDoKPj4+Pj4gICAgIEEgICAgICB8ICAgICAgICAgICAg
ICBCCj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+IHViaWZzX3RuY19sb2NhdGUKPj4+Pj4g
ICB6YnItPmxudW0gPSA1NCAoZmluZCBpbiBUTkMpCj4+Pj4+ICAgICB1Ymlmc19nZXRfd2J1Zih6
YnItPmxudW0gPSA1NCkgaXMgdHVyZQo+Pj4+PiAgICAgICAgICB1Ymlmc190bmNfcmVhZF9ub2Rl
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC0+R0MoY2hhbmdlIHp0LT5sbnVtIHRvIDIy
NChHQ0hEKSBpbiBfVE5DXykKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgLT56YnItPmxu
dW0gPSA1NCBiZWNvbWVzIERBVEFIRAo+Pj4+PiAgICAgICAgICAgICB1Ymlmc19nZXRfd2J1Zih6
YnItPmxudW0gPSA1NCBhcyB0aGUgREFUQUhEKSBpcyB0dXJlIGFnYWluCj4+Pj4+ICAgICAgICAg
ICAgIHViaWZzX3JlYWRfbm9kZV93YnVmCj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpMZXQncyBj
aGVjayBpdDoKCj4+Pj4+ICAgICBBICAgICAgfCAgICAgICAgICAgICAgQgo+Pj4+PiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+Pj4+PiB1Ymlmc190bmNfbG9jYXRlCj4+Pj4+ICAgemJyLT5sbnVtID0gNTQg
KGZpbmQgaW4gVE5DKQo+Pj4+PiAgICAgdWJpZnNfZ2V0X3didWYoemJyLT5sbnVtID0gNTQpIGlz
IHRydWUKICAgICAgICAgICAgICAgbWF5YmVfbGViX2djZWQoKSByZXR1cm4gZmFsc2UKPj4+Pj4g
ICAgICAgICAgdWJpZnNfdG5jX3JlYWRfbm9kZSgpCgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtPmNvbW1pdCBoYXBwZW5zIGFuZCA1NCBpcyByZW1vdmVkIGZyb20gYnVkIGxpc3QKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLT5jb21taXQgZW5kcyBhbmQgNTQgaXMgR0MtYWJs
ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPkdDIG1vdmUgNTQgdG8gMjI0CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0+cmV1c2UgNTQgYXMgREFUQUhECj4+Pj4+ICAgICAg
ICAgICAgIHViaWZzX2dldF93YnVmKHpici0+bG51bSA9IDU0IGFzIHRoZSBEQVRBSEQpIGlzIHRy
dWUgYWdhaW4KPj4+Pj4gICAgICAgICAgICAgdWJpZnNfcmVhZF9ub2RlX3didWYKClNvIGFkZGlu
ZyBhbiBleHRyYSBtYXliZV9sZWRfZ2NlZCgpIGRvZXNuJ3QgaGVscCBpbiB0aGUgYWJvdmUgY2Fz
ZS4gVGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQuCgpBbmQgdGhlIHF1aWNrIHNvbHV0aW9uIGNv
bWVzIHRvIG1lIGlzIHJlbW92aW5nIHRoZSBmb2xsb3dpbmcgb3B0aW1pemF0aW9uIGZvciByZWFk
aW5nIHdyaXRlIGJ1ZmZlcjoKCkBAIC0xNDgyLDEyICsxNDg5LDYgQEAgYWdhaW46CiAgICAgICAg
Z2Nfc2VxMSA9IGMtPmdjX3NlcTsKICAgICAgICBtdXRleF91bmxvY2soJmMtPnRuY19tdXRleCk7
CgotICAgICAgIGlmICh1Ymlmc19nZXRfd2J1ZihjLCB6YnIubG51bSkpIHsKLSAgICAgICAgICAg
ICAgIC8qIFdlIGRvIG5vdCBHQyBqb3VybmFsIGhlYWRzICovCi0gICAgICAgICAgICAgICBlcnIg
PSB1Ymlmc190bmNfcmVhZF9ub2RlKGMsICZ6YnIsIG5vZGUpOwotICAgICAgICAgICAgICAgcmV0
dXJuIGVycjsKLSAgICAgICB9Ci0KICAgICAgICBlcnIgPSBmYWxsaWJsZV9yZWFkX25vZGUoYywg
a2V5LCAmemJyLCBub2RlKTsKICAgICAgICBpZiAoZXJyIDw9IDAgfHwgbWF5YmVfbGViX2djZWQo
YywgemJyLmxudW0sIGdjX3NlcTEpKSB7CgpCdXQgbGV0IG1lIHRoaW5rIHdoZXRoZXIgb3Igbm90
IHRoZXJlIGlzIGFueSBiZXR0ZXIgc29sdXRpb24uCgpSZWdhcmRzLApUYW8KCgoKCj4gCj4gCj4g
VGhhbmtzLgo+IENhcnNvbgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
IFRoaXMgZW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVudHMpIGlzIGludGVuZGVkIG9ubHkg
Zm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdoaWNoIGl0IGlzIGFkZHJlc3NlZCBhbmQgbWF5
IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBwcml2aWxlZ2VkLCBjb25maWRlbnRpYWwgb3Ig
b3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIFVuYXV0aG9yaXplZCB1c2UsIGRp
c3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5nIG9mIHRoaXMgZW1haWwgb3IgdGhl
IGluZm9ybWF0aW9uIGhlcmVpbiBvciB0YWtpbmcgYW55IGFjdGlvbiBpbiByZWxpYW5jZSBvbiB0
aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3JtYXRpb24gaGVyZWluLCBieSBh
bnlvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBvciBhbiBlbXBsb3llZSBv
ciBhZ2VudCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0aGUgbWVzc2FnZSB0byB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50LCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90IHJlYWQsIGNvcHksIHVzZSBvciBk
aXNjbG9zZSBhbnkgcGFydCBvZiB0aGlzIGUtbWFpbCB0byBvdGhlcnMuIFBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgcGVybWFuZW50bHkgZGVsZXRlIHRoaXMgZS1tYWls
IGFuZCBhbnkgYXR0YWNobWVudHMgaWYgeW91IHJlY2VpdmVkIGl0IGluIGVycm9yLiBJbnRlcm5l
dCBjb21tdW5pY2F0aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSB0aW1lbHksIHNlY3Vy
ZSwgZXJyb3ItZnJlZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2VuZGVyIGRvZXMgbm90IGFjY2VwdCBs
aWFiaWxpdHkgZm9yIGFueSBlcnJvcnMgb3Igb21pc3Npb25zLgo+IOacrOmCruS7tuWPiuWFtumZ
hOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOWPl+azleW+i+S/neaKpOS4jeW+l+azhOmcsu+8jOS7
heWPkemAgee7meacrOmCruS7tuaJgOaMh+eJueWumuaUtuS7tuS6uuOAguS4peemgemdnue7j+aO
iOadg+S9v+eUqOOAgeWuo+S8oOOAgeWPkeW4g+aIluWkjeWItuacrOmCruS7tuaIluWFtuWGheWu
ueOAguiLpemdnuivpeeJueWumuaUtuS7tuS6uu+8jOivt+WLv+mYheivu+OAgeWkjeWItuOAgSDk
vb/nlKjmiJbmiqvpnLLmnKzpgq7ku7bnmoTku7vkvZXlhoXlrrnjgILoi6Xor6/mlLbmnKzpgq7k
u7bvvIzor7fku47ns7vnu5/kuK3msLjkuYXmgKfliKDpmaTmnKzpgq7ku7blj4rmiYDmnInpmYTk
u7bvvIzlubbku6Xlm57lpI3pgq7ku7bnmoTmlrnlvI/ljbPliLvlkYrnn6Xlj5Hku7bkurrjgILm
l6Dms5Xkv53or4HkupLogZTnvZHpgJrkv6Hlj4rml7bjgIHlronlhajjgIHml6Dor6/miJbpmLLm
r5LjgILlj5Hku7bkurrlr7nku7vkvZXplJnmvI/lnYfkuI3mib/mi4XotKPku7vjgIIKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
