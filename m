Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f0d1-0004sy-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 15:59:39 +0100
Date: Thu, 6 Sep 2001 16:05:34 +0100 (BST)
From: kira brown <kira@hex.linuxgrrls.org>
To: Holger Friedrich <friedrich@MAZeT.de>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance
In-Reply-To: <3B978FD5.D35F06BF@mazet.de>
Message-ID: <Pine.LNX.4.33.0109061600490.9437-100000@hex.linuxgrrls.org>
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


On Thu, 6 Sep 2001, Holger Friedrich wrote:

> achieve this. Unfortunately the fastest speed I could obtain was about
> 70 kBytes/sec which seems pretty poor to me. When I asked the M-Systems
> support the answers were not really helpfull so far.

The M-Systems drivers are not the topic of this mailing list.

Neither, for that matter, are the M-systems BIOS extensions, or the
patched LILO they supply.

The topic of this list is the Linux MTD layer.  The Linux MTD layer is
*not* written by M-Systems, it is not supplied by them, and their support
staff do not know anything about it.  THe Linux MTD layer does *not* use
the M-systems BIOS extender, the M-systems binary-only linux kernel
driver, or any M-systems code of any other kind.  The M-Systems firmware
has precisely zero to do with this list, the Linux MTD system, or the
JFFS.

Is that understood?  pradeep, this means *you*.

(Sorry David, I had to say it.)

kira.
