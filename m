Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=ocean.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6dvD-0003s2-6U
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2004 19:38:16 -0400
Received: from [203.26.222.154] (unknown [203.26.222.154])
	by ocean.magtech.com.au (Postfix) with ESMTP id 17E7D40AA40E
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2004 09:38:03 +1000 (EST)
Message-ID: <4144DDDA.1060109@magellan-technology.com>
Date: Mon, 13 Sep 2004 09:38:02 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0409092347290.6169-100000@gemini.home.net>
In-Reply-To: <Pine.LNX.4.44.0409092347290.6169-100000@gemini.home.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Setting up MTD via command line?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie Guinan wrote:
 >>>Can anyone explain, or is there docs on how to setup MTD via command

from <your kernel here>/Documentation/Configure.help

CONFIG_MTD_CMDLINE_PARTS
   Allow generic configuration of the MTD paritition tables via the kernel
   command line. Multiple flash resources are supported for hardware where
   different kinds of flash memory are available.

   You will still need the parsing functions to be called by the driver
   for your particular device. It won't happen automatically. The
   SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
   example.

   The format for the command line is as follows:

   mtdparts=<mtddef>[;<mtddef]
   <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
   <partdef> := <size>[@offset][<name>][ro]
   <mtd-id>  := unique id used in mapping driver/device
   <size>    := standard linux memsize OR "-" to denote all
   remaining space
   <name>    := (NAME)

   Due to the way Linux handles the command line, no spaces are
   allowed in the partition definition, including mtd id's and partition
   names.

   Examples:

   1 flash resource (mtd-id "sa1100"), with 1 single writable partition:
   mtdparts=sa1100:-

   Same flash, but 2 named partitions, the first one being read-only:
   mtdparts=sa1100:256k(ARMboot)ro,-(root)

   If unsure, say 'N'.
