Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iBHU-0001Va-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 09:30:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.SOL.4.30.0203050907220.25467-100000@alya.utu.fi> 
References: <Pine.SOL.4.30.0203050907220.25467-100000@alya.utu.fi> 
To: =?ISO-8859-1?Q?Veli-Pekka_Yl=F6nen?= <velpeyl@utu.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: easy way to compile jffs2 and mtd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Mar 2002 09:42:10 +0000
Message-ID: <5559.1015321330@redhat.com>
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

velpeyl@utu.fi said:
>  what is the easiest way to compile the jffs2 and mtd from the
> repository? I use 2.4.2 kernel and having difficulties to compile.
> Upgrading kernel is no option at the moment. 

It should work if you check out the current code from CVS, go into the 
fs/jffs2 directory and type 'make'. Likewise the drivers/mtd/ directory.

You may need 'make LINUXDIR=/home/where/I/put/linux'


--
dwmw2
