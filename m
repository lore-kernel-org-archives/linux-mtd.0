Received: from law10-oe52.law10.hotmail.com ([64.4.14.41] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAk9a-000219-Cn
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2004 07:33:46 +0100
From: "Kishore" <kishoreseera@hotmail.com>
To: "jffs" <jffs-dev@axis.com>,
	"mtdlist" <linux-mtd@lists.infradead.org>
Date: Tue, 6 Apr 2004 12:11:22 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-ID: <LAW10-OE52lqKV6aGHW00002bd6@hotmail.com>
Subject: VFS: Cannot open root device "mtdblock0" or 1f:00
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Friends,

                    I'm trying to boot the embedded linux from flash using
ROLO boot loader. I'm getting the following errors while booting. My target
is Elan SC520 CDP board.

the errors are as follows.

VFS: Cannot open root device "mtdblock0" or 1f:00

Please append a correct "root=" boot option

Kernel panic: VFS: Unable to mount root fs on 1f:00

                                                        Can anybody pls
explain me what is the mistake and what can be the possible cause for the
above errors. pls gimme a solution to avoid the above problem. Also what
should be the correct boot option.

 Your earliest reply would help me a lot.


Thanks in advance.

with Regards,
Kishore.S.
