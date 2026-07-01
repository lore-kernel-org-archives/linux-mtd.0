Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6936BC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yD4udqaS4XyYKyLlLANQ2FjqdhonwiEI97THz7nbgVM=; b=vRu6QEMpxBBfei
	6ocKq1tAuZTgrumWr1CCCO5m6MgWvyi9RppDdZViaOnYJhWCnx3v8WiPVNXB1k3CWLGPDePKTaaFV
	NITZq2IAKkts8LP2psnbT/vvvlxdSg1LS9O54wIcpzQF4N+Joi9wMW08cOA7ag1NljE4AfG5CuDoY
	0Mi9RuoYaYO2+3ubUrUOOJBIfjBYyoOmy4R/6oJYELhpoRiOSoNuUET8mZClKoNCQ3RhO1ergMUSg
	vCIfEtjEIl7hcOsSdM/HxGautyelnFqBGqjB2gFUn0lRnE/qXI7Ea0s48c53Avhc5wCXBbpVj+rba
	XlqwjDixmj4rghz8cUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetMT-00000001TYZ-2HqI;
	Wed, 01 Jul 2026 11:44:13 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetMQ-00000001TXw-49pB
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 11:44:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id BAFAE68D05; Wed,  1 Jul 2026 13:44:07 +0200 (CEST)
Date: Wed, 1 Jul 2026 13:44:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: linux-mtd@lists.infradead.org
Subject: [ANNOUNCE] Alpine Linux Persistence and Storage Summit 2026
Message-ID: <20260701114406.GE17996@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_044411_177031_0AA4B490 
X-CRM114-Status: GOOD (  11.27  )
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

We proudly announce the 9th Alpine Linux Persistence and Storage Summit
(ALPSS), which will be held September 28th to October 1st at the
Lizumerhuette (https://www.lizumer-huette.at/) in Austria.

The goal of this conference is to discuss the hot topics in Linux storage
and file systems, such as persistent memory, NVMe, zoned storage, and I/O
scheduling in a cool and relaxed setting with spectacular views in the
Austrian alps.

We plan to have a small selection of short and to the point talks with
lots of room for discussion in small groups, as well as ample downtime
to enjoy the surroundings.

Attendance is free except for the accommodation and food at the lodge
but the number of seats is strictly limited.  Cost for accommodation and
half board is between 73 and 92 EUR depending on the room category,
with additional discounts for members of an alpine society.

To attend please request an invitation by mailing your favorite topic(s)
to:

	alpss-pc@penguingang.at

If you are interested in giving a short and crisp talk please send an
abstract to the same address.  Attendance requests that propose a talk
will be prioritized.

We will start sending out invites on August 1st, and plan to publish
the official schedule in the beginning of September.

The Lizumerhuette is an Alpine Society lodge in a high alpine environment.
A hike of approximately 2 hours is required to the lodge, and no other
accommodations are available within walking distance.

Reservations for the lodge are handled as part of the ALPSS registration
and do NOT use the usual lodge reservation system.  Please let us know if
your require vegetarian, vegan or gluten free food or have any other
dietary restriction.

Check our website at https://www.alpss.at/ for more details.

Thank you on behalf of the program committee:

    Christoph Hellwig
    Johannes Thumshirn
    Richard Weinberger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
