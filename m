From: purushn@future.futsoft.com (Purushothaman N)
Date: Tue, 25 Feb 2003 21:38:05 +0530
Subject: Root file system as CRAMFS on Flash
In-Reply-To: <1046083004.1545.32.camel@passion.cambridge.redhat.com>
Message-ID: <003301c2dce8$154bae80$1504060a@future.futsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

>> Sorry for disturbing the list again. I was successfully able to mount a
>> cramfs
>> image in flash with NFS as root file system. But i am facing problems
with
>> mounting the cramfs image as root file system. I have given the correct
root
>> option
>> to the kernel.

>No you haven't. Turn off devfs or change it to 'root=/dev/mtdblock/2'

is it possible to have 2 file systems of the same type (eg. cramfs) and
mount it?

for eg. /dev/mtdblock/2 as root file system and /dev/mtdblock/3 as
secondary file system which has some binaries alone. My kernel
version is 2.4.5-pre1 (for IDT mips) and it seems that the kernel
is crashing at semaphore.c (line 235) when i try to load my driver.

-Purush

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

***************************************************************************
This message is proprietary to Future Software Limited (FSL) 
and is intended solely for the use of the individual to whom it
is addressed. It may contain  privileged or confidential information 
and should not be circulated or used for any purpose other than for 
what it is intended. 

If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient,
you are notified that you are strictly prohibited from using,
copying, altering, or disclosing the contents of this message. 
FSL accepts no responsibility for loss or damage arising from 
the use of the information transmitted by this email including
damage from virus.
***************************************************************************
