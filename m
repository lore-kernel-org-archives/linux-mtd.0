Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vkTd-00008e-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 20:43:25 +0100
Date: Thu, 11 Apr 2002 21:43:21 +0200 (MEST)
From: Robert Kaiser <rob@sysgo.de>
To: Tino Keitel <tino.keitel@innominate.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: mapping of boot loader offset
In-Reply-To: <20020411143018.GA30787@tino>
Message-ID: <Pine.LNX.4.21.0204112141300.23644-100000@dagobert.svc.sysgo.de>
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


On Thu, 11 Apr 2002, Tino Keitel wrote:

> I wonder what to do if a processor looks for its BIOS/loader at a specified
> address that is somewhere in the middle of a flash chip. The same chip will
> contain one JFFS2. The boot loader area will have to be mapped out of the
> file system. Is there already something that MTD can do for me?

Have a look at the dilnetpc.c map driver. It has to deal with 
exactly this situation and it does so by using the mtd concat layer.

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
