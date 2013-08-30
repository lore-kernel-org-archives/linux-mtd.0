Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFKom-0000Bs-Ti
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 09:16:37 +0000
Message-ID: <522062B4.4080709@digi.com>
Date: Fri, 30 Aug 2013 11:15:32 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, Marek Vasut
 <marex@denx.de>
Subject: gpmi-nand driver and jffs2 support
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Working on my custom platform based on i.MX28 (and also with the MX28EVK) I checked 
that I cannot mount JFFS2 nand partitions because I'm getting this error:

   jffs2: inconsistent device description

which seems to have to do with the OOB area of the NAND.
I saw patchset [1] from Huang Shijie which seems to be related to the issue. I just 
wanted to confirm if other people has the same problem and if the patchset really aims 
to solve this, or mine is a different issue.

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-August/048360.html

Best regards,
--
Hector Palacios
