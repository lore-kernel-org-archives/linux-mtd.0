Received: from nm8-vm11.bullet.mail.tp2.yahoo.com ([203.188.201.25])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XywG1-0000Qn-Hk
 for linux-mtd@lists.infradead.org; Thu, 11 Dec 2014 05:25:46 +0000
Date: Thu, 11 Dec 2014 05:25:20 +0000 (UTC)
From: kinghongkimo <kinghongkimo@yahoo.com.tw>
Reply-To: kinghongkimo <kinghongkimo@yahoo.com.tw>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <632511317.25977.1418275520540.JavaMail.yahoo@jws11014.mail.tw1.yahoo.com>
Subject: Jffs2 losing nvram per day as soon as kernel report Newly-erased
 block contained word with Spansion SPI flash
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
        I am running an embedded system with Linux Kerel 2.6.39.3, my system using spansion S25FL064P SPI Flash 

The kernel will mount /dev/mtdblock7  with jffs2 in rcS at startup.
mount -t jffs2 /dev/mtdblock7 /nvram


The mtd partition is as below
# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00020000 00010000 "U-Boot"
mtd1: 00010000 00010000 "env1"
mtd2: 00010000 00010000 "env2"
mtd3: 003a0000 00010000 "UBFI1"
mtd4: 003a0000 00010000 "UBFI2"
mtd5: 000cf6f4 00010000 "Kernel"
mtd6: 002cc800 00010000 "RootFileSystem"
mtd7: 00070000 00010000 "nvram"

I found after some times(around 1 time per days),  the kernel will print out below message  (Newly-erased block contained word ....)
[2014-12-09 08:23:33,428]# df
[2014-12-09 08:23:33,438]Filesystem           1024-blocks    Used Available Use% Mounted on
[2014-12-09 08:23:33,438]rootfs                    2944      2944         0 100% /
[2014-12-09 08:23:33,448]/dev/root                 2944      2944         0 100% /
[2014-12-09 08:23:33,448]tmpfs                    31188        12     31176   0% /dev
[2014-12-09 08:23:33,453]/dev/mtdblock7             448       264       184  59% /nvram
[2014-12-09 08:24:11,414]# Newly-erased block contained word 0x1e53dc76 at offset 0x00000780
[2014-12-09 08:25:33,025]# 
[2014-12-09 08:25:33,045]# df
[2014-12-09 08:25:33,045]ls * -al /Filesystem           1024-blocks    Used Available Use% Mounted on
[2014-12-09 08:25:33,045]nvram
[2014-12-09 08:25:33,055]rootfs                    2944      2944         0 100% /
[2014-12-09 08:25:33,055]/dev/root                 2944      2944         0 100% /
[2014-12-09 08:25:33,065]tmpfs                    31188        12     31176   0% /dev
[2014-12-09 08:25:33,070]/dev/mtdblock7             448       284       164  63% /nvram

NVRAM will losing around 14%(64k) once this message print out,  and around 3 days(after happens 3 times),   the nvram will occupy around 91% and the jffs2 will full.

After that the nvram can't write anymore. Only reboot will recover. 

After checking, I found my system have is a process "PowerOnTime" that writing a file descriptor to /nvram/tmp_file  every 5 seconds that may trigger the issues,
there may also some other process that accessing nvram folder but not list here. 


#define TMP_FILE_PATH               "/nvram/tmp_file" 

PowerOnTime{ 
..... 

fq = fopen( tMP_FILE_PATH, "r+"); 
while(1) 
{ 
lastupTime = lastupTime+5; 
sprintf(line_last, "%d", lastupTime); 
rewind(fq); 
fputs(line_last, fq); 
sleep(5); 
} 
}


My questions is 
1. why below process will cause the jffs happens this errors,  I assume the jffs2 driver should allow process to writing nvram safety without any issues. 
It seem the jffs found the block not erase properly when doing jffs2_block_check_erase Please comment what will be the root cause of the issues? Will this a SPI driver issues?
2 Can you comment if there is a way to recover this without reboot?

Please advice, I appreciate for your Help!!!



Best regards
James
