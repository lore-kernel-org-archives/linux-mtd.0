Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aXUe-0005oK-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 06:32:16 +0000
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aXUd-0005oE-00
	for mtd@infradead.org; Wed, 07 Mar 2001 06:32:15 +0000
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Subodh Nijsure" <subodh@best.com>,
	<mtd@infradead.org>,
	<jffs-dev@axis.com>
Subject: AW: JFFS on a powerpc platform.
Date: Wed, 7 Mar 2001 07:31:52 +0100
Message-ID: <BKEKLBIBFPNGJKJDEODFCECGEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200103070528.VAA21767@shell9.ba.best.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>Question I have is -- has anyone tested JFFS on powerpc platform.
>
>I have retrieved the latest mtd code from CVS repository and
>the data read back from flash is not "correct".
>
>The platform I am running on MPC860 based board having
>intel flash  which mtd is able to recognize correctly.

Yes the code runs fine - now. Please check wether you are using at least
version 1.10 of physmap.c. We fixed exactly this problem mhhh let me say
around 4 days ago. Did you checked out the source after that? Please
checkout again.

Hope that helps - if not please provide a DEBUG_CFI enabled output.

Happy hacking
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
