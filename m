Received: from codepoet.org ([166.70.14.212] helo=winder.codepoet.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15j85G-0007uH-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 00:45:51 +0100
Date: Mon, 17 Sep 2001 12:57:00 -0600
From: Erik Andersen <andersen@codepoet.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: joakim.tjernlund@lumentis.se, linux-mtd@lists.infradead.org
Subject: Re: Re(2): trouble compiling mkfs.jffs2
Message-ID: <20010917125700.C25674@codepoet.org>
Reply-To: andersen@codepoet.org
References: <IGEFJKJNHJDCBKALBJLLMEBMEPAA.joakim.tjernlund@lumentis.se> <23484.1000738424@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23484.1000738424@redhat.com>
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

On Mon Sep 17, 2001 at 03:53:44PM +0100, David Woodhouse wrote:
> 
> joakim.tjernlund@lumentis.se said:
> > When mounting a mkfs.jffs2 made jffs2 image, I get:
> > root@board8:~# mount /dev/mtdblock4 /jffs2/
> > Child dir "." (ino #1) of dir ino #1 appears to be a hard link
> > root@board8:~# cd /jffs2/                                     
> > root@board8:/jffs2# ls -l
> > total 4
> > drwxr-xr-x    2 root     root            0 Sep 14 09:05 ./
> > drwxr-xr-x    2 root     root            0 Sep 14 09:05 ./
> > drwxrwxrwx   17 root     root         4096 Sep 11 09:53 ../
> 
> Interesting. I recommend you poke Erik with a sharp stick :) 

Hmm.  Sorry about that.  I thought I had everything perfect
but I guess not... 

 -Erik

--
Erik B. Andersen   email:  andersee@debian.org, formerly of Lineo
--This message was written using 73% post-consumer electrons--
