Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtNu-0000oa-Bf
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:05:34 -0400
Received: from [210.176.198.195] (helo=mail.octopus.com.hk)
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BheRN-0006e5-04
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 02:08:10 +0100
Message-ID: <B6FABB86BDB8D511A46C00902785F34D038D71E2@CS-MAIL-1>
From: Yomie Chan <yomiechan@octopuscards.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 6 Jul 2004 09:08:18 +0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: corrupted file on jffs2 mtd on dataflash AT45DB2562
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all:
Can someone give me some comment on how to detect this kinda error =
before
hand?
Seems to me that the "i-node" table or the file itself is partially
corrupted or what causes that?
Dataflash is getting old?

I dont understand how this error would occur. Please give me some hands

looking forward for your reply
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@AT91RM9200DK /D]$Node header CRC failed at 003919f4. But it must =
have
been
 OK earlier.
Node was: { 0000, 2000, 00001481, 0000002d }
Node totlen on flash (0x00001481) !=3D totlen from node ref =
(0x00000080)
jffs2_do_read_inode(): No data nodes found for ino #126
AR/AR.12345678: Input/output error
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
My kernel version is linux-2.4.21-rmk1 on at91rm9200dk
I met some very weird case in which a directory on the dataflash =
becomes a
file.
Several weeks ago, similar case also occurs. But the error was that a =
normal
file turned to a directory.
It occurs randomly  and the error cant be replicate. =20

on my dataflash, I perform the following steps
1. get D.tar, E.tar by ftp
2. mkdir .tar
3. mv *.tar .tar
4. (at /E) rm -R *
5. ctrl-Z
6. bg

Note: /D and /E are my two mtd partitions. And please find some major =
error
messages including "input/out error" and the while directory is getting
weird
[root@AT91RM9200DK /E]$rm -R *

[1]+  Stopped                 rm -R *
[root@AT91RM9200DK /E]$bg
[1]+ rm -R * &
[root@AT91RM9200DK /E]$cd /D
[root@AT91RM9200DK /D]$ls
lib                    =A4=D8=01             ...................<extra =
weird file
along with other normal files>

[root@AT91RM9200DK /D]$Node header CRC failed at 003919f4. But it must =
have
been
 OK earlier.
Node was: { 0000, 2000, 00001481, 0000002d }
Node totlen on flash (0x00001481) !=3D totlen from node ref =
(0x00000080)
jffs2_do_read_inode(): No data nodes found for ino #126
AR/AR.12345678: Input/output error

[root@AT91RM9200DK /D]$AR: Directory not empty
AR: Directory not empty

[1]+  Exit 1                  rm -R *  (wd: /E)
(wd now: /D)
[root@AT91RM9200DK /D]$
