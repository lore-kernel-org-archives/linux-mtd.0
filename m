Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from mail1.danielind.com ([12.19.96.6])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11pveT-0005yx-00
	for mtd@imladris.mvhi.com; Mon, 22 Nov 1999 15:45:14 +0000
Message-ID: <3839651A.4D22A6F3@danielind.com>
Date: Mon, 22 Nov 1999 09:45:30 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: Reliability of FLASH data storage
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi all, going through the list archive at the web site I did not find
any discussion on the reliability of data storage during writes to
FLASH.

By reliability I mean, when data is being stored onto a flash sector,
what happens when power is suddenly and without warning removed?

I am thinking of using Linux in embedded systems for future (and
current) projects. Reliable storage of data is very important in
embedded systems. More important than speed of access etc. Of course
cost is also very important- hence
the desire to use a flash file system rather than IDE flash disk (which
has its own reliability problems, as I found).

would love to hear your guys thoughts on this issue. Reading the archive
I got the impression that others are also using/thinking of using Linux
in their embedded systems.

Vipin
_______________________________________________________________________________

Daniel Industries
Houston, TX.
***All comments are my personal opinion and do not reflect the position
of my company in any way.***



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
