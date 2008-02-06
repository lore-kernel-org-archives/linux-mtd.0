Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMhcG-0003bH-UG
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 10:35:03 +0000
Subject: Re: [RFC PATCH 1/3]] Add mtd panic_write function pointer
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1201607964.5017.48.camel@localhost.localdomain>
References: <1201607964.5017.48.camel@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 06 Feb 2008 10:34:34 +0000
Message-Id: <1202294074.8393.1.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've now shared these 3 patches as a git branch based on top of the
current mtd-2.6 tree:

git://git.o-hand.com/linux-rpurdie mtd-panicwrite

Cheers,

Richard
