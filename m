Received: from josephine.discordia.ch ([193.246.253.137])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MVwm-0007MI-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 16:40:08 +0100
Date: Mon, 24 Jun 2002 17:40:07 +0200
From: Peter Keel <seegras@discordia.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Message-ID: <20020624154007.GA4825@discordia.ch>
References: <000b01c21b92$8eebabe0$0201a8c0@dellc800>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <000b01c21b92$8eebabe0$0201a8c0@dellc800>
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

* on the Mon, Jun 24, 2002 at 11:19:10AM -0400, Mark Meade wrote:
> Peter Keel wrote:
> > I'd love to. Of course, for some reason my grub can't read the
> > filesystem on the disk. The Question now is:
> >
> > "If grub can't read the filesystem, how do I tell grub where the
> > kernel resides, and how do I find this out where it is?".
> 
> What type of filesystem is on your hard drive?  If it's ext2, 
> GRUB should recognize the filesystem -- if you just type "kernel 
> (hd0,0)/" and then hit TAB, the auto-completion 
> feature should give you a list of possibilities.

I'm hoping. It was reiserfs, but now it'll be ext3.. I hope grub 
has no problems reading ext3 since its the same as ext2 anyway...
in principle.. ;)

> If the hard drive you are trying to boot from has a filesystem 
> other than ext2, you would need to rebuild GRUB to support it -- 
> the "./configure" script used in the instructions
> explicitly disabled all other types of filesystems.

I didn't take your example, and theoretically grub should have had
support for reiserfs -- but I guess it hadn't. 

Peter
-- 
Those who give up essential liberties for temporary safety deserve 
neither liberty nor safety. -- Benjamin Franklin
