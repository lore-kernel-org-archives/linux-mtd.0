Received: from pd90062a6.dip.t-dialin.net ([217.0.98.166] helo=splash)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 151m8G-0007di-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2001 10:37:44 +0100
Date: Mon, 21 May 2001 11:42:40 +0200
From: Jochen Schaeuble <psionic@psionic.de>
To: linux-mtd@lists.infradead.org
Subject: new slram
Message-ID: <20010521114240.A3135@psionic.de>
Reply-To: psionic@psionic.de
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Last week I checked in a new version of the slram module. The new version
supports multiple memory regions and includes some minor enhancements.
The module-parameters has also changed. To specify a device the following
parameters are required (if slram is statically compiled into the kernel,
the parameter is called slram not map)

  modprobe slram map=<devname>,<devstart>,<devlength / devend>

    <devname> : the name of the device to add (this will appear in /proc/mtd)
    <devstart>: the start of the device
    <devlength / devend>: length or end of the device. To specify the length
                          of the device add a '+' in the front of the number.

To make life easier the numbers can also be specified in megabytes or kilobytes
by adding a 'm' (or 'M') or 'k' (or 'K') at the end of the number.

Example:
  modprobe slram map=dev1,50M,+4M

  this maps the memory region from 50M to 54M to a mtd-device

  modprobe slram map=dev1,50M,+2M,dev2,52M,+4M

  this adds two devices

Any comments on this?

jochen
