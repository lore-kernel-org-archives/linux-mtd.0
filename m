Received: from p01c12o144.mxlogic.net ([208.65.145.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1fJ1-0004W0-6B
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 17:23:52 +0000
Message-ID: <53B19D09.2000007@lutron.com>
Date: Mon, 30 Jun 2014 13:23:21 -0400
From: Akshay Bhat <abhat@lutron.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
In-Reply-To: <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Mon 30 Jun 2014 10:48:01 AM EDT, Richard Weinberger wrote:
> On Mon, Jun 30, 2014 at 3:01 PM, Akshay Bhat <abhat@lutron.com> wrote:
>> Thanks for your response. Answers in-line.
>>
>>
>> On Thu 26 Jun 2014 10:36:00 PM EDT, hujianyang wrote:
>>>
>>> How did you release data on the flash? What's the partitions on your
>>> system?
>>> Did you use MTD_UBI_FASTMAP?
>>
>>
>> Image was flashed using the below command:
>> ubiformat /dev/mtd11 -f rootfs.ubi -s 512 -O 2048
>>
>> UBI fastmap is enabled.
>> CONFIG_MTD_UBI_FASTMAP=y
>
> Do you also use it or is it just enabled?

We do not need/use the fastmap feature. (fm_autoconvert set to 0).

Is enabling UBI_FASTMAP the cause for the panic? If so I can disabled 
the
feature and re-test. Do you see any compatibility issue going from:
Current config -> New config -> Failsafe config

Current config: CONFIG_MTD_UBI_FASTMAP = y; fm_autoconvert = 0
New config:  CONFIG_MTD_UBI_FASTMAP = n; fm_autoconvert = 0
Failsafe kernel config (if the above kernel does not boot):
 CONFIG_MTD_UBI_FASTMAP = y; fm_autoconvert = 0

Snippet of dmesg boot log:
[    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd 
mem=256M
root=ubi0:rootfs rw ubi.mtd=11,2048 rootfstype=ubifs rootwait=1 ip=none 
quiet
loglevel=3 panic=3
............
[    0.483696] UBI: default fastmap pool size: 95
[    0.483712] UBI: default fastmap WL pool size: 25
[    0.483728] UBI: attaching mtd11 to ubi0
[    1.699309] UBI: scanning is finished
[    1.711816] UBI: attached mtd11 (name "RFS", size 242 MiB) to ubi0
[    1.711842] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 
bytes
[    1.711858] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 
512
[    1.711875] UBI: VID header offset: 2048 (aligned 2048), data 
offset: 4096
[    1.711891] UBI: good PEBs: 1939, bad PEBs: 0, corrupted PEBs: 0
[    1.711907] UBI: user volume: 6, internal volumes: 1, max. volumes 
count: 128
[    1.711926] UBI: max/mean erase counter: 1/0, WL threshold: 4096, 
image sequence number: 1426503060
[    1.711943] UBI: available PEBs: 0, total reserved PEBs: 1939, PEBs 
reserved for bad PEB handling: 40
[    1.726701] UBI: background thread "ubi_bgt0d" started, PID 55

>> mtd11 is for Rootfs and it has 6 volumes. Contents of ubinize.cfg:
>> [rootfs]
>> mode=ubi
>> #image=
>> vol_id=0
>> vol_size=100MiB
>> vol_type=dynamic
>> vol_name=rootfs
>>
>> [rootfs2]
>> mode=ubi
>> vol_id=1
>> vol_size=100MiB
>> vol_type=dynamic
>> vol_name=rootfs2
>>
>> [database]
>> mode=ubi
>> vol_id=2
>> vol_size=7MiB
>> vol_type=dynamic
>> vol_name=database
>>
>> [database2]
>> mode=ubi
>> vol_id=3
>> vol_size=7MiB
>> vol_type=dynamic
>> vol_name=database2
>>
>> [logging]
>> mode=ubi
>> vol_id=4
>> vol_size=7MiB
>> vol_type=dynamic
>> vol_name=logging
>>
>> [firmware]
>> mode=ubi
>> vol_id=5
>> vol_size=7MiB
>> vol_type=dynamic
>> vol_name=firmware
>> vol_flags=autoresize
>>
>>
>>> Did you try umount after this error happen and mount partition again, then
>>> re-run your scripts to see what will happen?
>>
>>
>> I am not able mount the partition again after getting the error
>>
>> ######At the time of panic############
>> # df
>> Filesystem           1024-blocks    Used Available Use% Mounted on
>> rootfs                   92780     32792     59988  35% /
>> ubi0:rootfs              92780     32792     59988  35% /
>> tmpfs                   125800        36    125764   0% /tmp
>> tmpfs                   125800         0    125800   0% /dev/shm
>> tmpfs                   125800        68    125732   0% /var/run
>> ubi0:logging              4816      1984      2548  44% /var/log
>> ubi0:database             4816       456      4080  10% /var/db
>> tmpfs                   125800         4    125796   0% /var/spool/cron
>> tmpfs                   125800         0    125800   0% /var/sftp
>>
>> # mount
>> rootfs on / type rootfs (rw)
>> ubi0:rootfs on / type ubifs (ro,relatime)
>> proc on /proc type proc (rw,relatime)
>> sysfs on /sys type sysfs (rw,relatime)
>> tmpfs on /tmp type tmpfs (rw,relatime)
>> none on /dev/pts type devpts (rw,relatime,mode=600)
>> tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
>> tmpfs on /var/run type tmpfs (rw,relatime,mode=777)
>> ubi0:logging on /var/log type ubifs (ro,sync,relatime)
>> ubi0:database on /var/db type ubifs (ro,sync,relatime)
>> tmpfs on /var/spool/cron type tmpfs (rw,relatime,mode=755)
>> tmpfs on /var/sftp type tmpfs (rw,relatime,mode=755)
>>
>> # umount /var/log
>> # umount /var/db
>> # mount -t ubifs ubi0:logging /var/log
>> mount: mounting ubi0:logging on /var/log failed: No space left on device
>> # mount -t ubifs ubi0:database /var/db
>> mount: mounting ubi0:database on /var/db failed: No space left on device
>>
>> # mount
>> rootfs on / type rootfs (rw)
>> ubi0:rootfs on / type ubifs (ro,relatime)
>> proc on /proc type proc (rw,relatime)
>> sysfs on /sys type sysfs (rw,relatime)
>> tmpfs on /tmp type tmpfs (rw,relatime)
>> none on /dev/pts type devpts (rw,relatime,mode=600)
>> tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
>> tmpfs on /var/run type tmpfs (rw,relatime,mode=777)
>> tmpfs on /var/spool/cron type tmpfs (rw,relatime,mode=755)
>> tmpfs on /var/sftp type tmpfs (rw,relatime,mode=755)
>>
>> # df
>> Filesystem           1024-blocks    Used Available Use% Mounted on
>> rootfs                   92780     32792     59988  35% /
>> ubi0:rootfs              92780     32792     59988  35% /
>> tmpfs                   125800        36    125764   0% /tmp
>> tmpfs                   125800         0    125800   0% /dev/shm
>> tmpfs                   125800        60    125740   0% /var/run
>> tmpfs                   125800         4    125796   0% /var/spool/cron
>> tmpfs                   125800         0    125800   0% /var/sftp
>>
>>
>>>> [81438.785011] UBIFS error (pid 31441): do_commit: commit failed, error
>>>> -30
>>>> [81438.785034] UBIFS error (pid 31441): ubifs_write_inode: can't write
>>>> inode 79,
>>>> error -30
>>>>
>>>
>>> Later error -30 is caused by former error -28 which is reported by UBI
>>> layer.
>>> Did you run df to see how much space left on your device?
>>
>>
>> Before running the scripts (right after boot)
>> # df
>> Filesystem           1024-blocks    Used Available Use% Mounted on
>> rootfs                   92780     32780     60000  35% /
>> ubi0:rootfs              92780     32780     60000  35% /
>> tmpfs                   125800        36    125764   0% /tmp
>> tmpfs                   125800         0    125800   0% /dev/shm
>> tmpfs                   125800        68    125732   0% /var/run
>> ubi0:logging              4816       324      4212   7% /var/log
>> ubi0:database             4816       248      4288   5% /var/db
>> tmpfs                   125800         4    125796   0% /var/spool/cron
>> tmpfs                   125800         0    125800   0% /var/sftp
>>
>> At the time of the panic:
>> # df
>> Filesystem           1024-blocks    Used Available Use% Mounted on
>> rootfs                   92780     32792     59988  35% /
>> ubi0:rootfs              92780     32792     59988  35% /
>> tmpfs                   125800        36    125764   0% /tmp
>> tmpfs                   125800         0    125800   0% /dev/shm
>> tmpfs                   125800        68    125732   0% /var/run
>> ubi0:logging              4816      1984      2548  44% /var/log
>> ubi0:database             4816       456      4080  10% /var/db
>> tmpfs                   125800         4    125796   0% /var/spool/cron
>> tmpfs                   125800         0    125800   0% /var/sftp
>>
>>
>>
>>>
>>> I think each time you get an error -28 from UBI layer, you will see an
>>> ubi_err.
>>> But I didn't see it in your log. Does anyone else know something about it?
>>>
>>> .
>>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
