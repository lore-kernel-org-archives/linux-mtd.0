Received: from bavaria.muenchen.pop.de
	([195.30.254.66] helo=fallback.pop.de ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jldI-0002Ho-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 20:04:09 +0100
Received: from mail.jena.pop.de ([195.222.197.3])
	by fallback.pop.de with esmtp (Exim 3.20 #1)
	id 17jld8-0001yP-00
	for linux-mtd@lists.infradead.org; Tue, 27 Aug 2002 21:04:02 +0200
Received: from goepel2.jena.provi.de (goepel2.jena.provi.de [195.222.197.91])
	by mail.jena.pop.de (8.9.3/8.9.3) with ESMTP id VAA01374
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 21:03:21 +0200
Received: from goepel.com (goepel109.goepel [172.16.1.109])
	by goepel2.jena.provi.de (8.10.0/8.10.0) with ESMTP id g7RJ3F221829
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 21:03:15 +0200
Message-ID: <3D6BCCFD.4090707@goepel.com>
Date: Tue, 27 Aug 2002 21:03:25 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: flash file system for production use
Content-Type: text/plain; charset=us-ascii; format=flowed
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

hello...

i've got a strongarm system with 32mb intel strata flash. i need a 
mechanism for storing configuration files etc in the flashes. for this 
purpose 20mb of the flashes are free. the performance/ stability thing 
is very important for me. i cant wait 10 secs fot mounting/ checking 
etc. i' ve tried jffs2 from CVS and it seems to be "fast" on a nearly 
empty flash partition, but i have no suggestion about what happens in 
hard production use, when the flash will be written  over and over again 
and the wear leveling takes place. the device is never shutdown'ed in a 
clean way -- always hard power off...

because i have 20megs free and only small information to store i think 
there is no need for a complex wear leveling mechanism but im not an expert.

what the best solution fot my problems???

please give some hints....


thanks in advance ... Michael Palme

-- 
-------------------------------
Dipl.-Ing. (FH)
Michael Palme
software engineer
Goepel electronic GmbH

mailto: m.palme@goepel.com
phone:  +493641689682
fax:    +493641689644
inet:   http://www.goepel.com
-------------------------------
