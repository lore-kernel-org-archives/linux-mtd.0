Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D7pr-0006Vd-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 18:01:39 +0100
Date: Thu, 21 Jun 2001 13:07:09 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Frederic Giasson <fgiasson@mediatrix.com>
cc: "=?iso-8859-1?Q?'K=E1ri_Dav=ED=F0sson'?=" <kd@flaga.is>,
        "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_medium effor
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D9954CF@mail.mediatrix.com>
Message-ID: <Pine.LNX.4.33.0106211306220.30096-100000@xanadu.home>
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

> Thank you Kari for your help.
>
> 	I tried partionning as you suggested, but I loose a lot of space
> because I have two seperate partitions on which I mount JFFS2.  It takes the
> same space ( roughly 324 KB ) for its own usage per partition.  Therefore, I
> can't afford the partitioning method to map my flash because I was already
> tight on it with 324K taken by JFFS2.

Why can't you make only a single JFFS2 partition out of the two you
currently made?


Nicolas
