Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB70BC369C7
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Apr 2025 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=ET/Dwe5fXADz6C
	q/wA+LrqqzitsL8dCkQxMCkV+HhkCJLir4/jttVAFCBvbJKwc//e4H+FEkYuI7DGbGzrgtBOU70Ka
	AFh8kFcIEBeVghj4ONR92/2i8Px0HM+z1I40l7ew7ZwxqQsSGjmYLuw4mKgC6QH3fWj3AcBphkDxF
	Hg84YNOGLr2qmyE1q+LBPPkeEmGUkxigmiRhEWskIluH5JTaYUn8rZ0Qn79LHgtw0CdnkPLL2xl3B
	1RrabUuC1lxmv5pdpk/FcPRDogyufAAYUna9rWJgLlqNxncnjH1mSVwf2yzaG1i09GsOjGcx0eOsp
	J4BHKqCcgqSkLCMWNxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KC6-0000000CD4W-3fGi;
	Thu, 17 Apr 2025 08:01:58 +0000
Received: from mail.taskflame.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KC4-0000000CD41-1b0A
	for linux-mtd@lists.infradead.org;
	Thu, 17 Apr 2025 08:01:57 +0000
Received: by mail.taskflame.pl (Postfix, from userid 1002)
	id 722452602C; Thu, 17 Apr 2025 09:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskflame.pl; s=mail;
	t=1744876278; bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=MZby9hryZzK5JYHYyKGtP9y1c5GfM2Ch6ym2RFAYlHfc7M4DWLKKCrDM3F9niBD9h
	 vLvhM5n2dXAbiAO8T+BraiterIhGwDXDotU7CixpnMGYjEZFDafUqMZ+AqYT3dIrD2
	 9cezriRsgX7h4+zVTaco4ZXttF6/6bQp0mH1ckKMLshrGgZolOKkXBzxO2gEHrmXCV
	 dF/uky7rOa2vvlsFCgjtv87E/EMTx6IgktTsuJsLOWIk0+YNI+JJhQxK/GBS9qzGbH
	 Rac69ZWYuV85xvmOHW2oPrwvuiAGloB3c1sSFVQK6l4R7KueNCa+tV5dEobBe436hC
	 i8XPPPXKZk2aQ==
Received: by mail.taskflame.pl for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2025 07:50:19 GMT
Message-ID: <20250417084500-0.1.hp.2z6ac.0.khl8imf37h@taskflame.pl>
Date: Thu, 17 Apr 2025 07:50:19 GMT
From: "Marcin Gard" <marcin.grad@taskflame.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.taskflame.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_010156_561739_D4267288 
X-CRM114-Status: UNSURE (   0.39  )
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
