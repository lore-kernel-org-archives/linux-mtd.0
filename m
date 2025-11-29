Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E74D116F1
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq5VpsWZNI/R8I5dArGcJSriaNdVsYZitARtF5UWHlg=; b=zRT3Uo3QdZIksa
	JZFOiBU/1gXPBomuj0fCzADwi2EuCwHxxY4pnlvoSevTOVRcam174lVKxt92aIKui2jeAisTRsxQb
	vJyHokYvEBvErAsxhu/cGJnVcet6bKVajcrEjdNFuuWbZHKwJIY6SoGLZMKj/ZkfTKzcbQt8r1yxo
	WhWewBS3yt6Fs/AVaZBg8ejiw2SdgCRfvHzd+Hg/Kkf1fAk2Xi0cVDS8XwgR6fwArNc9Nlx3uhQq3
	0yNwprlmJtFUwLD7+abk/BO37++qbSneTeo2F4RTHm84gBFzTA+4+XY3LFUIs7PJpXwgFTWrbO6kZ
	0SXOU5qR40T4CozpGnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQH-00000001XUu-1Lhc;
	Sat, 29 Nov 2025 12:51:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQE-00000001XTC-1OaO
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:51:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DDE934E41974;
	Sat, 29 Nov 2025 12:51:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD10160706;
	Sat, 29 Nov 2025 12:51:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA3D5119106A0;
	Sat, 29 Nov 2025 13:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eP+syvK4zuOrSrhpINnmmK/BF2Rpqc6dzW6cZoTHp7Q=;
	b=NtaM0myv2BC/PIPFgmb0JZRryi8XDjEJ6/fCh4QaI8LxU9Eck+Hn5PyG/rnbFUnjFWotqm
	fthjR752Zp5GqKLeHnbjmdaiT8jZvPfRocURWYOlN/3Ast9DQq8qQ2gePJMzKUwASTAhCn
	TpdU0EmzrnBciWrqOQwoh/Xin9WBVrJsDCYsGqbTe5EAit6Kxh4o+CF6lzrx/rGNZaVkPa
	KkL4kiBrkaHuFKBPTTu2PTo57eQ3dsjbiECD78k4FW1JgljkbWAPiPYqxaEssqwG5jPSzE
	7Wim0tvuiIDhnArvJbijMFHUofPmM45tbRhBiK/st2Q78czAd2Nmd9YDTn8nTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ivan Stepchenko <sid@itb.spb.ru>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jared Hulbert <jaredeh@gmail.com>, Alexey Korolev <akorolev@infradead.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.com
In-Reply-To: <20251121115446.11421-1-sid@itb.spb.ru>
References: <20251121115446.11421-1-sid@itb.spb.ru>
Subject: Re: [PATCH] mtd: lpddr_cmds: fix signed shifts in lpddr_cmds
Message-Id: <176442068453.77093.14391627489442582650.b4-ty@bootlin.com>
Date: Sat, 29 Nov 2025 13:51:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_045130_525294_F42FF2B1 
X-CRM114-Status: UNSURE (   9.31  )
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

T24gRnJpLCAyMSBOb3YgMjAyNSAxNDo1NDo0NiArMDMwMCwgSXZhbiBTdGVwY2hlbmtvIHdyb3Rl
Ogo+IFRoZXJlIGFyZSBzZXZlcmFsIHBsYWNlcyB3aGVyZSBhIHZhbHVlIG9mIHR5cGUgJ2ludCcg
aXMgc2hpZnRlZCBieQo+IGxwZGRyLT5jaGlwc2hpZnQuIGxwZGRyLT5jaGlwc2hpZnQgaXMgZGVy
aXZlZCBmcm9tIFFJTkZPIGdlb21ldHJ5IGFuZAo+IG1pZ2h0IHJlYWNoIDMxIHdoZW4gUUlORk8g
cmVwb3J0cyBhIDIgR2lCIHNpemUgLSB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgYnkKPiBMUEREUigx
KSBjb21wbGlhbnQgY2hpcHMuIFRoaXMgbWF5IGNhdXNlIHVuZXhwZWN0ZWQgc2lnbi1leHRlbnNp
b25zIHdoZW4KPiBjYXN0aW5nIHRoZSBpbnRlZ2VyIHZhbHVlIHRvIHRoZSB0eXBlIG9mICd1bnNp
Z25lZCBsb25nJy4KPiAKPiBVc2UgJzFVTCA8PCBscGRkci0+Y2hpcHNoaWZ0JyBhbmQgY2FzdCAn
aicgdG8gdW5zaWduZWQgbG9uZyBiZWZvcmUKPiBzaGlmdGluZyBzbyB0aGUgY29tcHV0YXRpb24g
aXMgcGVyZm9ybWVkIGF0IHRoZSBkZXN0aW5hdGlvbiB3aWR0aC4KPiAKPiBbLi4uXQoKQXBwbGll
ZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBscGRkcl9jbWRzOiBmaXggc2lnbmVk
IHNoaWZ0cyBpbiBscGRkcl9jbWRzCiAgICAgIGNvbW1pdDogYzkwOWZlYzY5Zjg0YjM5ZTYzODc2
YzY5YjlkZjJjMTc4YzZiNzZiYQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRk
L2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0
IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
