Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197u9n-0006Cz-A8
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 10:33:43 +0100
Date: Tue, 22 Apr 2003 11:33:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: leeyang <leeyang@ycig.com>
Message-ID: <20030422093342.GA20257@wohnheim.fh-wedel.de>
References: <001301c30745$438c1e60$0365a8c0@leeyang>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001301c30745$438c1e60$0365a8c0@leeyang>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mmap on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 20 April 2003 22:00:51 +0800, leeyang wrote:
> 
> I am using jffs2 on a ppc860 system(amd29lv160).
> Things seems ok,but when I am trying mmap.
> 
> I want to mmap a file in flash,so i can treat
> the file like some records.
> 
> I mean operation like
>  fd = open("/usr/dat/sot.dat",O_RDWR,FILEMODE);
>  
>  ptr1=mmap(NULL,filesize,PROT_READ|PROT_WRITE,
>    MAP_SHARED,fd,0);
> 
> fd returns 3 and it is ok,however ptr1 returns -1.
> I checked the errno it said invalid argument.
> 
> I have to say arguments "filesize" above is not
> aligment to any requirements,just the real file
> size?Does it matter?
> 
> The same procedure can done on common ext2
> so i wonder jffs2 implement all the features like
> ext2?

AFAIK (someone please correct me) jffs2 does not support mmap. I don't
remember any technical reason, so it seems as if noone cared enough to
implement it.

You can do the work yourself, pay someone to do it or wait and hope
that someone else does it. As always.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
