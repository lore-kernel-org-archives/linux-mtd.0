Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7A7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3D86113D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3D86113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QypU1VO+ELWEAXE5zBU4Ml8s9xA8fmdM7qPPRHqrbxw=; b=NP5GZ5bSlzRORH
	yQZttf1+2YPILskSlEVE+2gOkHzss8DxfRRDsm5p8Y13ke9yIDQ/eVquQyp6570L+tkSa35GWh69H
	wq3Gd2VWHmUfoOvYkxZ08ANGkAEBs1WbTA01XN+B3hNjrousZAbbLJW/JyOodaW+ffUmXfSkzPRPW
	uKdqHyxzeOxMAqE1kL+US0WrIwN0ViHWTQHjSCx6vSM4lyzaHKSS0E6+ng8+4CSKDaeRqNyhvAAY0
	Te/2UDNA8eXxo+2dDT9y6MvB32DP06/2gtGurxbZsbzBmbZe1Am7YmwsjKOsWXKd9ynn3/8/TSXPx
	wb6hgqgUcQoi1/dLRd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMKv-000xQE-QS; Tue, 09 Nov 2021 08:18:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMKe-000xN1-5W
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 08:18:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id w29so19933592wra.12
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnkPG58aRSU2stN/sz2HOoqniIWG+VTIsOCOHEzxkKk=;
 b=E3SfGNuFCiZ9f1c8YU9jPw7yxrEcbp+n0Jx/U69b3lLLDtYDpLQymeXCEuhCqdsWA7
 s4TrH3CSGuHFWvDL8TT/oAd2EcPdbRbXewA9mM+17HQX5VaqIeiGvNTTEBmK5Nfc5QeX
 y5DKucjg/YI6hRKP2ffGH/CN9zPlA5pL4M8pc4E8YldHV6OrEd2x3ZtvrnoWY9cslEsN
 o+N/HauzignQPJRa5sEo27lFBEMXqBuu87BUGBe74m+h4Kf/n4nNRf6ZAgih3tWTIg0v
 e8DgSoGm364moXmnlDTp4qowJjZN/f1qCaSy5DaM5QWp8mbmSB3qpEVXEsnPWGvDkx+g
 ewAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnkPG58aRSU2stN/sz2HOoqniIWG+VTIsOCOHEzxkKk=;
 b=wKXl1g4k4IC6XkeCYhnvCLXpqACh4uTqctbl2uwHnY1GHMCAXnskz3LPBZ93MST4/f
 THDKHy4M1iLt5dzrscDh2YB5jhdYpQq3GNr1WUpttPHrkaodm2cb+wRIspg7RYKnT58q
 G/u9Aip9NUxP1tvoIJRIQhnamq0MR53VOFwgxqko7hirgn98wR3ZHdSk4WChwnrm+bpQ
 EVcGSBRpb6OGz+AC+kEfj2Hl4j0nzc39mOh3usBTdf+bjjZj5AdYlXVoeXUTvtm0QaDa
 GhyGuJzuhR2So9tKxGgQj9bAz5nHcy+sYPQs9wjoyL2/nFJDZmaKb7NH9gAj21/BEoVc
 8OOg==
X-Gm-Message-State: AOAM532LI4ywGPoHJaqIcTRPxA3Kx8//jeeb3r13nEfXw5pFthx0p+sO
 OGpx7xgtUI7+HgnvLvFOPPlawSZiVaYfC1hQ
X-Google-Smtp-Source: ABdhPJxRiGxA54ILqlQvetDaXHpTnS3kj7sz+xXvfNoHzThLWzlyD37dk0GddUeNrf4Al6BLP2mpqQ==
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr6579039wri.352.1636445894650; 
 Tue, 09 Nov 2021 00:18:14 -0800 (PST)
Received: from thor.lan ([213.205.241.131])
 by smtp.gmail.com with ESMTPSA id n184sm1714028wme.2.2021.11.09.00.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:18:14 -0800 (PST)
From: Frederic Germain <frederic.germain@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Frederic Germain <frederic.germain@gmail.com>
Subject: [PATCH 2/4] Fix warning about unaligned pointer in jffs2reader
Date: Tue,  9 Nov 2021 08:17:49 +0000
Message-Id: <20211109081751.480718-3-frederic.germain@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109081751.480718-1-frederic.germain@gmail.com>
References: <20211109081751.480718-1-frederic.germain@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_001816_233066_25A85EAD 
X-CRM114-Status: GOOD (  11.37  )
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

Z2NjIDkuMy4wLTE3dWJ1bnR1MX4yMC4wNCB3YXJuaW5nIG9uIHRpbWVfdCBjdGltZSB2YWx1ZSBp
cyA6CgpGaXggdGFraW5nIGFkZHJlc3Mgb2YgcGFja2VkIG1lbWJlciBvZiDigJhzdHJ1Y3QgamZm
czJfcmF3X2lub2Rl4oCZIG1heQpyZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIgdmFsdWUg
Wy1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXS4KClNpZ25lZC1vZmYtYnk6IEZyZWRlcmljIEdl
cm1haW4gPGZyZWRlcmljLmdlcm1haW5AZ21haWwuY29tPgotLS0KIGpmZnNYLXV0aWxzL2pmZnMy
cmVhZGVyLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2pmZnNYLXV0aWxzL2pmZnMycmVhZGVyLmMgYi9qZmZz
WC11dGlscy9qZmZzMnJlYWRlci5jCmluZGV4IDA4MzUwMGUuLjMzYzU1NzcgMTAwNjQ0Ci0tLSBh
L2pmZnNYLXV0aWxzL2pmZnMycmVhZGVyLmMKKysrIGIvamZmc1gtdXRpbHMvamZmczJyZWFkZXIu
YwpAQCAtMzM2LDggKzMzNiw5IEBAIHN0YXRpYyB2b2lkIHByaW50ZGlyKGNoYXIgKm8sIHNpemVf
dCBzaXplLCBzdHJ1Y3QgZGlyICpkLCBjb25zdCBjaGFyICpwYXRoLAogCQkJZCA9IGQtPm5leHQ7
CiAJCQljb250aW51ZTsKIAkJfQotCi0JCWZpbGV0aW1lID0gY3RpbWUoKGNvbnN0IHRpbWVfdCAq
KSAmKHJpLT5jdGltZSkpOworCQl0aW1lX3QgX2N0aW1lOworCQltZW1jcHkoJl9jdGltZSwgJihy
aS0+Y3RpbWUpLCBzaXplb2YodGltZV90KSk7CisJCWZpbGV0aW1lID0gY3RpbWUoJl9jdGltZSk7
CiAJCWFnZSA9IHRpbWUoTlVMTCkgLSBqZTMyX3RvX2NwdShyaS0+Y3RpbWUpOwogCQltb2RlLnYz
MiA9IHJpLT5tb2RlLm07CiAJCXByaW50ZigiJXMgJS00ZCAlLThkICUtOGQgIiwgbW9kZV9zdHJp
bmcoamUzMl90b19jcHUobW9kZSkpLAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
