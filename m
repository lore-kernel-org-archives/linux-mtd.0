Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tt23-0001eU-00
	for mtd-list@infradead.org; Mon, 22 May 2000 15:18:11 +0100
Date: Mon, 22 May 2000 16:17:56 +0200
From: Andries Brouwer <aeb@veritas.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: HDIO_GETGEO vs. BLKGETSIZE
Message-ID: <20000522161756.A23047@veritas.com>
References: <29342.958997177@devel2.axiom.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <29342.958997177@devel2.axiom.internal>; from dwmw2@infradead.org on Mon, May 22, 2000 at 01:06:17PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, May 22, 2000 at 01:06:17PM +0100, David Woodhouse wrote:

> Is it permitted for a driver to returns CHS values for HDIO_GETGEO which, 
> when multiplied together, don't match the value returned by BLKGETSIZE?

Yes - HDIO_GETGEO may contain whatever you want.
A modern fdisk will use the values for heads and sectors/track
given by HDIO_GETGEO, but ignore the value for cylinders.

Indeed, since cylinders is a 16-bit field and the number of cylinders
can be larger than 65535, the value may be truncated, and is to be
considered worthless.

Instead, the number of cylinders is computed as BLKGETSIZE/(H*S).
(Thus, there is no need for a new ioctl HDIO_GETBIGGEO or so.
I think the code for it should be deleted from the kernel.)

Andries


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
