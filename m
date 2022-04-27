Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62204C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iu6eIEb3MZdm4e2caA/WBdsJeI0de6QD8c0z20CkwR0=; b=Jr82NtdQvP683k
	QdmnYiOjl0dBR99WHdr8CSl3QM01uIXaTeii2Tls8LhI7A5I8KDxDzHfv+VflIkz42eXHox8KlyNj
	MpPdbF35TF0vynOO1F/rE94HNw1ZjOExqVEVqJTxMy8hrz6mfUD+Bowtzj6bC8C3A4v5qEtia+Bkg
	xlufkc7sUxYGllJJSwX12ixmFM6RtMs8zkpytlqJArc93yYtldVUWRBGrZbKa6H+V7NuAo6PetDIb
	71olyrZbuIRmJXg1TakSw+eKmOZpVSLK5YuaBDsmcsB1tH2bYpvbHWoBwgDa0HrAcpS7DTIlk59mr
	jB7i1/NNlZ9ywuPYqzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc8u-000Hrh-EW; Wed, 27 Apr 2022 07:31:20 +0000
Received: from mail.fixingbiz.pl ([217.61.22.139])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc8n-000HoF-IL
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 07:31:16 +0000
Received: by mail.fixingbiz.pl (Postfix, from userid 1001)
 id 9A211A27CF; Wed, 27 Apr 2022 08:28:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fixingbiz.pl; s=mail;
 t=1651044573; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=vBTNego3kgsNxccH4HL4Lzhdq1yP5nsUv/p4Cje1Ph1PzSPLByemd38Xu4bZV1Zz6
 fGmRNcXUBvj09RVtn5iRnNEb2rXay1wPQntb51iSNMf/niW7Em4aw+IXbp3OPYhznZ
 HneUOe5MQKYPzsheXqITvCiPThWyvg2m9TJoWsttsxAXC/rVClssTeSO4FXUbK9dXp
 no/8Jsv/CAmvHjnn7UiZZy5gT2wGrNAf4cdraLcrS1zXqo8SZnSLW1cP1j+FxW3zHi
 5I7Up1xx2ZZ6j7YWfPfHudk5o6Y+ozGfpKMxlF+sxfnELQG/eZmvGMvRhiD8YCcFHR
 dJ1g7h20zLTBA==
Received: by mail.fixingbiz.pl for <linux-mtd@lists.infradead.org>;
 Wed, 27 Apr 2022 07:28:09 GMT
Message-ID: <20220427073002-0.1.22.aien.0.3ghf5rs4wk@fixingbiz.pl>
Date: Wed, 27 Apr 2022 07:28:09 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@fixingbiz.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.fixingbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_003113_780393_8806322F 
X-CRM114-Status: UNSURE (   2.35  )
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
