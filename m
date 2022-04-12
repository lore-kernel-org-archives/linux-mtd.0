Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA74C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iu6eIEb3MZdm4e2caA/WBdsJeI0de6QD8c0z20CkwR0=; b=cGF9eO7vcZRaxV
	9Gh2zOCphAsgTyvE60oFCfLvcOT1M+vmPJlHpu62rxogDncUy+PvYLZuuSFq3LCRWKy2mftjLNiae
	7jqZGcQI7YkoS9vwjDDFmThq7p2nc0gNBbKpxzGqTE+7WDCPCTxffQVDRaop+ixBhogosQrPpvO1n
	l07cmf/CdDTIIt3QzTHJVPIZsRuT8TOVZUgi1FAzJL5SpYNbOLCdSYwrCnseqlwJgvUBkr1xUVnjB
	ZpfL90W3/1twoLkLo9wxJA8ulMWwjCAz7zON3/gBnAENg5K+AQlocQROgat4OrcxK6UsxdP8u5hKM
	/EB/xod+OV2VK8UJ9rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBR4-00COyV-0g; Tue, 12 Apr 2022 07:59:38 +0000
Received: from mail.growthmindset24.pl ([212.237.36.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBNe-00CN29-Jr
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 07:56:07 +0000
Received: by mail.growthmindset24.pl (Postfix, from userid 1001)
 id 602E7885BC; Tue, 12 Apr 2022 08:52:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growthmindset24.pl;
 s=mail; t=1649750077;
 bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=YiJ6BQVX1BLUMB3KpF3mTeKMeqtL2o/PIwLkMtIJuAKj1WiVukGTMyzSgOIC0Q67f
 xM4W8I+nis/B2H2ZJk14zi5Aa0hAIvjxJgEu+SLquYBWC1QQAsM8X0jM1wzdxCCOqe
 rNSsoXOPJew1IJkhH5MEl8WO0r9GFP6piQrlxRzj5eio09aj+u0Bqsddk4HUiHxomO
 6e35qD0y56W4c881v2x9SQnxDy2d1+9c4plc+xsTozSMW6WK7EcYYju1ScWa+C/k6G
 MuYCVxWSHzP0cBizRMuQcNu6bE13JWnJscXhs43a4qkQwpE3VlYGLCr/VMQAgoXpR6
 z0qQ80LXZSC1w==
Received: by mail.growthmindset24.pl for <linux-mtd@lists.infradead.org>;
 Tue, 12 Apr 2022 07:50:49 GMT
Message-ID: <20220412073001-0.1.2w.d7ey.0.1q4cldgpik@growthmindset24.pl>
Date: Tue, 12 Apr 2022 07:50:49 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@growthmindset24.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.growthmindset24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_005606_841094_57020484 
X-CRM114-Status: UNSURE (   2.10  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
