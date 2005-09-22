Received: from londo.lunn.ch ([80.238.139.98])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIKlW-0006VV-Pf
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 02:41:17 -0400
Date: Thu, 22 Sep 2005 08:41:04 +0200
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050922064104.GM8421@lunn.ch>
References: <20050921211326.GK8421@lunn.ch> <43324D42.5060407@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43324D42.5060407@yandex.ru>
From: Andrew Lunn <andrew@lunn.ch>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Another compiler error: sumtool.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 22, 2005 at 10:20:50AM +0400, Artem B. Bityutskiy wrote:
> Andrew Lunn wrote:
> >Hi Folks
> >
> >Thanks to Artem's fix i can now compile jffs2 without write buffer
> >support. However the sumtool does not compile.....
> >
> >lunn@londo:~/pkgs/mtd/mtd/util$ make
> >gcc -I../include -O2 -Wall -g -c -o sumtool.o sumtool.c -g 
> >-Wp,-MD,.sumtool.c.dep
> >sumtool.c:66: error: static declaration of 'target_endian' follows 
> >non-static declaration../include/mtd/jffs2-user.h:22: error: previous 
> >declaration of 'target_endian' was here
> >make: *** [sumtool.o] Error 1
> 
> Hmm, I did not enable EBS and did not test how it works. If you have 
> small NOR flash, don't use EBS. EBS may make things worse on small NORs 
> - both because of wasting space and because NOR+EBS looks like NAND for 
> JFFS2 (jffs2_can_mark_obsolete() is 0 at os-linux.h), which leads to 
> greater CPU load on mount (much more nodes to check). I believe Ferenc 
> should write about this in a Readme file or in the EBS config help.

Could you define small.

I will be checking this anyway. I need to improve the mount time
performance of eCos's version of JFFS2. For the system i'm working on
now the eCos redboot loader has JFFS2 from CVS from a year or so
ago. It takes four or five times longer to mount the filesystem than
the JFFS2 code in the Linux 2.4.x version of the kernel redboot is
booting. For the particular application this device is being used in i
need very fast boot times and currently the RedBoot JFFS2 mount is the
bottleneck. So i was hopeing that bringing JFFS2 up to date in eCos's
Redboot and adding EBS might match the performance of the old 2.4.x
code. Testing will soon tell.

        Thanks
                Andrew
