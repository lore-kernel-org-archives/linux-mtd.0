Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157hPC-0006UK-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 18:47:42 +0100
Date: Wed, 6 Jun 2001 13:50:50 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Abraham vd Merwe <abraham@2d3d.co.za>
cc: Frederic Giasson <fgiasson@mediatrix.com>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd_info->write
In-Reply-To: <20010606152826.A9691@crystal.2d3d.co.za>
Message-ID: <Pine.LNX.4.33.0106061349040.24927-100000@xanadu.home>
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


On Wed, 6 Jun 2001, Abraham vd Merwe wrote:

> Hi Frederic!
>
> > If the data is all ones ("1"), it has been erased.   If not, it has not.
>
> Yes, I know, but I want to know whether I have to check if that's the case
> or not.

The chip should return an error code if it couldn't erase it correctly.
When it returns "done" then you just have to trust it, or signal the error
condition appropriately.


Nicolas
