Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp6nP-00056X-DY
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 10:49:44 -0400
From: Andy Hawkins <a.hawkins@cabletime.com>
To: D.A.Fedorov@inp.nsk.su
In-Reply-To: <Pine.SGI.4.10.10407262126150.569820-100000@Sky.inp.nsk.su>
References: <Pine.SGI.4.10.10407262126150.569820-100000@Sky.inp.nsk.su>
Content-Type: text/plain
Message-Id: <1090853366.2220.11.camel@adh>
Mime-Version: 1.0
Date: 26 Jul 2004 15:49:26 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2004-07-26 at 15:35, Dmitry A. Fedorov wrote:
> > Can I have a copy of these patches then?
> 
> Some time later (a few days).

Thanks for that.

> 
> > Have you had any problems writing to NOR?
> 
> No, after upgrade from the MTD snapshot.
> There were problems with erase (ioctl call did not wait of
> completion of erase operation) and jffs2 did not allowed to
> write. Now it works properly.

Ah, should have been more clear. This is a 'raw' write to the NOR
device. It appears that it's crashing inside do_xxlock_oneblock in
cfi_cmdset_0002.c (where it does the 'cfi_write').

There's a comment at the top of the code saying that it's very chip
specific, and hasn't been tested on an interleaved device (which I think
mine is).

Anyone help?

Thanks.

Andy
