Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M7iF-0007nc-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 13:42:59 +0100
Received: from seranoa.com (IDENT:andrew.dixon@[172.16.1.202])
	by mail.seranoa.com (8.11.0/8.11.0) with ESMTP id f6GCpSv13386
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 08:51:28 -0400
Message-ID: <3B52E192.50EF674@seranoa.com>
Date: Mon, 16 Jul 2001 08:44:02 -0400
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [Question] cp result.txt  /dev/mtd0 problem
References: <20010714082817.HM.F0000000002ETLk@www16.hanmail.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

>  when I followed the step in FAQ manual.
>  I tried
> 
>  cp /tmp/jffs.image  /dev/mtd0
> 
>  I got
> 
>  cp: /dev/mtd0  Read only file system.
> 

Have you mounted /dev/mtd0 onto a file system?  You probably need to do
something like:

	#mount -t mtd /dev/mtd0 /flash
               ^^^^^^

I'm not sure about "-t mtd" because I haven't started playing with this
yet myself, but that info should be fairly easy to track down.

Once the file system is mounted you should be able to copy to it by:

	$cp /tmp/jffs.image /flash

later,
Andy
