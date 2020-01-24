Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30252C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 17:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032E02072C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 17:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ruco/9Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032E02072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SF4WC14Tfe4oT11ZDGsAcdmOnw9iv/TMdQ8InprY7jo=; b=Ruco/9QfoU3QhZ
	i5S+OMtRPPJ1Wz8kOTDfMpgHf3qgbzl7mkA/gsaHHlsluck4TiWHXecsCyz7alrfWB+4xPGxaepeJ
	ySKgRaW+x9sXRAYCAf7QIYaEPuyveZZ/nkxlaPVMRcOrcB0wllhSJvtC5i17zLZU/TTd8PJ0Wn2i9
	T2BSFsQQtJyaePh8aXPKbTjlfoxk2bCXoF3nst8zu2CCisQCddl5i2wkqaxZl7zX2ZJZVcK+wjLcz
	sHZ7zRgs1qASb2z7RR9uW9JmLnP3QBDi5krTMzH4MVm5nGxkvxADluxe9W8t9q+bYNcs3G7AEIpqn
	DtGRdeA5uqVb0M0y0SMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv2bB-0005rY-62; Fri, 24 Jan 2020 17:18:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv2b0-0005jZ-Th; Fri, 24 Jan 2020 17:18:16 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 04F64E0003;
 Fri, 24 Jan 2020 17:17:52 +0000 (UTC)
Date: Fri, 24 Jan 2020 18:17:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH v2 00/10] Enable RK3066 NANDC for MK808
Message-ID: <20200124181751.721aa428@xps13>
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_091815_097510_4C3D83CB 
X-CRM114-Status: GOOD (  14.60  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, yifeng.zhao@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9oYW4sCgpKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPiB3cm90ZSBvbiBGcmks
IDI0IEphbiAyMDIwIDE3OjI5OjUxCiswMTAwOgoKPiBESVNDTEFJTUVSOiBVc2UgYXQgeW91ciBv
d24gcmlzay4KPiBTdGF0dXM6IEZvciB0ZXN0aW5nIG9ubHkhCj4gCj4gVmVyc2lvbjogVjIKPiAK
PiBUaXRsZTogRW5hYmxlIFJLMzA2NiBOQU5EQyBmb3IgTUs4MDguCj4gCj4gVGhlIG1ham9yaXR5
IG9mIFJvY2tjaGlwIGRldmljZXMgdXNlIGEgY2xvc2VkIHNvdXJjZSBGVEwgZHJpdmVyCj4gdG8g
cmVkdWNlIHdlYXIgbGV2ZWxpbmcuIFRoaXMgcGF0Y2ggc2VyaWUgcHJvcG9zZXMKPiBhbiBleHBl
cmltZW50YWwgcmF3IE5BTkQgY29udHJvbGxlciBkcml2ZXIgZm9yIGJhc2ljIHRhc2tzCj4gaW4g
b3JkZXIgdG8gZ2V0IHRoZSBiaW5kaW5ncyBhbmQgdGhlIG5vZGVzIGFjY2VwdGVkIGZvciBpbiB0
aGUgZHRzIGZpbGVzLgo+IAo+IFdoYXQgZG9lcyBpdCBkbzoKPiAKPiBPbiBtb2R1bGUgbG9hZCB0
aGlzIGRyaXZlciB3aWxsIHJlc2VydmUgaXRzIHJlc291cmNlcy4KPiBBZnRlciBpbml0aWFsaXph
dGlvbiB0aGUgTVREIGZyYW1ld29yayB3aWxsIHRoZW4gdHJ5IHRvIGRldGVjdAo+IHRoZSB0eXBl
IGFuZCBudW1iZXIgb2YgTkFORCBjaGlwcy4gV2hlbiBhbGwgY29uZGl0aW9ucyBhcmUgbWV0LAo+
IGl0IHJlZ2lzdGVycyBpdCBzZWxmIGFzIE1URCBkZXZpY2UuCj4gVGhpcyBkcml2ZXIgaXMgdGhl
biByZWFkeSB0byByZWNlaXZlIHVzZXIgY29tbWFuZHMKPiBzdWNoIGFzIHRvIHJlYWQgYW5kIHdy
aXRlIE5BTkQgcGFnZXMuCj4gCj4gVGVzdCBleGFtcGxlczoKPiAKPiAjIGRkIGlmPS9kZXYvbXRk
MCBvZj1kZC5iaW4gYnM9ODE5MiBjb3VudD00Cj4gCj4gIyBuYW5kZHVtcCAtYSAtbCAzMjc2OCAt
ZiBuYW5kZHVtcC5iaW4gL2Rldi9tdGQwCj4gCj4gTm90IHRlc3RlZDoKPiAKPiBOQU5EQyB2ZXJz
aW9uIDkuCj4gTkFORCByYXcgd3JpdGUuCgpuYW5kYml0ZXJycyAtaSAvZGV2L210ZDx4PiB0byB2
YWxpZGF0ZSBpdCB3b3JrcyEKCj4gUkszMDY2IHN0aWxsIGhhcyBubyBzdXBwb3J0IGZvciBVYm9v
dC4KPiBBbnkgd3JpdGUgY29tbWFuZCB3b3VsZCBpbnRlcmZlcmUgd2l0aCBkYXRhIHN0cnVjdHVy
ZXMgbWFkZSBieSB0aGUgYm9vdCBsb2FkZXIuCj4gCj4gRXRjLgo+IAo+IFByb2JsZW1zOgo+IAo+
IE5vIGJhZCBibG9jayBzdXBwb3J0LiBNb3N0IGRldmljZXMgdXNlIGEgRlRMIGJhZCBibG9jayBt
YXAgd2l0aCB0YWdzCj4gdGhhdCBtdXN0IGJlIGxvY2F0ZWQgb24gc3BlY2lmaWMgcGFnZSBsb2Nh
dGlvbnMgd2hpY2ggaXMgb3V0c2lkZQo+IHRoZSBzY29wZSBvZiB0aGUgcmF3IE1URCBmcmFtZXdv
cmsuCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBzdG9yeSBvZiBiYWQgYmxvY2sgbWFwLiBBcmUg
eW91IGNvbXBhcmluZyB3aXRoCmEgdmVuZG9yIGtlcm5lbD8KCklmIHZlbmRvcnMgaW52ZW50IG5l
dyB3YXlzIHRvIGhhbmRsZSBNVEQgYmxvY2tzIGl0J3Mgc2FkIGJ1dCB0aGV5IHdpbGwKbmV2ZXIg
YmUgY29tcGF0aWJsZSB3aXRoIG1haW5saW5lLiBJdCdzIGEgZmFjdC4gSG93ZXZlciBmb3IgYW4g
dXBzdHJlYW0KdmVyc2lvbiwgSSBkb24ndCBnZXQgaWYgdGhlcmUgaXMgYW55IHJlYWwgaXNzdWU/
IFRoZSBsb2NhdGlvbiBvZiB0aGUKQkJNIGlzIG5vdCByZWxhdGVkIHRvIHlvdXIgY29udHJvbGxl
ciBkcml2ZXIgYnV0IGRlcGVuZHMgb24gdGhlIE5BTkQKY2hpcCBhbmQgYXMgeW91IHNheSBiZWxv
dyB3ZSBrbm93IHByb3ZpZGUgdGhyZWUgcG9zc2libGUgcG9zaXRpb25zIGluCmEgYmxvY2suCgpX
aGF0IHlvdSByZWZlciBhcyB0aGUgRlRMIGlzIHRoZSBlcXVpdmFsZW50IG9mIFVCSSBpbiBMaW51
eCwgd2hpY2gKaW5kZWVkIG9mZmVycyB0byB0aGUgdXNlciBhIGxpbmVhciBsb2dpY2FsIHZpZXcg
b2YgYWxsIHRoZSB2YWxpZCBibG9ja3MKd2hpbGUgcGh5c2ljYWxseSB0aGUgZGF0YSBpcyBzcHJl
YWQgYWNyb3NzIGFsbCB0aGUgYXZhaWxhYmxlCmVyYXNlYmxvY2tzLgoKPiAKPiBoeW5peF9uYW5k
X2luaXQoKSBhZGQgZXh0cmEgb3B0aW9uIE5BTkRfQkJNX0xBU1RQQUdFIGZvciBIMjdVQ0c4VDJB
VFItQkMuCj4gCj4gTm8gcGFydGl0aW9uIHN1cHBvcnQuIEEgRlRMIGRyaXZlciB3aWxsIHN0b3Jl
IGF0IHJhbmRvbSBsb2NhdGlvbnMgYW5kCj4gYSBsaW5lYXIgdXNlciBzcGVjaWZpYyBsYXlvdXQg
ZG9lcyBub3QgZml0IHdpdGhpbgo+IHRoZSBnZW5lcmljIGNoYXJhY3RlciBvZiB0aGlzIGJhc2lj
IGRyaXZlci4KPiAKPiBEcml2ZXIgYXNzdW1lcyB0aGF0IElPIHBpbnMgYXJlIGNvcnJlY3RseSBz
ZXQgYnkgdGhlIGJvb3QgbG9hZGVyLgoKV2hpY2ggcGlucyBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/
IEFyZSB5b3UgbWlzc2luZyBhIHBpbmN0cmwgZHJpdmVyPwoKPiAKPiBGaXhlZCB0aW1pbmcgc2V0
dGluZy4KPiAKPiBSSzMyMjhBL1JLMzIyOEIgY29tcGF0aWJpbGl0eSB2ZXJzaW9uIDcwMSB1bmtu
b3duCj4gUlYxMTA4IG5hbmQgdmVyc2lvbiB1bmtub3duCj4gCj4gRXRjLgo+IAo+IFRvZG86Cj4g
Cj4gTUxDID8KClRoaXMgaXMgbm90IHJlbGF0ZWQgdG8geW91ciBOQU5EIGNvbnRyb2xsZXIgZHJp
dmVyIG5laXRoZXIuCgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
