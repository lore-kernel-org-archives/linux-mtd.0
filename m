Received: from tomts9.bellnexxia.net ([209.226.175.53] helo=tomts9-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17306G-0002Oe-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 May 2002 20:49:16 +0100
Date: Wed, 1 May 2002 15:49:13 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: John Sutton <john@scl.co.uk>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Booting from DOC2000 with GRUB loader
In-Reply-To: <02050120383503.07252@diva.localdomain>
Message-ID: <Pine.LNX.4.44.0205011545020.8520-100000@server.superbt.com>
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

Hi John,

On Wed, 1 May 2002, John Sutton wrote:

> or nftl_format /dev/mtd0 98304  (bytes)

The third option is the right one.  The start offset of the NFTL layer
must be specified in bytes.

> And anyway, if the system is unbootable with the DoC chip in there, how
> am I ever going to reprogram it?)

Install GRUB or LILO on your hard disk.  Insert the DOC chip when you've
gotten to the boot prompt.

Ilguiz
