Received: from casablanca.magic.fr ([195.154.101.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CL84-0003k4-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 14:01:12 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by casablanca.magic.fr (8.9.3/8.9.3) with ESMTP id PAA23739
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 15:06:40 +0200 (CEST)
Message-ID: <3B2F4DEA.6839BBD0@inventel.fr>
Date: Tue, 19 Jun 2001 15:04:43 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: non cfi flash memory
Content-Type: text/plain; charset=us-ascii
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

Sorry about those beginner questions...

Correct wrong statements :
In fact, as the intel flash 28F160x3 is not cfi, it is useless to use
do_map_probe("cfi") or something else as I tried to.
What should be written is the equivalent of amd_flash.c for the flash
family which include TE28Fxxxx3 from INTEL, M28Wxxx from ST and so on.
A good starting point is lart.c written by Abraham and amd_flash.c.

Xavier
