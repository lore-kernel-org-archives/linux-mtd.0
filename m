Received: from tomts19.bellnexxia.net ([209.226.175.73] helo=tomts19-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17D5Z8-0003pi-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2002 16:40:46 +0100
Date: Wed, 29 May 2002 11:40:42 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Frederic Marmond <fmarmond@eprocess.fr>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: can't boot with DiskOnChip2000 / nftlmount UnitSizeFactor ????
In-Reply-To: <3CF4F0ED.8040805@eprocess.fr>
Message-ID: <Pine.LNX.4.44.0205291138490.3100-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 29 May 2002, Frederic Marmond wrote:

> is there any info to make my nftlmount works, even if i have this
> message? ("Sorry, we don't support UnitSizeFactor of != 1 yet.")

I circumvented such problem by re-formatting the chip with the MTD
nftlformat utility.  The latter has a built-in check for erase block size
which you may need to remove if you find the risk acceptable.

Ilguiz
