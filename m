Received: from tomts13-srv.bellnexxia.net ([209.226.175.34])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MWta-0007Qd-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 17:40:54 +0100
Date: Mon, 24 Jun 2002 12:40:51 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Peter Keel <seegras@discordia.ch>
cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
In-Reply-To: <20020624154007.GA4825@discordia.ch>
Message-ID: <Pine.LNX.4.44.0206241234100.9174-100000@server.superbt.com>
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

Peter,

The --enable-diskonchip-biosnetboot cat not sometime prevent BIOS from
invoking the network boot code directly.  I observed this with an
Advantech PCA 6753 board.

As for the ext3 support in GRUB, I am not sure.  I know that ext3 driver 
can read ext2 partition, but I read somewhere that opposite may not always 
be possible.  For this reason I keep the kernel image in a separate ext2 
partition and the rest in ext3.

It seems that the default journalling mode in ext3 driver has been changed
from "data journalling" to "data ordered" one.  Does this mean that no
double write operation will occur with regard to the file data?

Ilguiz

On Mon, 24 Jun 2002, Peter Keel wrote:

> I'm hoping. It was reiserfs, but now it'll be ext3.. I hope grub 
> has no problems reading ext3 since its the same as ext2 anyway...
> in principle.. ;)
