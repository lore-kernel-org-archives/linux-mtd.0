Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C360C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jmpjnpRaiMG6q4SIzVvwJgKUguxQvwPaZoKrE7tEtBw=; b=aPiY4s1QG0pfe8
	cheaaqHR2qpV1ZKKfH5DPl2Xty7lYY+x1ETAHwUQym6miWI8r8Pvs3djrUbPxrIuJVIlumk8MqWGv
	N7vyz+/jtCJAf1HK3k3DxLov7Ymk1cDxLc1C0nI8uMtR8K8XwjrScLuXjcbq2PUpJMOcZl8Yh5hfx
	R4Oqe0luDEp9LSqRmpSNTy5rREnKRcY0Qp9r69NdI0pQGwEaSFIGLkPJl9FZc1lYfXjzu4NcfkLYy
	VVZ3Rnbk9eG9rdpjdo9WuhBJtHI6x4rz+xYnw6PwjKwodvFBdrnPVEk8xe4NlxE6XgWlx89G27/YE
	wBQiXoP+l2ppHoyT4ZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc2K3-00000008Dvv-36sr;
	Thu, 08 Aug 2024 12:32:51 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc2Jm-00000008Dqv-3lVp
	for linux-mtd@lists.infradead.org;
	Thu, 08 Aug 2024 12:32:36 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9BF63A0A37
	for <linux-mtd@lists.infradead.org>; Thu,  8 Aug 2024 14:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=PZrHaEwRPuHJV3ZwTZId4qsgiHPNumH19TpBHVuLNuA=; b=
	P/GVhckh5M67k6i5DxkX20eO0mST+RFcfgULc6GHdPY1wcK0Yj8cePJH5JWbHx2Z
	nHT4f9L4Eh4QWMFMI+EoHgGOkeh/zeAwopGvQR5+Eu9f1X4G/TkNeToyLP1EMm0h
	0vA3vYlgVqW8wG3YrdvWP31AY80gra3NsfqTevHTPg7aYG8nKGH3atSWsHsyrVKo
	cyJmQhvUZfPtqgL+ADkk0yuBVgGHmBxoUyvt1u/+RuoG2ZvdgiezAqjKee0ImLXy
	DIyLc83wDPBqJcqPcTt1+GaEZUB4NdIIpwOM2Auxbj7UJgz8J3Vi4GhnQuU49gso
	HZyYYIErArVT/E1KJHvXf3FD5TBzpYVzLFyBDwxdvDk/ktOlUrk/fUb1W/KJuweB
	bBItIX0tS4x7oWiuIwnzMwPRBjk9rue41H8BqUdbJYksYhcQ76HHsOjN1ZDz3EQ4
	G9AO3MJMjs8Cc0ml1qBZBT83t9Zt8wZWupuGmXeX7qrKrjJdfq7fuYA7/DkTRynh
	3al5zeRYMj56iZo0JP09mGUjxgDnH/ytfdfdnFKhBH8UfPEeyH64hbba74yO6QHo
	0ZBQot6mwCI5KAu/1C0wsdyILe8NXBrkWtpuKga4UVZbJ0UlnNJJ9VCgriAmFxUy
	Qm5XVINZ3xepmCV8dByoQ3u8d3VwaIkRhGZV7ssn8Yc=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH mtd-utils] fs-tests: integck: Allow checking root
Date: Thu, 8 Aug 2024 14:31:50 +0200
Message-ID: <20240808123149.2667334-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1723120341;VERSION=7976;MC=3070845852;ID=859822;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854617765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_053235_450483_356314CC 
X-CRM114-Status: UNSURE (   8.54  )
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

VHJhaWxpbmcgc2xhc2ggcmVtb3ZhbCBjcmVhdGVzIGFuIGVtcHR5IHN0cmluZwpmcm9tICcvJywg
bWFraW5nIGl0IGltcG9zc2libGUgdG8gY2hlY2sgdGhlCnJvb3QgZmlsZXN5c3RlbS4KClNpZ25l
ZC1vZmYtYnk6IENzw7Nrw6FzLCBCZW5jZSA8Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KLS0tCiB0
ZXN0cy9mcy10ZXN0cy9pbnRlZ3JpdHkvaW50ZWdjay5jIHwgOCArKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0
cy9mcy10ZXN0cy9pbnRlZ3JpdHkvaW50ZWdjay5jIGIvdGVzdHMvZnMtdGVzdHMvaW50ZWdyaXR5
L2ludGVnY2suYwppbmRleCAwYTdmMTQyLi5iN2NlZGMyIDEwMDY0NAotLS0gYS90ZXN0cy9mcy10
ZXN0cy9pbnRlZ3JpdHkvaW50ZWdjay5jCisrKyBiL3Rlc3RzL2ZzLXRlc3RzL2ludGVncml0eS9p
bnRlZ2NrLmMKQEAgLTI5NDYsOSArMjk0NiwxMSBAQCBzdGF0aWMgdm9pZCBnZXRfdGVzdGVkX2Zz
X2luZm8odm9pZCkKIAkvKiBSZW1vdmUgdHJhaWxpbmcgJy8nIHN5bWJvbHMgZnJvbSB0aGUgbW91
bnQgcG9pbnQgKi8KIAlwID0gZHVwX3N0cmluZyhhcmdzLm1vdW50X3BvaW50KTsKIAlmc2luZm8u
bW91bnRfcG9pbnQgPSBwOwotCXAgKz0gc3RybGVuKHApOwotCXdoaWxlICgqLS1wID09ICcvJyk7
Ci0JKihwICsgMSkgPSAnXDAnOworCWlmIChzdHJsZW4ocCkgPiAxKSB7CisJCXAgKz0gc3RybGVu
KHApOworCQl3aGlsZSAoKi0tcCA9PSAnLycpOworCQkqKHAgKyAxKSA9ICdcMCc7CisJfQogCiAJ
Q0hFQ0soc3RhdGZzKGZzaW5mby5tb3VudF9wb2ludCwgJmZzX2luZm8pID09IDApOwogCWZzaW5m
by5tYXhfbmFtZV9sZW4gPSBmc19pbmZvLmZfbmFtZWxlbjsKLS0gCjIuMzQuMQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
