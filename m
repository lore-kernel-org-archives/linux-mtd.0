Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKQYV-0001D2-H2
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 20:11:49 -0400
Date: Wed, 20 Oct 2004 20:11:37 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Christopher Hoover <ch@murgatroid.com>
In-Reply-To: <20041020233921.62536A00099@mail.murgatroid.com>
Message-ID: <Pine.LNX.4.61.0410202011020.26473@xanadu.home>
References: <20041020233921.62536A00099@mail.murgatroid.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: 'Scott Wood' <scott@timesys.com>, linux-mtd@lists.infradead.org
Subject: RE: [PATCH] Interleave order while probing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Oct 2004, Christopher Hoover wrote:

> > I don't think there are any situations
> > where that would produce a false positive (short of having QRY as the
> > actual flash data at the relevant addresses).
> 
> That would be a problem.  It's a block device: you can store whatever you
> want, wherever you want.

Not in query mode though.


Nicolas
