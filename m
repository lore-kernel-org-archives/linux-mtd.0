Received: from 209-184-180-125.faxtell.net ([209.184.180.125] helo=eventlog.faxtell.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xUid-0002Ye-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 15:13:36 +0100
Message-ID: <001e01c0d892$6817f800$88b4b8d1@ShuhIII>
Reply-To: "Shuh C. Chang" <schang@3inet.com>
From: schang@3inet.com (Shuh C Chang)
To: "Jason Walker" <jasonw@uswo.net>,
	"MTD Mailing List" <linux-mtd@lists.infradead.org>
References: <NEBBIDMHCLDPHDHEGDMLEEHACBAA.jasonw@uswo.net>
Subject: Re: Oddities with MTD/DOC
Date: Wed, 9 May 2001 09:14:48 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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
