Received: from p01c12o143.mxlogic.net ([208.65.145.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1bDQ-0007NL-2n
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 13:01:52 +0000
Message-ID: <53B15F8E.3030309@lutron.com>
Date: Mon, 30 Jun 2014 09:01:02 -0400
From: Akshay Bhat <abhat@lutron.com>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
In-Reply-To: <53ACD890.4030805@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Thanks for your response. Answers in-line.

On Thu 26 Jun 2014 10:36:00 PM EDT, hujianyang wrote:
> How did you release data on the flash? What's the partitions on your system?
> Did you use MTD_UBI_FASTMAP?

Image was flashed using the below command:
ubiformat /dev/mtd11 -f rootfs.ubi -s 512 -O 2048

UBI fastmap is enabled.
CONFIG_MTD_UBI_FASTMAP=y

mtd11 is for Rootfs and it has 6 volumes. Contents of ubinize.cfg:
[rootfs]
mode=ubi
#image=
vol_id=0
vol_size=100MiB
vol_type=dynamic
vol_name=rootfs

[rootfs2]
mode=ubi
vol_id=1
vol_size=100MiB
vol_type=dynamic
vol_name=rootfs2

[database]
mode=ubi
vol_id=2
vol_size=7MiB
vol_type=dynamic
vol_name=database

[database2]
mode=ubi
vol_id=3
vol_size=7MiB
vol_type=dynamic
vol_name=database2

[logging]
mode=ubi
vol_id=4
vol_size=7MiB
vol_type=dynamic
vol_name=logging

[firmware]
mode=ubi
vol_id=5
vol_size=7MiB
vol_type=dynamic
vol_name=firmware
vol_flags=autoresize

> Did you try umount after this error happen and mount partition again, then
> re-run your scripts to see what will happen?

I am not able mount the partition again after getting the error

######At the time of panic############
# df
Filesystem           1024-blocks    Used Available Use% Mounted on
rootfs                   92780     32792     59988  35% /
ubi0:rootfs              92780     32792     59988  35% /
tmpfs                   125800        36    125764   0% /tmp
tmpfs                   125800         0    125800   0% /dev/shm
tmpfs                   125800        68    125732   0% /var/run
ubi0:logging              4816      1984      2548  44% /var/log
ubi0:database             4816       456      4080  10% /var/db
tmpfs                   125800         4    125796   0% /var/spool/cron
tmpfs                   125800         0    125800   0% /var/sftp

# mount
rootfs on / type rootfs (rw)
ubi0:rootfs on / type ubifs (ro,relatime)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
none on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /var/run type tmpfs (rw,relatime,mode=777)
ubi0:logging on /var/log type ubifs (ro,sync,relatime)
ubi0:database on /var/db type ubifs (ro,sync,relatime)
tmpfs on /var/spool/cron type tmpfs (rw,relatime,mode=755)
tmpfs on /var/sftp type tmpfs (rw,relatime,mode=755)

# umount /var/log
# umount /var/db
# mount -t ubifs ubi0:logging /var/log
mount: mounting ubi0:logging on /var/log failed: No space left on device
# mount -t ubifs ubi0:database /var/db
mount: mounting ubi0:database on /var/db failed: No space left on device

# mount
rootfs on / type rootfs (rw)
ubi0:rootfs on / type ubifs (ro,relatime)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
none on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /var/run type tmpfs (rw,relatime,mode=777)
tmpfs on /var/spool/cron type tmpfs (rw,relatime,mode=755)
tmpfs on /var/sftp type tmpfs (rw,relatime,mode=755)

# df
Filesystem           1024-blocks    Used Available Use% Mounted on
rootfs                   92780     32792     59988  35% /
ubi0:rootfs              92780     32792     59988  35% /
tmpfs                   125800        36    125764   0% /tmp
tmpfs                   125800         0    125800   0% /dev/shm
tmpfs                   125800        60    125740   0% /var/run
tmpfs                   125800         4    125796   0% /var/spool/cron
tmpfs                   125800         0    125800   0% /var/sftp

>> [81438.785011] UBIFS error (pid 31441): do_commit: commit failed, error -30
>> [81438.785034] UBIFS error (pid 31441): ubifs_write_inode: can't write inode 79,
>> error -30
>>
>
> Later error -30 is caused by former error -28 which is reported by UBI layer.
> Did you run df to see how much space left on your device?

Before running the scripts (right after boot)
# df
Filesystem           1024-blocks    Used Available Use% Mounted on
rootfs                   92780     32780     60000  35% /
ubi0:rootfs              92780     32780     60000  35% /
tmpfs                   125800        36    125764   0% /tmp
tmpfs                   125800         0    125800   0% /dev/shm
tmpfs                   125800        68    125732   0% /var/run
ubi0:logging              4816       324      4212   7% /var/log
ubi0:database             4816       248      4288   5% /var/db
tmpfs                   125800         4    125796   0% /var/spool/cron
tmpfs                   125800         0    125800   0% /var/sftp

At the time of the panic:
# df
Filesystem           1024-blocks    Used Available Use% Mounted on
rootfs                   92780     32792     59988  35% /
ubi0:rootfs              92780     32792     59988  35% /
tmpfs                   125800        36    125764   0% /tmp
tmpfs                   125800         0    125800   0% /dev/shm
tmpfs                   125800        68    125732   0% /var/run
ubi0:logging              4816      1984      2548  44% /var/log
ubi0:database             4816       456      4080  10% /var/db
tmpfs                   125800         4    125796   0% /var/spool/cron
tmpfs                   125800         0    125800   0% /var/sftp


>
> I think each time you get an error -28 from UBI layer, you will see an ubi_err.
> But I didn't see it in your log. Does anyone else know something about it?
>
> .
>
