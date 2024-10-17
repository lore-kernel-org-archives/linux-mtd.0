Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04857D2F7FA
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2024 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJYlnw6WI/S+v3qVmtA03EWuyOMcyGYFkuAjDkG9Jbw=; b=ySklTKpQzcoZir
	XtrRq+xN5Is54OBEtUmVPvIrSb61yqx5pprcr7rqjpk8Saty23Ptg0OO2LOg2JS10HKTNwWEqgc4D
	PYTv5Dyte5RR90cXcTvP8lWcpWLzbr5K9yOjgvWktb/z6QNgKVqit8GD5K38vATwrsju8QNPxpEub
	64wRXTvipcNhK71JAwB8xWb857hLYeA63yhqftXxK08lpkbyiiTZLL+esam4ptPYwX+x/IFr6V/x3
	TjUfLMJ4s7/n1l3x3KpyDtTzNEDqxcKQviX/c2l+glU6xkJYSL7plm6wwZQxHzt3QUA4Os+kGcZbI
	oMzW+v/Kzdu0L1wSFPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LRD-0000000E49u-0TCG;
	Thu, 17 Oct 2024 08:00:51 +0000
Received: from mail.firmexa.pl ([217.61.97.237])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LOf-0000000E3UA-2z9k
	for linux-mtd@lists.infradead.org;
	Thu, 17 Oct 2024 07:58:19 +0000
Received: by mail.firmexa.pl (Postfix, from userid 1002)
	id 65E4C840D0; Thu, 17 Oct 2024 09:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firmexa.pl; s=mail;
	t=1729151794; bh=t64YQ6+Ul8jKtSnXdKDYpCigYTG2jPMqgmy0uGCEDW8=;
	h=Date:From:To:Subject:From;
	b=O1YdxmIhQ7zkuCuIRlKJjG7ekfbtLrtrMb0MLLdjnKpXVZsTEtgMxkkk1t+OaP94s
	 5P+kuEoh57dPzUqpUDHVz4RM32ROZAe7O18MxSK0KWL5QRyVaZ0F15R9DW61gMslAe
	 2CvCASKUbtj6UjHZNItREJKLojtvSF0USaJOYcC/Bv56JlC69AjLnAXkzYGo4fM4uy
	 Y0TzQP1QSusiYzyafuezrEDDPOwSP15NoJgGbI9YuXZCOWUJuOJ0KjHORPnlVLYlTo
	 ZLvkqLYqg70jBVOHxuTw1XyCsFkvxU2/kPLRhLe+BHO2mkbOilO40ouZd0pARQ0pHj
	 LByu2a+TJpk1Q==
Received: by mail.firmexa.pl for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2024 07:56:05 GMT
Message-ID: <20241017084501-0.1.1z.7e30.0.mzf6d30s53@firmexa.pl>
Date: Thu, 17 Oct 2024 07:56:05 GMT
From: "Marek Wejcht" <marek.wejcht@firmexa.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Termin_odbioru_przesy=C5=82ki___?=
X-Mailer: mail.firmexa.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_005814_513817_07D33432 
X-CRM114-Status: UNSURE (   0.50  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6d3JhY2FtIHNpxJkgZG8gUGHFhHN0d2EgamFrbyBwcnplZHN0
YXdpY2llbCBkb3N0YXdjeSBzcHJ6xJl0dSBrb21wdXRlcm93ZWdvIGRsYSBmaXJtLiAKCk5hc3ph
IGJvZ2F0YSBvZmVydGEgb2Jlam11amUgc3plcm9raSB3eWLDs3IgbGFwdG9ww7N3LCBkZXNrdG9w
w7N3LCBzdGFjamkgcm9ib2N6eWNoIG9yYXogc2Vyd2Vyw7N3LiBQcmFnbsSZIHBvZGtyZcWbbGnE
hywgxbxlIG9ic8WCdWd1amVteSB3acSZa3N6ZSB6YW3Ds3dpZW5pYSwgbmllIHBvamVkeW5jemUg
c3p0dWtpLgoKQ28gd2HFvG5lLCBwb3NpYWRhbXkgbmFqd3nFvHN6ZSBjZXJ0eWZpa2F0eSBwYXJ0
bmVyYSBmaXJteSBEZWxsIHcgUG9sc2NlLCBhIHRha8W8ZSBqZXN0ZcWbbXkgcGFydG5lcmFtaSB0
YWtpY2ggcmVub21vd2FueWNoIG1hcmVrIGphayBMZW5vdm8sIEhQLCBDaXNjbywgTWljcm9zb2Z0
LCBWTXdhcmUgaSBTY2huZWlkZXIgRWxlY3RyaWMuIER6acSZa2kgdGVtdSB6YXBld25pYW15IFBh
xYRzdHd1IGF0cmFrY3lqbmUsIGtvbmt1cmVuY3lqbmUgY2VueS4KCkN6eSBpbnRlcmVzdWplIFBh
xYRzdHdhIGtvbmtyZXRueSBzcHJ6xJl0IGx1YiBtb2RlbD8KCgpQb3pkcmF3aWFtCk1hcmVrIFdl
amNodAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
