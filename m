Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1483CC388F9
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 08:21:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94089206B7
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 08:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jer2TcLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94089206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Mime-Version:References:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=43NokZDWAZ1VeBkrsuEhEqP3QlPnVlx9dZVSNWI/aq0=; b=jer2TcLVU7o3ou2P7InlEo7D2
	RL2mmhWUHpbAKhSNCFcQgR9DBH/ZXncHuFCfxtLRec8tyIQKNv67B31XHxvVJvJD5OBmhHqV7COAS
	vr4ENPcGi4eMbRp+93HSjZuDN0/ezaBJkprGii/H5nHQQxfcSBPNwWUsquEepvJqam2pbHVLGT2kp
	HNlXSST2hp5Kzz9AzwA4CiTPhYFrZ8aiiUgwZFpqztBavjonHc66PqPO7fftTVW0ErGbWaoAfl6zh
	9rBdW1E3U1o8ZxxClkPT8FcUR7PQWHeFXYCdJGL75ABTSxSZtwPt9/DLbIoFoyvrmrcFCe220PfGL
	0g8UooUYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZV4i-0004Jy-6p; Mon, 02 Nov 2020 08:20:24 +0000
Received: from regular1.263xmail.com ([211.150.70.206])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZV4d-0004IU-A4; Mon, 02 Nov 2020 08:20:21 +0000
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id B62C42615;
 Mon,  2 Nov 2020 16:14:01 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from hp1216 (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P26974T140148431894272S1604304841345296_; 
 Mon, 02 Nov 2020 16:14:02 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7d77ae4acfc77cc4fc55aff865618565>
X-RL-SENDER: zyf@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: zyf@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Mon, 2 Nov 2020 16:14:01 +0800
Organization: =?utf-8?B?55Ge6Iqv5b6u55S15a2Q?=
From: =?utf-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for
 RK3308, RK2928 and others
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>, 
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>, 
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>, 
 <0dabd80e-b281-be65-b8e2-da00f46964fb@gmail.com>, 
 <20201102114503679684135@rock-chips.com>, 
 <20201102083258.3a748c44@xps13>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <20201102161300764203144@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_032019_636919_65AC6E01 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 =?utf-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>, richard <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 robh+dt <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 vigneshr <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKVGhlIG5hbmRfYmFzZS5jIHdpbGwgY2FsbMKgbmFuZF9kZXNlbGVjdF90YXJn
ZXQgYWZ0ZXIgTkFORCByZWFkL3Byb2dyYW0uLi4gb3BzIGRvbmUsIGFuZCBzZXTCoHZhcmlhYmxl
IGNoaXAtPmN1cl9jcyA9IC0xLApidXQgdGhlIG5hbmQgY29udHJvbGxlciBkbyBub3RoaW5nIGFu
ZCB0aGUgY3Mgb2YgdGhlIE5BTkQgZGV2aWNlIGlzIHN0aWxsIHNlbGVjdGVkLCAKc28gdGhlIE5B
TkQgZGV2aWNlIMKgd2lsbCBub3QgZW50ZXIgYXV0byBwb3dlciBzYXZlIG1vZGUuCgotLS0tLS0t
LS0tLS0tLQpUaGFua3MsCllpZmVuZwoKPkhlbGxvLAo+Cj7otbXku6rls7AgPHlpZmVuZy56aGFv
QHJvY2stY2hpcHMuY29tPiB3cm90ZSBvbiBNb24sIDIgTm92IDIwMjAgMTE6NDY6MDQKPiswODAw
Ogo+Cj4+IEhpIEpvaGFuLAo+Pgo+PiB2b2lkIG5hbmRfZGVzZWxlY3RfdGFyZ2V0KHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXApCj4+IHsKPj4gaWYgKGNoaXAtPmxlZ2FjeS5zZWxlY3RfY2hpcCkKPj4g
Y2hpcC0+bGVnYWN5LnNlbGVjdF9jaGlwKGNoaXAsIC0xKTsKPj4KPj4gY2hpcC0+Y3VyX2NzID0g
LTE7Cj4+IH0KPj4KPj4gSSBuZWVkIGFkZCB0aGUgY29kZSBiZWxvdyBhbmQgaXQgd29yay4KPj4K
Pj4gwqAgwqBjaGlwLT5sZWdhY3kuc2VsZWN0X2NoaXAgPSBya19uZmNfc2VsZWN0X2NoaXA7Cj4+
Cj4+IEJ1dCBJIGZvdW5kwqBhbG1vc3QgYWxsIG5hbmRjIGRyaXZlcnMgZG8gbm90IGFkZCB0aGlz
IGNvZGUuIElzIHRoZXJlIGFueSBvdGhlciB3YXkgdG8gaW1wbGVtZW50IGl077yfCj4KPkluZGVl
ZCwgd2UgZG9uJ3QgYWNjZXB0IG5ldyBjb2RlIHdlIGxlZ2FjeSBiaW5kaW5ncy4KPgo+SSBkb24n
dCB1bmRlcnN0YW5kIHdoYXQgZXh0cmEgY29uc3VtcHRpb24geW91IGFyZSB0cnlpbmcgdG8gYXZv
aWQsCj5iZWNhdXNlIGlmIGl0IGlzIHRoZSBOQU5EIGRldmljZSBpdHNlbGYgdGhhdCBpcyBhYmxl
IHRvIHNhdmUgcG93ZXIgd2hlbgo+aXQgZ2V0cyB1bnNlbGVjdGVkLCBpdCdzIHJlYWxseSBub25l
IG9mIHlvdSBjb250cm9sbGVyJ3MgYnVzaW5lc3MuCj4KPlBlcmhhcHMgaXQncyB0aGUgdGltZSB0
byBmb2N1cyBvbiB0aGUgY29udHJvbGxlciBzdXBwb3J0IGFuZCB0dW5lIHRoZQo+Y29kZSBiYXNl
IGxhdGVyIGluIGEgYmlkIHRvIHJlZHVjZSBjb25zdW1wdGlvbi4KPgo+VGhhbmtzLAo+TWlxdcOo
bAo+Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
