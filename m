Received: from tomts22.bellnexxia.net ([209.226.175.184] helo=tomts22-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FiqF-0006wC-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2002 23:01:19 +0100
Date: Wed, 5 Jun 2002 18:01:16 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Dzuy Nguyen <dzuy@infinity-studios.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millenium
In-Reply-To: <3CFE80D2.5010508@infinity-studios.com>
Message-ID: <Pine.LNX.4.44.0206051757460.2069-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 5 Jun 2002, Dzuy Nguyen wrote:

> 8. Reboot and never see the grub.

No messages other than BIOS initialization ones?

Have you tried the --enable-diskonchip-biosnetboot option?  This will hook 
the RAM copy of stage 1 bootloader to INT 18h which is the network boot 
handler.  The BIOS should be configured to boot off the network first.

Ilguiz
