Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPn8b-0004Nr-5U
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 16:23:59 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IO900CFWKNDGV10@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 16:23:38 -0400 (EDT)
Date: Wed, 12 Oct 2005 16:23:37 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <6934efce0510121205t2558aaei8ab91a79e22f75a0@mail.gmail.com>
To: Jared Hulbert <jaredeh@gmail.com>
Message-id: <Pine.LNX.4.64.0510121621020.23357@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
	<Pine.LNX.4.63.0509221318180.18381@localhost.localdomain>
	<6934efce05092915519ffe76c@mail.gmail.com>
	<6934efce0510121205t2558aaei8ab91a79e22f75a0@mail.gmail.com>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: XIP fails on kernels 2.6.12 and higher
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Oct 2005, Jared Hulbert wrote:

> On 9/29/05, Jared Hulbert <jaredeh@gmail.com> wrote:
> > > If you can find the exact intermediate release between 2.6.11 and 2.6.12
> > > that broke it that would be extrelely helpful.
> 
> I found it.  This is the change that was causing my problem
> -----------------------------------------------------------------------------------
> commit 3871b11e8c07c9e6652f81ae5afc1ae3bb120c40
> Author: mpm <mpm>
> Date:   Tue Mar 8 18:05:40 2005 +0000
> 
>     [PATCH] lib/sort: Replace insertion sort in exception tables
> 
>     Replace exception table insertion sort with lib/sort

Are you using JFFS2?

Does it still crash if you don't?


Nicolas
