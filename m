Received: from [202.157.186.110] (helo=n10.secure-webhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cLuU-0000Xz-SE
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2003 10:15:47 +0100
From: "Mike G." <gohas@actinium.org>
To: dwmw2@infradead.org
In-Reply-To: <1058251000.2262.114.camel@imladris.demon.co.uk>
References: <1058249854.1031.24.camel@localhost.localdomain>
	<1058251000.2262.114.camel@imladris.demon.co.uk>
Date: 15 Jul 2003 17:18:26 +0800
Message-Id: <1058260708.5914.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: help installing MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi there, 


On Tue, 2003-07-15 at 14:36, David Woodhouse wrote: 
> On Tue, 2003-07-15 at 07:17, Mike G wrote:
> > Hi there,
> > 
> > I am a Linux newbies, an idiot basically.  My task is to install the MTD
> > to the kernel linux-2.4.4 .. to run for MPC 857 for AM29DL322. 
> 
> 2.4.4 is very old. You really should consider upgrading to a vaguely
> recent kernel which isn't full of known holes.
I have try to use the new kernel 2.4.20 .. Somehow it doesn't work on
the custom board. So i m back to the ancient kernel. 
> 
> > This is the error msg.. of course there is some wrong file association i
> > can see.
> 
> You've copied files in manually rather than using the 'patchin' script
> from the patches/ directory. Which means you've got the 'Makefile' files
> instead of the 'Makefile.common' files which you should have copied and
> renamed to 'Makefile' in each subdirectory.
I did used the patch now the compling complaint the exactly as you said
"kernel too old" *sigh* 
> 
> If you really do stay with 2.4.4 you'll probably need some surgery on
> linux/mtd/compatmac.h to make it support kernels that ancient again.
ok ok  if i were to do surgery, wat changes i hav to do. 

> 
> -- 
> dwmw2
> 
> 
thanks for prompt help .. 

Mike G.
