Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E63C77B70
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O633rm6WUPkJlShn+8601XkT1R90oneAtAVfZHlV+SA=; b=apGGbULHaRxCwXiKCYWRMgy5mI
	wEYjQmLyv7ugj11rYLRZfnT2VQovZUlEc8fyDAfYJ2ytO4lATasLqoPGR+xUXXshkwvCXjk5frMo2
	rf8TTjAm9jnwUY2u0p+DjAmSi7tEHgSUbBF3HSfe52Av55SF0uhh2anIUoMQEePcw4NUy0DQmSPvv
	uQCRX/hZMFr3BWBekLjPqY5dvzlWVMqfknxQLwAvocPhtNox95g72hvZDxxjF2j97+rbAglMIvuHz
	zyIdGjbMmh4iovt3PJYCCdqe3T0o76I0hvZbK9N342IXVrZuNKvCajrqmpmihsOm0WzMAiSCt7w/C
	32JbwjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkm5-00Cbsh-33;
	Sat, 15 Apr 2023 18:37:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkm3-00CbsG-12
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:37:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B363661989EA;
	Sat, 15 Apr 2023 20:37:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2ZkRJUYzMcDn; Sat, 15 Apr 2023 20:37:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 07D06622623A;
	Sat, 15 Apr 2023 20:37:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sYN0Wmqo47dJ; Sat, 15 Apr 2023 20:37:20 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D7AE461989EA;
	Sat, 15 Apr 2023 20:37:20 +0200 (CEST)
Date: Sat, 15 Apr 2023 20:37:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Golle <daniel@makrotopia.org>, stable <stable@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Hauke Mehrtens <hauke@hauke-m.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Nicolas Schichan <nschichan@freebox.fr>, 
	George Kennedy <george.kennedy@oracle.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <557432802.69470.1681583840768.JavaMail.zimbra@nod.at>
In-Reply-To: <2023041544-unending-glowing-e5ce@gregkh>
References: <ZDrmsnX5BHxtBNwf@makrotopia.org> <288240559.69421.1681583177740.JavaMail.zimbra@nod.at> <2023041544-unending-glowing-e5ce@gregkh>
Subject: Re: Request to pick "ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size"
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Request to pick "ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size"
Thread-Index: 0ft8VSmtq084fRfhryZVFw9RtiiJQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_113723_510987_F0485BFF 
X-CRM114-Status: UNSURE (   2.39  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdyZWcgS3JvYWgtSGFydG1h
biIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEFueSBzcGVjaWZpYyByZWFzb24gd2h5
IGl0IHdhc24ndCB0YWdnZWQgY2M6IHN0YWJsZUAgaWYgaXQgd2FzIGtub3duIHRvCj4gYmUgZml4
aW5nIGEgcmVncmVzc2lvbiBzbyB0aGF0IHdlIHdvdWxkIHBpY2sgaXQgdXAgYXV0b21hdGljYWxs
eT8KCkJlY2F1c2UgSSBub3RpY2VkIG9ubHkgYWZ0ZXIgSSBwdXNoZWQgYWxyZWFkeSB0byBuZXh0
IGFuZCB0aGVyZWZvcmUgcGxhbm5lZCB0byBpbmZvcm0KeW91IGJ5IG1haWwuIEJ1dCBEYW5pZWwg
d2FzIGZhc3Rlci4uLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
