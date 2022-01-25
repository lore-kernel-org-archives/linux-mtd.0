Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F8C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uZQGaveXHIXTMU0IXTSECgdtWVtZm+dSdVlWlUsCkFE=; b=sbhXvTTK5nyzve
	MANdYB9HREB4KW1Nn7gWcXNYd3jgTFqtM7/hinsjj6XJ0z5hAbcnREav1+SVopgyPWq6KjNzqYWJi
	Oy8pNrK0UPi1R3GZuQqongEL1hNqJkDEDE8PYHmVM6ovzeR00FvNw9ZgBpEUM+JErfSM+ZTj45QzK
	TYyqQQv2ndFA+vLlvLFkXl+bl0KX2ufXoFb7uHXeSdblsjNWfGknEp7wvijYLx6TH7+A5cq1B5n6i
	M9OA9MpieraTHn3RxXAOGuZQpNiv0MxHXYKccujGw2UnwWlmto+nlzGO9HiaIwEnTGnsCwrGNtFZl
	QVJGc62njvtU2WawXk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIBS-007Aqz-CS; Tue, 25 Jan 2022 09:32:14 +0000
Received: from mail.belongsenergy.pl ([185.45.112.191])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHqO-0071Es-27
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 09:10:29 +0000
Received: by mail.belongsenergy.pl (Postfix, from userid 1001)
 id D54322669E; Tue, 25 Jan 2022 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=belongsenergy.pl;
 s=mail; t=1643101826;
 bh=JAEkA4FCBmQ7T7M+WVau75EdqeDf4MEEr9hE2/l61BA=;
 h=Date:From:To:Subject:From;
 b=CwRuW/8ob9VjT02vd3X4q9kFfqzpTWmFcILW6+k2Nnc7XaIgf+53VwZKV+REvHfns
 eE2QYfgOvckj2MP6CUciSp4KZzgqDw70gIc8l2xdb7nIuMEeKo/4PG6eIlpJ0VBVKN
 8+aJ8g3VxRjKX3UEgWSmTTKdWmSZsI3KCk52/dZfViEHWEYJKL66hE74Rpg8S3g+eI
 qzE1HHEtlgiQ+YxEEVWpX8f20GsEGXEzszDVBSHmMx7HKthUoaC1wCl7/lYxDE182x
 tn9GfMDm4tAFxdgDSdzUpQRUv3vPJhbaoHJRHw/AFZZ1ubJrZklERHv+UgQTGoVUpu
 ebxLbp+w/ihNA==
Received: by mail.belongsenergy.pl for <linux-mtd@lists.infradead.org>;
 Tue, 25 Jan 2022 09:10:08 GMT
Message-ID: <20220125074500-0.1.7.2mb.0.a14afol11l@belongsenergy.pl>
Date: Tue, 25 Jan 2022 09:10:08 GMT
From: "Maciej Nitycz" <maciej.nitycz@belongsenergy.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.belongsenergy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_011028_264436_B091BAC8 
X-CRM114-Status: UNSURE (   2.38  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hY2llaiBOaXR5
Y3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
