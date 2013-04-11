Received: from moutng.kundenserver.de ([212.227.17.8])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQKKw-0006B8-AH
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 16:26:58 +0000
Message-ID: <5166E4F8.5030107@ammonit.com>
Date: Thu, 11 Apr 2013 18:29:44 +0200
From: =?ISO-8859-1?Q?Steffen_K=FChn?= <sk@ammonit.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Changing the ECC method for a running system (UBI seems to use OOB?)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone,

the problem which I have to solve is to change the type of the used ECC
procedure for a linux system with UBIFS >>after<< the installation. For
this purpose I have modified the first-stage bootloader so, that it
reads all blocks with the old ECC method (software ECC 1-bit) and
re-writes these with the new one (on-die hardware ECC, Micron flash).

The reason for that effort is, that the old method has to be proven as
to bad (to much bit errors). Unfortunately it is not possible to install
the system new with activated on-die ECC, because the hardware is
scattered over the world.

The update procedure works in principle fine, that means, it is possible
to update the blocks for kernel, u-boot, first-stage bootloader and
environment variables. But the rootfs makes problems. Can it be, that
UBIFS uses some bytes of the OOB structures, perhaps indirect?

Have someone any hints for me?

Best regards,
Steffen
