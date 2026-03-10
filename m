Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D8EB1060
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dFcrVeOj4l3jzbUgudmaxXU62PydDrZ1TOk9rDIdoA=; b=SIbyony7bi/zhV
	qRSJ6AqeKCFuhkISEkotJw2vKQI/luyvW53wuvu1j3lqI76xrM9mxK/nPVrbpSgpPGVAnIEKqZsBh
	fbxPI1dZTrGm5EPDWwJXw9+xQNQJqPltwJzYzrb585DaADfQeFkZVXVF1TybQIUPI2B/9xREBHs5g
	6FJ7oTB8FHgLDucxsjnRRe7ya/lh2dajeKJlnVKWer1bxobfjWvFI9hqT3Gu7y6A/EgiyzNA3Aekr
	UL1nXoM9BpWdjt8PVmF4KTsIASR4VPSaoSJH76wY/6Xw/1jMzoUVyDJD7HoRBnLZM1EEEk9X23xOf
	rckDXf6C6HL/cpEreVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzDq-00000009phM-32J3;
	Tue, 10 Mar 2026 15:42:14 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzDo-00000009pgf-1qQr;
	Tue, 10 Mar 2026 15:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773157278; x=1773762078; i=markus.elfring@web.de;
	bh=ViIdeWt5br4rBsrGxHUMEkJDkD/ERSvSv/UV5SzvttY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WGyUT73FEGUOOobbpfTI5yEU52qIQ6s1WY/i688nStWUQV10XR2CP+ZJ0EI1DoSj
	 Xao+vuSmeqRUvw1rCkfbrx+P2Mp9Xzd85tz+P0j6Nh4ytfn14WxQJkixOYPwoNFGG
	 jx8AZjbjj8u3WdFHou1xq3rWXHkXEWBPl7deq8ZbVbHnVT5Pv4EAbphC6oX0N8H5K
	 AIG7N3YBMhYWhVWaPMrPZLwnZcHqJ3CavL4NESQybJfHoaluRMqMByMA+Rb9kKxzj
	 a9HDg+chG8MVqBskLp97/tiQ7YmHDaT3yXWC/AhQq02RivkCSXoliC76ctKxRSnK4
	 3PX+mH77sQHC3/Cfmg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5lj7-1vYM6w3zfn-012TrV; Tue, 10
 Mar 2026 16:41:18 +0100
Message-ID: <924acf71-45df-4ea2-9bbd-b6f5ff262b2b@web.de>
Date: Tue, 10 Mar 2026 16:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Hahn <phahn-oss@avm.de>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, dm-devel@lists.linux.dev,
 dri-devel@lists.freedesktop.org, gfs2@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 nicolas.palix@imag.fr, ntfs3@lists.linux.dev,
 samba-technical@lists.samba.org, sched-ext@lists.linux.dev,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 v9fs@lists.linux.dev
References: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
Subject: Re: [PATCH 01/61] Coccinelle: Prefer IS_ERR_OR_NULL over manual NULL
 check
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
X-Provags-ID: V03:K1:I49ufsxpBKiFBze+2Qm04f+elx94DZSymOaZcQTAnyd9Dy18WSZ
 l5PlqGBdCeQJnqXYHB7LM8JEThQzWaqt46DhF3JOnbIEKCtwYJeZnzJMAXhMu3h78zedo+b
 2MDr9yfDF5xiOPbOsnoVg9HvEpZouoV7eAA1AasOX+/8mAaWp7eICgl3FZXuUGMMgTPEUmo
 9zEXJmftCILFnPJ5epBUQ==
UI-OutboundReport: notjunk:1;M01:P0:jCe8S3PVhmA=;jIHM+yewjYlED18bQxoGve5P1nn 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084212_840471_BBB5672F 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBGaW5kIGFuZCBjb252ZXJ0IHVzZXMgb2YgSVNfRVJSKCkgcGx1cyBOVUxMIGNoZWNrIHRvIElT
X0VSUl9PUl9OVUxMKCkuCuKApgoKQ2FuIHRoaXMgaW5mb3JtYXRpb24gdHJpZ2dlciBhbnkgbW9y
ZSBjb25zZXF1ZW5jZXMgb24gY29ycmVzcG9uZGluZyBzdW1tYXJ5IHBocmFzZXM/CgoK4oCmCj4g
KysrIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2FwaS9pc19lcnJfb3JfbnVsbC5jb2NjaQo+IEBAIC0w
LDAgKzEsMTI1IEBACuKApgo+ICt2aXJ0dWFsIHBhdGNoCj4gK3ZpcnR1YWwgcmVwb3J0Cj4gK3Zp
cnR1YWwgb3JnCgpIb3cgd2lsbCBpbnRlcmVzdHMgZXZvbHZlIGZ1cnRoZXIgZm9yIHRoZSBzdXBw
b3J0IG9mIHRoZSBvcGVyYXRpb24gbW9kZSDigJxjb250ZXh04oCdPwoKCj4gK0BwMSBkZXBlbmRz
IG9uIHBhdGNoQAo+ICtleHByZXNzaW9uIEU7Cj4gK0BACj4gKygKPiArLQlFICE9IE5VTEwgJiYg
IUlTX0VSUihFKQo+ICsrCSFJU19FUlJfT1JfTlVMTChFKQo+ICt8Cj4gKy0JRSA9PSBOVUxMIHx8
IElTX0VSUihFKQo+ICsrCUlTX0VSUl9PUl9OVUxMKEUpCj4gK3wKPiArLQkhSVNfRVJSKEUpICYm
IEUgIT0gTlVMTAo+ICsrCSFJU19FUlJfT1JfTlVMTChFKQo+ICt8Cj4gKy0JSVNfRVJSKEUpIHx8
IEUgPT0gTlVMTAo+ICsrCUlTX0VSUl9PUl9OVUxMKEUpCj4gKykKCkRpZCB5b3UgZXZlbnR1YWxs
eSBjaGVjayBwcm9iYWJpbGl0aWVzIGZvciB0aGUgb2NjdXJyZW5jZSBvZiBtZW50aW9uZWQgY2Fz
ZSBkaXN0aW5jdGlvbnM/CgoKPiArQHAyIGRlcGVuZHMgb24gcGF0Y2hACuKApgoKSSBzdWdnZXN0
IHRvIHJlY29uc2lkZXIg4oCcc2lkZSBlZmZlY3Rz4oCdIGFjY29yZGluZyB0byB0aGUgc3BsaXR0
aW5nIG9mIHRoZXNlIFNtUEwgcnVsZXMKb25jZSBtb3JlLgoKCuKApgo+ICtAcjIgZGVwZW5kcyBv
biByZXBvcnQgfHwgb3JnQAo+ICtpZGVudGlmaWVyIEk7Cj4gK2V4cHJlc3Npb24gRTsKPiArcG9z
aXRpb24gcDsKPiArQEAKPiArKAo+ICsqCShJID0gRSkgIT0gTlVMTCAmJiAuLi4gJiYgIUlTX0VS
UkBwKEkpCj4gK3wKPiArKgkoSSA9IEUpID09IE5VTEwgfHwgLi4uIHx8IElTX0VSUkBwKEkpCj4g
KykKCkkgZG91YnQgdGhhdCB0aGUgdXNhZ2Ugb2YgU21QTCBhc3Rlcmlza3MgZml0cyB0byB0aGVz
ZSB0d28gb3BlcmF0aW9uIG1vZGVzLgoKCuKApgo+ICtAcDUgZGVwZW5kcyBvbiBwYXRjaCBkaXNh
YmxlIHVubGlrZWx5IEAKPiArZXhwcmVzc2lvbiBFOwo+ICtAQAo+ICstXCggbGlrZWx5IFx8IHVu
bGlrZWx5IFwpKAo+ICsoCj4gKyBJU19FUlJfT1JfTlVMTChFKQo+ICt8Cj4gKyAhSVNfRVJSX09S
X05VTEwoRSkKPiArKQo+ICstKQoKKiBXb3VsZCBpdCBiZSBuaWNlciB0byBtb3ZlIHN1Y2ggU21Q
TCBjb2RlIHRvIHRoZSBlbmQgb2YgdGhlIHBhdGNoIHJ1bGUgbGlzdGluZz8KCiogQ2FuIHRoaXMg
c291cmNlIGNvZGUgc2VhcmNoIHBhdHRlcm4gbWF0dGVyIGFsc28gZm9yIGZ1cnRoZXIgb3BlcmF0
aW9uIG1vZGVzPwoKClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
