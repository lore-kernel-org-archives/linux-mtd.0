Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182QjS-0004rm-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 07:35:38 +0100
Date: Fri, 18 Oct 2002 08:35:30 +0200 (MEST)
From: Robert Kaiser <rob@sysgo.de>
To: Frank Neuber <neuber@convergence.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Virtual MTD-Device
In-Reply-To: <20021017160635.GA8927@jupiter>
Message-ID: <Pine.LNX.4.21.0210180830430.25843-100000@dagobert.svc.sysgo.de>
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


On Thu, 17 Oct 2002, Frank Neuber wrote:

> On Mon, Oct 14, 2002 at 05:28:19PM +0200, Frank Neuber wrote:
> And it works well, thanks ... great work!
> I did a mix between dilnetpc.c and sc520cdp.c because I have two chips
> with partitioning information.
> It was easy to collect the free space to one mtd into the kernel.

Glad to hear it works for you :-)

<hint>
If your hardware is something off the shelf (i.e. if your mapping driver 
could be useful to other people), it would be nice if you could contribute
it to the MTD project when you're done.
</hint>

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
