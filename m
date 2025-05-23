Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407E6C3DA6D
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=1nVa/WjNinqbsy
	gy2qsvGwDwHmo3D26YcUD79iVC7eqljdeZjDZBOfYvVqN3HGHeZtX5DfgqYGJ7iZEnxjKKM2mS4WD
	0OiE0JQq3qK1J65bGVDI91IYC4QvqmuWhnVYUnnn1jFq8gmMKvnd5eI6WCVGbnNscNtL3/XXsheT9
	zB+Iv5YVztYXKtWK1N7ly6m4Z1Ox+DkFwfhDdN7HdaeP03HehgmavaAIP7cUdJQwFNf8dPhDuTLs3
	N8j0kKoM1Nzek4QCJowkJvifkn2Xzypd/W4xaPu+Hwzo4LRZ9/gTYClOo5LeYe2CsWZQ/z2MM48hq
	/B18eQqTNWEibKOsIcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1S-00000003KYI-2WPo;
	Fri, 23 May 2025 08:44:58 +0000
Received: from mail.taskflame.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMsW-00000003CZy-3UYn
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 07:31:43 +0000
Received: by mail.taskflame.pl (Postfix, from userid 1002)
	id 0A8ED23EFC; Fri, 23 May 2025 09:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskflame.pl; s=mail;
	t=1747985492; bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=GDDZs0JwKyzZfh75daOF7ig/nIq+I5Wty+xlmvfe29JCLjXkKwsTqTpOT4CtCX3f6
	 Cu0b1Zl3cVa859Bw0gGahitwKS7gySwcV4ds99pjt1wfYjAlsCrjgUISSim3hEfg81
	 UIGHPwFF2gYqil0gUgiyfylr46bTnXR+Bn08CLitxfwq/0EAsCbut2HCmEuD4znLm0
	 0Ef0V/eAL23DvXLEG3q05wnC0nLUxDWmuDzCO1WHWhoDJDWrt+PBZiaWnU1wC3fyux
	 tdUWX74A+rdseHP8N0/zaSSjvf/2AAvAZTvImqOJYGpd5cgp2GyDDe0Fhv7YJBdSDs
	 AnIVEoC+JvrHg==
Received: by mail.taskflame.pl for <linux-mtd@lists.infradead.org>; Fri, 23 May 2025 07:31:18 GMT
Message-ID: <20250523084500-0.1.ic.38ubk.0.tdu9dzsh8o@taskflame.pl>
Date: Fri, 23 May 2025 07:31:18 GMT
From: "Marcin Gard" <marcin.grad@taskflame.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.taskflame.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_003141_555905_D5A77A1C 
X-CRM114-Status: UNSURE (   0.86  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
