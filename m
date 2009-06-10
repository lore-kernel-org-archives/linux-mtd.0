Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEJ9Q-0002vu-OH
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 08:27:23 +0000
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly21a.srv.mailcontrol.com (MailControl) with ESMTP id
	n5A8RCeg004866
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2009 09:27:12 +0100
From: Canella Matteo <Matteo.Canella@mta.it>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 10 Jun 2009 10:27:09 +0200
Subject: Problem in erasing a nand flash with ubiformat
Message-ID: <BD9F3F3F5A6CCF4BA032B9FED4DD312E893B13@mta-digimail.MTA.INT>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I have a question for Artem,
I'm running a problem with ubiformat and I saw this email from you:

http://lists.infradead.org/pipermail/linux-mtd/2009-January/024285.htm

I'm having the same problem, ubiformat fails to format a nand flash because=
 it is not able to erase a block.
flash_eraseall just ignore this erase problem.

Do you think ubiformat should physically mark this block as bad eraseblock?=
 Or should it just ignore it?

Why currently ubiformat or flash_eraseall does not mark these as bad blocks=
?

I'm going to implement this feature in your ubiformat app and I'd like to k=
now if you have already done some work on it...
Thanks


  Matteo  Canella=20
  ELECTRONIC DIVISION  -
   PROJECT ENGINEER

  MTA SpA
  Via Romagnoli 24
  41033 Concordia Sulla Secchia (MO) - Italy
  T. +39 0535 57732=20
  F. +39 0535 54550=20
  email: matteo.canella@mta.it
