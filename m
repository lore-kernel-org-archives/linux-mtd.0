Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D8ap-0006ZX-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 18:50:11 +0100
Date: Thu, 21 Jun 2001 13:55:41 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Frederic Giasson <fgiasson@mediatrix.com>
cc: "=?iso-8859-1?Q?'K=E1ri_Dav=ED=F0sson'?=" <kd@flaga.is>,
        "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_medium effor
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D9954D0@mail.mediatrix.com>
Message-ID: <Pine.LNX.4.33.0106211347570.30096-100000@xanadu.home>
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


On Thu, 21 Jun 2001, Frederic Giasson wrote:

> Because my boot monitor is straigth in the middle of my flash and I can't
> move it for an hardware reason.

Hmmm...

Then what I would suggest is that you play tricks with offsets in your map
driver so the firmware sector appears at the end and the two separate parts
are seen as being contigous.

	if (offset >= FIRMWARE_OFFSET + FIRMWARE_SECTOR_SIZE)
		offset -= FIRMWARE_SECTOR_SIZE;
	else if (offset >= FIRMWARE_OFFSET)
		offset = offset - FIRMWARE_OFFSET + LAST_SECTOR_OFFSET;

Add this in your read/write/memcpy map functions, set your firmware
partition to be the last, and you're set.


Nicolas
