Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B036FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LFBSx+ner6cq1U4r1J/S8GYu8sLOQTv7NN2ujh6WQMQ=; b=aH91L4svYdtzCr
	zFhatErTLwKlrZkH9K+qwTZQbOQdQKS41HvIFbmDsb1RU/ozl/5rGhAvnCJQUhoDDTVj4tE3EN4bq
	vh34jsjp/ojL6bQmfpGJxKfilFqUfJ6B2JAvBvWayyOKz+OElu6UWkjqr0i+iFcBjIV3yuzi7lNqi
	4X03GFUMS46+ovRXszFg2aK5c6tJQE05mDW2Cm2+YikEegQwwvyTUfjuKdYaWk9vs9MSCjQpGJ/Cn
	+WDKbRia0ggzFes7wjuz8ffSkNCWIdslNlB1xWW3bONgTbs4rSPGt95q/fsOtVLWgIF6O1IECtUn2
	k8p4Vf4V6YrsGM6d+W/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx3Fh-00D2bT-VG; Tue, 14 Dec 2021 08:33:38 +0000
Received: from mail.thebizzie.pl ([192.236.147.111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3Ff-00D2aR-Jt
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 08:33:36 +0000
Received: by mail.thebizzie.pl (Postfix, from userid 1002)
 id 6762C18159B; Tue, 14 Dec 2021 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thebizzie.pl; s=mail;
 t=1639470814; bh=kU+//Lu71IqgcFfjayWXuIc0mZtoyrYJc2YuqyU8eS8=;
 h=Date:From:To:Subject:From;
 b=lPv3XNSbKzokwHuBYpnABFcBsWStn/38d+t/O7AoVuTTeSLX/k5td6kPmufnTp5OS
 s/PdKjY3CaP0ogstw5KT2zHPOCHCgSTqu7i5vYPL16mCNK/fjgM1RMtBdfd61X9St/
 Kf1W+cAKwNCe1dAquXXYKocaNfWBKUdEMZ3peLNKr0dgk1myLWZxyXOIBjgV8QdIP3
 +3oPG7pKhqxbvIF9R3DAU4JJdx3HMmUZ0Fixo539Oq2RfAUoKElloISUhJEWfIo6OM
 vMMQbNdjeLQASwRelkr6YzbyKNXGgl3HOpBUeOJ9nBEM9LzLTCgigXzFd4mGEOeuJt
 ZfafkWsIHUrbQ==
Received: by mail.thebizzie.pl for <linux-mtd@lists.infradead.org>;
 Tue, 14 Dec 2021 08:32:04 GMT
Message-ID: <20211214074500-0.1.7.2vb.0.9md41264kr@thebizzie.pl>
Date: Tue, 14 Dec 2021 08:32:04 GMT
From: "Mateusz Adamczyk" <mateusz.adamczyk@thebizzie.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.thebizzie.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_003335_832226_5FE5FABD 
X-CRM114-Status: UNSURE (   1.89  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hdGV1c3ogQWRh
bWN6eWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
