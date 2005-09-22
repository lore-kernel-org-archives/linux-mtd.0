Received: from tel096021.tait.co.nz ([202.37.96.21] helo=gatekeeper.tait.co.nz)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIJOs-0004oz-SL
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 01:13:54 -0400
Received: from gatekeeper.tait.co.nz (merlin.tait.co.nz [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 7ABB115B7C9
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Sep 2005 17:13:30 +1200 (NZST)
Received: from sunstrike.tait.co.nz (unknown [172.25.40.92])by
	gatekeeper.tait.co.nz (Postfix) with ESMTP id E160B15B681for
	<linux-mtd@lists.infradead.org>; Thu, 22 Sep 2005 17:13:29 +1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0IN700H01CSDI300@sunstrike.tait.co.nz>(original mail from
	robin.gilks@tait.co.nz) for linux-mtd@lists.infradead.org;
	Thu, 22 Sep 2005 17:13:29 +1200 (NZST)
Received: from [172.25.111.171] by sunstrike.tait.co.nz(Sun Java System
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id
	<0IN700HU6D6H8000@sunstrike.tait.co.nz>
	forlinux-mtd@lists.infradead.org;
	Thu, 22 Sep 2005 17:13:29 +1200 (NZST)
Date: Thu, 22 Sep 2005 17:13:29 +1200
From: Robin Gilks <robin.gilks@tait.co.nz>
To: MTD mail list <linux-mtd@lists.infradead.org>
Message-id: <43323D79.8060507@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Subject: NOR Flash equivalents
Reply-To: robin.gilks@tait.co.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

I've been playing at looking for a second source for Flash parts and on 
paper the STM M28W640ECB is the same as the Intel JS28F640C3BC80 apart 
from the buffered write mode. Does anyone know of any other differences 
that might bite me?

My old snapshot of MTD from 2 years ago is OK with the STM part but it 
looks like the Intel part randomly gets into lock mode so that writes fail.

Updating to current MTD is not possible as the target is PPC 8xx which 
is still not supported by the 2.6 kernel so I'm just looking at spec 
differences for now with a view to just hacking a quick patch in if 
required.

Cheers


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand

=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
