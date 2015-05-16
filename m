Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtjU0-0004dG-Hl
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 21:18:57 +0000
Received: by laat2 with SMTP id t2so168968059laa.1
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 14:18:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150516205354.GK6055@norris-Latitude-E6410>
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
 <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
 <20150516205354.GK6055@norris-Latitude-E6410>
Date: Sat, 16 May 2015 23:18:32 +0200
Message-ID: <CAD=nrE_7btNkWoS_L5rv6i2edDWRWnkMtmtvHK0Sk1GdvtrKnA@mail.gmail.com>
Subject: Re: Tracking flash IO activity?
From: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>
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

On 16 May 2015 at 22:53, Brian Norris <computersforpeace@gmail.com> wrote:
> On Sat, May 16, 2015 at 10:41:53PM +0200, valent.turkovic@gmail.com wrote:
>> I have used iostat but it is not showing any changes on /dev/mtdblock5
>> which is mounted as /overlay jffs2 partition on this device I'm using.
>> I have also checked stats in /proc/diskstat, and they also only change
>> for /dev/mmcblk0p1 which is usb device, but not for any of
>> /dev/mtdblockX partitions.
>
> JFFS2 doesn't actually use mtdblock. At most, it uses it as a
> placeholder, which tells it to actually use the corresponding /dev/mtdX
> device:

Thanks Brian, I'll keep that in mind.

> http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock
>
>> > through fio and iostats , just starts an io through dd gets status through
>> > iostats, i have not used but i know.
>
> Those are all for monitoring block devices. MTDs are not block devices:
>
> http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_what
>
> I don't know of any similar IO stats for MTDs, sorry.


I tried digging trough /sys and checked out few files from
/sys/devices/platform/ath79-spi/spi_master/spi0/spi0.0/mtd/ and
/sys/block/mtdblock5/ and most I found out that this is NOR type of
memory and that it has 65536 size of eraseblock.

I also found mtd-utils:
http://processors.wiki.ti.com/index.php/MTD_Utilities, but I don't see
any tool in mtd-utils that shows stats of how many eraseblocks were
written and read.

Could I access jffs2 stats somehow for /overlay partition?
