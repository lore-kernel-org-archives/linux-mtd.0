Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t7ty-00016y-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 14:03:14 +0100
Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t7tx-00016s-00
	for mtd@infradead.org; Fri, 27 Apr 2001 14:03:13 +0100
Message-ID: <000d01c0cf12$129fd700$4d02010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
References: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk> <01042316543802.01109@rob> <3AE4B5B3.26E340E8@daniel.com> <01042412450101.00394@rob> <3AE5950D.D10C1F8B@daniel.com>
Subject: Re: Boot kernel from flash on CDPSC520 w/o BIOS!
Date: Fri, 27 Apr 2001 16:03:24 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello, Vipin!
To boot kernel from flash I do :
- reset the board (z).
- init it (yi).
- load lstart16.abs to it (ns lstart16.abs ff800, ns lstart16.abs 7ff800).
- load zImage to it with offset 0 (ns zImage 0).
After that I reboot CDP, but nothing is happening.
What step is wrong? 

Alexander Melichenko.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
