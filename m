Received: from ip10.savigear.adsl.gxn.net ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18XsS2-0005qn-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2003 00:27:38 +0000
From: spse@secret.org.uk
To: Federico Ferreres <fferreres@arrancar.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on block devices 
In-Reply-To: Message from Federico Ferreres <fferreres@arrancar.com>
   of "12 Jan 2003 21:19:49 -0300." <1042417192.289.37.camel@tp>
References: <1042352498.1998.19.camel@tp> <13805.1042363286@passion.cambridge.redhat.com> <1042402929.12878.10.camel@tp> <E18Xox1-0004qA-00@spoinky.renegade.org.uk>  <1042417192.289.37.camel@tp> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Jan 2003 00:58:26 +0000
Message-Id: <E18Xsvq-00052o-00@spoinky.renegade.org.uk>
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

Hi,

>The last problem was a single mount, and on next umount i got this:
>
>Unmounting loopback JFFS2 filsystem...
>Unable to handle kernel paging request at virtual address 921c3912
>*pde = 00000000
>Oops: 0000
>CPU:    0
>EIP:    0010:[<cc90fc32>]    Not tainted
>EFLAGS: 00010282
>eax: 921c390e   ebx: 921c390e   ecx: cb529e20   edx: ffffff67

Could you run this through ksymoops please?



>The syslog always warns about (both CVS and kernel versions):
>
>Jan 12 20:51:10 fede kernel: blkmtd: erase: invalid erase request
>0x2000D @ 0x14
>5E8463
>Jan 12 20:51:10 fede kernel: blkmtd: erase: invalid erase request
>0x2000D @ 0x14
>5C8456
>
>I suppose it's normal.
>

No, that looks bad ;). The request is len @ offset and the
length should be the same as an eraseblock. Thats looks 
like 128k+13bytes at an offset not aligned on a 128K boundary.

What erase size did you use in the mkfs.jffs2? By default
blkmtd uses an erase size of 128K so the jffs2 image needs to
match this.

Could you try running the mtd_debug (or einfo) from the
utils dir (in CVS) to see what that reckons the erase
regions look like?

>That's about it. Haven't experienced any problem after a sucessfull
>mount (except when trying to umount on some cases).
>

I expect the real problem is that you are using a new and
experimental blkmtd with the latest jffs2 code. It might
be best to just try one of these at a time. I would suggest
to go back to your clean kernel but copy the blkmtd.c from
cvs into it to try that out.

The other thing to try is creating a small (8 or 16meg) jffs2
image file and mounting/unmounting that in loopback with
CONFIG_MTD_DEBUG set to 2 (note this will generate a *lot* of
syslog output). Feel free to mail this to me privately so
as not to spam the list (or post a link to it).

What base kernel version are you using?

cheers
si
