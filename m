Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArHmu-0005Pp-Cr
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2004 14:25:56 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200402112259.53361.joshua@joshuawise.com>
References: <200402110054.31831.joshua@joshuawise.com>
	 <1076516571.19353.582.camel@tubarao>
	 <200402112259.53361.joshua@joshuawise.com>
Content-Type: text/plain
Message-Id: <1076595846.19353.590.camel@tubarao>
Mime-Version: 1.0
Date: 12 Feb 2004 07:24:06 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002.c: do_xxlock_oneblock: overflow subtract
	causing oopsen on iPAQ h1900
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-02-11 at 20:59, Joshua Wise wrote:

> > In the end, please fix up the code so that it works for the general
> > case.  I'll look at things later and see what I can do to either black
> > list the SST parts or deal with them in a sane way that isn't dangerous
> > and ugly.
> Hrm ... you make it sound like there are different unlock codes for every 
> chip! Is there a general case here?

I don't have extensive knowledge about unlocking flash chips.  I think,
however, that the SST part is unique in that it has unlock addresses
that are below the array addresses.

> As to dealing with the SST parts, I believe that if there is not another way 
> to detect the parts (ie, doing something htat would cause one to reset, but 
> not another), you should probably make the user specify what type of part it 
> is ... dangerous hacks like having to read/write 4MiB below the address space 
> just to unlock does not seem like a good answer for all chips of the sort!

Yes, definitely dangerous - but at the time, there wasn't an unlock
function so I took certain liberties . . ..

Would a change like this be acceptable until I figure out a better way?

- adr = ((adr & ~0xffff) | 0x2) + ~0x3fffff;
+ adr = ((adr & ~0xffff) | 0x2);


-- 
Thayne Harbaugh
Linux Networx
