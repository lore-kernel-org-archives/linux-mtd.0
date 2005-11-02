Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EXLJJ-0000XB-Ut
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2005 11:18:06 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IPC00H6J59RZ1I0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 02 Nov 2005 11:17:52 -0500 (EST)
Date: Wed, 02 Nov 2005 11:17:51 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1130946658.4348.26.camel@windu.rchland.ibm.com>
To: Josh Boyer <jdub@us.ibm.com>
Message-id: <Pine.LNX.4.64.0511021116090.12873@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
	<1130536220.3901.5.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
	<1130946658.4348.26.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Nov 2005, Josh Boyer wrote:

> On Fri, 2005-10-28 at 18:04 -0400, Nicolas Pitre wrote:
> > 
> > But current code has almost same behavior:
> 
> > And therefore I wonder if what you saw could occur with that version as 
> > well.
> 
> Ok, here is a pseduo-description of the problem.  Sorry for the delay in
> my reply, I've been trying to verify that it still exists in 2.6.  The
> answer is "I think so" ;).

Your explanation makes sense.

Could you prepare a patch with it and a signed-off line?


Nicolas
