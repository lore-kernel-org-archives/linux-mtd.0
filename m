Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t2rR-0008IL-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 08:40:17 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t2rP-0008I9-00
	for mtd@infradead.org; Fri, 27 Apr 2001 08:40:15 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'Vipin Malik'" <Vipin.Malik@daniel.com>,
        "'Chris Read '" <chris.read@activesilicon.co.uk>, <mtd@infradead.org>
Subject: RE: Power blackouts and brownouts
Date: Fri, 27 Apr 2001 09:39:14 +0200
Message-ID: <002801c0ceed$28aad830$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <30724FF712DFD2119E6200104B24489201197483@mail1>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf

Well, I haven't seen any flash chips without a reset line, not to say that
they aren't out there.

With a flash chip *with* a reset line, and one which is connected to the
system reset, and assuming that the reset gets asserted in a power down, up,
and brown condition, then everything is ok.

<snip>

hmm, do you mean that reset has to asserted at power DOWN as well in order
for JFFS2 FS to manage its FS? How do you manage that when someone pulls
the power cable?

         Jocke



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
