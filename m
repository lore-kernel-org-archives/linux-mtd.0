Received: from [216.205.122.228] (helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Nat5-00042f-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2002 16:08:47 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: How to Clean bad Grubfirmware off DOC?
Date: Thu, 27 Jun 2002 10:59:58 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200206271059.30830.mark@lakeshoremicro.com>
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

g_friend@etang.com wrote:
> By saying above ,do you mean "hot plug" ?

Yes.

> Do you mean that I can install a grub on my harddisk with "network " op=
tion
> then install DOC ,then I can boot from harddisk with DOC in my board ?=20

No.  The "--enable-diskonchip-biosnetboot" applies only to the DoC GRUB. =
 If=20
you have a BIOS that supports "NETWORK" boot, then you *can* boot from a=20
harddisk with a GRUB-bootable DoC installed.

See item #8, "Change Boot Sequence" at:=20
http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html
