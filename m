Received: from mail.coactive.com ([63.97.71.15] helo=airbag.coactive.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Ml55-0001k2-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 07:45:11 +0100
Message-ID: <7118259C3044D311942700508B2CA5BB7412E5@balance.coactive.com>
From: Mike Voytovich <mvoytovich@coactive.com>
To: 'David Woodhouse ' <dwmw2@infradead.org>
Cc: 'Steve Kranz ' <skranz@ridgerun.com>,
	"'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: RE: MTD/mtdblock.c uclinux 2.0.38? 
Date: Tue, 17 Jul 2001 23:50:21 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

>Wouldn't it be easier to forward-port uCLinux to 2.4? Didn't someone
>already do that, in fact?

Yes, there is a uClinux 2.4.x port.  However, there are some issues with
that port; for example, I'm not sure if MMU-less ARM support is complete.
It definitely is complete for 2.0.x.  And, there's the size issue...


>Just provide internally to the JFFS2 code sufficient dcache stuff
>for it to work. Pretend dentries are JFFS2-internal data structures. 

Cool, that seems like good advice - perhaps we'll try that.  Thanks for the
feedback.

Regards,
-mike


-----Original Message-----
From: David Woodhouse
To: Mike Voytovich
Cc: Steve Kranz; linux-mtd@lists.infradead.org
Sent: 7/17/01 11:16 PM
Subject: Re: MTD/mtdblock.c uclinux 2.0.38? 


mvoytovich@coactive.com said:
> One big issue is that JFFS2 seems to rely on the dirent cache, which
> isn't present in the 2.0.x kernel.  So, I suppose that would have to
> be backported from 2.2.x (if that's even a reasonable task).  

Wouldn't it be easier to forward-port uCLinux to 2.4? Didn't someone 
already do that, in fact?

> I don't know what other kernel dependencies (besides dirent cache)
> there are for JFFS2...  I wonder if anyone has been successful in
> getting JFFS2 working with 2.0.x??  Any feedback would be
> appreciated...

JFFS1 will be easier. JFFS2 is possible but may be a lot of work. The
dcache
thing should be the biggest problem - and that's possible to work
around. I 
wouldn't backport the whole of the dcache thing to 2.0 - that would
involve 
completely rewriting the VFS. Just provide internally to the JFFS2 code 
sufficient dcache stuff for it to work. Pretend dentries are
JFFS2-internal 
data structures. 

--
dwmw2
