Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QUQL-00048Q-48
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 16:55:37 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 1CB376D0074
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 11:51:32 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 09B926D006D
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 15:51:32 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 12 Jun 2003 11:43:50 -0400
MIME-Version: 1.0
Message-Id: <200306121143.51204.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Is this correct ?
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Is this output indicating an error codition ?


# /sbin/erase /dev/mtd0
MTD_open
Erase Total 1 UnMTD_ioctl
its
MTD_ioctl
Performing FlasMTD_ioctl
h Erase of lengtMTD do_erase_oneblock(): ERASE 0x00000000
h 65536 at offseMTD do_erase_oneblock(): Check 0x00000044 0x00000004
t 0x0MTD do_erase_oneblock(): Check 0x0000004c 0x0000000c
MTD do_erase_oneblock(): Check 0x0000005c 0x0000001c
MTD do_erase_oneblock(): Check 0x0000005c 0x0000001c
MTD do_erase_oneblock(): Check 0x00000058 0x0000001c
MTD do_erase_oneblock(): Check 0x0000005c 0x0000001c
MTD do_erase_oneblock(): Check 0x0000005c 0x0000001c
MTD do_erase_oneblock(): Check 0x00000058 0x0000001c
MTD do_erase_oneblock(): Check 0x00000058 0x0000001c
MTD do_erase_oneblock(): Check 0x000000ff 0x000000ff
MTD do_erase_oneblock(): Check 0x000000ff 0x000000ff
MTD do_erase_oneblock(): Check 0x000000ff 0x000000ff
 doneMTD_close

I did a 'mount -t jffs2 /dev/mdtblock2 /mnt/ffs2' that went away for
a very long time <more that miniutes> but the next day it was mounted, I
could even create a file on it - which cat'ed ok.

Any help please ?

 If I can get this working I will submit the info back to the card
 manufacture so they can add it to there linux/sbc docs.

TIA,
	Frank.

ps. Thanks J=F6rn CONFIG_MTD_CHAR =3D yes fixed my last problem
