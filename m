Received: from mailhost1-bcvloh.bcvloh.ameritech.net ([66.73.20.42] helo=mailhost.bcv1.ameritech.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tBNp-0005ap-00
	for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2002 19:23:05 +0100
Received: from rtcworks.com ([64.108.129.239])
          by mailhost.bcv1.ameritech.net
          (InterMail vM.4.01.02.17 201-229-119) with ESMTP
          id <20020922182303.FACB12029.mailhost.bcv1.ameritech.net@rtcworks.com>
          for <linux-mtd@lists.infradead.org>;
          Sun, 22 Sep 2002 14:23:03 -0400
Message-ID: <3D8E0A8A.E657084A@rtcworks.com>
Date: Sun, 22 Sep 2002 13:23:06 -0500
From: Bob Wirka <bobwirka@rtcworks.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: lilo-22.1 works with 2.4.19 kernel MTD
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

Hello,

I've been trying to use LILO with a Disk on Chip with no success. I've
got a 2.4.19 kernel, and have been trying to use lilo-21.4. When booted
from a kernel on floppy disk, the Disk on Chip was recognized; I could
fdisk, mke2fs, mount, etc., all normally. LILO would not work, however.
I tried the M-Systems lilo with no success (though I have used their
lilo successfully with a 2.2.12 kernel and disk on chip).

A colleague had apparently used lilo-22.1 successfully. I tried it, and
it works. It's available as an rpm (you'll need gfxboot.rpm, also).
You'll find these rpms through 'rpm.bone.net'. Search for 'lilo-22*i386'
with 'SuSE other' checked. Use the new boot.b and chain.b.

There have been a number of posts on this list regarding the use of lilo
with the MTD drivers; I thought some of you might be intereseted.

Best regards,

Bob Wirka
