Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13XIej-0007ZZ-00
	for mtd-list@infradead.org; Fri, 08 Sep 2000 08:33:01 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13XIeh-0007ZT-00
	for mtd@infradead.org; Fri, 08 Sep 2000 08:33:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13X5id-0004fA-00@infradead.org> 
References: <E13X5id-0004fA-00@infradead.org> 
To: "Steven J. Hill" <sjhill@cotw.com>
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v23.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 08 Sep 2000 08:32:42 +0100
Message-ID: <3113.968398362@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



sjhill@infradead.org said:
> Removed extra function argument for call to 'filldir' in 'linux/fs/
> readdir.c' which prevented successful compilation. 

Oi!. That was required for -test7 and above. You've just reversed the change 
I made in v1.43. 

If you're using older kernels, use v1.42.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
