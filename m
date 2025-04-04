Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD79C3601E
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M1p5+2kEskHoAf2VZeyyNk7JGofQ2Y3Eo3OIXxgQ328=; b=rHnvN8vc3ZIEfr
	kNGwiHQqpkkrH3A+inGeeL3nMs98UJcmUcf47YFzFKxDTMVTjRkNZy46ZZcfscfKtB7mGcRrGdlmo
	4hl0mimXlmay2E8lj9ahUJ/wERh/kv8TkeB01PVC/yOCHswhGfVknii1+5Q9epK4odEiFOWTdW7ND
	/tfkI/yGp263lqY6f0PX4UV8AmHhlbdr91p34flw5Kny4VbZ0QhNz6AHKpdix4lLvGl2DCn+UMVhs
	FVM/kFciJwg7FovD7jlarOSXaScqt9SMPkAsVzY2uGM0ybi7qDDSd4CsJph/Ae586/tIbr5jjsKa9
	7K3clyK/kwQvMvagpaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bzJ-0000000B5Tw-2knm;
	Fri, 04 Apr 2025 08:01:17 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bzG-0000000B5Si-43vf
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 08:01:16 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 9032825C3D; Fri,  4 Apr 2025 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743753673; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=gGCTfIHt7Of5VaDTF2QA/FWFs4CMxoZLwkkCEk72LA3Gh5qZL62XOkR6KZK7R4HB1
	 475DG37NxMRFKEbDZ9Hw68BoJeE4W1XWvV0n107/PRsB5dvNy4WhZzB6UysOWH/1dJ
	 1/5FPRQjKNK6oniXJJ8IULSY6vCwJVnzroQr7E1Z63Dg+feYVqOmSy7okckJlRgxF9
	 6+CeXv7VX9v7Zs5sG7bAaJM0327tVjtMPexzSmdjICC6/dai1WgKuEFeIdg+OA0d3D
	 HHFsJKovEJiHTxjq+0RvcxmYFvk7ly5kZTozMp2CoMFRHtqo0olZaxlHw5tV98HV+h
	 Tdze7uyaB53bQ==
Received: by mail.ventrixor.pl for <linux-mtd@lists.infradead.org>; Fri,  4 Apr 2025 08:00:53 GMT
Message-ID: <20250404064500-0.1.6b.1c8m5.0.0qm57680k9@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:00:53 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_010115_146100_5ED8B454 
X-CRM114-Status: UNSURE (   1.89  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
CkphbiBBZGFtY3p5awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
