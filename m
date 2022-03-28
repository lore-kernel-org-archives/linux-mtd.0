Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93A9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DOjJZ00MBrQq4lRWVmCC8dapSNXdB/kilbSW8gBtSbg=; b=Y8P81m8/y9Zr5s
	+ZO4TDhOFGJ2yEy+MkBB3ujdYwxhdpuWB2s9ocI3GZV/u8hrn4z2HRkrqb5iGGx8n4A1A037nJD6s
	014FIPQJAhh/FyPiztMsYgTK0VU21bI1khZydrd8cQ1Qdd62/D+juzjqZbN8EO+qqcfN9AAV2NueK
	Y7HkoFWDwdxegi3JB5qH7BWUf89lsngJUdFzinXiXTBVz4G8hWBV99Hqj7PTCvgKpZBYqbaP3wB0f
	c7S+Tp7Mdq4FMMuhFqA+hzA0DplC6rfvCtjTb2hTQicydusDoQ6iwgjgoK2Fn3yUm8CtNcpy0hM6c
	v6ozphOk2Lwz44gl3bbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYrxo-009SJx-NY; Mon, 28 Mar 2022 16:11:28 +0000
Received: from louie.mork.no ([2001:41c8:51:8a:feff:ff:fe00:e5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYrxl-009SIW-1g
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 16:11:27 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9f:8600:0:0:0:1])
 (authenticated bits=0)
 by louie.mork.no (8.15.2/8.15.2) with ESMTPSA id 22SGBGTc084871
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 17:11:17 +0100
Received: from miraculix.mork.no ([IPv6:2a01:799:c9f:8602:8cd5:a7b0:d07:d516])
 (authenticated bits=0)
 by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 22SGBDrc2261970
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 18:11:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
 t=1648483876; bh=ylEt2QBfNYPBDlHibbdrlD4vWN8MJiweBZSBI4HZ7qw=;
 h=From:To:Cc:Subject:Date:Message-Id:From;
 b=mRjtwWpkE8XVn3xtBo29Ta16GifQ5UiPht/luB+02BxNTuYJC5HbEpmPyG1aR6OPZ
 Xty43nqzqjJQQv6U2m4AO7GBdZ+iULxj/t5tdfoxo/9zHg6VOn4ucr9HgzaNej0uuY
 AB4gKMoxqMAviqSPazYKoh288IJW++j4p0+DtT20=
Received: (nullmailer pid 87825 invoked by uid 1000);
 Mon, 28 Mar 2022 16:11:13 -0000
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] mtdblock: warn if opened on NAND
Date: Mon, 28 Mar 2022 18:11:08 +0200
Message-Id: <20220328161108.87757-1-bjorn@mork.no>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_091125_551343_49D05F18 
X-CRM114-Status: GOOD (  19.19  )
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

V2FybmluZyBvbiBldmVyeSB0cmFuc2xhdGVkIG10ZCBwYXJ0aXRpb24gcmVzdWx0cyBpbiBleGNl
c3NpdmUgbG9nIG5vaXNlCmlmIHRoaXMgZHJpdmVyIGlzIGxvYWRlZDoKCiAgbmFuZDogZGV2aWNl
IGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YzIsIENoaXAgSUQ6IDB4ZjEKICBuYW5kOiBNYWNy
b25peCBNWDMwTEYxRzE4QUMKICBuYW5kOiAxMjggTWlCLCBTTEMsIGVyYXNlIHNpemU6IDEyOCBL
aUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0CiAgbXQ3NjIxLW5hbmQgMWUwMDMwMDAu
bmFuZDogRUNDIHN0cmVuZ3RoIGFkanVzdGVkIHRvIDQgYml0cwogIHJlYWRfYmJ0OiBmb3VuZCBi
YnQgYXQgYmxvY2sgMTAyMwogIDEwIGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBv
biBNVEQgZGV2aWNlIG10NzYyMS1uYW5kCiAgQ3JlYXRpbmcgMTAgTVREIHBhcnRpdGlvbnMgb24g
Im10NzYyMS1uYW5kIjoKICAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA4MDAwMCA6ICJCb290bG9h
ZGVyIgogIG10ZGJsb2NrOiBNVEQgZGV2aWNlICdCb290bG9hZGVyJyBpcyBOQU5ELCBwbGVhc2Ug
Y29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4KICAweDAwMDAwMDA4MDAw
MC0weDAwMDAwMDEwMDAwMCA6ICJDb25maWciCiAgbXRkYmxvY2s6IE1URCBkZXZpY2UgJ0NvbmZp
ZycgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3Rl
YWQuCiAgMHgwMDAwMDAxMDAwMDAtMHgwMDAwMDAxNDAwMDAgOiAiRmFjdG9yeSIKICBtdGRibG9j
azogTVREIGRldmljZSAnRmFjdG9yeScgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIFVC
SSBibG9jayBkZXZpY2VzIGluc3RlYWQuCiAgMHgwMDAwMDAxNDAwMDAtMHgwMDAwMDIwMDAwMDAg
OiAiS2VybmVsIgogIG10ZGJsb2NrOiBNVEQgZGV2aWNlICdLZXJuZWwnIGlzIE5BTkQsIHBsZWFz
ZSBjb25zaWRlciB1c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgogIDB4MDAwMDAwNTQw
MDAwLTB4MDAwMDAyMDAwMDAwIDogInViaSIKICBtdGRibG9jazogTVREIGRldmljZSAndWJpJyBp
cyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4K
ICAweDAwMDAwMjE0MDAwMC0weDAwMDAwNDAwMDAwMCA6ICJLZXJuZWwyIgogIG10ZGJsb2NrOiBN
VEQgZGV2aWNlICdLZXJuZWwyJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJs
b2NrIGRldmljZXMgaW5zdGVhZC4KICAweDAwMDAwNDAwMDAwMC0weDAwMDAwNDEwMDAwMCA6ICJ3
d2FuIgogIG10ZGJsb2NrOiBNVEQgZGV2aWNlICd3d2FuJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lk
ZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4KICAweDAwMDAwNDEwMDAwMC0weDAw
MDAwNTEwMDAwMCA6ICJkYXRhIgogIG10ZGJsb2NrOiBNVEQgZGV2aWNlICdkYXRhJyBpcyBOQU5E
LCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4KICAweDAw
MDAwNTEwMDAwMC0weDAwMDAwNTIwMDAwMCA6ICJyb20tZCIKICBtdGRibG9jazogTVREIGRldmlj
ZSAncm9tLWQnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkgYmxvY2sgZGV2aWNl
cyBpbnN0ZWFkLgogIDB4MDAwMDA1MjAwMDAwLTB4MDAwMDA1MjgwMDAwIDogInJlc2VydmUiCiAg
bXRkYmxvY2s6IE1URCBkZXZpY2UgJ3Jlc2VydmUnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1
c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgogIG10a19zb2NfZXRoIDFlMTAwMDAwLmV0
aGVybmV0IGV0aDA6IG1lZGlhdGVrIGZyYW1lIGVuZ2luZSBhdCAweGJlMTAwMDAwLCBpcnEgMjEK
ClRoaXMgaXMgbW9yZSBsaWtlbHkgdG8gYW5ub3kgdGhhbiB0byBoZWxwIHVzZXJzIG9mIGVtYmVk
ZGVkIGRpc3Ryb3Mgd2hlcmUKdGhpcyBkcml2ZXIgaXMgZW5hYmxlZCBieSBkZWZhdWx0LiAgTWFr
aW5nIHRoZSBibG9ja2RldnMgYXZhaWxhYmxlIGRvZXMKbm90IGltcGx5IHRoYXQgdGhleSBhcmUg
aW4gdXNlLCBhbmQgd2FybmluZyBhYm91dCBib290bG9hZGVyIHBhcnRpdGlvbnMKb3Igb3RoZXIg
ZGV2aWNlcyB3aGljaCBvYnZpb3VzbHkgbmV2ZXIgd2lsbCBiZSBtb3VudGVkIGlzIG1vcmUgY29u
ZnVzaW5nCnRoYW4gaGVscGZ1bC4KCk1vdmUgdGhlIHdhcm5pbmcgdG8gb3BlbigpLCB3aGVyZSBp
dCB3aWxsIGJlIG9mIG1vcmUgdXNlIC0gYWN0dWFsbHkgd2FybmluZwphbnlvbmUgd2hvIG1vdW50
cyBhIGZpbGUgc3lzdGVtIG9uIE5BTkQgdXNpbmcgbXRkYmxvY2suCgpGaXhlczogZTA3NDAzYThj
NmJlICgibXRkYmxvY2s6IFdhcm4gaWYgYWRkZWQgZm9yIGEgTkFORCBkZXZpY2UiKQpTaWduZWQt
b2ZmLWJ5OiBCasO4cm4gTW9yayA8Ympvcm5AbW9yay5ubz4KLS0tCkkgZG9uJ3Qga25vdyB3aGF0
IHRvIGRvIGFib3V0IHRoZSBtdGRibG9ja19ybyBwYXJ0IG9mIHRoZSBvcmlnaW5hbApwYXRjaCBz
aW5jZSBpdCBkb2Vzbid0IGhhdmUgYW4gb3BlbiBob29rLiBBZGRpbmcgb25lIGp1c3QgdG8gcHJp
bnQKdGhpcyB3YXJuaW5nIHNlZW1zIGEgYml0IGxpa2Ugb3ZlcmtpbGwuLi4gIE1heWJlIGp1c3Qg
ZHJvcCB0aGUKd2FybmluZyB0aGVyZT8gV2hhdCBoYXJtIGlzIHRoZXJlIGFjY2Vzc2luZyBOQU5E
IGRldmljZXMgYW55d2F5PwoKTGVhdmluZyB0aGF0IGRlY2lzaW9uIHVwIHRvIHlvdSBleHBlcnRz
IDotKQoKSSdkIHJlYWxseSBsaWtlIHRvIHNlZSB0aGlzIGZpeCBnZXQgaW50byBzdGFibGUgYmVm
b3JlIHRoZSBtYXNzZXMKc3RhcnQgbm90aWNpbmcgbm93IHRoYXQgT3BlbldydCBpcyBtb3Zpbmcg
dG8gNS4xNS4gIEFzIHlvdSBtYXkgb3IKbm90IGtub3csIE9wZW5XcnQgdW5jb25kaXRpb25hbGx5
IGluY2x1ZGVzIG10ZGJsb2NrIHdoZXRoZXIgdGhlCnRhcmdldCBpcyBOQU5EIG9yIE5PUi4gIFNv
IHRoaXMgd2lsbCBjYXVzZSBsb3RzIG9mIG5vaXNlIG9uIGFueQpOQU5EIE9wZW5XcnQgZGV2aWNl
LgoKCkJqw7hybgoKIGRyaXZlcnMvbXRkL210ZGJsb2NrLmMgfCA4ICsrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL210ZGJsb2NrLmMgYi9kcml2ZXJzL210ZC9tdGRibG9jay5jCmluZGV4IDAzZTNk
ZTNhNWQ3OS4uMWU5NGU3ZDEwYjhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRibG9jay5j
CisrKyBiL2RyaXZlcnMvbXRkL210ZGJsb2NrLmMKQEAgLTI1Nyw2ICsyNTcsMTAgQEAgc3RhdGlj
IGludCBtdGRibG9ja19vcGVuKHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICptYmQpCiAJCXJldHVy
biAwOwogCX0KIAorCWlmIChtdGRfdHlwZV9pc19uYW5kKG1iZC0+bXRkKSkKKwkJcHJfd2Fybigi
JXM6IE1URCBkZXZpY2UgJyVzJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJs
b2NrIGRldmljZXMgaW5zdGVhZC5cbiIsCisJCQltYmQtPnRyLT5uYW1lLCBtYmQtPm10ZC0+bmFt
ZSk7CisKIAkvKiBPSywgaXQncyBub3Qgb3Blbi4gQ3JlYXRlIGNhY2hlIGluZm8gZm9yIGl0ICov
CiAJbXRkYmxrLT5jb3VudCA9IDE7CiAJbXV0ZXhfaW5pdCgmbXRkYmxrLT5jYWNoZV9tdXRleCk7
CkBAIC0zMjIsMTAgKzMyNiw2IEBAIHN0YXRpYyB2b2lkIG10ZGJsb2NrX2FkZF9tdGQoc3RydWN0
IG10ZF9ibGt0cmFuc19vcHMgKnRyLCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAlpZiAoIShtdGQt
PmZsYWdzICYgTVREX1dSSVRFQUJMRSkpCiAJCWRldi0+bWJkLnJlYWRvbmx5ID0gMTsKIAotCWlm
IChtdGRfdHlwZV9pc19uYW5kKG10ZCkpCi0JCXByX3dhcm4oIiVzOiBNVEQgZGV2aWNlICclcycg
aXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQu
XG4iLAotCQkJdHItPm5hbWUsIG10ZC0+bmFtZSk7Ci0KIAlpZiAoYWRkX210ZF9ibGt0cmFuc19k
ZXYoJmRldi0+bWJkKSkKIAkJa2ZyZWUoZGV2KTsKIH0KLS0gCjIuMzAuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
