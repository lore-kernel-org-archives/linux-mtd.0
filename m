Received: from law14-oe37.law14.hotmail.com ([64.4.20.94] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19X2ac-0005cz-H6
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2003 18:37:18 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "Uclinux-Dev@Uclinux.Org" <uclinux-dev@uclinux.org>
Date: Mon, 30 Jun 2003 23:03:09 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE37mut1Elus200057d5f@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
cc: jffs <jffs-dev@axis.com>
Subject: PC jumping to wrong location
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

 when I try to mount a partition using jffs2

it says
***
mtdblock_open
ok
****

but then either system stops responding,
Or the kernel crashes
with the PC ( i am working on motorola 68VZ328) jumps to strange locations
like 00007  and sometimes the kernel is corrupted too.

Sometimes it mounts properly byt when I  cd into the mounted folder , then
the system crashes...

The kernel I built was very stable before I put in
Jffs2 support. to putJffs2 support I had tomake the kernel run from RAM but
i don't think that  is the problem here

Can anyone give me any clues or hints as to how can I solve this problem...

I hv been working on this problem for a  long tie now

regards
Vikram
