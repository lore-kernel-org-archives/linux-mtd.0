Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G4mKI-00056Q-TO
	for linux-mtd@lists.infradead.org; Sun, 23 Jul 2006 18:21:34 -0400
Received: from mail01.m-online.net (svr21.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id C49B8982FD
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Jul 2006 00:00:27 +0200 (CEST)
Received: from mail.denx.de (p54965E53.dip.t-dialin.net [84.150.94.83])
	by smtp-auth.mnet-online.de (Postfix) with ESMTP id B03AB921E6
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Jul 2006 00:00:27 +0200 (CEST)
Received: from atlas.denx.de (atlas.denx.de [10.0.0.14])
	by mail.denx.de (Postfix) with ESMTP id 14DCD6D00A8
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Jul 2006 00:00:28 +0200 (MEST)
Received: from atlas.denx.de (localhost.localdomain [127.0.0.1])
	by atlas.denx.de (Postfix) with ESMTP id 2D872352B36
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Jul 2006 00:00:27 +0200 (MEST)
To: linux-mtd@lists.infradead.org
Subject: Bit Field Programming for Spansion MirrorBit Flashes
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
Date: Mon, 24 Jul 2006 00:00:27 +0200
Sender: wd@denx.de
Message-Id: <20060723220027.2D872352B36@atlas.denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Has anybody noticed the Spansion Software Application Note titled
"Bit Field Programming for Flash Products Based on 230-nm and 200-nm
MirrorBit(TM) Technology" at
http://www.spansion.com/application_notes/bitfieldprogMirrorbit_an_a3_e.pdf
?

This seems to be an (intentionally ?) obscure description of  serious
problems  with the Spansion 'M' type MirrorBit flash chips. In short,
when reprogramming the  same  flash  addresses  (like  when  changing
individual  bits  in  a  byte  from 1 to 0) this may (a) just work as
expected, (b) leave the bits that should become 0 unchanged (1),  (c)
change the data stored at other addresses (!) [I am aware that the AN
quoted  above  does  not go into such detail. Please contact Spansion
support in case you want to know more.]

No need to say that (b) and especially (c) are .... really nasty.


>From what I've seen, none of the existing flash drivers  attempts  to
implement the suggested workaround.


Any recommendations what to do (except avoiding  'M'  type  MirrorBit
flashes) ?


Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
He'd heard her use that sweet, innocent  tone  of  voice  before.  It
meant that, pretty soon, there was going to be trouble.
                                        - Terry Pratchett, _Truckers_
