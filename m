Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WQhq-0002sF-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 00:37:58 +0000
Date: Thu, 9 Jan 2003 02:08:43 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: Thomas Gleixner <tglx@linutronix.de>
cc: Russ Dill <Russ.Dill@asu.edu>, <Srinivasu.Vaduguri@nokia.com>,
   <linux-mtd@lists.infradead.org>
Subject: Re: CRAMFS on MTD/NAND Issue
In-Reply-To: <200301082304.25101.tglx@linutronix.de>
Message-ID: <Pine.LNX.4.44.0301090206130.14735-100000@filer.marasystems.com>
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

On Wed, 8 Jan 2003, Thomas Gleixner wrote:

> Mount your rootfs _readonly_ and you have the _same_ including bad block 
> handling.

If a flag could be added to a jffs2 image denying it to be mounted 
read-write then yes..

With (c)ramfs I know the files in the image is not modified unless someone 
has done a direct block access on the underlying device.

Regards
Henrik
