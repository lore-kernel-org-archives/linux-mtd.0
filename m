Received: from tomts11.bellnexxia.net ([209.226.175.55] helo=tomts11-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DSEJ-0005HC-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 16:52:48 +0100
Date: Thu, 30 May 2002 11:52:46 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
cc: linux-mtd@lists.infradead.org
Subject: Re: Grub Booting Disk On Chip
In-Reply-To: <1022768943.26053.19.camel@tweedy.ksc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0205301150430.16856-100000@server.superbt.com>
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

On 30 May 2002, Bob Chiodini wrote:

> I reserved 100000 bytes for the grub_firmware.

I am not sure if every MTD utility and driver is happy with NFTL layer 
starting not on the erase sector boundary.  I'd suggest using the offset 
98304 which is 12*8192.

Ilguiz
