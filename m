Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Y9QZ-0000rX-00
	for mtd-list@infradead.org; Wed, 28 Feb 2001 16:26:11 +0000
Received: from [194.23.27.63] (helo=alpha.telia.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Y9QY-0000rQ-00
	for mtd@infradead.org; Wed, 28 Feb 2001 16:26:10 +0000
Message-ID: <01C0A1AC.4FF643C0@STEFANLO>
From: Stefan Löfgren <stefan.lofgren@introducor.com>
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: SV: Unable to install modules: initcalls
Date: Wed, 28 Feb 2001 17:31:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

One HOWTOs in the CVS tells me that modules and MTD will not work...
I have not tested the theory, but that could be one reason...
/Stefan

-----Ursprungligt meddelande-----
Fr=E5n:	Tim Bloomfield [SMTP:tim_bloomfield@linkata.com]
Skickat:	den 28 februari 2001 16:40
Till:	mtd@infradead.org
=C4mne:	Unable to install modules: initcalls

Hi,

I have compiled the mtd patch on kernel 2.2.17, with the mtd components
as modules. It appears that I must install the module initcalls before I
can install mtdcore.  When I try and install initcalls I get the error:
"couldn't find the kernel version the module was compiled for".

I suspect that there should not be an initcalls module. I have installed
the inter-module patch for 2.2.17. What am I missing. Thanks,

-Tim





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
