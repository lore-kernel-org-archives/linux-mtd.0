Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D89C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h1A02dxwRxVamiIv8LYw/+1zmQTcBgQQGZ3unYSPVNA=; b=1WZeuqVqvnQPUYkk3iMShdg4xt
	O6y4QnzwxADaFssVylV4T4VirK5PzoN8wFAcTyglGuJ/GYho4gyjhbpeuYdRwil9JFX4hEoiPW3NR
	092MSyA2eU8IiSVXcDfm9/EAXlQsF+IRhlFm63ibV52HrOMLNn58K/8T3uStxMajYL1bZgzPzgynT
	0XaB2zOQWHeUXvaSyhPDU+TX+VTxXzgPgQdo0wJXkIR4zqMet2MxP0dsIbJRjjgjIN/dZcVSU0Iv0
	KlxfKPVLxuiq6LQiYax8gk8j5aEqszkZy9O+YBT1/xGGaNUmlVREepZuYLaL38S1Bs7A/o7qbbTQd
	m3dtXi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNGSw-001OBN-LY; Thu, 24 Feb 2022 15:55:38 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNGSr-001O7N-Rk
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 15:55:37 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 77B5C5F7FD;
 Thu, 24 Feb 2022 16:55:28 +0100 (CET)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <LW@KARO-electronics.de>,
 Brian Norris <computersforpeace@gmail.com>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
 <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
 <20220224162958.184079e4@xps13>
From: =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <0a5497bf-7716-e8c8-7e79-7df6602d5104@emlix.com>
Date: Thu, 24 Feb 2022 16:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20220224162958.184079e4@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_075534_087142_58F5E415 
X-CRM114-Status: GOOD (  11.53  )
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

QW0gMjQuMDIuMjIgdW0gMTY6Mjkgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+IGRnQGVtbGl4LmNv
bSB3cm90ZSBvbiBXZWQsIDIzIEZlYiAyMDIyIDExOjU5OjAyICswMTAwOgo+PiBBbSAyMi4wMi4y
MiB1bSAyMzowMiBzY2hyaWViIEhhbiBYdTo+Pj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSBt
b3JlIGRldGFpbHMgYWJvdXQgd2hhdCBraW5kIG9mIGVycm9yLCBob3cgdG8KPj4+IHJlcHJvZHVj
ZSBpdCBhbmQgb24gd2hpY2gga2VybmVsIHZlcnNpb24/ICAKPj4KPj4gWW91IG5lZWQgYSBmbGFz
aCB0aGF0IGhhcyBvbmUgYmFkIGJsb2NrIHdoZXJlIHByb2dyYW1taW5nIHRoZSBCQk0gc2V0cwo+
PiBOQU5EX1NUQVRVU19GQUlMIGluIGl0cyBzdGF0dXMgcmVnaXN0ZXIuIFRoZSBsYXRlc3Qga2Vy
bmVscyBzaG91bGQgc3RpbGwKPj4gaGF2ZSBwcm9ibGVtcyB3aGVuIHRoaXMgaGFwcGVucyBpbiBh
IFVCSS4KPiAKPiBJIGJlbGlldmUgd2Ugc2hvdWxkIHRyeSB0byB0YWNrbGUgIndoeSIgdGhpcyBo
YXBwZW5zIG1vcmUgdGhhbiB0cnkgdG8KPiB3b3JrYXJvdW5kIGl0cyBjb25zZXF1ZW5jZXMuIENh
biB5b3UgZ2l2ZSBtb3JlIGRldGFpbHMgYWJvdXQgd2h5IHdlIGdldAo+IHRoaXMgc3RhdHVzPwoK
VWhtLCB0aGUgYmxvY2sgaXMgYmFkLCBicm9rZW4uIEl0IHNob3dzIHRoZSBzYW1lIGJlaGF2aW9y
IGV2ZW4gYWZ0ZXIKcG93ZXIgY3ljbGluZy4gVGhlIG90aGVyIGJsb2NrcyBhcmUgb2suIEkgZG9u
J3QgdGhpbmsgaXQgaXMgb3VyIGZhdWx0CnRoYXQgaXQgZGllZCBzbyBlYXJseS4KCkJlc3QgcmVn
YXJkcywKCiAgRGFuaWVsCgoKLS0gCkRpcGwuLU1hdGguIERhbmllbCBHbMO2Y2tuZXIsIGVtbGl4
IEdtYkgsIGh0dHA6Ly93d3cuZW1saXguY29tCkZvbiArNDkgNTUxIDMwNjY0LTAsIEZheCArNDkg
NTUxIDMwNjY0LTExLApHb3RoYWVyIFBsYXR6IDMsIDM3MDgzIEfDtnR0aW5nZW4sIEdlcm1hbnkK
U2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBHw7Z0dGluZ2VuLCBBbXRzZ2VyaWNodCBHw7Z0dGluZ2Vu
IEhSIEIgMzE2MApHZXNjaMOkZnRzZsO8aHJ1bmc6IEhlaWtlIEpvcmRhbiwgRHIuIFV3ZSBLcmFj
a2UKVXN0LUlkTnIuOiBERSAyMDUgMTk4IDA1NQoKZW1saXggLSB5b3VyIGVtYmVkZGVkIGxpbnV4
IHBhcnRuZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
