Received: from msl-exchange.m-sys.com ([195.213.109.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xVgs-0002fA-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 16:15:50 +0100
Message-ID: <44A73E446E0BD511860700508BEEF7071886C8@msl-exchange.m-sys.com>
From: Vadim Khamlinsky <Vadimk@m-sys.com>
To: "'Shuh C. Chang'" <schang@3inet.com>, Jason Walker <jasonw@uswo.net>,
	MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: RE: Oddities with MTD/DOC
Date: Wed, 9 May 2001 18:16:50 +0300 
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

Never try to erase the whole diskonchip by using docpmap /e .
After that there is a very good chance that you will not be able to 
work with this DOC again since, you erase a bad block table of the device .
If you want to return diskonchip back to its virgin state do the following :

1. docpmap /b /f:file_name 
  This operation saves bad block of the device in the file named file_name

2. docpmap /bc /f:file_name  
   This operation returns diskonchip to its virgin state, but does not
erases bad blocks .

3.  Now you can reformat diskonchip .

Vadim 

-----Original Message-----
From: schang@3inet.com [mailto:schang@3inet.com]
Sent: Wed, May 09, 2001 5:15 PM
To: Jason Walker; MTD Mailing List
Subject: Re: Oddities with MTD/DOC


If you have the M-System's DOS utility (downloadable), then try this:

docpmap /e

and see if it would wipe out the whole DOC and allows you to re-format again
using dformat (another DOS utility from M-System).  After that, try it in
Linux and see if it recognizes the DOC again.

Shuh Chang


----- Original Message -----
From: "Jason Walker" <jasonw@uswo.net>
To: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Sent: Tuesday, May 08, 2001 6:38 PM
Subject: Oddities with MTD/DOC


> Just a question for you all: Have you ever had a DOC just *not* work
> anymore?  After formatting/installing my software on one for about 10-20
> times, the device refuses to be recognized by the kernel. I have a stack
of
> boxes that are in this state now.  Do I have to do some kind of low level
> format to them? I can't even fdisk them.  I would have a hard time
believing
> these are all just faulty.  Any insight on this?
>
> Jason Walker
> Network Engineer
> US Wireless Online
> www.uswo.net
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
