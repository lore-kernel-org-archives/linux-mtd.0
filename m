Received: from anchor-post-34.mail.demon.net ([194.217.242.92])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxS5o-00069H-2w
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 11:11:13 -0400
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-34.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1BxS5i-0007Ue-0Y
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 15:11:07 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 18 Aug 2004 15:59:16 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <1B6027A6223B@baydel.com>
Subject: SSFDC
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I recently committed a ssfdc.c to CVS. I have changed this file recently to 
operate with recent changes to the way in which the OOB data is written/read.
It seems I have overlooked autoplacement for reads ?

I was getting some single bit errors in seemingly random bytes.  I believe 
these were generated because I was performing a mtd->read and it was using 
the oob ecc to correct the data. The problem was my ecc bytes were not in the
same position as auto placement.

Can anyone verify that this could be the case ?

I have applied a temporary fix to ssfdc.c but the whole way in which the oob
is written/read needs addressing. I believe it should be possible for the mtd 
layer to generate and correct my ecc bytes for me but I need to look into 
this.

I plan to update CVS but I would like to do some more testing first.

Cheers

Simon.
