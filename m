Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429F4C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuRL3QNwFKgZjTR7jIP60QPaCyeuoHcDAxsAu4tkhJw=; b=sisyzkKNy2/qML
	QgTNmaSswfiwvzPG28g9SsdwBQ5nFTLtV6Xhu3fHCSgfGQ318z3IC/S85IOIZJ+p3QGtHE8tnjMER
	RiZIxmGB0DWPLbxUHunIGc2ZVsj+CvRSfE4pZYu5Mo2oYaDgqHBfYVXqAmrK6Hhp8YBb9pvbOAl0k
	zOO9+fGVqiMUJI4jJghDeLXEjZrlz0MwkPS2IYD9wl6TOGxPKGHL6Aaj9AEXBj6rQJWOCD+4SPr/7
	QBqmdbird009OCVjCF+I3J4Dv9iL9M0v2TXq2Utg+PDWAAUuqfsoUrsTOuc5gSIn8uQ9uomuWfHD7
	V5/Wxpt7ptKQUay40ehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kt-00Flpl-2i;
	Thu, 27 Jul 2023 15:18:19 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kk-00FleE-20
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:18:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D929FE000E;
	Thu, 27 Jul 2023 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4N+nVvd32coGB4dhPfHrUB7ThbwMd+axV+x3nV/00sQ=;
	b=FVg628VaH6MGOA+9jHzJPGIB9qv0szoOBn/eAVMOm4cyLZhIWeCmPxlSQu/gedFHHKqw0g
	CJx+qzXSkhllWkUYnF0RCvuqZ+n/dexg00ZX6GEyZa4OQFu/lFbVrjL5DWoCf7DHq00Myg
	QEtqRKiVzfJMReCVMKe3w+bhNKe4dhgVkBlrXDkexeShrv13AucVVj82Ask2W3p1z416G+
	XW+UF9tSq7rsNHyooGVnv+KzwGbij6RUFBddpIc/ogIx0am50zopPwWB2fQMkMbim8XE6B
	kQVoChWzgSzCDCB+vGs4SuweQGPlUaDOA8wC5Uaz5J6E5m4ooMYDBFia2vxrWw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mtd: rawnand: brcmnand: propagate init error -EPROBE_DEFER up
Date: Thu, 27 Jul 2023 17:18:07 +0200
Message-Id: <20230727151807.586461-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719084324.14799-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6680d8b67921fc732a59792dec6d3f94c031451c'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081810_811875_415B6108 
X-CRM114-Status: UNSURE (   6.70  )
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

T24gV2VkLCAyMDIzLTA3LTE5IGF0IDA4OjQzOjI0IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IE1URCBzdWJzeXN0ZW0gbWF5IHJldHVybiAtRVBST0JFX0RFRkVSIGlmIHNvbWV0
aGluZyBpc24ndCByZWFkeSB5ZXQuCj4gSXQncyBpbXBvcnRhbnQgdG8gcGFzcyB0aGF0IGVycm9y
IHVwIHNvIGRldmljZSB3aWxsIGdldCBwcm9iZWQgbGF0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IEFja2VkLWJ5OiBGbG9yaWFuIEZh
aW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KPiBBY2tlZC1ieTogV2lsbGlh
bSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFu
ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
