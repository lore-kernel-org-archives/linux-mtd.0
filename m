Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKfaz-0000xa-D1
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 12:15:22 -0400
Date: Thu, 21 Oct 2004 12:15:12 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Scott Wood <scott@timesys.com>
In-Reply-To: <20041021160427.GA26048@yoda.timesys>
Message-ID: <Pine.LNX.4.61.0410211213040.26473@xanadu.home>
References: <20041020233921.62536A00099@mail.murgatroid.com>
	<Pine.LNX.4.61.0410202011020.26473@xanadu.home>
	<20041021160427.GA26048@yoda.timesys>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Christopher Hoover <ch@murgatroid.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Interleave order while probing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 Oct 2004, Scott Wood wrote:

> > Not in query mode though.
> 
> But if you've guessed the wrong interleave, you could be seeing some
> non-query-mode data for the chips that didn't get the query command.

True.

Like you said, the flash could then be asked to go into status mode, 
which is sure not to have "qry" anywhere.


Nicolas
