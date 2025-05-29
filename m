Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64095C54FB3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 May 2025 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I+a+xGHeYpxD+y+L24+cKAUi02EoX/bAoTnjcSUzLL8=; b=ht33q5mG95Hkw8
	D6qoeCM5ReX7blvAD3br3nU+ZHnC5jBxkmG6qxD5EAcPv0RH/disdmxaDFKaQPD+JEjp23hrg2imR
	bHFgNJcDbiWqgAkKYeAzYqxFzJ+kdNzn5zIgpbD3L+unP6ijUsZR9CqOz3v51YnEQhIyk06yErOA7
	RqNLIdfc1JYwnb/02l/DGOw+1an1eWfXf+TelnuipUDqDF3SLwylk04x9f9epjoqOR/4TfZimcQmb
	4/3ezbwfwHZ8jmx/ZQ7zUyj/i9tLbsu+z5rLKpAIJsdQBIRcZ1rPyrVynSxNtDNu6KlBD2pOompzE
	ncl4p5WEenkuz8/LLVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXpS-0000000FBuZ-0e58;
	Thu, 29 May 2025 07:37:30 +0000
Received: from mail.genbiz.pl ([94.177.225.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXp0-0000000FBo1-3Glg
	for linux-mtd@lists.infradead.org;
	Thu, 29 May 2025 07:37:04 +0000
Received: by mail.genbiz.pl (Postfix, from userid 1002)
	id 93DAA83491; Thu, 29 May 2025 09:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=genbiz.pl; s=mail;
	t=1748504190; bh=QE2s7Sx3IpLcBTCvlyAnhlStw9+iPMwbl94HYtFJXq0=;
	h=Date:From:To:Subject:From;
	b=Gvfb+2RpkoVz5fG7pbNe/LGTdQDHWC5cahz2AkZQufxkGPSspXW0k1joPgEVid/tj
	 3ldZipxmeFxLcd5WEsWQbpd2JBbzVXplqnJ8f3mOW3I9TfQl6w6NXMqxZk0F5J5t1y
	 Y9S2FcNXIzbNxkD3pHRiInqt+m4ckUpLjzfA898w6tQeD5qNJISnuJuQWPfVjDucLE
	 b90ZxTAyTVzHCfKPgKqS1EPDkj+ABv4fDw/D0tPqnAPO3wLjvfY5M6pBIRnwR4EbeC
	 iMOZ9IX2RreeddTyG/HOdBCUSdzHM/cggDMtzqwGxWEv23kAo8gO2ArgQdeC+NoWct
	 tlJtLkKf36xLw==
Received: by mail.genbiz.pl for <linux-mtd@lists.infradead.org>; Thu, 29 May 2025 07:35:30 GMT
Message-ID: <20250529084502-0.1.1n.1x8f.0.87h3bpo8od@genbiz.pl>
Date: Thu, 29 May 2025 07:35:30 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@genbiz.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.genbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_003703_071048_71AB511B 
X-CRM114-Status: UNSURE (   0.65  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtClJhZG9zxYJh
dyBHcmFib3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
