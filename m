Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ghygb-000161-NG
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 20:26:37 -0500
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 0F952467D7
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Nov 2006 14:26:26 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id EB42A467D2
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Nov 2006 14:26:25 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0J8F00A01U8UCD00@sunstrike.tait.co.nz>
	(original mail from robin.gilks@tait.co.nz) for
	linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2006 14:26:25 +1300 (NZDT)
Received: from [172.25.140.15] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0J8F00AGRW00BE00@sunstrike.tait.co.nz> for
	linux-mtd@lists.infradead.org; Thu, 09 Nov 2006 14:26:25 +1300 (NZDT)
Date: Thu, 09 Nov 2006 14:26:12 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
Subject: Command line partition support in 2.6
To: MTD mail list <linux-mtd@lists.infradead.org>
Message-id: <455283B4.20300@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
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

I'm just moving from a 2.4 to 2.6 kernel and am trying to make sense of 
the command line partition support. In 2.4 I added a definition in 
maps/physmap.c


struct map_info physmap_map = {
	.name = "asif",
	.size = CONFIG_MTD_PHYSMAP_LEN,
	.buswidth = CONFIG_MTD_PHYSMAP_BUSWIDTH,
	.phys = CONFIG_MTD_PHYSMAP_START,
};

and used a kernel command line of the form:
      mtdparts=asif:64K(param),3008K(jffs),256K(u-boot),-(kernel)

to partition the flash.

What is the equivalent procedure now? All the documentation seems to 
skim over NOR straight into NAND and all the example maps I've looked at 
use a fixed partition map rather than a command line one.

I'm sure its really simple but it beats me at the moment!!

Cheers

-- 
Robin


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
