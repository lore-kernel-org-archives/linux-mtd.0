Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12986C369DC
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Apr 2025 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IIpnlORSpm9hTfR3gpmxmLN7MnZI49zwP2+RC7K7JDA=; b=g0PxPT3sjha3CI
	TkbNtUkfn7CzBKHpeNtdbiSrTB5wl9uRITq4HANIsOcvxrk3Ehbsr7W47BbRw8/M1mfX9RqiDFa5c
	gFJKvDUQmIKVLZYD2Jc3xeOUdNCoTQu1CjXQHJ6Y3YHPW3UDze4c35Zmh2z7zX1wEOPdTbxfl4bYf
	sHRXoh6c01A2+Qw4HEApSQJ/fJ9Smp/Sq0qukdsSGbgZS/e1QNHgWKK1JrasFX5LcHr4g5vhjgKP1
	K3mV071yJdsO0/ZLlKtGJNjvFSGvmvwzPk+ln/u37Wt1IWqtKZCE1+C2rVqAp+4/Nw/visx+zlcgV
	N0oJ3etjHZ7DMwOyQhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2RY-0000000C5jj-0RXV;
	Wed, 30 Apr 2025 08:05:24 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA26a-0000000C1oE-1HUN
	for linux-mtd@lists.infradead.org;
	Wed, 30 Apr 2025 07:43:46 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id A6C8D8363A; Wed, 30 Apr 2025 09:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1745998918; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=hqNYYl1ZUTAVBtm82hYVZiA/TUiqV9Bvh+JitX13ZG/k1q/fA1PjIchG3/Fnb4ecc
	 bclbcKt1MUJW1kR1htLn6mzXdUZKn1dDReakBx7nqU6m5Wozs3nbNOzvY/f/JsRfds
	 A55+N9JTDTntsP+Y9KXE6CIGYj3xO6VC7k0ZPbrsILCjSJv8lhA9QFj5YIeF1psTMu
	 ITLLMi6ppEic+DKFGvNmuey+beaCi86QF60c3b9eZ5qZ8ri/EufhfpEZiem+mrqZrx
	 l6bcqFUSTZSlaIPVONU59GufuX05mXUU2Up+Un/jZtY8deHqqwAct/gGmxN1y1A/lG
	 IdYuJvM7qk9cg==
Received: by mail.commetro.pl for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2025 07:41:06 GMT
Message-ID: <20250430084500-0.1.2a.qbhl.0.ybml98gnlp@commetro.pl>
Date: Wed, 30 Apr 2025 07:41:06 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_004344_473403_1B7C0F52 
X-CRM114-Status: UNSURE (   1.07  )
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
