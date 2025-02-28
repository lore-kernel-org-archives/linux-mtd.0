Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC635C19776
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2025 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2tuDw2o/sNdZ4F8JmRz98JpTKdQ/e9X5Rr8m9YAPMYE=; b=aWekYGTI9nRmmX
	x47xmxRMm/lxVnq2JmB0FXsfE3V8qH5I5OkOAhBFNQOkstkhlu7BN2cOu0sFR/Dsklx+YwHDsYJXO
	a6cQg3cGF3ANrgCj5BZ+SSl9BrTvTRQNzGXi7+Jj9oTu4tIzSrtIwp58PyalGEZ/1oRF7fgBxiovD
	/oM5ZexsgJ6Kee4E1tmx+YPtjUCSCM3Qlh9bNwX2R7E0Ly6zlIvlXndMSevTEwokGofQ1zHmXl4pl
	CIYg12kisV8h8OA0TJ+aKs4SJrORo6JjpgVPqw+VwOYMciibsoARHFzRLRGtoXpgFXbpbjrPsR6cX
	LkMMh1hQZrIL75Sgqrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwJm-0000000AI5U-27Gl;
	Fri, 28 Feb 2025 09:06:02 +0000
Received: from mail.growdeal.pl ([141.95.55.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwJi-0000000AI3Q-1YM9
	for linux-mtd@lists.infradead.org;
	Fri, 28 Feb 2025 09:06:00 +0000
Received: by mail.growdeal.pl (Postfix, from userid 1002)
	id BF37724BF3; Fri, 28 Feb 2025 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growdeal.pl; s=mail;
	t=1740733291; bh=nU0fzD5wnLwbt9yoUSBeMInFHzMm7DGirLXtUO2ZpV8=;
	h=Date:From:To:Subject:From;
	b=Zqd4nmgys3Uorh2MlcqK0HTjUT01w6D/fXMUVVGkRojFc+KQQNyD7SRCIHLCclTFx
	 QgqsErYv6atCZKip+hUnsE4wKzm/EcUsIJtYZR707+EpDLiFMPS8vEVB7eSNzAxHYD
	 2qr/urDc/QX0Jjg2kQtEPqlZCfQboIizlyLriD6XuKD/nv90zTCKxB2TL6fenCJcXY
	 O+h91I1KGHg5x3QYUNyDh3eTY2YsGpVl52IPxaPCDGbKVPWmtPOtUAwZQllJdCeGQB
	 /CU/x10NvCWxJtoyYMHnRW7oz8mam7gQakOnZcksJfVESRcea/3E1yaEnxN2eh3EBZ
	 MCO2D8s2zPiow==
Received: by mail.growdeal.pl for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2025 09:00:57 GMT
Message-ID: <20250228074500-0.1.w.berf.0.tlj5hmekn8@growdeal.pl>
Date: Fri, 28 Feb 2025 09:00:57 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Zajdlicz"?= <pawel.zajdlicz@growdeal.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.growdeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_010559_105176_6A7866AD 
X-CRM114-Status: UNSURE (   1.17  )
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
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGF3ZcWCIFphamRsaWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
