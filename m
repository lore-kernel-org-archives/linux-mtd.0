Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L4ky-000883-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 17:26:00 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Jason Chan <jason@emsoftltd.com>, linux-mtd@lists.infradead.org
Subject: Re: How to configure MTD so that JFFS2 work on 7312 NandFlash?
Date: Thu, 20 Jun 2002 18:21:40 +0200
References: <3D0EA22F.9050801@emsoftltd.com>
In-Reply-To: <3D0EA22F.9050801@emsoftltd.com>
MIME-Version: 1.0
Message-Id: <02062018214001.01082@linuxtest>
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

On Tuesday, 18. June 2002 04:59, Jason Chan wrote:
> Hi all,
>     I am trying to configure MTD NandFlash and JFFS2 on EP7312 NandFlash
> driver.
> However, when I try to access, it output "I/O Error".
> But when the kernel bootup, I can see that the kernel successfully find
> out the nandflash device. So how can I make the JFFS2 and MTD work on 7312?

please read http://www.linux-mtd.infradead.org/tech/nand.html : Config 
settings


-- 
Thomas
________________________________
Thomas Gleixner - autronix automation
http://www.autronix.de gleixner@autronix.de
