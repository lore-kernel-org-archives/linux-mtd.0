Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QYO1-0005Ln-Er
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 21:09:29 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id E62C06D0074
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 16:05:23 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id BE7256D006D
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 20:05:23 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 12 Jun 2003 15:57:39 -0400
References: <200306121143.51204.f.callaghan@ieee.org>
In-Reply-To: <200306121143.51204.f.callaghan@ieee.org>
MIME-Version: 1.0
Message-Id: <200306121557.39831.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: Is this correct ?
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

More information !

When copying a jffs2 filesystem to the device I get the
following ioctl error

# cp /myapp/jffs2_file_sys.img /dev/mtd0
MTD_open
MTD_ioctl
Invalid ioctl 5401 (MEMGETINFO =3D 80204d01)
MTD_write
MTD_close
#
# mount -t jffs2 /dev/mtdblock0 /var/fixed_flash/
mtdblock_open
ok

<wait forever>

What can I do to find the problem ?

-------------------------
kernel 2.4.19 +
uClibc.0.9.19 +
rtai-24.1.11 +
mtd from CVS (today)
-------------------------
