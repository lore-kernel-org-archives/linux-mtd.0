Received: from web20407.mail.yahoo.com ([216.136.226.126])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 170vKm-0000OG-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 03:19:40 +0100
Message-ID: <20020426021938.12025.qmail@web20407.mail.yahoo.com>
Date: Thu, 25 Apr 2002 19:19:38 -0700 (PDT)
From: Zhiwei Yu <linux_vpn@yahoo.com>
Subject: Booting from DOC2000 with GRUB loader
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi,

I am working on booting from DOC2000, LILO works on my
box but GRUB doesn't.  After I patched the latest
patch for GRUB, I got grub-fireware and sucessfully
load the fireware in DOC.

For now, everytime I boot up, I got grub prompt, but I
failed to load kernel, the command I using is 
kernel (dc0,0)/boot/bzImage.

This problem is not new to the list, I found several
similar mails, All of them didn't have the answer.  DI
u have any idea?  Thanks in advance.

-Zhiwei

__________________________________________________
Do You Yahoo!?
Yahoo! Games - play chess, backgammon, pool and more
http://games.yahoo.com/
