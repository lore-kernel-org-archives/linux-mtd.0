Return-Path: <SRS0=1wRa=2N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23740C2D0C0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 09:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD32D206B7
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 09:23:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YYdU/UNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD32D206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zoxC+dE0Ymdp5UpvyDWkPv9kacM931wDTEfaG41/Uiw=; b=YYdU/UNnoPbqeV
	YbB7rWNmhXah1ZmRPkvSAw5rTLtNeo3OjVU3Z7UpXcCHWSwIxDnGF89W7LDkJawSpovuau9nyDdwu
	wZcRBW0RLgLek9msRvzKG54IhoBx2g3VCbFhEqyl2NxDj7izBZhoN9fi12UjLTIuhIMVdwSTJX67X
	KiPgBn+23eIs0nsHY3MC9AxGZWTgc/YCPD6yMnTvptCBVmffTBBHLsWF3GCBESude8HrnCyTBwj3b
	z7ByTGo5knnkrK8KkUJ18P3mfmail5IShTMy3ZD6Bocd0xSCOb0eUQ84YR7+sIRSm5k8ZCu6x8e7h
	j+/Ta866A8elXTVg2j+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijJvq-0007Lz-I4; Mon, 23 Dec 2019 09:23:18 +0000
Received: from [68.183.32.7] (helo=cuisineaz.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijJvl-0007LE-76
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2019 09:23:14 +0000
Received: by cuisineaz.com (Postfix, from userid 33)
 id 308DB46A47; Mon, 23 Dec 2019 08:27:12 +0000 (UTC)
Date: Mon, 23 Dec 2019 08:27:12 +0000
To: linux-mtd@lists.infradead.org
From: =?utf-8?Q??= <linux-mtd@lists.infradead.org>
Subject: =?utf-8?Q?Schlechte=20Nachrichten?=
Message-ID: <0410ac0ffcb0b3e3b32932d716b1cbe4@68.183.32.7>
X-Priority: 3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_012313_390157_E2AE2A20 
X-CRM114-Status: UNSURE (  -2.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SWNoIGdyw7zDn2UgZGljaCEKSWNoIGhhYmUgc2NobGVjaHRlIE5hY2hyaWNodGVuIGbDvHIgZGlj
aC4KMjkuMTIuMjAxOCAtIEFuIGRpZXNlbSBUYWcgaGFiZSBpY2ggbWljaCBpbiBJaHIgQmV0cmll
YnNzeXN0ZW0gZ2VoYWNrdCB1bmQgaGF0dGUgdm9sbGVuIFp1Z3JpZmYgYXVmIElociBLb250by4g
RGFzIFBhc3N3b3J0IG11c3MgbmljaHQgZ2XDpG5kZXJ0IHdlcmRlbiwgbWVpbmUgTWFsd2FyZSBm
w6RuZ3QgZXMgamVkZXMgTWFsIGFiLgpXaWUgZXMgd2FyOgoKRGllIFNvZnR3YXJlIGF1ZiBkZW0g
Um91dGVyLCBtaXQgZGVtIFNpZSBhbiBkaWVzZW0gVGFnIHZlcmJ1bmRlbiB3YXJlbiwgd2FyIGFu
ZsOkbGxpZy4KSWNoIGhhYmUgbWljaCB6dWVyc3QgaW4gZGllc2VuIFJvdXRlciBnZWhhY2t0IHVu
ZCBtZWluZW4gYsO2c2FydGlnZW4gQ29kZSBoaW5laW5nZWxlZ3QuCkFscyBTaWUgaW5zIEludGVy
bmV0IGthbWVuLCB3YXIgbWVpbiBUcm9qYW5lciBhdWYgZGVtIEJldHJpZWJzc3lzdGVtIElocmVz
IEdlcsOkdHMgaW5zdGFsbGllcnQuCkRhbm4gaGFiZSBpY2ggZWluZSB2b2xsc3TDpG5kaWdlIFNp
Y2hlcnVuZyBJaHJlciBGZXN0cGxhdHRlIGVyc3RlbGx0IChpY2ggaGFiZSBiZXJlaXRzIElociBB
ZHJlc3NidWNoLApWZXJsYXVmLCBhbGxlIERhdGVpZW4sIFRlbGVmb25udW1tZXJuIHVuZCBBZHJl
c3NlbiBhbGwgSWhyZXIgS29udGFrdGUpLgpWb3IgZWluZW0gTW9uYXQgd29sbHRlIGljaCBJaHIg
R2Vyw6R0IHNwZXJyZW4gdW5kIHVtIEdlbGQgYml0dGVuLCB1bSBlcyB6dSBlbnRzcGVycmVuLgpB
YmVyIGljaCBoYWJlIG1pciBkaWUgV2Vic2l0ZXMgYW5nZXNlaGVuLCBkaWUgU2llIHJlZ2VsbcOk
w59pZyBiZXN1Y2hlbiwgdW5kIG1pY2ggc2VociBnZWZyZXV0LCBJaHJlIExpZWJsaW5nc3F1ZWxs
ZW4genUgc2VoZW4uCkljaCBzcHJlY2hlIHZvbiBXZWJzaXRlcyBmw7xyIEVyd2FjaHNlbmUuCgpJ
Y2ggbWVpbmUgLSBkdSBiaXN0IGVpbiBncm/Dn2VyIFBlcnZlcnNsaW5nLiBTaWUgaGFiZW4gZWlu
ZSB1bmdlesO8Z2VsdGUgRmFudGFzaWUhCkRhbm4gaGF0dGUgaWNoIGVpbmUgSWRlZS4KSWNoIGhh
YmUgZWluZW4gU2NyZWVuc2hvdCB2b24gZGVyIGludGltZW4gU2VpdGUgZ2VtYWNodCwgYXVmIGRl
ciBTaWUgenVmcmllZGVuIHNpbmQgKHZlcnN0ZWhlbiBTaWUsIHdhcyBpY2ggbWVpbmU/KS4KRGFu
biBoYWJlIGljaCBlaW4gVmlkZW8gdm9uIGRlaW5lbSBTcGHDnyBnZW1hY2h0IChtaXQgZGVyIEth
bWVyYSBkZWluZXMgR2Vyw6R0cykuIEVzIHd1cmRlIHNjaMO2biEKSWNoIGJpbiBkZXIgZmVzdGVu
IMOcYmVyemV1Z3VuZywgZGFzcyBTaWUgZGllc2UgRm90b3MgbmljaHQgSWhyZW4gRWx0ZXJuLCBG
cmV1bmRlbiBvZGVyIEtvbGxlZ2VuIHplaWdlbiBtw7ZjaHRlbi4KSWNoIGRlbmtlLCAzOTkg4oKs
IHNpbmQgZWluIHNlaHIga2xlaW5lciBCZXRyYWcgZsO8ciBtZWluIFNjaHdlaWdlbi4KCkljaCBo
YWJlIMO8YnJpZ2VucyB2aWVsIFplaXQgbWl0IGRpciB2ZXJicmFjaHQhCkljaCBha3plcHRpZXJl
IG51ciBHZWxkIGluIEJpdGNvaW5zLgoKTWVpbiBCVEMtUG9ydGZvbGlvOiAxSGdaZ0dUSDdCbXlZ
Vk1jeVJ1VWhlTEJhZk1oUGhkNjZHClNpZSBzaW5kIHNpY2ggbmljaHQgc2ljaGVyLCB3aWUgU2ll
IGVpbmUgQml0Y29pbi1CcmllZnRhc2NoZSB3aWVkZXJoZXJzdGVsbGVuIHNvbGxlbj8KClNjaHJl
aWJlbiBTaWUgaW4gamVkZSBTdWNobWFzY2hpbmUsICJ3aWUgU2llIEdlbGQgYW4gZWluZSBCVEMt
R2VsZGLDtnJzZSBzZW5kZW4iLgpFcyBpc3QgZWluZmFjaGVyIGFscyBHZWxkIGFuIGVpbmUgS3Jl
ZGl0a2FydGUgenUgc2VuZGVuIQpGw7xyIGRpZSBCZXphaGx1bmcgaGFiZW4gU2llIGV0d2FzIG1l
aHIgYWxzIHp3ZWkgVGFnZSBaZWl0IChnZW5hdSA1MCBTdHVuZGVuKS4KCktlaW5lIFNvcmdlLCBk
aWUgU3RvcHB1aHIgc3RhcnRldCwgd2VubiBTaWUgZGllc2VuIEJyaWVmIMO2ZmZuZW4uIEphLCBq
YSAuLi4gZXMgaGF0IHNjaG9uIGJlZ29ubmVuIQpOYWNoIGRlciBCZXphaGx1bmcgd2VyZGVuIG1l
aW4gVmlydXMgdW5kIElocmUgc2NobXV0emlnZW4gRm90b3MgbWl0IElobmVuIHplcnN0w7ZydC4K
V2VubiBpY2ggbmljaHQgZGVuIGFuZ2VnZWJlbmVuIEJldHJhZyB2b24gSWhuZW4gZXJoYWx0ZSwg
d2lyZCBJaHIgR2Vyw6R0IGdlc3BlcnJ0IHVuZCBhbGxlIElocmUgS29udGFrdGUgZXJoYWx0ZW4g
ZWluIEZvdG8gbWl0IElocmVtICJWZXJnbsO8Z2VuIi4KSWNoIG3DtmNodGUsIGRhc3MgZHUgdm9y
c2ljaHRpZyBiaXN0LgotIFZlcnN1Y2hlbiBTaWUgbmljaHQsIG1laW5lbiBWaXJ1cyB6dSBmaW5k
ZW4gdW5kIHp1IHplcnN0w7ZyZW4hIChBbGxlIElocmUgRGF0ZW4gd3VyZGVuIGJlcmVpdHMgYXVm
IGVpbmVuIGV4dGVybmVuIFNlcnZlciBob2NoZ2VsYWRlbikKLSBWZXJzdWNoZW4gU2llIG5pY2h0
LCBtaWNoIHp1IGtvbnRha3RpZXJlbiAoZXMgaXN0IG5pY2h0IG3DtmdsaWNoLCBpY2ggaGFiZSBJ
aG5lbiBlaW5lIEUtTWFpbCB2b24gSWhyZW0gS29udG8gZ2VzZW5kZXQpCi0gVmVyc2NoaWVkZW5l
IFNpY2hlcmhlaXRzZGllbnN0ZSBoZWxmZW4gSWhuZW4gbmljaHQuIERhcyBGb3JtYXRpZXJlbiBl
aW5lciBGZXN0cGxhdHRlIG9kZXIgZGFzIFplcnN0w7ZyZW4gZWluZXMgR2Vyw6R0cyBoaWxmdCBl
YmVuZmFsbHMgbmljaHQsIGRhIHNpY2ggSWhyZSBEYXRlbiBiZXJlaXRzIGF1ZiBlaW5lbSBSZW1v
dGUtU2VydmVyIGJlZmluZGVuLgpQUyBJY2ggZ2FyYW50aWVyZSBJaG5lbiwgZGFzcyBpY2ggU2ll
IG5hY2ggZGVyIFphaGx1bmcgbmljaHQgc3TDtnJlbiB3ZXJkZSwgd2VpbCBTaWUgbmljaHQgbWVp
biBlaW56aWdlcyBPcGZlciBzaW5kLgpFcyBpc3QgZWluIEVocmVua29kZXggZsO8ciBQaXJhdGVu
LgpBYiBzb2ZvcnQgZW1wZmVobGUgaWNoIElobmVuLCBlaW4gZ3V0ZXMgQW50aXZpcmVucHJvZ3Jh
bW0genUgdmVyd2VuZGVuIHVuZCBlcyByZWdlbG3DpMOfaWcgKG1laHJtYWxzIHTDpGdsaWNoKSB6
dSBha3R1YWxpc2llcmVuIQpTZWkgbWlyIG5pY2h0IGLDtnNlLCBqZWRlciBoYXQgc2VpbmVuIGVp
Z2VuZW4gSm9iLgpBdWYgV2llZGVyc2VoZW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
