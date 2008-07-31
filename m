Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOQ1R-0005k5-So
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 04:44:18 +0000
Received: from [192.168.2.10] (adsl-75-23-81-96.dsl.peoril.sbcglobal.net
	[75.23.81.96])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by venus.billgatliff.com (Postfix) with ESMTP id 4A093A40B2
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jul 2008 23:44:17 -0500 (CDT)
Message-ID: <4891431D.7030009@billgatliff.com>
Date: Wed, 30 Jul 2008 23:44:13 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Node CRC failures in latest mainline git?
References: <48913EA3.9080603@billgatliff.com>
In-Reply-To: <48913EA3.9080603@billgatliff.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bill Gatliff wrote:
> 
> An older kernel (three or four weeks ago) continues to work fine on the same board.

I take that back--- a 2.6.24 kernel is issuing the same message, but it still
mounts the filesystem.  The latest git stuff won't.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
