Received: from nf-out-0910.google.com ([64.233.182.185])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GvDbJ-00029B-Vq
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 08:59:52 -0500
Received: by nf-out-0910.google.com with SMTP id i2so1092739nfe
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Dec 2006 05:59:48 -0800 (PST)
Message-ID: <f9fe74a60612150559x4bcb9eedlfe9675b6be70682@mail.gmail.com>
Date: Fri, 15 Dec 2006 21:59:47 +0800
From: "Shiner Chen" <shiner.chen@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBI error on 64bit Machine
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

Recently, I get the source code on the ubi-2.6.git tree. I compiled
the kernel on x86-32 arch and erverything is ok,but on x86-64,I met
some problems as follows
Environment
operation system:Red hat Enterprise Server 4.3(kernel 2.6.19 including
the UBI,gcc 3.5)
hardware:x86-64

Command
[linux-ubi$] modprobe nandsim second_id_byte=0x36
[linux-ubi$] modprobe ubi mtd=0

the result in the /var/log/messages
Dec 15 04:45:33 localhost kernel:flash size:64 MiB
Dec 15 04:45:33 localhost kernel:page size:512 bytes
Dec 15 04:45:33 localhost kernel:OOB area size:16 bytes
Dec 15 04:45:33 localhost kernel:sector size:16 KiB
Dec 15 04:45:33 localhost kernel:pages number:131072
Dec 15 04:45:33 localhost kernel:pages per sector:32
Dec 15 04:45:33 localhost kernel:bus width:8
Dec 15 04:45:33 localhost kernel:bits in sector size:14
Dec 15 04:45:33 localhost kernel:bits in page size:9
Dec 15 04:45:33 localhost kernel:bits in OOB size:4
Dec 15 04:45:33 localhost kernel:flash size with OOB:67584 KiB
Dec 15 04:45:33 localhost kernel:page address bytes:4
Dec 15 04:45:33 localhost kernel:sector address bytes:3
Dec 15 04:45:33 localhost kernel:options:0x62
Dec 15 04:45:33 localhost kernel:Scanning device for bad blocks
Dec 15 04:45:33 localhost kernel:Creating 1 MTD partitions on "NAND 64
MiB 1,8V 8-bit":
Dec 15 04:45:33 localhost kernel:0x00000000-0x04000000:"NAND simulator
partition"
Dec 15 04:45:33 localhost kernel:UBI:background thread "ubi_bgt0d"
started,PID 431
Dec 15 04:45:33 localhost kernel:UBI:empty MTD device detected
Dec 15 04:45:33 localhost kernel:UBI:create volume table(copy #1)
Dec 15 04:45:33 localhost kernel:UBI:create volume table(copy #2)
Dec 15 04:45:33 localhost kernel:UBI:create volume table(copy #2)
Dec 15 04:45:33 localhost kernel:UBI:error:ubi_scan_add_volume:two
LEBs with same version 0

I think it's not the problem of the source code . I am not sure if it
is caused by the gcc version or the setting of configure options of
kernel on the x86-64 or something else?

Is anyone who met this kind of problem? Please could you tell me how
to deal with it,thanks a lot!

Your quick reply will be highly appreciated.

Best regards,
shiner
