Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxCU2-0005SB-8Z
 for linux-mtd@lists.infradead.org; Wed, 18 Jun 2014 09:48:46 +0000
Message-ID: <53A16066.4040805@codeaurora.org>
Date: Wed, 18 Jun 2014 12:48:22 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Matt Hevern <matt.hevern@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS becomes read-only when written, then fails to mount
References: <20140618044434.GA9331@gmail.com>
In-Reply-To: <20140618044434.GA9331@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/18/2014 7:44 AM, Matt Hevern wrote:
> Hi All,
>
>
> I am running UBIFS on freescale i.MX28, kernel 2.6.35.3, based on
> freescale's IMX tree:
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/?h=imx_2.6.35_maintain
> The flash is NAND, Micron 256MiB (MT29F2G08)
>
> The main mtd partition has 5 UBI volumes on it, one of which is around
> 20MB UBIFS. This is used as the writeable backing store for a unionfs
> filesystem which is mounted over various areas of the readonly root squashfs area.
>
> I noticed on one device which I was testing, that on bootup the whole
> UBIFS volume had gone read-only, and I'm trying to figure out why, and if
> there is anything that can be done to recover.
> I built a kernel with UBIFS debuging and have attached various logs to this email,
> I don't currently have access to a console on this device.
>
> What I have seen is that when I mount it, it mounts successfully,
> but when I attempt to write a file to it, then it will fail to write
> and then remount read-only. This happened on a number of successive ocasions
> while i was recording log files, and then later it failed to mount at all.
> I don't know what exactly led to this occuring, at the time there was
> logging to the UBIFS occuring every 5 seconds, and the device will hard
> power down when the battery level drops, which happens regularly.
>
> Does anyone have an idea what is happening here, or any options to
> prevent this from happening ?
>
> Thanks in advance,
>
> Matt
>
> ------dmesg
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "system"
> UBI: MTD device size:            248 MiB
> UBI: number of good PEBs:        1982
> UBI: number of bad PEBs:         2
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     5
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 1982
> UBI: number of PEBs reserved for bad PEB handling: 19
> UBI: max/mean erase counter: 80/60
> UBI: image sequence number: 1793180392
> UBI: background thread "ubi_bgt0d" started, PID 492
>   ubiblka: unknown partition table
>   ubiblkb: unknown partition table
>   ubiblkc: unknown partition table
>   ubiblkd: unknown partition table
>   ubiblke: unknown partition table
> ....

How did you create your ubifs and ubi images?

> ....
> UBIFS: mounted UBI device 0, volume 5, name "config"
> UBIFS: file system size:   20697088 bytes (20212 KiB, 19 MiB, 163 LEBs)
> UBIFS: journal size:       4444160 bytes (4340 KiB, 4 MiB, 35 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: none
> UBIFS: reserved for root:  0 bytes (0 KiB)
> UBIFS error (pid 616): ubifs_leb_unmap: unmap LEB -1 failed, error -22
> UBIFS warning (pid 616): ubifs_ro_mode: switched to read-only mode, error -22
> UBIFS error (pid 616): make_reservation: cannot reserve 160 bytes in jhead 1, error -22
> UBIFS error (pid 616): ubifs_write_inode: can't write inode 69, error -22
>
> ----
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
