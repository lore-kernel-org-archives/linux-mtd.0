Received: from sccrmhc02.attbi.com ([204.127.202.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18QpVK-0006nS-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Dec 2002 13:53:54 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: For information
Date: Tue, 24 Dec 2002 09:23:26 -0500
References: <B5747F3DB39FD411884B00B0D07808CCB6C6C9@server10>
In-Reply-To: <B5747F3DB39FD411884B00B0D07808CCB6C6C9@server10>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E18QpVK-0006nS-00@pentafluge.infradead.org>
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

Philippe Dhont   (Sea-ro) wrote:
> But i want to set up a firewall with iptables etc. And i wanna do that on a
> flash card and i wanna boot from that flash card.

Take a look at the Linux Embedded Appliance Firewall (LEAF) project:

http://leaf.sourceforge.net/

The "Bering" distribution is a very nice firewall/router that uses iptables.  
The base distribution fits on a floppy disk (no hard drive needed), and there 
are instructions for using the MTD drivers to install and boot from a 
DiskOnChip.  I believe that it's also possible to boot from compact flash.
