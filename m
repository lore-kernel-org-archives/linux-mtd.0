Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB3C6379F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Feb 2023 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mJH6Ze3P0yXSvmFumpF5xV4NprpRIGo9zjVN9kfEPKg=; b=cZUEA7xrRna+6c
	BS/fUbO5aWUwVj0TTgIVusB3utRYm3XplezkgOSVE6RbJWF3tFRS13UjbmbVjYC/UCRdKCFHHfZ7d
	SjiHiaaoCO6duTT74Z7A81FDWOrs3tOFjGLLFaly9wbSGDrV+tPuzzFzVkcB572PBpyfHE/r8xKzL
	nQniBTdhTYU8jQsPKuo3gqzR1E/wC4qb1YoiE0gDwUlIzwQCuPUB2ayFNZ4dN/POVqb4K277CUqWG
	IolhiDhX/zJ+dhHYj6X0kwHRth0ds2R/K5Wn4yVK3PI/KC1U71zfozrMEV8fwdFUlZismDrkuq9Do
	6EdsTSMEHUdiJ1tuk4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl9N-00BLLi-Nb; Wed, 22 Feb 2023 09:10:57 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl9A-00BLIM-Kv
	for linux-mtd@lists.infradead.org; Wed, 22 Feb 2023 09:10:45 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id 5EBCEA3666; Wed, 22 Feb 2023 09:10:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1677057048; bh=X6IEpSISwJiYlJ3uA866lskXve3r+4o2hf4z7VM6m5o=;
	h=Date:From:To:Subject:From;
	b=bMCn7hmSBW69UmtUL5Jt3syyM1X3SO1mktwGbM7nxXmRQkE0gX7xBFT1kPlmFo2Np
	 6P9Qd/8nS6hPqppHvU8s6d/FsoT1tHMW4xRyqb+vIdsrEwrzLuheUc040w5Rv3K0Zv
	 PdFV/JpqtQgraVo5pOwCrJtwVnbU5dt+urtN80mqjAnO8tDaetF1Fn/j73y5yM5r7Y
	 t9eMq5mCgmfXF4wa7sMO8CnfjCOiq8oF0IQqeDHVCf4zINdqKIFodgoWdQ3CnHSYCZ
	 z32/bwvB6ZQjX+Y0g6SUb0hSgSJxizHkBwcBmVsw0Nbd9i3qjnCky8q471KyXD9c7I
	 wy4Ec96KOmczg==
Received: by mail.corrib.pl for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2023 09:10:40 GMT
Message-ID: <20230222074502-0.1.5n.hcp3.0.m0z9wdal00@corrib.pl>
Date: Wed, 22 Feb 2023 09:10:40 GMT
From: =?UTF-8?Q?"Szczepan_Kie=C5=82basa"?= <szczepan.kielbasa@corrib.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_011044_819472_77A3BD7F 
X-CRM114-Status: UNSURE (   1.63  )
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

RHppZcWEIGRvYnJ5LAoKcm96d2HFvGFsaSBQYcWEc3R3byB3eWLDs3IgZmluYW5zb3dhbmlhLCBr
dMOzcmUgc3BlxYJuaSBwb3RyemVieSBmaXJteSwgemFwZXduaWFqxIVjIG5hdHljaG1pYXN0b3d5
IGRvc3TEmXAgZG8gZ290w7N3a2ksIGJleiB6YsSZZG55Y2ggcHJ6ZXN0b2rDs3c/IAoKUHJ6eWdv
dG93YWxpxZtteSByb3p3acSFemFuaWEgZmFrdG9yaW5nb3dlIGRvcGFzb3dhbmUgZG8gUGHFhHN0
d2EgYnJhbsW8eSBpIHdpZWxrb8WbY2kgZmlybXksIGR6acSZa2kga3TDs3J5bSwgbmllIG11c3rE
hSBQYcWEc3R3byBtYXJ0d2nEhyBzacSZIG8gbmlld3lwxYJhY2Fsbm/Fm8SHIGtvbnRyYWhlbnTD
s3csIHBvbmlld2HFvCB0cmFuc2FrY2plIHPEhSB6YWJlenBpZWN6b25lIGkgcG9zaWFkYWrEhSBn
d2FyYW5jasSZIHNwxYJhdHkuIApDaGPEhSBQYcWEc3R3byBwcnplYW5hbGl6b3dhxIcgZG9zdMSZ
cG5lIG9wY2plPwoKClBvemRyYXdpYW0KU3pjemVwYW4gS2llxYJiYXNhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
