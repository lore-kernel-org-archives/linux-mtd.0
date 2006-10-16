Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZT0k-00006g-9o
	for linux-mtd@lists.infradead.org; Mon, 16 Oct 2006 10:00:20 -0400
Message-ID: <4533905D.1090103@gandalf.sssup.it>
Date: Mon, 16 Oct 2006 15:59:57 +0200
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: yh@bizmail.com.au
Subject: Re: Failed to build mkfs.jffs2
References: <45302F20.8030904@bizmail.com.au>
In-Reply-To: <45302F20.8030904@bizmail.com.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

yh@bizmail.com.au wrote:

>Hi,
>
>I am using the version mtd-20050122 for a linux arm system, I can build 
>mtd under arm-linux-gcc, but failed to build a host tool mkfs.jffs2 by 
>"make CC=cc" in util directory on FC5. Please see following error 
>messages. Is there any way to fix it, rather than to change a new version?
>
>compr_zlib.c:65: error: ‘z_stream’ has no member named ‘zalloc'
>compr_zlib.c:66: error: ‘z_stream’ has no member named ‘zfree’
>
>Thanks.
>
>Jim
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
Have you a zlib compiled for your target?

Regards Michael
