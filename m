Received: from bay0-omc1-s14.bay0.hotmail.com ([65.54.246.86])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0rky-00020I-Dz
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 04:20:53 +0100
Message-ID: <BAY110-F40FBC1AC051B557679234EBC6E0@phx.gbl>
In-Reply-To: <20060712095205.GC14333@wohnheim.fh-wedel.de>
From: "Han Chang" <posaune@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Subject: Re: File size limitation on JFFS2.
Date: Wed, 12 Jul 2006 20:20:37 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




>From: Jörn Engel <joern@wohnheim.fh-wedel.de>
>To: Han Chang <posaune@hotmail.com>
>CC: linux-mtd@lists.infradead.org
>Subject: Re: File size limitation on JFFS2.
>Date: Wed, 12 Jul 2006 11:52:05 +0200
>
>On Tue, 11 July 2006 15:32:08 -0700, Han Chang wrote:
> >
> > I'm trying to put a file of size 1G on the JFFS2/NAND. I got "Out of 
>Memory"
> > error. Looks like the max size of file I can put on it is 500M, though 
>my
> > NAND has 2G space. This is on Linux. I noticed JFFS2 is using filemap in 
>the
> > Linux mm, where it crashed. Any help?
>
>Just out of curiosity: how much memory does the machine have?
>
>Jörn
>
>--
>The wise man seeks everything in himself; the ignorant man tries to get
>everything from somebody else.
>-- unknown

32 MB.
