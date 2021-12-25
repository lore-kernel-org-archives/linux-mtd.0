Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25874C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 02:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pAtn8rRzQIVrXIkeoHs7zJpCi+SmUTys5y7Q51n9mA=; b=UbwaImWJce9klSs42Uh1PaFHqb
	apdK0105vDG3L160eLhm+Ig1npCAoQWpHQtAYda/qaMc9JaHvLOeZr8f4lYGv4ww8VQ+sxnRBtVKs
	X9ty436Fz+4kxHUHTQr7sE+R00/+nt+wb6cyzmLCgwbXvDdSTMbB2Egpqqhg+D/ndrOEDpLZSPWqh
	jQdKmVPhWxyLSuB8dXcrfZgi4nJaDL/2Ch2VsRyfs9zd26xEUMCDpgpUMKoJoKAZycIQ/nOqmbix6
	8AesBkgESP1wCpdrb+jVlnSIDiKQQWyLMKfyTKM1OCefsANyaow8ODx0Eg0DffPU5UNxKEk2JnHpL
	y+ip49LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0wiQ-00Eavk-Ps; Sat, 25 Dec 2021 02:23:22 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0wiM-00EavQ-VE
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 02:23:21 +0000
Received: from kwepemi100003.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JLSLc3Nz1z1DJxd
 for <linux-mtd@lists.infradead.org>; Sat, 25 Dec 2021 10:19:52 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100003.china.huawei.com (7.221.188.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 25 Dec 2021 10:23:04 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 25 Dec 2021 10:23:04 +0800
Subject: Re: UBIFS: ubifs_recover_leb() always execute fix_unclean_leb() even
 all the nodes are valid
To: =?UTF-8?B?6Z+p5LuB5p2w?= <hanrenjie123@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <CADPmmj4xHLvptkPXga-Cv1WfBr+qXbaib1io1FUfRx+Ac1e+sQ@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9c6d1f5d-0f84-4e2a-3d05-9bbb11eb985c@huawei.com>
Date: Sat, 25 Dec 2021 10:23:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADPmmj4xHLvptkPXga-Cv1WfBr+qXbaib1io1FUfRx+Ac1e+sQ@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_182319_206078_A5C39FAA 
X-CRM114-Status: GOOD (  16.84  )
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

5ZyoIDIwMjEvMTIvMjQgMTU6NTgsIOmfqeS7geadsCDlhpnpgZM6CkhpLCDku4HmnbAKPiBJJ3Zl
IGJlZW4gd29ya2luZyBvbiBMaW51eCA0LjQuNjAgcmVjZW50bHkgV2hlbiB1c2luZyBVQklGUyBm
aWxlIHN5c3RlbSwKPiAKPiBJIHJlY2VudGx5IGVuY291bnRlcmVkIGEgcHJvYmxlbSB0aGF0IGV2
ZXJ5IHRpbWUgSSBwb3dlciBvZmYgYW5kIHJlc3RhcnQsCj4gCj4gSSB3aWxsIGVudGVyIHRoZSBy
ZWNvdmVyeSBwcm9jZXNzIG9mIFVCSUZTLgo+IAo+IAo+IAo+IEkgZG8gdW5kZXJzdGFuZCB0aGUg
cmVhc29uIGZvciBlbnRlcmluZyByZWNvdmVyeSBkdXJpbmcgc3RhcnR1cCwgYW5kIHRoZQo+IAo+
IG1haW4gIHB1cnBvc2Ugb2YgdWJpZnNfcmVjb3Zlcl9sZWIoKSBpcyB0byBkZWFsIHdpdGggYW4g
aW52YWxpZCBub2RlIGFuZAo+IAo+IG1ha2UgdWJpZnMgbW91bnQgc3VjY2Vzc2Z1bGx5LiBCdXQg
ZXZlbiBpZiB0aGVyZSBhcmUgbm8gaW52YWxpZCBub2RlcywKPiAKPiB1Ymlmc19yZWNvdmVyX2xl
YigpIHdpbGwgY2FsbCAgZml4X3VuY2xlYW5fbGViKCksIHdoaWNoIHJlc3VsdHMgaW4gZmxhc2ji
gJlzIGVyYXNlCj4gCj4gYW5kIHdyaXRlIG9wZXJhdGlvbnMgZHVyaW5nIHN0YXJ0dXAuCj4gCj4g
Cj4gCj4gSSBjaGVja2VkIHRoZSBtb2RpZnkgaGlzdG9yeSBvZiBrZXJuZWwvZnMvdWJpZnMvcmVj
b3ZlcnkuYywgYW5kIGZvdW5kIGEgcmVsYXRlZAo+IAo+IGNvbW1pdDoKPiAKPiAgICBodHRwOi8v
Z2l0LmluZnJhZGVhZC5vcmcvbGludXguZ2l0L2NvbW1pdGRpZmYvN2M0N2JmZDBkYmIyMGU1ZDdm
YTRlMzdjZmQ3NmJiNwo+IAo+IDNkMzliMzJiND9ocD02MTc5OTIwNjk1MTNjMWU3ODljNzA3YzRk
NzVmZjAzYmY3ZGQwZmIwLgo+IAo+IAo+IAo+IEluIHRoZSBjb21taXQsIHZhcmlhYmxlICJuZWVk
X2NsZWFuIiB3YXMgZGVsZXRlZC4gTXkgcXVlc3Rpb24gaXMgdGhhdAo+IHdoZXRoZXIgaXQgaXMK
PiAKPiBuZWNlc3NhcnkgdG8gZXhlY3V0ZSBmaXhfdW5jbGVhbl9sZWIoKSBpZiB0aGVyZSBhcmUg
bm8gaW52YWxpZCBub2RlID8KPiBJIGFtIG5vdCBzdXJlIGlmCj4gCj4gdGhlcmUgYXJlIHNvbWUg
YWRkaXRpb25hbCBjb25zaWRlcmF0aW9ucyBJIGRpZG4ndCB0aGluayBvZiA/CgpBY2NvcmRpbmcg
dG8gdGhlIGRlc2NyaXB0aW9uIGluIGNvbW1pdCAKN2M0N2JmZDBkYmIyMGU1ZDdmYTRlMzdjZmQ3
NmJiNzNkMzliMzJiNCgiVUJJRlM6IGFsd2F5cyBjbGVhbnVwIHRoZSAKcmVjb3ZlcmVkIExFQiIp
OgoiTm93IHdoZW4gd2UgY2FsbCAndWJpZnNfcmVjb3Zlcl9sZWIoKScgb25seSBmb3IgTEVCcyB3
aGljaCBhcmUgCnBvdGVudGlhbGx5IGNvcnJ1cHRlZCAoaS5lLiwgb25seSBmb3IgbGFzdCBidWRz
LCBub3QgZm9yIGFsbCBvZiB0aGVtKSwgCndlIGNhbiBjbGVhbnVwIGV2ZXJ5IExFQiwgbm90IG9u
bHkgdGhvc2Ugd2hlcmUgd2UgZmluZCBjb3JydXB0aW9uLiBUaGUgCnJlYXNvbiAtIHVuc3RhYmxl
IGJpdHMuIEV2ZW4gdGhvdWdoIHRoZSBMRUIgbWF5IGxvb2sgZ29vZCBub3csIGl0IG1pZ2h0IApj
b250YWluIHVuc3RhYmxlIGJpdHMgd2hpY2ggbWF5IGhpdCB1cyBhIGJpdCBsYXRlci4iCgpJIGd1
ZXNzIGltcG9ydmVkIHViaWZzX3JlY292ZXJfbGViKCkgY2FuIGhhbmRsZSB1bnN0YWJsZSB3cml0
aW5nIG9uIG5hbmQgCmZsYXNoIGJ5IGNhbGxpbmcgZml4X3VuY2xlYW5fbGViKCkgYWZ0ZXIgYSBw
b3dlci1jdXQuIExhc3QgcHJvZ3JhbW1pbmcgCmJlZm9yZSBwb3dlci1jdXQgb24gUEVCIGlzIHVu
dHJ1c3RhYmxlLCBldmVuIHRob3VnaCB0aGUgUEVCIGlzIApyZWNvZ25pemVkIGFzIHZhbGlkIGZv
ciB0aGUgbW9tZW50LCB0aGVyZSBtYXliZSBhbm90aGVyIGRhdGEgY29udGVudCAKcmVhZCBmcm9t
IHRoZSBzYW1lIFBFQiBhZnRlciBhIHdoaWxlLiBKdXN0IGxpa2UgY29tbWl0IHNhaWQsIHVuc3Rh
YmxlIApiaXRzLCB3aGljaCBtYXkgZmFpbCB1Ymlmc19zY2FuKCkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
