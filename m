Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14ul2P-00066R-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 02:02:41 +0100
Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ul2q-0007xN-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 02:03:09 +0100
Message-ID: <3AEF5AC6.47ABF513@sis.com.tw>
Date: Wed, 02 May 2001 08:54:30 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: "Shuh C. Chang" <schang@3inet.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: Is DOC Address 0xC8000 Something Special?
References: <21813.988381415@redhat.com> <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Shuh C Chang wrote:
> 
> Dear MTD fans:
> 
> I would like to ask the developers in this list if any of you have ever
> experienced a DiskOnChip (DOC) problem not being recognized at address
> 0xC8000 ONLY by docprobe.
> 

The C segment is usually used by VGA BIOS and is mapped (shadow) to your
DRAM, not on any ISA device.

Ollie
