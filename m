Received: from tomts14-srv.bellnexxia.net ([209.226.175.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eIrs-0006Cw-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 16:48:20 +0000
Date: Fri, 22 Feb 2002 11:59:29 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
In-Reply-To: <002601c1bbbc$6a8c4d30$0101a8c0@dellc800>
Message-ID: <Pine.LNX.4.44.0202221157280.8089-100000@server.superbt.com>
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

On Fri, 22 Feb 2002, Mark Meade wrote:

> I can't seem to find an updated doc_loadbios.  Where should I look?

The source code for doc_loadbios is in the util/ directory of the Linux
MTD CVS repository.

> The "aclocal && automake && autoconf" caused some errors; the errors I
> had were identical to those posted by Herman Theron in the "Error using
> GRUB patch" thread.

Mind upgrading autoconf and automake?

Ilguiz
