Received: from dell8.sinamail.com ([210.68.8.11] helo=sinamail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mlnk-0001Ps-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 01:19:04 +0000
Message-ID: <20020318011812.26887.qmail@sinamail.com>
From: "=?big5?B?cmVnaWdhbw==?=" <regigao@sinamail.com>
Subject: =?big5?B?L2Rldi9tdGRibG9jazAgOiBObyBzdWNoIGRldmljZQ==?=
To: <linux-mtd@lists.infradead.org>
Date: Mon, 18 Mar 2002 09:18:12 +0800
Content-Type: text/plain;charset="big5"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi
I have a board with two Intel Flash E28F640.
The Flash mapping address starts from 0xff000000 to 0xffffffff
Each Flash is 8 MB , so the total size is 16 MB
I use kernel 2.4.18 , and enable the MTD options with
  CONFIG_MTD
  CONFIG_MTD_CHAR
  CONFIG_MTD_BLOCK
  CONFIG_MTD_CFI
  CONFIG_MTD_CFI_GEOMETRY
  CONFIG_MTD_CFI_B1
  CONFIG_MTD_CFI_I2
  CONFIG_MTD_CFI_INTELEXT
  CONFIG_MTD_PHYSMAP 
  CONFIG_MTD_PHYSMAP_START  ( 0xff000000 )
  CONFIG_MTD_PHYSMAP_LEN    ( 0x01000000 )
  CONFIG_MTD_PHYSMAP_BUSWIDTH  ( 1 )
I also enable the JFFS option in File systems
When I boot the kernel , I can see the detection message
  physmap flash device: 1000000 at ff000000
  Physically mapped flash: Found 1 x16 devices at 0x800000 in 8-bit mode
  mtd: Giving out device 0 to Physically mapped flash
I cat /proc/mtd and it shows the MTD device
  # cat /proc/mtd
  dev:    size   erasesize  name
  mtd0: 01000000 00020000 "Physically mapped flash"
Now I use mkfs.jffs to build a jffs image(img_file) and cp it to /dev/mtd0
  # cp img_file /dev/mtd0
But whenever I try to mount /dev/mtdblock0 , it shows No such device
  # mount -t jffs /dev/mtdblock0 tmp
  mount: Mounting /dev/mtdblock0 on /tmp/tmp failed: No such device
I am sure that I have the device file ( mtdblock0 ) in the /dev/
  # ls -la /dev/mtdblock0
brw-r--r--    1 root     root      31,   0 Dec 11  2001 /dev/mtdblock0

Does anyone have any suggestions about what I might be getting wrong ?
thanks !

  


==================================================================
〔新浪網公告〕
上網免撥接費! [帳號] sina [密碼] sina@u2online [撥接電話] 4050-8888，
或請至http://u2.sina.com.tw/sina下載自動設定軟體
