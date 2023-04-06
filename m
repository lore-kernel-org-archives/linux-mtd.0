Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF3EC77B6C
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 07:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3y8mZ0DfO2MFGMLjkax7C+bAQL34K3zkMOIG2r1quCU=; b=lR1Wb6sbu5cy2P
	2etvp4g2VI8UxDum3zYWQG10lfHAUKR/+cybcSY6rebmLWUmkOoDnCJjjjw5b1iFChrDB6/roqy9o
	N9woDUCXJktQMyyMMfe6zfOA1hejF2bwmmZtErh2YERp8oWU1dGNrR2DxYf8yju0mkl9g57oR6g5r
	tZJo1FftUTCx3egIMu969Rook7V7LwsXodNYRelHaNTX0H3EBpACcuAFdH5rwpYtgk+CBsMlh/E2n
	IvlqidXXZPdEUOnkLi2i+D2HnAyByu3rUpFxH/sek4OR5dkCT+brs+Jt7Rl8CxGRCiJJTbMHOexvX
	LFS3GczB9hE2LCSJQtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKTu-006g5v-2d;
	Thu, 06 Apr 2023 07:56:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKTt-006g5l-3C
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Apr 2023 07:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=; b=F5/B0vpYwiehx1ZNNVzaqvlAQ4
	gsyxRSv8vrmr907PN7mqzM5LxIt1TW8um7cfVa2X46JSrfaVt9/FRghthpib495dQ+0DM1AB0d8cT
	4LF5ed/kdA03AKM/aCCteL8bA2wwQ4ux4XXkrPKYhc9yVCTb+XMIoDzl+5Og5vtm/E0JPn2tIpMhY
	kIhqW5mQpSdQG1t7zTBO6r3nYg9FghcNo3l9jx2EoUMqUgn+N20byk8w2Ygr0EL/m0ftWo1aT2wFP
	aGyRXIOYzbYJ3A6MQzInt3Y35NqG1vL2BRTFDPWsqIG3caTFQMupvVNflNt2KSGwSA7no0trRjnMC
	iJayho1g==;
Received: from mail.feshiecree.pl ([89.40.114.103])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKTp-00ASla-1U
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 07:56:27 +0000
Received: by mail.feshiecree.pl (Postfix, from userid 1001)
	id 2660087F2A; Thu,  6 Apr 2023 08:51:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=feshiecree.pl;
	s=mail; t=1680767561;
	bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
	h=Date:From:To:Subject:From;
	b=XHgNi3KvyaERlyat0j4SH31KywuvvcUwZ7mNnb020hHAWM/1Goe8gQpKCYRkoX14j
	 LvneFVsSu1RodNdScVOQ5TVgXF5b1xWsJS9nWb+I3iltNgj/+MCmhToKNVdJqbh2RI
	 h23+znRz23BEhUu0L73vb612o+3k4EFG/uxEQxg9my8iFQ9AkHQinx7FR9j3Y3vNxr
	 njIfBVM7/eF7T/yaTmzU0N5UQT1sLnFvYHUHFO890GhDfqij+efMGvTc4/gJWCkZWp
	 JFR8Lw/aPCtMaZFR85rQIgxSsPW9ViCTpPDd+pil4NysR24K9lmfAzlZA8RpixDW+L
	 EhJzFVvqN25VQ==
Received: by mail.feshiecree.pl for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2023 07:50:28 GMT
Message-ID: <20230406074501-0.1.1v.6uyr.0.52nr3qo8jp@feshiecree.pl>
Date: Thu,  6 Apr 2023 07:50:28 GMT
From: "Krystian Wieczorek" <krystian.wieczorek@feshiecree.pl>
To: <linux-mtd@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.feshiecree.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_085625_838504_F33120E1 
X-CRM114-Status: UNSURE (   1.75  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpLcnlzdGlhbiBXaWVjem9yZWsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
