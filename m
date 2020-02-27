Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59695C4BA06
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2902B2467F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ca08XQrl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2902B2467F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQeiL496vWRERndGu/xF7mRLOIvLJCHOO0USwTqxQlE=; b=Ca08XQrli6iRDE
	KU/IIa6kbXO31wiZdmvfF1I0rse1grz5sDfH3xR/Iv4E431i6JtwIoulj86rD9h8sH9Fm/9SYR8dF
	LryPOGNt8WiPE+SAKSCj497xvuHNKCvROCZG+Cy9W7LEbbUdOSTuFiNTlrf/vg35qGQ8o+KnRCIvs
	jlXzaxAHMuwQQp/PIO4KEYnx9+75eNeK4tT07OF+Cf9YCvPY0GLB7XUGN61dWnT97hj6MRcOdtHcG
	aX3P8dp6v1mepzXw2C5prmxNpvYo9cawIuBFaGW9eg+7r/6Z0hvC4fzzWeKN2RBnoNNZo/jrgIo/T
	+kkraASPeZ0pZmHlaL4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7D01-0006li-Sd; Thu, 27 Feb 2020 06:50:21 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Czu-0005eQ-OJ
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 06:50:20 +0000
Received: from ig2.spreadtrum.com (shmbx01.spreadtrum.com [10.0.1.203])
 by SHSQR01.spreadtrum.com with ESMTPS id 01R6nhrm031673
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Thu, 27 Feb 2020 14:49:43 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by SHMBX01.spreadtrum.com
 (10.0.1.203) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 27 Feb
 2020 14:49:29 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Thu, 27 Feb 2020 14:49:29 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Hou Tao <houtao1@huawei.com>, Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/JAOmUHIw88Ik/HDzxSCANiTskIAKghsAgAFc6YD//9dEAAARFrMA
Date: Thu, 27 Feb 2020 06:49:28 +0000
Message-ID: <3768e0805ba349f487214bef018f1853@shmbx04.spreadtrum.com>
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
 <6cf2ba81-98ad-c03f-59b9-b871c7979df6@huawei.com>
In-Reply-To: <6cf2ba81-98ad-c03f-59b9-b871c7979df6@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.1.253]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 01R6nhrm031673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_225019_110816_963B52C0 
X-CRM114-Status: UNSURE (   5.91  )
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

SGnvvIwNCg0KPkBAIC0xNDgyLDEyICsxNDg5LDYgQEAgYWdhaW46DQo+ICAgICAgICBnY19zZXEx
ID0gYy0+Z2Nfc2VxOw0KPiAgICAgICAgbXV0ZXhfdW5sb2NrKCZjLT50bmNfbXV0ZXgpOw0KPg0K
Pi0gICAgICAgaWYgKHViaWZzX2dldF93YnVmKGMsIHpici5sbnVtKSkgew0KPi0gICAgICAgICAg
ICAgICAvKiBXZSBkbyBub3QgR0Mgam91cm5hbCBoZWFkcyAqLw0KPi0gICAgICAgICAgICAgICBl
cnIgPSB1Ymlmc190bmNfcmVhZF9ub2RlKGMsICZ6YnIsIG5vZGUpOw0KPi0gICAgICAgICAgICAg
ICByZXR1cm4gZXJyOw0KPi0gICAgICAgfQ0KPi0NCj4gICAgICAgIGVyciA9IGZhbGxpYmxlX3Jl
YWRfbm9kZShjLCBrZXksICZ6YnIsIG5vZGUpOw0KPiAgICAgICAgaWYgKGVyciA8PSAwIHx8IG1h
eWJlX2xlYl9nY2VkKGMsIHpici5sbnVtLCBnY19zZXExKSkgew0KDQpUaGF0IGlzIHdoYXQgSSBk
byBub3cuIGFuZCBjYW4geW91IHBsZWFzZSBoYXZlIGEgY2hlY2sgYXQgd2hhdCBJIHBvc3QgYmVm
b3JlOg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tdGVtcG9yYXJ5IHNvbHV0
aW9uLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi0tLSBhL2ZzL3ViaWZzL3RuYy5j
DQorKysgYi9mcy91Ymlmcy90bmMuYw0KQEAgLTE0ODIsMTIgKzE0ODIsNiBAQCBhZ2FpbjoNCiBn
Y19zZXExID0gYy0+Z2Nfc2VxOw0KIG11dGV4X3VubG9jaygmYy0+dG5jX211dGV4KTsNCg0KLWlm
ICh1Ymlmc19nZXRfd2J1ZihjLCB6YnIubG51bSkpIHsNCi0vKiBXZSBkbyBub3QgR0Mgam91cm5h
bCBoZWFkcyAqLw0KLWVyciA9IHViaWZzX3RuY19yZWFkX25vZGUoYywgJnpiciwgbm9kZSk7DQot
cmV0dXJuIGVycjsNCi19DQotDQpBY3R1YWxseSwgY29tcGFyZWQgdG8gdGhhdCBzb2x1dGlvbiBk
ZXNjcmliZWQgYWJvdmUsIEkgbW9yZSBzdWdnZXN0IHRvIG1vZGlmeSB0aGUNCnViaWZzX2dldF93
YnVmLnViaWZzX2dldF93YnVmIGlzIHRvIGNoZWNrIGlmIHRoZSBMRUIgaXMgb24gdGhlIGpoZWFk
LCBidXQNCnViaWZzX3RuY19yZWFkX3didWYgb25seSByZWFkIG5vZGUgZnJvbSB3YnVmIHdoZW4g
dGhlIGxudW0gaXMgZXF1YWwgdG8gd2J1Zi5sbnVtDQphbmQgdGhlIG90aGVycyBzdGlsbCBuZWVk
IHRvIHJlYWQgb24gZmxhc2guIEl0IHNlZW1zIHRvIGJlIGJldHRlciB0byBqdXN0IG1ha2UNCnVi
aWZzX2dldF93YnVmIHRvIGNoZWNrIGlmIHRoZSBMRUIgaXMgZXF1YWwgdG8gdGhlIHdidWZzLmxu
dW0sIGFuZCB0aGVuIHRoZXJlIGlzDQpubyBuZWVkIHRvIGhhdmUgYSBkb3VibGUgY2hlY2sgaW4g
dWJpZnNfdG5jX3JlYWRfd2J1Zi4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tbW9yZSBz
dWdnZXN0ZWQgYnV0IG5vdCB0ZXN0ZWQgc29sdXRpb24tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi0t
LSBhL2ZzL3ViaWZzL2xvZy5jDQorKysgYi9mcy91Ymlmcy9sb2cuYw0KQEAgLTcwLDI4ICs3MCwx
NiBAQCBzdHJ1Y3QgdWJpZnNfYnVkICp1Ymlmc19zZWFyY2hfYnVkKHN0cnVjdCB1Ymlmc19pbmZv
ICpjLCBpbnQgbG51bSkNCiAgKi8NCiBzdHJ1Y3QgdWJpZnNfd2J1ZiAqdWJpZnNfZ2V0X3didWYo
c3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtKSAgew0KLXN0cnVjdCByYl9ub2RlICpwOw0K
LXN0cnVjdCB1Ymlmc19idWQgKmJ1ZDsNCiBpbnQgamhlYWQ7DQoNCiBpZiAoIWMtPmpoZWFkcykN
CiByZXR1cm4gTlVMTDsNCg0KLXNwaW5fbG9jaygmYy0+YnVkc19sb2NrKTsNCi1wID0gYy0+YnVk
cy5yYl9ub2RlOw0KLXdoaWxlIChwKSB7DQotYnVkID0gcmJfZW50cnkocCwgc3RydWN0IHViaWZz
X2J1ZCwgcmIpOw0KLWlmIChsbnVtIDwgYnVkLT5sbnVtKQ0KLXAgPSBwLT5yYl9sZWZ0Ow0KLWVs
c2UgaWYgKGxudW0gPiBidWQtPmxudW0pDQotcCA9IHAtPnJiX3JpZ2h0Ow0KLWVsc2Ugew0KLWpo
ZWFkID0gYnVkLT5qaGVhZDsNCi1zcGluX3VubG9jaygmYy0+YnVkc19sb2NrKTsNCitmb3Ioamhl
YWQgPSAwOyBqaGVhZCA8IGMtPmpoZWFkX2NudDsgamhlYWQrKyl7DQoraWYobG51bSA9PSBjLT5q
aGVhZHNbamhlYWRdLndidWYubG51bSkNCiByZXR1cm4gJmMtPmpoZWFkc1tqaGVhZF0ud2J1ZjsN
Ci19DQogfQ0KLXNwaW5fdW5sb2NrKCZjLT5idWRzX2xvY2spOw0KKw0KIHJldHVybiBOVUxMOw0K
IH0NCg0KLS0tIGEvZnMvdWJpZnMvaW8uYw0KKysrIGIvZnMvdWJpZnMvaW8uYw0KQEAgLTkwNiw5
ICs5MDYsMTAgQEAgaW50IHViaWZzX3JlYWRfbm9kZV93YnVmKHN0cnVjdCB1Ymlmc193YnVmICp3
YnVmLCB2b2lkICpidWYsIGludCB0eXBlLCBpbnQgbGVuLA0KIHViaWZzX2Fzc2VydCh3YnVmICYm
IGxudW0gPj0gMCAmJiBsbnVtIDwgYy0+bGViX2NudCAmJiBvZmZzID49IDApOw0KIHViaWZzX2Fz
c2VydCghKG9mZnMgJiA3KSAmJiBvZmZzIDwgYy0+bGViX3NpemUpOw0KIHViaWZzX2Fzc2VydCh0
eXBlID49IDAgJiYgdHlwZSA8IFVCSUZTX05PREVfVFlQRVNfQ05UKTsNCit1Ymlmc19hc3NlcnQo
d2J1Zi0+bG51bSA9PSBsbnVtKTsNCg0KIHNwaW5fbG9jaygmd2J1Zi0+bG9jayk7DQotb3Zlcmxh
cCA9IChsbnVtID09IHdidWYtPmxudW0gJiYgb2ZmcyArIGxlbiA+IHdidWYtPm9mZnMpOw0KK292
ZXJsYXAgPSAob2ZmcyArIGxlbiA+IHdidWYtPm9mZnMpOw0KIGlmICghb3ZlcmxhcCkgew0KIC8q
IFdlIG1heSBzYWZlbHkgdW5sb2NrIHRoZSB3cml0ZS1idWZmZXIgYW5kIHJlYWQgdGhlIGRhdGEg
Ki8NCiBzcGluX3VubG9jaygmd2J1Zi0+bG9jayk7DQoNCmFmdGVyIHRoZSBtb2RpZmljYXRpb24s
IHRoZSBMRUIgY29udGFpbnMgbm9kZSB3aWxsIG5vdCBiZSBHQ2VkIHNpbmNlIGV2ZW4gdGhvdWdo
DQp0aGVyZSBpcyBhIGNvbW1pdCwgdGhlIHdidWYubG51bSBpcyBzdGlsbCBvbiB0aGUgYnVkIHJi
dHJlZSBhcyBhIGpvdXJuYWwgaGVhZCBsZWIuDQoNCg0KDQpUaGFua3MuDQpDYXJzb24NCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiBUaGlzIGVtYWlsIChpbmNsdWRpbmcgaXRz
IGF0dGFjaG1lbnRzKSBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29uIG9yIGVudGl0eSB0
byB3aGljaCBpdCBpcyBhZGRyZXNzZWQgYW5kIG1heSBjb250YWluIGluZm9ybWF0aW9uIHRoYXQg
aXMgcHJpdmlsZWdlZCwgY29uZmlkZW50aWFsIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBk
aXNjbG9zdXJlLiBVbmF1dGhvcml6ZWQgdXNlLCBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24g
b3IgY29weWluZyBvZiB0aGlzIGVtYWlsIG9yIHRoZSBpbmZvcm1hdGlvbiBoZXJlaW4gb3IgdGFr
aW5nIGFueSBhY3Rpb24gaW4gcmVsaWFuY2Ugb24gdGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwg
b3IgdGhlIGluZm9ybWF0aW9uIGhlcmVpbiwgYnkgYW55b25lIG90aGVyIHRoYW4gdGhlIGludGVu
ZGVkIHJlY2lwaWVudCwgb3IgYW4gZW1wbG95ZWUgb3IgYWdlbnQgcmVzcG9uc2libGUgZm9yIGRl
bGl2ZXJpbmcgdGhlIG1lc3NhZ2UgdG8gdGhlIGludGVuZGVkIHJlY2lwaWVudCwgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxl
YXNlIGRvIG5vdCByZWFkLCBjb3B5LCB1c2Ugb3IgZGlzY2xvc2UgYW55IHBhcnQgb2YgdGhpcyBl
LW1haWwgdG8gb3RoZXJzLiBQbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5k
IHBlcm1hbmVudGx5IGRlbGV0ZSB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGlmIHlv
dSByZWNlaXZlZCBpdCBpbiBlcnJvci4gSW50ZXJuZXQgY29tbXVuaWNhdGlvbnMgY2Fubm90IGJl
IGd1YXJhbnRlZWQgdG8gYmUgdGltZWx5LCBzZWN1cmUsIGVycm9yLWZyZWUgb3IgdmlydXMtZnJl
ZS4gVGhlIHNlbmRlciBkb2VzIG5vdCBhY2NlcHQgbGlhYmlsaXR5IGZvciBhbnkgZXJyb3JzIG9y
IG9taXNzaW9ucy4NCuacrOmCruS7tuWPiuWFtumZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOWP
l+azleW+i+S/neaKpOS4jeW+l+azhOmcsu+8jOS7heWPkemAgee7meacrOmCruS7tuaJgOaMh+eJ
ueWumuaUtuS7tuS6uuOAguS4peemgemdnue7j+aOiOadg+S9v+eUqOOAgeWuo+S8oOOAgeWPkeW4
g+aIluWkjeWItuacrOmCruS7tuaIluWFtuWGheWuueOAguiLpemdnuivpeeJueWumuaUtuS7tuS6
uu+8jOivt+WLv+mYheivu+OAgeWkjeWItuOAgSDkvb/nlKjmiJbmiqvpnLLmnKzpgq7ku7bnmoTk
u7vkvZXlhoXlrrnjgILoi6Xor6/mlLbmnKzpgq7ku7bvvIzor7fku47ns7vnu5/kuK3msLjkuYXm
gKfliKDpmaTmnKzpgq7ku7blj4rmiYDmnInpmYTku7bvvIzlubbku6Xlm57lpI3pgq7ku7bnmoTm
lrnlvI/ljbPliLvlkYrnn6Xlj5Hku7bkurrjgILml6Dms5Xkv53or4HkupLogZTnvZHpgJrkv6Hl
j4rml7bjgIHlronlhajjgIHml6Dor6/miJbpmLLmr5LjgILlj5Hku7bkurrlr7nku7vkvZXplJnm
vI/lnYfkuI3mib/mi4XotKPku7vjgIINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
