Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89951EB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hU0ZHqihwFp6mSfqr1fmGZ0Ja93F6JTfG5S5rSWuuhw=; b=nNcWqzfRjadTRU
	bCGyoaFUUzo01oSnwNgMU7YMu9V9T56a/zmkdxX0EibhtQmVey5qcpttBBq1CHeA9SnfHmvcjmfuu
	O+/de2ulLbhlHopAh/tBD0wXnWSsMurQYsSYgUoJqrzzs7p65uw2Vijm53ZYt/7CANVSBeGFNDre9
	zcboUejt4Fcs+0uoNWwkuHu69CQK8UZKarpwAmk1Thtc4D3FW57UhyVKeguCLbPNaGr1WiAGNdJ8c
	xybSbq/+vDW33xggW6ca8bUbvYCNiqEjE5cvPoPyOWbUYJ3oSDRlh7fVurUAELUvdirYoz+oDG+x6
	TGASUe1+QuTRRjKHiulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCDMZ-00Gy7q-0d;
	Thu, 22 Jun 2023 06:00:11 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCDMW-00Gy7I-2Q
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 06:00:09 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4E6A467373; Thu, 22 Jun 2023 08:00:01 +0200 (CEST)
Date: Thu, 22 Jun 2023 08:00:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 14/24] init: clear root_wait on all invalid root=
 strings
Message-ID: <20230622060001.GA8351@lst.de>
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-15-hch@lst.de> <8c1992bc-110a-4dad-8643-766c14bf6fd4@roeck-us.net> <20230622035149.GA4667@lst.de> <2205ef1e-9bb6-fb1e-9ca3-367c1afe12ac@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2205ef1e-9bb6-fb1e-9ca3-367c1afe12ac@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_230008_935323_25EFFC0D 
X-CRM114-Status: GOOD (  11.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Guenter,

can you try this patch?

diff --git a/block/early-lookup.c b/block/early-lookup.c
index a5be3c68ed079c..66e4514d671179 100644
--- a/block/early-lookup.c
+++ b/block/early-lookup.c
@@ -174,7 +174,7 @@ static int __init devt_from_devname(const char *name, dev_t *devt)
 	while (p > s && isdigit(p[-1]))
 		p--;
 	if (p == s || !*p || *p == '0')
-		return -EINVAL;
+		return -ENODEV;
 
 	/* try disk name without <part number> */
 	part = simple_strtoul(p, NULL, 10);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
