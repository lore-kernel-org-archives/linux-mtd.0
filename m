Received: from data.pl ([212.85.96.58] helo=v000058.home.net.pl)
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RDgd4-0005Wq-DU
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2011 18:00:40 +0000
Message-ID: <4E948437.2010807@data.pl>
Date: Tue, 11 Oct 2011 20:00:23 +0200
From: -= KuK =- <kuk@data.pl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Two same name files in JFFS2 image? Is it possible?
Content-Type: multipart/mixed; boundary="------------060404050805020902090205"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060404050805020902090205
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have JFFS2 image ( NAND Samsung K9G8G08U0M) copy made with Wellon 
VP-990 programmer.
(attached to this email)

When I examine this image with jffs2dump, I can see:

root@pouchx-Presario-2100:~# jffs2dump -c -v /HDS/ConfigHDS7full_noECC.img

          Inode      node at 0x00000000, totlen 0x00000044, #ino      2, 
version     1, isize        0, csize        0, dsize        0, 
offset        0
          Dirent     node at 0x00000044, totlen 0x0000002b, #pino     1, 
version     1, #ino         2, nsize        3, name MAC
          Inode      node at 0x00000070, totlen 0x00000056, #ino      2, 
version     2, isize       18, csize       18, dsize       18, 
offset        0
          Padding    node at 0x000000c8, totlen 0x00000738

          Inode      node at 0x00000800, totlen 0x00000044, #ino      3, 
version     1, isize        0, csize        0, dsize        0, 
offset        0
          Dirent     node at 0x00000844, totlen 0x00000034, #pino     1, 
version     2, #ino         3, nsize       12, name lcd_contrast
          Inode      node at 0x00000878, totlen 0x00000048, #ino      3, 
version     2, isize        4, csize        4, dsize        4, 
offset        0
          Padding    node at 0x000008c0, totlen 0x00000740

          Inode      node at 0x00001000, totlen 0x00000044, #ino      4, 
version     1, isize        0, csize        0, dsize        0, 
offset        0
          Dirent     node at 0x00001044, totlen 0x00000032, #pino     1, 
version     3, #ino         4, nsize       10, name Config.ini
          Inode      node at 0x00001078, totlen 0x0000016e, #ino      4, 
version     2, isize      474, csize      298, dsize      474, 
offset        0
          Padding    node at 0x000011e8, totlen 0x00000618

          Dirent     node at 0x00001800, totlen 0x0000002b, #pino     1, 
version     4, #ino         0, nsize        3, name MAC
          Inode      node at 0x0000182c, totlen 0x00000044, #ino      5, 
version     1, isize        0, csize        0, dsize        0, 
offset        0
          Dirent     node at 0x00001870, totlen 0x0000002b, #pino     1, 
version     5, #ino         5, nsize        3, name MAC
          Inode      node at 0x0000189c, totlen 0x00000056, #ino      5, 
version     2, isize       18, csize       18, dsize       18, 
offset        0
          Padding    node at 0x000018f4, totlen 0x0000070c

          Inode      node at 0x00002000, totlen 0x00000044, #ino      6, 
version     1, isize        0, csize        0, dsize        0, 
offset        0
          Dirent     node at 0x00002044, totlen 0x00000035, #pino     1, 
version     6, #ino         6, nsize       13, name can_unique_id
          Inode      node at 0x0000207c, totlen 0x0000004c, #ino      6, 
version     2, isize        8, csize        8, dsize        8, 
offset        0
          Padding    node at 0x000020c8, totlen 0x00000738

Empty space: 0, dirty space: 0


Is it possible that image contains two files with name "MAC"?

How to mount not to lose one "MAC" file?

PS. Im Linux beginner. Please help :)

Jakub Jozwiak

--------------060404050805020902090205
Content-Type: application/octet-stream;
 name="HDS-7_Config_JFFS2image.rar"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="HDS-7_Config_JFFS2image.rar"

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
--------------060404050805020902090205--
