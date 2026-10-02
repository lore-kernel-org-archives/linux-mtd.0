Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA4CA5FDD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhUCJCWTH7cs8CYB50ngAW1EN2cJNNodxK9ambjpQDM=; b=GwbkYQDKOamLeG
	ZdlCrYel5D+WZp1X7v4xK6x7fVTqCbGM+hgdDxlRh9EaccXlHwYRHFHPwRMDyVkRn2DUIrBJj7L2c
	fECr816ULMDftWFzTPjbuF/pBxQCak0W43xu8FEwmTNHknX0qsZ2YXrHjk59URsszZTfC1n+cbtQE
	KQCuEbSWVOdyxCRwH1APwRIQ8VuU9/uDhn+OrU5y2r6HqiYDIop0VRNANVBDsNyeIX6YCG62ozyRW
	S9sJaHwfHTv/VsT+2sQ9+Z/IvYxrXExiBns5vAzFF+clIpfG+RqGhbLJTLrkV8dS/jtYx1K3zWlvU
	xURwPHJi6MjjaI0JcK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcdz-0000000BbcV-3RMA;
	Fri, 02 Oct 2026 12:45:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcdy-0000000Bbc6-3j3l
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:45:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5814E60A99;
	Fri,  2 Oct 2026 12:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFB41F00893;
	Fri,  2 Oct 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945142;
	bh=xKTWeEYvEnq79Yxip4eR9Mt6akyZMfafUd0tpMec7X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bLk02lqHk6sLm/Y9/eL3x80KpG1VpyNYAA3SY/0XMGLKrqq/EvbsUSBRqZ71a1gAP
	 wOAsukhqRyamJGmYiW5kqlum2Awu52uz3BEQG8vc4OIl32A7pHL5IHRNKX5ibqWGCl
	 Z/vbdDVWzFlcwEvIg9gSejzjgmQk76ggul9PwyJrtg/+DudTaEyuUCJoPDF9JkG7DH
	 YfMDavAXO50DKNzh6g7xL0kjZHWHHIs9JGOiElFsb4d+S12itXfol4gKXn95udrnBR
	 uHnQ0slVIHTUiw4EU9Xshm3NKcBF4+JOIRfeNAxeFzu8kuc9rXzHuvBewKJa8s2hF7
	 T/qlfCpXyK0XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/15] mtd: spi-nor: winbond: Prepare the introduction
 of W35TxxNW parts
To: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-9-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-9-a22a2f95c26e@bootlin.com>
Date: Fri, 02 Oct 2026 12:45:41 +0000
Message-Id: <20261002124541.7EFB41F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
d2luYm9uZDogdm9sYXRpbGUgZHVtbXkgY3ljbGUgY29uZmlnIGxvc3Qgb24gcmVzdW1lCi0tCgpj
b21taXQgNjFhNGMxNDE4Nzk4ODA0NzU5ZGJiNWNlYjMxNmJkNTYxOTZiNjhhZApBdXRob3I6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cm10ZDogc3BpLW5vcjogd2lu
Ym9uZDogUHJlcGFyZSB0aGUgaW50cm9kdWN0aW9uIG9mIFczNVR4eE5XIHBhcnRzCgpUaGlzIGNv
bW1pdCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBXaW5ib25kIFczNVR4eE5XIG9jdGFsIERU
UiBmbGFzaApmYW1pbHkuIEl0IGltcGxlbWVudHMgY2FsbGJhY2tzIGZvciBlbnRlcmluZyBvY3Rh
bCBEVFIgbW9kZSBhbmQgY29uZmlndXJpbmcKdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMgdmlh
IHZvbGF0aWxlIFZDUiByZWdpc3RlcnMuCgo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2lu
Ym9uZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKClsgLi4uIF0KCj4g
K3N0YXRpYyBpbnQgd2luYm9uZF93MzV0eHhud19ub3Jfc2V0X2R1bW15KHN0cnVjdCBzcGlfbm9y
ICpub3IsIHU4IGR1bW15X2N5Y2xlcykKPiArewo+ICsJcmV0dXJuIHdpbmJvbmRfdzM1dHh4bndf
bm9yX3dyaXRlX3Zjcihub3IsIFdJTkJPTkRfTk9SX1ZDUl9EVU1NWV9DRkdfUkVHLAo+ICsJCQkJ
CSAgICAgIGR1bW15X2N5Y2xlcyk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgd2luYm9uZF93MzV0
eHhud19ub3Jfc2V0X29jdGFsX2R0cihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBib29sIGVuYWJsZSkK
PiArewo+ICsJZW51bSBzcGlfbm9yX3Byb3RvY29sIHByb3RvX2FmdDsKPiArCXU4ICpidWYgPSBu
b3ItPmJvdW5jZWJ1ZjsKPiArCXU4IHJkaWRfZHVtbXlfYWZ0LCB2YWw7Cj4gKwlpbnQgcmV0Owo+
ICsKPiArCWlmIChlbmFibGUpIHsKPiArCQl2YWwgPSBXSU5CT05EX05PUl9WQ1JfSU9fTU9ERV9P
RERSOwo+ICsJCXByb3RvX2FmdCA9IFNOT1JfUFJPVE9fOF84XzhfRFRSOwo+ICsJCXJkaWRfZHVt
bXlfYWZ0ID0gMTY7Cj4gKwl9IGVsc2Ugewo+ICsJCXZhbCA9IFdJTkJPTkRfTk9SX1ZDUl9JT19N
T0RFX1NTRFI7Cj4gKwkJcHJvdG9fYWZ0ID0gU05PUl9QUk9UT18xXzFfMTsKPiArCQlyZGlkX2R1
bW15X2FmdCA9IDA7Cj4gKwl9Cj4gKwo+ICsJcmV0ID0gd2luYm9uZF93MzV0eHhud19ub3Jfd3Jp
dGVfdmNyKG5vciwgV0lOQk9ORF9OT1JfVkNSX0lPX01PREVfQ0ZHX1JFRywgdmFsKTsKPiArCWlm
IChyZXQpCj4gKwkJcmV0dXJuIHJldDsKCltTZXZlcml0eTogSGlnaF0KV2lsbCB0aGlzIGxvc2Ug
dGhlIGR1bW15IGN5Y2xlIGNvbmZpZ3VyYXRpb24gdXBvbiBzeXN0ZW0gcmVzdW1lPwoKV2hlbiB0
aGUgc3lzdGVtIHJlc3VtZXMsIHRoZSBTUEkgTk9SIHN1YnN5c3RlbSBpbnZva2VzIHNwaV9ub3Jf
cmVzdW1lKCksCndoaWNoIGNhbGxzIHNwaV9ub3JfaW5pdCgpLiBUaGUgc3BpX25vcl9pbml0KCkg
ZnVuY3Rpb24gY2FsbHMKc3BpX25vcl9zZXRfb2N0YWxfZHRyKCkgdG8gcmUtZW5hYmxlIG9jdGFs
IERUUiBtb2RlLCB3aGljaCBpbnZva2VzCndpbmJvbmRfdzM1dHh4bndfbm9yX3NldF9vY3RhbF9k
dHIoKToKCnNwaV9ub3JfcmVzdW1lKCkKICBzcGlfbm9yX2luaXQoKQogICAgc3BpX25vcl9zZXRf
b2N0YWxfZHRyKCkKICAgICAgd2luYm9uZF93MzV0eHhud19ub3Jfc2V0X29jdGFsX2R0cigpCgpT
aW5jZSB3aW5ib25kX3czNXR4eG53X25vcl9zZXRfZHVtbXkoKSB3cml0ZXMgdG8gYSB2b2xhdGls
ZSByZWdpc3RlcgooV0lOQk9ORF9OT1JfVkNSX0RVTU1ZX0NGR19SRUcpLCB0aGF0IGNvbmZpZ3Vy
YXRpb24gaXMgbG9zdCBkdXJpbmcgc2xlZXAuCgpCZWNhdXNlIHRoZSBjb3JlIGRvZXMgbm90IGNh
bGwgdGhlIG5vci0+cGFyYW1zLT5zZXRfZHVtbXkoKSBjYWxsYmFjayBvbgpyZXN1bWUsIGFuZCB3
aW5ib25kX3czNXR4eG53X25vcl9zZXRfb2N0YWxfZHRyKCkgZG9lcyBub3QgZXhwbGljaXRseQpy
ZWNvbmZpZ3VyZSB0aGUgZHVtbXkgY3ljbGVzIHdoZW4gT2N0YWwgRFRSIGlzIHJlLWVuYWJsZWQs
IHdpbGwgdGhlIFNQSQpjb250cm9sbGVyIGFuZCB0aGUgZmxhc2ggY2hpcCBkaXNhZ3JlZSBvbiB0
aGUgbnVtYmVyIG9mIGR1bW15IGN5Y2xlcyB1c2VkCmZvciByZWFkIG9wZXJhdGlvbnM/CgpDYW4g
dGhpcyBjYXVzZSBkYXRhIGNvcnJ1cHRpb24gb24gcmVhZCBvcGVyYXRpb25zIGFmdGVyIGEgc3lz
dGVtCnN1c3BlbmQvcmVzdW1lIGN5Y2xlPwoKPiArCj4gKwkvKiBSZWFkIGZsYXNoIElEIHRvIG1h
a2Ugc3VyZSB0aGUgc3dpdGNoIHdhcyBzdWNjZXNzZnVsICovCj4gKwlyZXQgPSBzcGlfbm9yX3Jl
YWRfaWQobm9yLCAwLCByZGlkX2R1bW15X2FmdCwgYnVmLCBwcm90b19hZnQpOwoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwMi13
aW5ib25kLW1hc3Rlci1zcGktbm9yLXczNXQtdjEtMC1hMjJhMmY5NWMyNmVAYm9vdGxpbi5jb20/
cGFydD05CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
