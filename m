Received: from mail-yk0-x236.google.com ([2607:f8b0:4002:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqhp9-0004AS-9i
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 13:28:31 +0000
Received: by ykek133 with SMTP id k133so851878yke.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 06:28:09 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 26 Oct 2015 14:28:09 +0100
Message-ID: <CALtMJEA7vsVxdg-s03WyehTH+bEHjvFWmGgcW5c5GjVteefFGA@mail.gmail.com>
Subject: override read-only flag of /dev/mtd1 partition
From: Andreas Fenkart <afenkart@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I try to modify the u-boot params using fw_setenv from linux prompt,
unfortunately that fails since /dev/mtd1 is read-only

# fw_setenv -s enable-rescue-system.txt
Can't open /dev/mtd1: Permission denied

Obviously, since our u-boot / linux got the flash layout wrong:

Creating 3 MTD partitions on "m25p80":
0x000000000000-0x0000000c0000 : "bootloader"
0x0000000c0000-0x0000000c2000 : "ubparams"
mtd: partition "ubparams" doesn't end on an erase block -- force read-only
0x0000000c2000-0x000000400000 : "unused"
mtd: partition "unused" doesn't start on an erase block boundary --
force read-only

The reason for accessing the u-boot is to switch the bootcmd to boot
our new and shiny kernel upgrade. Intent is to leave the factory
kernel untouched and use it as a fallback just in case.

What are my options to tinker with the u-boot environment, without
having to replace the kernel first? Is there some magic knob, to
switch off the read-only flag. As you can see there is nothing
valuable coming after the u-boot params, and u-boot itself is aligned
correctly.

kind regards,
Andi
