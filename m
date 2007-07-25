Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDdeo-0005tY-8H
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 05:59:52 -0400
Received: by ug-out-1314.google.com with SMTP id m2so308533ugc
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Jul 2007 02:59:48 -0700 (PDT)
Message-ID: <46A71F0D.5070001@googlemail.com>
Date: Wed, 25 Jul 2007 11:59:41 +0200
From: "benszau@googlemail.com" <benszau@googlemail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: problem writing to flash
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem, writing to my flash device (Intel StrataFlash - 28F128J3).
Background: I'm using a phyCORE-MPC5200B-tiny module (a PPC embedded board)
Now I want to write to the onboard flash. First I tryed to use the MTD
package provided by the OpenWRT porject. Compiling was no problem but
when I tried to unlock (erase/write) the flash memory, I got an error:
"phys_mapped_flash: block unlock error: (status timeout)".
Then I tried to access my flash using the mtd-tools (provided by
http://www.linux-mtd.infradead.org) and I got the same error
"phys_mapped_flash: block unlock error: (status timeout)" when I tried
to unlock /dev/mtd2.
Now the mysterious part: I examined the code, I found "mtdLockInfo.start
= 0" and changed it to "mtdLockInfo.start = 1" and then it worked!!!
So, my question is: Why???
Is this a bug or am I doing something wrong?


I'm thankful for every hint.

Simon
