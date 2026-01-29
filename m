Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F34FD73E84
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0beE9zyoGBPfyD9/zNvYI6F/KlMcSU7/vFijyYBjIRw=; b=ZyW+nOFs7h0cXb
	BuKEDiF758SLiQZZJHLVuZc3aBdSVXgZIDrfVg5T+0nMGCBXI5J8cT+c2qFbEFNJNnlt2y2Yuj5EB
	L6v0RqN6i0R2Ugrem11oYZWxiKvpqGvZKm9g0KxFRWtsBbQuuTsFPnkhvy58kWZzEazqOtKpY0n4v
	F5UTBegEs1ZQcORN3DUEiCqxG+yRnTKbkx6Bjusk7ehhqFh3zsol4t5rTS4kIumifPuSqzHrsAv6l
	1ElcHcKwCwQ1hfYGciyue+r7/x7CiQVfZE6LrjkuqC5WphGWTtdDLeFT1qDWhbVeXVYRZzvtL/Ioq
	0+TyEdm+R+blcH7HDSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXo1-00000000ZRP-2rjN;
	Thu, 29 Jan 2026 19:35:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXnx-00000000ZQt-01zD
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:35:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A2D3F4E42318;
	Thu, 29 Jan 2026 19:35:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64FB960746;
	Thu, 29 Jan 2026 19:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A88D119A880F;
	Thu, 29 Jan 2026 20:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769715345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UmJz8uv6hj9TJJXKRiIeCWh+SgTZWK5ogeUf/Hqg3w0=;
	b=0S36is7SWnzBM5XDPW/pDrpN1fqSI6j9SKay2/0ojBRj3e4zoaxQBYaP5kWcBTpc3mw5qd
	EkujvznuPAYovjcR7WmSMEFC1yNwvrAB7SvA6gHq9Ul6DMQN3yrhmbNFfPbhtIWWlgQIcb
	OP4p+S1u67FhREsy9RHM+4emHmdIMxicUb5vW/MdVPm9D6SwAr6jOFLPvdOSjfqZEwPKzo
	bbXRZMj9RHNaTMwe3jCC6keH9c4AbdAZX0aMrs4TDCqyxDtqqoHvAKznCz8vrcSuQ9elTM
	RIGJCZrObGSOt8kOKKhDM9u9MY1QJxXsWJzsKO1i73ks/voqCn4kZQTHR0ELEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.19-rc8
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 20:35:42 +0100
Message-ID: <87jyx0jjox.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_113549_202967_C40638BF 
X-CRM114-Status: GOOD (  10.43  )
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

SGVsbG8sCgpUaGlzIGlzIGEgbGF0ZSBmaXhlcyBQUjsgSSB3YXMgd2FpdGluZyBmb3IgdGhyZWUg
b3RoZXIgZml4ZXMgb24gdGhlIE1MCnRvIGJlIGFja25vd2xlZGdlZCBidXQgdGhpcyB0dXJuZWQg
b3V0IHRvIG5vdCBoYXBwZW4gaW4gdGltZSwgc28gaGVyZSBpcwp0aGUgb25seSBmaXggd2hpY2gg
bmVlZHMgdG8gZ2V0IGluIGZvciB0aGlzIHJlbGVhc2UsIGFuZCB0aGUgcmVzdCB3aWxsCmJlIGRl
bGF5ZWQgdG8gdGhlIG5leHQgY3ljbGUsIGJ1eWluZyB1cyB0aW1lIHRvIHNldHRsZS4KClRoYW5r
cywKTWlxdcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4ZjBiNGNjZTQ0
ODFmYjIyNjUzNjk3Y2NlZDhkMGQwNDAyN2NiMWU4OgoKICBMaW51eCA2LjE5LXJjMSAoMjAyNS0x
Mi0xNCAxNjowNTowNyArMTIwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNi4xOS1yYzgKCmZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byAyZjZkMmM4ZDlhYzA1YTdhMWMwMjMzM2Y2YWQzMDg2ODI0Njg4MGQ4OgoK
ICBSZXZlcnQgIm10ZDogc3BpbmFuZDogZXNtdDogZml4IGlkIGNvZGUgZm9yIEY1MEQxRzQxTEIi
ICgyMDI1LTEyLTE2IDA5OjA4OjI4ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBIHNpbmdsZSBsYXRlIE1URCBm
aXgsIHdoaWNoIHJldmVydHMgYSBmaXggdGhhdCB0dXJuZWQgb3V0IHRvIGJlCmluY29ycmVjdC4g
VGhlIG9ic2VydmF0aW9ucyBvZiB0aGUgY29tbWl0dGVyIHdhcyB0aGF0IHRoZSBudW1iZXIgb2Yg
SURzCnRvIGJlIHVzZWQgdG8gcHJvYmUgYSBjaGlwIHdhcyBpbmNvcnJlY3QuIEl0IGhhcHBlbmVk
IHRvIGJlIGEgbGltaXRhdGlvbgpvZiBoaXMgY29udHJvbGxlciwgbm90IGEgY2hpcCBpc3N1ZS4g
UmVzdG9yZSB0aGUgY2hpcCBkZXNjcmlwdGlvbiwgYQpzb2x1dGlvbiBtdXN0IGJlIGZvdW5kIHNv
bWV3aGVyZSBlbHNlLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpaaXlhbmcgSHVhbmcgKDEpOgogICAgICBSZXZlcnQgIm10
ZDogc3BpbmFuZDogZXNtdDogZml4IGlkIGNvZGUgZm9yIEY1MEQxRzQxTEIiCgogZHJpdmVycy9t
dGQvbmFuZC9zcGkvZXNtdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
