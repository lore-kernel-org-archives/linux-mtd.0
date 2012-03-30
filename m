Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDitf-00050m-FL
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 20:58:12 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: User error with fw_printenv - I hope
Date: Fri, 30 Mar 2012 16:54:02 -0400
Message-ID: <5D308BD40154E4439D82454FE483A5020655576C@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to read my uboot environment from userspace.=A0 Not too =
successful.

root:/> cat /proc/mtd
dev:=A0=A0=A0 size=A0=A0 erasesize=A0 name
mtd0: 00080000 00020000 "bootloader(nand)"
mtd1: 00800000 00020000 "linux kernel(nand)"
mtd2: 06400000 00020000 "file system(nand)"
mtd3: 09380000 00020000 "file system(ubifs)"

>From my uboot config:
#define CONFIG_ENV_OFFSET=A0=A0=A0=A0=A0=A0 0x60000
#define CONFIG_ENV_SIZE=A0=A0=A0=A0=A0=A0=A0=A0 0x20000

Try #1
root:/> cat /etc/fw_env.config
/dev/mtd0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0x60000=A0=A0=A0=A0=A0=A0=A0=A0 0x20000=A0=A0=A0=A0=A0=A0=A0=A0 =
0x20000=A0=A0=A0=A0=A0=A0=A0=A0 1

root:/> ./fw_printenv
Cannot read bad block mark: Invalid argument
