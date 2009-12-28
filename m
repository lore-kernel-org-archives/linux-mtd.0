Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NPD1q-0008Ga-ID
	for linux-mtd@lists.infradead.org; Mon, 28 Dec 2009 10:40:51 +0000
Message-ID: <4B388B2B.5080906@nokia.com>
Date: Mon, 28 Dec 2009 12:40:43 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Jander <david.jander@protonic.nl>
Subject: Re: Good stress test for UBIFS?
References: <200912180900.51332.david.jander@protonic.nl>
In-Reply-To: <200912180900.51332.david.jander@protonic.nl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Jander wrote:
> Hi all,
> 
> What would be a good stress-test for the whole ubifs stack: ubifs, ubi, mtd, 
> nand-flash-driver?
> 
> I have gone through this:
> - Forced to use 2.6.24 which is provided by the chip manufacturer with some 
> unknown version of mtd/ubi/ubifs, which is not the latest and not the one that 
> originally shipped with 2.6.24. The git history is gone.
> - Used this version for a time when suddenly some boards had a corrupt 
> filesystem (unreadable /etc).
> - Used mtd tests to check hardware and driver, and everything seems fine.
> - Updated to latest ubi/ubifs for 2.6.24 from ubifs-v2.6.24.git
> 
> And now I need to accomplish two things:
> 
> 1. Be able come up with a fairly reliable method to reproduce the corruption 
> on the original version of ubi/ubifs.
> 2. Check that this problem indeed does not occur on the latest version, and if 
> it does post a bug report here.
> 
> For 1. I am looking for some kind of tool or method to stress-test ubi/ubifs 
> preferably including also the nand-flash driver and hardware (you never know).
> 
> I thought of running something like bonnie++ while power-cycling the board at 
> random times for a few days, or something similar, but since IMHO this must be 
> a recurring issue for many here, I'd like to know about what others have come 
> up with, or if there is some comprehensive stress-test-tool.

Generally we test with debugging checks turned on because they will spot an
error the instant it happens.  On the other hand, you must also test the actual
configuration you will deploy.

There are two approaches.  We use both of them.  They are:

1. Set up a desktop machine with your kernel and test on nandsim.  This has the
advantage that it can do very many more operations than a small device.

You can simulate power-off-recovery by using UBIFS "failure mode".  Set UBIFS
debugging module parameter debug_tsts to 4.  There is a script I have used
for that below.

2. Run tests on the device.  There are tests in mtd-utils/tests/fs-tests but
LTP's fsstress is good for stressing the file system during power-off-recovery
testing.

Good luck!




#!/bin/bash

start()
{
        umount /mnt/test_file_system
        rmmod ubifs
        rmmod ubi
        rmmod nandsim
        modprobe nandsim second_id_byte=0x78 overridesize=9
        modprobe ubi mtd=0
        udevsettle
        ubimkvol /dev/ubi0 -Nvol -m
        udevsettle
        modprobe ubifs
        mount -t ubifs ubi0 /mnt/test_file_system
}

sleep_until_fail()
{
        while true; do
                sleep 1
                touch /mnt/test_file_system/ok > /dev/null 2> /dev/null || retun
                rm /mnt/test_file_system/ok > /dev/null 2> /dev/null || return
        done
}

unmount()
{
        echo un-mounting
        umount /mnt/test_file_system && return
        sleep 1
        umount /mnt/test_file_system && return
        sleep 10
        umount /mnt/test_file_system && return
        sleep 30
        umount /mnt/test_file_system && return
        sleep 30
        umount /mnt/test_file_system && return
        pkill fsstress > /dev/null 2> /dev/null
        sleep 300
        umount /mnt/test_file_system && return
        echo Did not unmount
        exit 1
}

start

dmesg -n3

echo 4096 > /sys/module/ubifs/parameters/debug_msgs

mkdir -p /mnt/test_file_system/fsstress

rm -rf dmesg-*.txt

dmesg_count=0

while true; do
        #dmesg > dmesg-${dmesg_count}.txt
        dmesg_count=`expr $dmesg_count + 1`
        echo fsstress $dmesg_count
        /home/root/fsstress/fsstress -d /mnt/test_file_system/fsstress -p 5 -l &
        sleep 28
        echo failure mode on
        echo 4 > /sys/module/ubifs/parameters/debug_tsts
        sleep_until_fail
        echo failed
        echo 0 > /sys/module/ubifs/parameters/debug_tsts
        pkill fsstress > /dev/null 2> /dev/null
        sleep 1
        unmount
        echo mounting
        mount -t ubifs ubi0 /mnt/test_file_system || exit 1
        echo removing files
        rm -rf /mnt/test_file_system/* 2> /dev/null || exit 1
done
