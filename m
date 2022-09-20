Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25102C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLuJ2aPSff9TI/47a2UOUYe86sl3R31cgUQ0Cd5Faxk=; b=FKd5l7w6eQ4DEc
	gb+PYHZ56KZwqylGItyEgtroouDfQN8SIVezX2eJpo3crDRFixFE7iCMjH+dOy1nBrhDygnIKAuyb
	OI0IxLq8r/WJaevR7bR7G8fldxUyIHXBBkRTUGX3F3ZiHoG4DS4h6X6Gycp89v2Iif4KzgBHympZn
	p0I4xVcVePDbE3/9sRYDmVUq50qpBtlTIPO4C0bHP+IKlPso5Q62J4hlH524/lD04orGEOpByoGso
	cdIV2W7mOtbNARacseZwt72HNKd0TLeX0eAVlCnRM9B6GaXobm3VBHFiydAHl73N3lVdENVj6MFZe
	hnln9I1jqgyupIKK3UTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYb0-001nO1-Bp; Tue, 20 Sep 2022 08:27:10 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYax-001nIM-Ou
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:27:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 790374000C;
	Tue, 20 Sep 2022 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTnfaAUrVolUOjcW97DzGgJ1A+KBifmDkjE9TXjCqls=;
	b=nm4Gg80xC+WeYs/9o/3GCz9rjrFy6ESk0mN9SqydE8JULcv2PIRKll5OnkHqaemHV6K41q
	oT0PSt2bJ5nGlleuB+nmJpWMwJ4fbBdU1oUrKpO21OlP/zVmWHLCWqkhMIQLUHXoKw9SKh
	Bg6+R7noq54LDlXWOUGqhybN3i0t3mb2PKy+QqTnNEIjraTY2usu+mq4ueDlj3RWNS15xg
	ln3Xvz5Kdkq0YpGCVSsRR7Wt5eATZl2U5ZxF4r8Xs2pIXB65bbC4Gb76dDQtrmArdgIdjr
	nW35/45GQRROjvWHt1qtMwfEP2C3Ztmk0aq/9laZ8JBrpnsIAzJ0y0sOdi+lrQ==
Date: Tue, 20 Sep 2022 10:27:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jason Wang <wangborong@cdjrlc.com>
Cc: han.xu@nxp.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix comment typo
Message-ID: <20220920102703.20bbf413@xps-13>
In-Reply-To: <20220811135854.27036-1-wangborong@cdjrlc.com>
References: <20220811135854.27036-1-wangborong@cdjrlc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_012708_015545_29FB8779 
X-CRM114-Status: UNSURE (   6.65  )
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

SGkgSmFzb24sCgp3YW5nYm9yb25nQGNkanJsYy5jb20gd3JvdGUgb24gVGh1LCAxMSBBdWcgMjAy
MiAyMTo1ODo1NCArMDgwMDoKCj4gVGhlIGRvdWJsZSBgdGhlJyBpcyBkdXBsaWNhdGVkIGluIHRo
ZSBjb21tZW50LCByZW1vdmUgb25lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPHdh
bmdib3JvbmdAY2RqcmxjLmNvbT4KCkkndmUgYWxyZWR5IHJlY2VpdmVkIGFub3RoZXIgcGF0Y2gg
Zm9yIHRoYXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
