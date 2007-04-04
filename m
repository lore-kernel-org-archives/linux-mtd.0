Received: from india.einfochips.com ([203.88.139.151])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HYz9W-0002Xz-JT
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 02:39:33 -0400
From: "Jitendra Jain" <jitendra.jain@einfochips.com>
To: <linux-mtd@lists.infradead.org>
Subject: MEMGETREGIONCOUNT ioctl
Date: Wed, 4 Apr 2007 12:08:11 +0530
Message-ID: <00b401c77683$d0be6340$fd09a8c0@jitendrajain>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi All,
=A0
I am trying to get some information regarding my NAND device on board
through the MEMGETREGIONCOUNT and the MEMGETREGIONINFO ioctls. What
troubles me is that the mtd/util application "flash_info" also doesnt
come to my rescue.
=A0
As per the driver, the MEMGETREGIONCOUNT returns the parameter
numeraseregions, which is meant to signify if the flash erase size is
same throughout or whether it has variable sized sectors (which is found
on NOR flash devices). Why does the util denote that number as number of
erase regions ??
=A0
Next, the MEMGETREGIONINFO seems to copy arguments from User to the
kernel which I dont understand. This is meant to give the User
information so, it ought to be copy_to_user.
=A0
Please excuse me if I am wrong on both the above accounts, but i would
be glad if anybody would let me know about that...
=A0
Thanx,

Regards
Jitendra Jain,

=A0



eInfochips Business Disclaimer:
This message may contain confidential, proprietary or legally Privileged information. In case you are not the original intended Recipient of the message, you must not, directly or indirectly, use, Disclose, distribute, print, or copy any part of this message and you are requested to delete it and inform the sender. Any views expressed in this message are those of the individual sender unless otherwise stated. Nothing contained in this message shall be construed as an offer or acceptance of any offer by eInfochips Limited and/or eInfochips Inc("eInfochips") unless sent with that express intent and with due authority of eInfochips. eInfochips has taken enough precautions to prevent the spread of viruses. However the company accepts no liability for any damage caused by any virus transmitted by this email.
