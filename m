Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2391CAC5AC
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Sep 2025 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=LUIJNUdJiNuA2L
	YhYVmlgXo5Oa9L2b98FP6GZMOF9b1hR9vu18aNswG3EywyhTaBcFbKCz1AZv23/rNelT2JmZZTXiJ
	vSd4p670FbJQm1H1GHWSbGlEPMnaTd9wrbnyUIAM3sSHh8GIBGDvN9j1QLtUcJXQ+Eoq6Vv0uG06s
	AKN0CvXQsTSm76IIakgq4P2x9S2yqNWPP+kKfyrWk04UZedqU6p29ajII0nLel5LGz64tUu6THjcG
	j3Vz/kSt65H2mD0xZGwE+gMOgfhtYJrQkh2jF9n28EVBSqpHPlGCWW95fc11vdln9FfrrnhCSJeh9
	v/fCJsZ/Bjn7jYD5IKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22zr-0000000GqKj-2UOL;
	Fri, 26 Sep 2025 07:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22zq-0000000GqKF-3ojK
	for linux-mtd@bombadil.infradead.org;
	Fri, 26 Sep 2025 07:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=; b=UttMMVzW+9Y/vuselhkEXvKjzC
	WR54z2g6zRpxtJl9tOBn4L9B6Jy7sF6CDq6/YEjrzhFjbXQzyKX5kfQLj3BDDQMr8B2lbzBY5Ib3c
	pfruoU2en/kxQgdhXmCYKT8YfhIcn6fjaTi2OAsPJRnEjuEkTgtVqg5HqY1KcOKIT3snu6wEmqFnu
	cU4PhgOMjpoUTlxczNTyznpXcM+5nOzSUChQpD9J3i0wvMB5XjndL2vbTSZv1QNVfe2vp/36e5X4R
	VetUKw6zmodxm3rZcbzbw1P6F7pikS6tJBfCUZwbdpQAcnOivnpE+Un2cWycglb4VCbtH5RgGTQTI
	pBd5raZw==;
Received: from mail.monetoro.pl ([217.182.69.186])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22zn-00000009ki4-0kCf
	for linux-mtd@lists.infradead.org;
	Fri, 26 Sep 2025 07:36:01 +0000
Received: by mail.monetoro.pl (Postfix, from userid 1002)
	id 1D9BF4C6DB; Fri, 26 Sep 2025 09:35:49 +0200 (CEST)
Received: by mail.monetoro.pl for <linux-mtd@lists.infradead.org>; Fri, 26 Sep 2025 07:35:33 GMT
Message-ID: <20250926084500-0.1.im.3kqk8.0.46go03k21j@QuantumQuest.pl>
Date: Fri, 26 Sep 2025 07:35:33 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@monetoro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_083559_510609_7CC23233 
X-CRM114-Status: UNSURE (   0.73  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllClRhZGV1c3ogxYF1a29tc2tpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
