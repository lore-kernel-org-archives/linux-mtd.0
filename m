Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AAXI-000319-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 14:18:17 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id PAA06090
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 15:23:40 +0200 (CEST)
Message-ID: <3B2768F0.9979B834@inventel.fr>
Date: Wed, 13 Jun 2001 15:21:52 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <3B273827.33CC03BB@inventel.fr>
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

> ----> !!!!!
> ----> JFFS: Failed to mount device 1f:01.
> ----> VFS: Mounted root (jffs2 filesystem) readonly.
> ----> !!!!!
> Freeing init memory: 48K
> serial console detected.  Disabling virtual terminals.
> init started:  BusyBox v0.51 (2001.06.05-17:42+0000) multi-call binary
> 
> So, on the one hand, it indicates that it failed to mount the device on
> 1F01 but afterwards, it managed to mount the jffs2 filesystem as root
> fs. Is it a known behaviour or do I have to modify some parameters ?
> 

In fact, when the JFFS says that it failed to mount the device 1f:01,
the VFS detects the jffs2 and mount it ; and when it successfully
mounted device 1f:01, VFS mounts a jffs filesystem ; but as it is a
jffs2, then the following happens !!!

JFFS: Successfully mounted device 1f:01.
VFS: Mounted root (jffs filesystem) readonly.
Freeing init memory: 48K
Warning: unable to open an initial console.
Kernel panic: No init found.  Try passing init= option to
kernel.                                                                             

Any help is welcomed

Xavier
