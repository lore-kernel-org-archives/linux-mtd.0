Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2CDC6FD1D
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Mar 2023 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mJH6Ze3P0yXSvmFumpF5xV4NprpRIGo9zjVN9kfEPKg=; b=ED2BUbwUbifXHR
	GxXisCSKfbRCmu4hNAleFxsrkG0+8ZNgcT7qwk86zDue8JNxhL3PskcPjpsaDGWjyZAjgvTAT8RSv
	eOdyb4Ei7yxQWanGkqiAT1kQjJsUlsbx4dbXJlt81u03uDYMH2RzF1pEpSDfFEuvXyoRFuJKsL5gq
	gp72OVOd0eKd2Www7jTWZW95DUxxWRvxe16EAtFJD0YCpNdQ3EfN8dCyQnkJdbWhMxm1IgzqKzse9
	CWReiVVNg3NJCUk3l/goPK6rwFqePGm+vfB9kQLdkR+N7bTo89Xfk9YSeYYfXj/QIWkoPIHGIUbkP
	zMbPX4NAZqjA9kNo9QBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN0P-00Cqpp-0u;
	Wed, 15 Mar 2023 09:01:09 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN0K-00Cqnn-0v
	for linux-mtd@lists.infradead.org;
	Wed, 15 Mar 2023 09:01:07 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id CA64AA3B71; Wed, 15 Mar 2023 09:00:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1678870868; bh=X6IEpSISwJiYlJ3uA866lskXve3r+4o2hf4z7VM6m5o=;
	h=Date:From:To:Subject:From;
	b=UwQomScQzqueG+PV3ejktUbh+rWiK1O2EXcdQpFkA7etu73KTvrm5tBu1jKsgggFT
	 7gRokk0fe8kbP38+bKnPPqsAEoYHYcSSGAlo4eatFC2+ltf0zO7BL6P0VTjTW8mQq/
	 4g/MQ7yZBuQJSVebJekYWyR1SDwTseGzBna3OEPA3TREdDL1EVHHW4tpnWIj1A4DgO
	 3//SV/G1BV+4RXFGiOAphqzh/dMje/sgWYSfpDZhbrm7oppGV+RkB5u980vHTSJ+da
	 EuJNb60ZH8gYx49GxAWStI5qFKgQ9z4uUrW9KBUnYXgKKpLn1qOll4xFaR1fbWx+Z7
	 WVup2njdDeQZQ==
Received: by mail.corrib.pl for <linux-mtd@lists.infradead.org>; Wed, 15 Mar 2023 09:00:35 GMT
Message-ID: <20230315074501-0.1.62.iw94.0.w9l0ragoeo@corrib.pl>
Date: Wed, 15 Mar 2023 09:00:35 GMT
From: =?UTF-8?Q?"Szczepan_Kie=C5=82basa"?= <szczepan.kielbasa@corrib.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_020106_105549_CBF376AB 
X-CRM114-Status: UNSURE (   2.09  )
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
