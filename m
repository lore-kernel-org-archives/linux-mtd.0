Received: from lrts1.demon.co.uk ([158.152.10.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16JHM1-0007yF-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Dec 2001 16:56:33 +0000
Received: from tomsk.lotwillow.ltd (grmd@tomsk.lotwillow.ltd [192.168.0.2])
	by lrts1.demon.co.uk (8.8.7/8.8.7) with SMTP id QAA31532
	for <linux-mtd@lists.infradead.org>; Wed, 26 Dec 2001 16:54:15 GMT
Content-Type: text/plain;
  charset="iso-8859-1"
From: Gareth Davies <grmd@lotwillow.co.uk>
To: linux-mtd@lists.infradead.org
Subject: FAQ? How do I use slram?
Date: Wed, 26 Dec 2001 16:54:19 +0000
MIME-Version: 1.0
Message-Id: <01122616541901.01003@tomsk.lotwillow.ltd>
Content-Transfer-Encoding: 8bit
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

I understand that slram can be used to support using uncached RAM for
swapping but I do not know how to set it up.

I have compiled both slram and mtdcore as modules have loaded mtdcore.o
but slram.o emits errors about the number of parameters.

I tried adding parameters to the kernel command line or via modules.conf
but am unclear as to the correct format in either case. From reading the
source file, I think 3 parameters are required, the device name, the
start address and either the length or the end address.

The computers I use currently have 64 Mbytes, but can support up to 128
Mbytes, although the upper 64 Mbytes is uncached. Before I add extra RAM,
I have been testing by limiting the kernel to 48 Mbytes and attempting to
use the remaining 16 Mbytes as a high priority swap space.

I started by doing:

  mknod -m 600 /dev/slram b 35 0

(although I am concerned that I should be using a /dev/mtd? device) and 
adding mem=48152k to the kernel command line.

I have tried putting options on the command line:

  map=slram,48152k,16384k
  map=/dev/slram,48152k,16384k

or in modules.conf:

  alias block-major-35 slram
  options slram device=slram start=48152k length=16384k
  options slram device=/dev/slram start=48152k length=16384k
  options slram map=slram,48152k,16384k
  options slram map=/dev/slram,48152k,16384k

but so far to no avail.

Having looked at older drivers for uncached RAM, I would expect to be able 
to do something like

  mkswap /dev/slram

and then enable it as the highest priority swap-space.

This is using RedHat 7.2 with either a 2.4.7 or a 2.4.9 kernel.

Will someone please point me in the right direction?

Many thanks,

Gareth.

-- 
Gareth Davies, Lotwillow Ltd.     'Always' and 'never' are two words you
Tel. +44 1344 294900               should always remember never to use.
Fax. +44 1344 294902                                         - M. Kendig
