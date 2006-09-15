Received: from mfront8.mail.yandex.net ([213.180.223.98])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GO80P-0002Td-UO
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 08:20:58 +0100
Date: Fri, 15 Sep 2006 11:16:49 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <450A5361.000001.25703@mfront8.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: Siddharth Choudhuri <sid@igor.ics.uci.edu>
Subject: Running nandsim...
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Please, let's keep MTD ML in CC]

>> It is just a bug. I was fixed in newer kernels. Just change "bool" to
>> "tristate" for nandsim in Kconfig.
> Thanks for your quick reply. I got nandsim running as a module. I was 
> trying to search for some documentation on how to use it (Say to 
> simulate a NAND chip with FTL/NFTL running VFAT or directly using
> JFFS2).
No, no FTL/NFTL.

> Is there some documentation ?
I don't think so.

> I searched on linux-mtd and google'd for some information.
Glance at the UBI HOWTO page - there is some information:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

BR, Artem.
