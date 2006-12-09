Received: from web56706.mail.re3.yahoo.com ([66.196.97.65])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gsq7v-00022q-H4
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 19:31:47 -0500
Date: Fri, 8 Dec 2006 16:24:56 -0800 (PST)
From: Jianlin Zeng <jianlinz_2000@yahoo.com>
Subject: reboot problem with jffs2
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <319457.62342.qm@web56706.mail.re3.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a MPC8248 based board running linux 2.6.11. I
mounted jffs2 FS on a NOR flash partition. The jffs2
FS works fine. But if I modify any files in the jffs2
FS and then soft reboot the board, the reboot hangs.
If I don't modify any files in jffs2 FS and just do
flashcp to a MTD char device, the soft reboot works
fine.

I tried implementing the "reboot" functionality on my
board either through "m8260_gorom" or a mechanism
similar to what is used on u-boot, the result is the
same. Can anyone let me know what difference between
jffs2 write and MTD char device write that could
possibly cause the reboot hang? Does anybody have
similar experience?

Thanks,
Jianlin


 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com
