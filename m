Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3oK6-0001kd-0v
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 03:21:52 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <200706272350.04975.m.kozlowski@tuxland.pl>
References: <200706272350.04975.m.kozlowski@tuxland.pl>
	<200706271030.l5RAUgKE015163@imap1.linux-foundation.org>
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: Re: [PATCH] mtd: add module license to mtdbdi
Date: Thu, 28 Jun 2007 08:21:08 +0100
Message-ID: <1224.1183015268@redhat.com>
Sender: dhowells@redhat.com
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> 	This seems to be a known issue [1] about Photron PNC-2000 module called
> pnc2000. To reproduce this just 'modprobe pnc2000'. The patch attached at least
> makes the kernel to be not tainted when mtdbdi gets loaded.

This is the wrong solution.  This file should not be its own module, but
should rather be linked with mtdcore.

There was a patch for this, but I don't know what happened to it.

David
