Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AUzM-0007lG-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 13:13:08 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: how to make a bootable linux on doc millennium 
Date: Wed, 22 May 2002 08:12:08 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200205220810312.SM02488@there>
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

On Wed, 22 May 2002, [gb2312] cytang wrote:

>   my aim is just to build a mini system which can boot
> off my doc . I dont know whether 8M space of Doc  is
> enough . How can I make such a small system ,and can
> boot form doc?

Marius is correct - both LILO and patched GRUB can make the DOC Millennium 
bootable.  8MB is more than enough space for a small system.

I used a package called "Peewee Linux" (GPL-license) to set up my DOC Mil.  
It currently uses 2.2 kernels, but it is possible to use a custom kernel -- 
in my case, a 2.4.18 with the MTD drivers.

Mark
