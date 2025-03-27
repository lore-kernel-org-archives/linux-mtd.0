Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC87AC3600B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Mar 2025 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IIpnlORSpm9hTfR3gpmxmLN7MnZI49zwP2+RC7K7JDA=; b=XRlm3zCJEt8a6H
	wYp1mjAi8E2hSHpphQEyijZD4E4ahwH8j8cvc8zvXgNZM6QZv+AvykPD9cupdjrzBSIAMk7QgkPxs
	E3bKfQ+2/SpUy6n+PQOiVwsV9/xGXLLjvLLr5VuMau2DSaY/FgYgWw7jAXHfjZh7HcNKGbD0PNh2H
	NlsUNsZuBCydYFNfGMTKkKNlRT+0PIiJHXzpF7YTbswus8fF3wnuEdusDMWdaJ4dGJE6xG5TSDmcn
	gseuTHGaGZpkfFyb7Gr0xnoPlVsCAQ6+I3d/bkIb2AVlGcESGix4rAse0Pc11HQPF0szrHGAr2Ll9
	HTgk9dQpKROoQ90zfD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjFX-0000000AX9a-3vmr;
	Thu, 27 Mar 2025 09:10:07 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjEn-0000000AX5y-2Y6o
	for linux-mtd@lists.infradead.org;
	Thu, 27 Mar 2025 09:09:22 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 866DE83A48; Thu, 27 Mar 2025 10:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1743066397; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=Xag7nU+ihBIs7Hn8wxkijrFSF1e87+Qc4WqgaHrdCgMGzT9lg65L01CBulkWcWivj
	 tTFyjZ8As9ZK/bPWkvyJvZMrzdvRj2th5s8E7BC/F/WkljGKJ3QdtWJAAJUge5AlmM
	 AdAi3UzDclWO04UqHNalxOEZ0H5lz5LtMzWik69hAajBVYeFhhKmB2eTDe6ZGCaBw+
	 rKMrweNA95+BWzHcAb39mNMfZeIPTsHaAORNZXSUM5UnYnVbpw+6AQCGaFcdD52V1w
	 J6Un+qMQupvczgqbe5pZevZkybJMCEYmrc6R42TA4DlJnxKBNG58lQ3zIDmIM3xznY
	 RVSPWnfXeoJng==
Received: by mail.commetro.pl for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2025 09:05:49 GMT
Message-ID: <20250327084500-0.1.1n.jelg.0.xb2eoof1ft@commetro.pl>
Date: Thu, 27 Mar 2025 09:05:49 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_020921_766792_BB65364C 
X-CRM114-Status: UNSURE (   1.96  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
