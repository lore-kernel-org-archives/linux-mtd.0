Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA71C43331
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 13:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1A320775
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 13:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LgYSswTM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F1A320775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PAQIHZlmzcSH8DXftnx/AHqTStsU9TGnyelKdKD6yA=; b=LgYSswTMeU4OkL
	4Tw5+rJvNoP7Z1duYelCP8HCX9KIaFNhh4qlnjEmOyNq1wtam7+IIhrep+6UiKp+iwbQ9uTgTy23t
	DYb1wJc7RSAOZTCVcslIyKMfV6LbpgMruIaD0kz0nejgJIRDow5Tb5RcHgJF/m+fDR/nH6adn3eDk
	0KECK3Fjh2arlyO89Xol9S+YoodWgJ5MBFgwp3SgWvQzESGvdPaE3ldNtexiNAPpbKHSQroNJEa2c
	k+K+fbZq9rpFd6LvViv7hfKIAiKuBGRZI8npHjql3s/dS4qYwg4uVWkSSKzUn4mzAv9413TSSitbd
	DXcK7dMuh01GBnc5w96w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGjb6-0005xa-HX; Tue, 24 Mar 2020 13:28:00 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGjav-0005m2-If
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 13:27:52 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48msW62nF7z1qsZv;
 Tue, 24 Mar 2020 14:27:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48msW61Xw6z1qqkB;
 Tue, 24 Mar 2020 14:27:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KI2dn7oYdaEf; Tue, 24 Mar 2020 14:27:44 +0100 (CET)
X-Auth-Info: O36tjVcTnNqRqjn56Y7nMWOjOOT5bBR6urvusDump94=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 14:27:44 +0100 (CET)
Subject: Re: [00/12] add STM32 FMC2 controller drivers
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <466cf542-7575-d791-da81-da32c0919505@denx.de>
 <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6827412d-1350-5daf-6882-41dc2a9307e5@denx.de>
Date: Tue, 24 Mar 2020 14:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_062750_038877_4A5E3BB7 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8yNC8yMCA4OjM2IEFNLCBDaHJpc3RvcGhlIEtlcmVsbG8gd3JvdGU6Cj4gCj4gCj4gT24g
My8yNC8yMCAxOjM3IEFNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gMy8yMy8yMCAzOjU4IFBN
LCBDaHJpc3RvcGhlIEtlcmVsbG8gd3JvdGU6Cj4+PiBUaGUgRk1DMiBmdW5jdGlvbmFsIGJsb2Nr
IG1ha2VzIHRoZSBpbnRlcmZhY2Ugd2l0aDogc3luY2hyb25vdXMgYW5kCj4+PiBhc3luY2hyb25v
dXMgc3RhdGljIGRldmljZXMgKHN1Y2ggYXMgUFNOT1IsIFBTUkFNIG9yIG90aGVyIG1lbW9yeS1t
YXBwZWQKPj4+IHBlcmlwaGVyYWxzKSBhbmQgTkFORCBmbGFzaCBtZW1vcmllcy4KPj4+IEl0cyBt
YWluIHB1cnBvc2VzIGFyZToKPj4+IMKgwqAgLSB0byB0cmFuc2xhdGUgQVhJIHRyYW5zYWN0aW9u
cyBpbnRvIHRoZSBhcHByb3ByaWF0ZSBleHRlcm5hbCBkZXZpY2UKPj4+IMKgwqDCoMKgIHByb3Rv
Y29sCj4+PiDCoMKgIC0gdG8gbWVldCB0aGUgYWNjZXNzIHRpbWUgcmVxdWlyZW1lbnRzIG9mIHRo
ZSBleHRlcm5hbCBkZXZpY2VzCj4+PiBBbGwgZXh0ZXJuYWwgZGV2aWNlcyBzaGFyZSB0aGUgYWRk
cmVzc2VzLCBkYXRhIGFuZCBjb250cm9sIHNpZ25hbHMKPj4+IHdpdGggdGhlCj4+PiBjb250cm9s
bGVyLiBFYWNoIGV4dGVybmFsIGRldmljZSBpcyBhY2Nlc3NlZCBieSBtZWFucyBvZiBhIHVuaXF1
ZSBDaGlwCj4+PiBTZWxlY3QuIFRoZSBGTUMyIHBlcmZvcm1zIG9ubHkgb25lIGFjY2VzcyBhdCBh
IHRpbWUgdG8gYW4gZXh0ZXJuYWwKPj4+IGRldmljZS4KPj4+Cj4+PiBDaHJpc3RvcGhlIEtlcmVs
bG8gKDEyKToKPj4+IMKgwqAgZHQtYmluZGluZ3M6IG1mZDogc3RtMzItZm1jMjogYWRkIFNUTTMy
IEZNQzIgY29udHJvbGxlciBkb2N1bWVudGF0aW9uCj4+PiDCoMKgIG1mZDogc3RtMzItZm1jMjog
YWRkIFNUTTMyIEZNQzIgY29udHJvbGxlciBkcml2ZXIKPj4+IMKgwqAgYnVzOiBzdG0zMi1mbWMy
LWViaTogYWRkIFNUTTMyIEZNQzIgRUJJIGNvbnRyb2xsZXIgZHJpdmVyCj4+PiDCoMKgIG10ZDog
cmF3bmFuZDogc3RtMzJfZm1jMjogbWFuYWdlIGFsbCBlcnJvcnMgY2FzZXMgYXQgcHJvYmUgdGlt
ZQo+Pj4gwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHJlbW92ZSB1c2VsZXNzIGlubGlu
ZSBjb21tZW50cwo+Pj4gwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHVzZSBGTUMyX1RJ
TUVPVVRfTVMgZm9yIHRpbWVvdXRzCj4+PiDCoMKgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjog
Y2xlYW51cAo+Pj4gwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHVzZSBGSUVMRF9QUkVQ
L0ZJRUxEX0dFVCBtYWNyb3MKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBtb3Zl
IGFsbCByZWdpc3RlcnMKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2UgcmVn
bWFwIEFQSXMKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2Ugc3RtMzJfZm1j
MiBzdHJ1Y3R1cmUgaW4gbmZjIGNvbnRyb2xsZXIKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0z
Ml9mbWMyOiBhZGQgbmV3IE1QMSBjb21wYXRpYmxlIHN0cmluZwo+Pgo+PiBUaGlzIGRvZXNuJ3Qg
YXBwbHkgdG8gZWl0aGVyIG5leHQgb3IgNS42LXJjNywgZG8geW91IGhhdmUgYSB0cmVlCj4+IHNv
bWV3aGVyZSB3aXRoIHRob3NlIHBhdGNoZXMgYXBwbGllZCA/Cj4+Cj4gCj4gSGkgTWFyZWssCgpI
aSwKCj4gVGhpcyBpbXBsZW1lbnRhdGlvbiBoYXMgYmVlbiBkb25lIG9uIG10ZC9uYW5kL25leHQg
YnJhbmNoLgoKT2Ygd2hpY2ggdHJlZSA/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
