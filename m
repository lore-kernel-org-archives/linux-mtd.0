Received: from modemcable166.48-200-24.mtl.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5WF2-0003vq-AZ
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 21:09:32 +0100
Date: Fri, 3 Oct 2003 16:08:36 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Howard King <hking@qualcomm.com>
In-Reply-To: <6.0.0.22.2.20031003125817.03ae9010@e2k.qualcomm.com>
Message-ID: <Pine.LNX.4.44.0310031606230.29733-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd support for 64-bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 Oct 2003, Howard King wrote:

> We have a customized board with 4 AMD 29L641V flash chips (4 * 8Mbyte) with 
> 64-bit wide bus. The mtd driver in linux 2.4.18 kernel does not work for 
> this configuration.  Does anyone have similar experiences?  What is the 
> solution?  Thanks.

Upgrade your MTD code to a more recent snapshot.


Nicolas
