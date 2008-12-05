Received: from mta.airbonet.com ([202.238.82.244] helo=mx09.ms.so-net.ne.jp)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8cHb-0003HW-M7
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 15:07:56 +0000
Received: from Dell2300 (p02fe57.kngwnt01.ap.so-net.ne.jp [121.2.254.87])
	by mx09.ms.so-net.ne.jp  with SMTP id mB5F7fEJ027667
	for <linux-mtd@lists.infradead.org>;
	Sat, 6 Dec 2008 00:07:41 +0900 (JST)
Message-ID: <000e01c956eb$3732cff0$0201a8c0@Dell2300>
From: "min" <min@xj9.so-net.ne.jp>
To: <linux-mtd@lists.infradead.org>
Subject: Failed to erase flash while multiple erase processes are running
Date: Sat, 6 Dec 2008 00:07:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-2022-jp";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,everyone:

I am using Linux 2.16.18(powerpc) to develop an embeded linux system.
My Flash is S29GL256P(serval partitions are divided in it,included a data
area(JFFS2),and a config area(no filesystem, used to write product code or
serial number).

I write a program to save data(for example:serial number) to config area
with mmap function(/dev/mtdblock5),and they work ok.
But the problem is while I am copying a file in JFFS2 area ,and concurrently
to run My mmap program, the following error will be outputed by syslogd on
an irregular base.

Nov 28 05:43:42 kernel: Erase at 0x00220000 failed immediately: errno -5
Nov 28 05:50:27 kernel: Erase at 0x00440000 failed immediately: errno -5
Nov 28 06:15:27 kernel: Erase at 0x00100000 failed immediately: errno -5
...

If I execute a test shell script to copy files and mmap program
repeatedly,in the end,it will be failed to copy file because of "No space
left on device".The usage rate of JFFS2 area will be 100%!

I debugged the Linux kernel,and found it failed in function
do_erase_chip()
(/drivers/mtd/chips/cfi_cmdset_0002.c)

static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
{
 struct cfi_private *cfi = map->fldrv_priv;
 unsigned long timeo = jiffies + HZ;
 unsigned long int adr;
 DECLARE_WAITQUEUE(wait, current);
 int ret = 0;

 :::
 :::

  /* Did we succeed? */
  if (!chip_good(map, adr, map_word_ff(map))) {
     /* reset on all failures. */
     map_write( map, CMD(0xF0), chip->start );
     /* FIXME - should have reset delay before continuing */

     ret = -EIO;    //Fail here occasionally!!!
  }
 chip->state = FL_READY;
 xip_enable(map, chip, adr);
 put_chip(map, chip, adr);
 spin_unlock(chip->mutex);

 return ret;
}

it seems that erase failure occurs if erase process in JFFS2 copy files is
executed while erase process in mmap program is running.

Is it a known problem,and is there a patch to fix it?

Any advice will be  appreciated,thank you in advance.

min 
