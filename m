Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15izgj-00078t-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 15:47:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEBMEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEBMEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org, Erik Andersen <andersen@codepoet.org>
Subject: Re: Re(2): trouble compiling mkfs.jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Sep 2001 15:53:44 +0100
Message-ID: <23484.1000738424@redhat.com>
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

joakim.tjernlund@lumentis.se said:
> When mounting a mkfs.jffs2 made jffs2 image, I get:
> root@board8:~# mount /dev/mtdblock4 /jffs2/
> Child dir "." (ino #1) of dir ino #1 appears to be a hard link
> root@board8:~# cd /jffs2/                                     
> root@board8:/jffs2# ls -l
> total 4
> drwxr-xr-x    2 root     root            0 Sep 14 09:05 ./
> drwxr-xr-x    2 root     root            0 Sep 14 09:05 ./
> drwxrwxrwx   17 root     root         4096 Sep 11 09:53 ../

Interesting. I recommend you poke Erik with a sharp stick :) 

What args did you use to create the filesystem, and does it still do it 
with v1.15 (before I changed some stuff)?

--
dwmw2
