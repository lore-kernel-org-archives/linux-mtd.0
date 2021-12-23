Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF127C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVE4V6ASbVQSXo2q8lsDMOQHtKS8cQPc0wgyVPfAJWc=; b=Kcq9kC4yJR+qvX
	y0w17GB0QnM+i9Mcj32e/mIOve7xwA8cTUcM6MEa7KYeL26xTWMv5QdEY4jG9qbWzylCNO1CjCl5O
	8ujXid5wft500zfpLQzdwuRpMJbv38v/alyFL3D3GcZDbLjTtu/0HtE8KxUgiGVB9FUfyiPkxLShv
	G202cnuhFTWXTI5AMvR6XEC++HyzOcHZXBsem64a5clk4syQNTvNrod1aAuv5vWzdxu0t/iLe6sK1
	oxJnCC/rKXRHEiKu2x1iL6gjxnls6qH84kGPAtGEPZOQ8b9z1qn40WZcoyV6UxHtbifdqY41qQgF/
	D0RC9BSOXRXT3R55xHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0JSl-00CFC9-2K; Thu, 23 Dec 2021 08:28:35 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0IqO-00C0o1-J4
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 07:48:57 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id 12B108315C; Thu, 23 Dec 2021 02:45:59 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1640245736; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=XWiBRnIgTdvFLnSlswbKJoSFo6wgtU9C8FEFdaFUZq0D+CkcK7mHsLG1TvnJL2svM
 rZ0lRYFohMGH+3T4/9jkCU4NC6aKtGng5vgREXXV9OJcVI5yAGy4v2CnmBGtNt9n3g
 oUKWjHsWnq0UVJPUVYmXXw8exZEJwAdghyiTsFKIkJb9nnjiHOwSRNMXZUaZqgJm8C
 BGD9NWxoj4hAz9uSA40h2EhgHhWhhfp7rXbMAxkOdqOK6fWXs+GV+OieUvR+OhcCOp
 DhUoOq9UYvbNkNG4VuXYQGG0Gwr4lcW5haBqFu7euMfSK4fPB/korsjKJV2ibhDHdV
 RgbsARN3wbrUw==
Received: by mail.betterbiz.pl for <linux-mtd@lists.infradead.org>;
 Thu, 23 Dec 2021 07:45:53 GMT
Message-ID: <20211223024500-0.1.f.10mv.0.pm9um5cl6n@betterbiz.pl>
Date: Thu, 23 Dec 2021 07:45:53 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_234856_675879_677E3267 
X-CRM114-Status: UNSURE (   1.20  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
