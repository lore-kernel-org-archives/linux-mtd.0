Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A92C02192
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=vqcMHWQ6LiOabw
	INQMpP2U+qVSPO0hi+KRLQ7u7ziuObMukgFVNFj3CVFw3qqWyNy34h1lIkIIUNajQfOQa6c9SGdvv
	NM9sRFTKXOqdJB2VATJMuM857vLP+P4jfWPvXEmaAmw/zYqr7y4uDs5CX7Bbrp+Ub8uyEaPn0supF
	+v6iXJiIRdLuxo8EV3PX+nm9izZSQXzBEOB1RbG/hrPfFfBnvBvoctcRxW0n8U7HPjwvqC8J9aBEy
	79wmU6Ly/16qbnjA6lmgQpwj4JnpeC7DQPbUTSYWQ8aK3DoMaHNziRvyIKcYYfPOg4A9VhT9daGym
	hd5U36yNnm3Nkru5j1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetGA-0000000F40W-21gT;
	Mon, 03 Feb 2025 10:00:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesDa-0000000Ev6R-2kBj
	for linux-mtd@bombadil.infradead.org;
	Mon, 03 Feb 2025 08:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=; b=XGOZuj4bs+yxZ0W2Xj56zsC4Bk
	YDkMK+R5aPdXXH85fv1OsqSWvHmD+C64MyUQGowHs2TR7hxU+owtgLRlKEA0Mi60HtRpiiNVQZTqw
	+SuUR2Roq8L3q9htrgFs3fwhYxY/kp12eQ7fjqXqQ4Owvb5ebKwSNqPsKypbyM+feoW4ddRXqnazB
	HNDlHx7KAiJFV3SWlnIZpHoQ8q9sxZ3dqdR+bSxBXx9CZpJlhG1J6Ym8UONA5M1dPpsHhkaYp6yXA
	zqutUQexr85wHVyxQ3sn+ye7udUCBeyPZzWwCVU7e/sW7f/SqXC8XmSK5OGNvcJkwerj3vejaH7Kt
	l8gEBgdA==;
Received: from mail.completesolutions.pl ([51.91.254.67])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesDX-00000000kyW-34Pv
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 08:54:09 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id E99EF244DA; Mon,  3 Feb 2025 09:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1738572758;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=Qc5OOKTETp3Y8ZxtIrfLSezXrKGBrWrJz4RvoCksnlRkNUuGRyswEhMAzLspVstMW
	 z2Obwb762ck2mzYGNMF0EFrVaATGdLuzxCfXs+AQTAFjpKFj/byp/cxGJDrs/iSPLh
	 qHcDB8meJ4+5OcE/PDrdEMoYPO0IpHut/H5dn7fYUhodQukbeWJAqjYNgjw6I5xmDI
	 BklDHYyPMg1bry6llDVUlFf6MY88vBTk6c87sWj34CiF94RDzKXagT7X6yAuOZOmFh
	 FaOBACjy05AG4ixZlHVMDi9E8eNz2pM3Pz4AqplVKYt3VCSqxLde7J5TB9TFpW+0aa
	 gtsvxoAAXBS7Q==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Mon,  3 Feb 2025 08:51:08 GMT
Message-ID: <20250203084500-0.1.g8.2cq8p.0.1q525iglkc@completesolutions.pl>
Date: Mon,  3 Feb 2025 08:51:08 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_085407_800144_FA07F84C 
X-CRM114-Status: UNSURE (   1.04  )
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
