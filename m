Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64485E9536D
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HcW547JgrbsLj42FVMzLyBq9BddVw9PzDYr0ZCdpETg=; b=yvQ8HDFcI/5qUz
	3peqeN6mtsx95flsr6WDCQzcc2A+wFulSGCaJ/+tiZV3WA3mI9hWUgGSHbZUNLnGz6Du7Drn6Vuo6
	J5zvzaHAzxtmrPdr5KDKh6ALJhIqXKY+1TFMt0a1erT5Ay1U6QG/9G35qvTOAbF5kx1Z8G/7sGcoz
	BD4U7ErJ6MFjs9ejzvHhljlI2M2lFEtn71gBTrs8vPMqCWDlcOQ2kHKAt3pYvRcuJfewXS5FxL2Ej
	2TfuDsOxeEx2+L0SqjMNDGrwSe7IpOJV0VQWkLtqBlgkvAI2fEEAq4YFmq/93xdQwaW85ZSCiYL5X
	CePp8RsZGi0FOT9+rJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna30-00000008Hbf-1WeJ;
	Wed, 04 Feb 2026 10:23:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna2y-00000008HbK-3f4E
	for linux-mtd@bombadil.infradead.org;
	Wed, 04 Feb 2026 10:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MYBuTu5OB75A6/GrlgsR5Q1v5/fZBHf5I/RU1z8ZZiE=; b=eOQJ2dkvCW4rXpB156RGxKNxBZ
	2/5eLIUlguILkR9akZK8foaHef1+tUJNpalKQCdujO7uz1E9RHhPAXWFRilyvrIJEYrzMT8gMAW9z
	/Nk3ylCJRNtF8Mpi0W1z48z/sxg3czlYBGooDJ8teQuZG5jo/QvZVUyhd8O54pOhwCeP6e96xwN9n
	GJ/cJwExwN2IIIVEV2XzgDTMRHDWKwCIFiKajhbaQbyWcJJFJJ0qnFqgg9pXi8xYJCmGdi0Nt8mYw
	mN8tjKkJL7i7OpmQskWjLZ9AfBldCttRr4G1dFRnS3u4R+lWX3kKBqhqt1ptiFi+GseuBcsSWcH3M
	1VfAjF0w==;
Received: from mail.central-kino-rottweil.de ([85.214.227.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna2v-00000000Ips-49UA
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 10:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=central-kino-rottweil.de;
	s=2020; t=1770198431; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=MYBuTu5OB75A6/GrlgsR5Q1v5/fZBHf5I/RU1z8ZZiE=;
	b=wNamGf0Zk17783DQ0EVB+vRQWbut2j/QlLNiffjMpJbPb3/5OzEnQdc5aP5y6AzMjUok43
	40YBSlqzzcrvZ7nhmZThYbSyZFKBCgD0HB6kq/JN2Ax4EyCQhIRZJR2ztPBGGHuveZC9p4
	vT1NuaPl5YpxcdJM/my+Ya4SCwnM2CNUwoFhzAeHOx6zOAbBDlGQuxXBZugNSRn4M5Zcck
	UQ/hXmdlRjj5NazaKDcDFrRyU7ctCiuckV12optknohK/S0VoHVw5y8lh0kS43BYppyQS6
	48IHXYDvjl2dTUbsHqSXMIzVFL+cZVCM8A9eazBSFNV3s0IYYGPDlnov3dDo8A==
From: fsj@central-kino-rottweil.de
To: linux-mtd@lists.infradead.org
Subject: /KXM/
Date: 4 Feb 2026 01:47:10 -0800
Message-ID: <20260204014710.41FE86B314102237@central-kino-rottweil.de>
MIME-Version: 1.0
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=fsj@central-kino-rottweil.de smtp.mailfrom=fsj@central-kino-rottweil.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_102342_139929_D5664B62 
X-CRM114-Status: UNSURE (  -0.55  )
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
Reply-To: info.superenalotto@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpXaXIgZnJldWVuIHVucywgSWhuZW4gbWl0dGVpbGVuIHp1IGvDtm5uZW4sIGRhc3MgU2llIHp1
IGRlbiAKR2V3aW5uZXJuIGRlciBsZXR6dGVuIFN1cGVyRW5hbG90dG8tWmllaHVuZyBpbiBadXNh
bW1lbmFyYmVpdCBtaXQgCkxvdHRvMjQgZ2Vow7ZyZW4uIEV1cm9NaWxsaW9ucyB1bmQgUG93ZXJi
YWxsIHNpbmQgZWJlbmZhbGxzIAplbnRoYWx0ZW4uIFNpZSBoYWJlbiBlaW5lbiBlaW5tYWxpZ2Vu
IEdld2lubiB2b24g4oKsMy44NTAuMDAwICBpbiAKZGVyIHp3ZWl0ZW4gR2V3aW5ua2xhc3NlIGVy
emllbHQuIFVtIElocmVuIEdld2lubiB6dSBiZWFyYmVpdGVuLCAKc2VuZGVuIFNpZSB1bnMgYml0
dGUgZGllIGZvbGdlbmRlbiBJbmZvcm1hdGlvbmVuIHBlciBFLU1haWw6CgpWb2xsc3TDpG5kaWdl
ciBOYW1lOiBMYW5kOiBBZHJlc3NlOiBBbHRlcjogR2VzY2hsZWNodDogQmVydWY6IApNb2JpbG51
bW1lcjogV2hhdHNBcHAtIHVuZCBUZWxlZ3JhbS1OdW1tZXIuCgpJbSBOYW1lbiBkZXIgT25saW5l
LUxvdHRlcmllLUFidGVpbHVuZyBTdXBlckVuYWxvdHRvIGdyYXR1bGllcmVuIAp3aXIgSWhuZW4g
aGVyemxpY2ggenUgSWhyZW0gd29obHZlcmRpZW50ZW4gRXVyb01pbGxpb25zLSB1bmQgClBvd2Vy
YmFsbC1HZXdpbm4hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
