Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92EC77B72
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/KcjmzRfy2zcYivGLXo1nQqi2yS8T60ugYp1Mk8Cm0=; b=3tuB+YF4Jn4UIE
	5uOjasLuK8qQIwfeWGGPyP6TgYNPyp2N4Ot56SEDsR4iH4Y6QxImnfJ3Y5TvSIey0cdW0CoDkLJyx
	AVDZVdjwLvePGZma6t1BaWyebEre42lXuw6Z7G92rKRwaDg3Fb0KF97GgRahNhGVhlip4676SEebz
	ZdnbJa+Aoub5n91OqiiWgkBWmiS7Wi1oimTMC0iFOYK/K+BcAd3oA3wgJ9x2tHXKOGAfU/J+bmhU9
	KMhEcsKaKA12FUPXKZmcp3g99p/3NemOe6OqLTFFXH31GMm/C51l+7qa6Ry/r1nJvluJQx6AlKWBK
	T1Dlkdx8PJY0B0CvjQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVzq-008O8p-0e;
	Thu, 20 Apr 2023 15:14:54 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVzm-008O8K-1d
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 15:14:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4B32524000C;
	Thu, 20 Apr 2023 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682003685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6VGWdbwaAKnhjbf0SQQhkQq+B/GT7CL9e3HMfJLxvs=;
	b=XAwJbv+eMekt4JLDD3f4jG8I9Myy/BPWANKzOzJUuSPBA3zHzZj3kk+dNY6CW5G5P+HGfu
	qPJCE/hJhTJ0CjYBEJ3H7xn+c3y61umv9TE07aJN6+Ffp/DYny9Mz8hJcWFgVqgG1SO2ET
	ZkGGVrE1sqNjXt6us/gJOIFkkwlEDF9aS8aPUQg/C13yQGAHGTUyibisV8t8Ir4r56S9cc
	yztCsGU36JnnbZ0ftSQQU31+li5AYvcP2hJf6rteoapB+ynP4MSrU/4LsnK0Fli0kQKZJZ
	xNHhE54T9lUAY73cjgPxjWft+5X/h2XiFj5GD/eFTS30uthOg7jnyjBDu6Tg8w==
Date: Thu, 20 Apr 2023 17:14:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.4
Message-ID: <20230420171441.5691da12@xps-13>
In-Reply-To: <20230419203647.3aea35d5@xps-13>
References: <20230419203647.3aea35d5@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_081450_719367_83D702A9 
X-CRM114-Status: UNSURE (   5.27  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFdlZCwgMTkgQXByIDIw
MjMgMjA6MzY6NDcgKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9y
IDYuNC4KClB1bGxlZCBpbnRvIG10ZC9uZXh0LgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
