Received: from tomts7.bellnexxia.net ([209.226.175.40] helo=tomts7-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DpkF-00032V-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 16:27:03 +0000
Date: Tue, 11 Dec 2001 11:36:48 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: <joao.filgueira@copel.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Booting from Disk On Chip 2000
In-Reply-To: <OF91E0A003.03E7B951-ON03256B1F.00401E6D@COPELnet>
Message-ID: <Pine.LNX.4.33.0112111134120.19403-100000@server.superbt.com>
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

Could this be due to the older MTD drivers compiled/loaded into the
workstation kernel?  Does "eraseall /dev/mtd0" work?  [This will erase the
filesystem too.]

Ilgiz

On Tue, 11 Dec 2001 joao.filgueira@copel.com wrote:

> When i try to use the utility DOC_LOADBIOS i get a "ioctl: MEMGETINFO
> error" message.
