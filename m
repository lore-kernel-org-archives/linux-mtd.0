Received: from web14405.mail.yahoo.com ([216.136.174.62])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17CJfD-0000xL-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 May 2002 13:31:51 +0100
Message-ID: <20020527123149.40310.qmail@web14405.mail.yahoo.com>
Date: Mon, 27 May 2002 20:31:49 +0800 (CST)
From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
Subject: grub cannt  boot from doc millennium
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
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

I searched the mail archive with keyword "grub"
but I only find just one detailed howto : 
http://lists.infradead.org/pipermail/linux-mtd/2001-October/003475.html
Accroding to it ,step by step  on my DoC millennium
(8M), but  I still end up with failure.
My all steps as follow, did I miss something?
1.make a new kernel with DOC support with 2.4.2-2
kernel source  on my RH7.1 box
2.tar zxvf grub-0.90.tar.gz
3.cd grub-0.90; 
  patch -p0 < /usr/src/mtd/grub/grub-0.90-doc.patch
4. rm configure;
   autoconf
5. make ; make install;
6. cp stage2/pre_stage2 /usr/src/mtd/grub
7. cd /usr/src/mtd/grub; make ; cp grub_firmware
/usr/src/mtd/util/
8. cd /usr/src/mtd/util; make ;
9. ./eraseall /dev/mtd0 
10 ./nftl_format /dev/mtd0 98304   
11  fdisk /dev/nftla
     n
     p
     1<Enter><Enter>
     w
     mke2fs /dev/nftla1
     ./doc_loadbios /dev/mtd0 grub_firmware
 
12. # this part install grub on hard disk
   
    mkdir /boot/grub; 
    cp ~/grub-0.90/stage1/stage1  /boot/grub/;
    cp ~/grub-0.90/stage2/stage2  /boot/grub/;
    vi /boot/grub/menu.lst
    timeout 30
    default 0
    fallback 1
    #For booting linux kernel with doc support from
harddisk
    tile linux
    root (hd0,0)
    kernel /boot/bzImage-doc  root=/dev/hda5
    #For booting linux kernel from doc
    tile linuxondoc
    root (dc0,0)
    kernel /boot/bzImage-doc  root=/dev/nftla1
13 grub
   root (hd0,0)
   setup (hd0)
14 reboot

enter grub console : (I dont know why not enter menu
select )
root (dc0,0)
error 21: selected disk does not exist

only 
     root (hd0,0)
     kernel /boot/bzImage-doc root=/dev/hda5 
can boot

_________________________________________________________
Do You Yahoo!? 
摊开你的掌心 让我看看你
http://sweepstakes.yahoo.com/2002cnuser
