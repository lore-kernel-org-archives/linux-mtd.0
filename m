Received: from tomts12.bellnexxia.net ([209.226.175.56] helo=tomts12-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169s5P-0001RK-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 18:08:31 +0000
Date: Fri, 30 Nov 2001 13:17:53 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: Felix Frey <ffrey@freesurf.ch>,
   Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Booting from DOC-Millenium 
In-Reply-To: <20221.1007124809@redhat.com>
Message-ID: <Pine.LNX.4.33.0111301312080.28829-100000@server.superbt.com>
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

There is no Millenium-specific use of ReadPipeInit and LastDataRead
registers in the DOC patch to stage2 of Grub-0.90.  Only slow reads and
writes through CDSN Slow I/O register are implemented.

Ilguiz

On Fri, 30 Nov 2001, David Woodhouse wrote:

> I think the Grub code to drive the DiskOnChip directly, without even
> using the M-Systems' BIOS extension, is now ready for people to use it
> - you could try that.
