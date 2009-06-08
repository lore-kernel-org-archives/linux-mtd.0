Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDZFd-0005Ui-NQ
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 07:26:43 +0000
Subject: Re: Confuse with WL_THRESHOLD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thang Dao Duy <hanbaoquansexy@gmail.com>
In-Reply-To: <1244370180.5847.322.camel@localhost.localdomain>
References: <a1fb7300906022244g5cd882acw7de4b9b0ecc35547@mail.gmail.com>
	<a1fb7300906051703p148c5d1k7fd46257c8031ac6@mail.gmail.com>
	<1244370180.5847.322.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jun 2009 10:26:04 +0300
Message-Id: <1244445964.5847.349.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-06-07 at 13:23 +0300, Artem Bityutskiy wrote:
> On Sat, 2009-06-06 at 07:03 +0700, Thang Dao Duy wrote:
> > Hi everyone.
> > I used NANDsim and ubifs not for along time. Now, I have confused with
> > wear-leveling threshold. If i give parameter WL_THRESHOLD in Kernel is
> > small (example, the value is  3), then when i write a file size 2 MiB
> > to NAND about 200 times, it makes me cannot read EC and VID headers of
> > one PEB (example PEB 10). May be that PEB is bad ? And when i set the
> > WL_THRESHOLD is higher (the value is 20), i write a file 2MiB about
> > 1000 times, nothing 's happen, i can read headers of any PEB. So can
> > you tell me what make this happen, and show me where in ubi source in
> > kernel.
> 
> Looks like a bug. Please, describe precisely how to reproduce it,
> and I'll take a look at this.

Please, also make sure you are using the latest UBI/UBIFS. Please, take
a look here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

I've configured my UBI and made the threshold to be 3 now. I've also
enabled additional UBI and UBIFS debugging checks. I'm running the
following test:

$ sudo modprobe nandsim
$ sudo modprobe ubi mtd=0
$ sudo ubimkvol /dev/ubi0 -m -N test_fs
Set volume size to 128674304
Volume ID 0, size 8107 LEBs (128674304 bytes, 122.7 MiB), LEB size 15872 bytes (15.5 KiB), dynamic, name "test_fs", alignment 1
$ sudo modprobe ubifs
$ sudo mount -t ubifs ubi0:test_fs /mnt/ubifs/
$ while true; do sudo dd if=/dev/urandom of=ubifs/file count=2048; sync; done
2097152 bytes (2.1 MB) copied, 0.316768 s, 6.6 MB/s                                            
4096+0 records in                                                                              
4096+0 records out                                                                             
....

It's being run for some time now, so far so good - no issues.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
