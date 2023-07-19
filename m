Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3C3C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cbjRCUW2OCb6nYOJluvdzPz9I1EGJZn2oFH9lnXsoZc=; b=a4YYsG29rbv6ASiNQ9eqd0O/S6
	OPwB2HV0g055nHNn0qsszARm6/tod+B5N45eoaVY2lunDhfz+os8BeFf/Dpt13a97C1P+eZZuERPv
	bNUKpuu/qHW8ajPJ4+wBoLnwN6GrjAjDc0FVrfE4h3ekjD3oKVpgWafOzzfKBCl0vIvbIpN4AoQlf
	a+jlXeQgeX0eMT4qTzgLJR3rjiJmsZvNJ0X26dukIiWGFJSXw9xmdnLuw8fKNgd5ihQop+JhC0tvK
	aMGk3erR8PeGTbrE5U0U7GwDTdP6LpOvaS82h05ohCBcXolsIr+KdDzSuLQIYjwpy5QqWpLTJGtaP
	R5QCbq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8Dt-007jLB-0O;
	Wed, 19 Jul 2023 14:32:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8Dq-007jJD-1E
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 14:32:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5D1B1634202F;
	Wed, 19 Jul 2023 16:31:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zaKynDZcz5vf; Wed, 19 Jul 2023 16:31:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D49FC6342049;
	Wed, 19 Jul 2023 16:31:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jP2E1FoDpgBZ; Wed, 19 Jul 2023 16:31:55 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id AFEA5634202B;
	Wed, 19 Jul 2023 16:31:55 +0200 (CEST)
Date: Wed, 19 Jul 2023 16:31:55 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Stephan Wurm <stephan.wurm@a-eberle.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Johannes Eigner <johannes.eigner@a-eberle.de>
Message-ID: <1006337471.13025.1689777115644.JavaMail.zimbra@nod.at>
In-Reply-To: <ZLVWfrlEOWT1twpr@PC-LX-Wurm>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <736980270.3262.1689586950735.JavaMail.zimbra@nod.at> <ZLUXruUkYMrPK+GQ@PC-LX-Wurm> <260741266.3681.1689591789332.JavaMail.zimbra@nod.at> <ZLVWfrlEOWT1twpr@PC-LX-Wurm>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubiblock: null pointer dereference using scatterlist in work_queue
Thread-Index: QWBZmEM+jrW3AoQV9zucPkJZxr7Mdw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_073210_595542_5E220F5A 
X-CRM114-Status: UNSURE (   4.94  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlN0ZXBoYW4gV3VybSIgPHN0
ZXBoYW4ud3VybUBhLWViZXJsZS5kZT4KPj4gPiBXZSBkaWQgbm90IGNoZWNrIG90aGVyIHN0YWNr
ZWQgZGV2aWNlcywgYnV0IHdlJ2xsIGdpdmUgdGhpcyBhIHRyeS4KCkRpZCB5b3UgZmluZCB0aGUg
dGltZSB0byBjaGVjayB3aXRoIGRtY3J5cHQ/Ckp1c3QgdG8gZ2l2ZSBtZSBhIGhpbnQgd2hlcmUg
dG8gc3RhcnQgbG9va2luZy4KSSdtIHN0aWxsIGEgbGl0dGxlIHB1enpsZWQgd2hhdCBpcyBnb2lu
ZyBvbiBoZXJlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
