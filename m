Received: from forward3m.mail.yandex.net ([2a02:6b8:0:2519::3:12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcCdg-0004KC-NB
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 11:11:43 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <alpine.DEB.2.00.1311011036080.29641@lnxricardw.se.axis.com>
References: <72811383227314@web24j.yandex.ru>
 <20131031150844.GA1092@localhost> <16161383242430@web27h.yandex.ru>
 <alpine.DEB.2.00.1311010844450.29641@lnxricardw.se.axis.com>
 <620221383297125@web13h.yandex.ru>
 <alpine.DEB.2.00.1311011036080.29641@lnxricardw.se.axis.com>
Subject: Re: Flashing UBIFS image to gluebi mtd
MIME-Version: 1.0
Message-Id: <638781383304257@web27m.yandex.ru>
Date: Fri, 01 Nov 2013 15:10:57 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

01.11.2013, 13:43, "Ricard Wanderlof" <ricard.wanderlof@axis.com>:

> šOn Fri, 1 Nov 2013, Konstantin Tokarev wrote:
>>>> šššBtw, I'm more interested in finding out in what way my UBIFS volume can be
>>>> šššbroken in given scenario and how can I detect it (to reflash once again,
>>>> šššusing UBI-aware updater this time).
>>> ššYou didn't mention how you overwrote your UBI partition with new data. dd
>>> šš? nandwrite ?
>> ššI write data to mtd device file (gluebi-based in this case) using write()
>> ššfunction, one mtd eraseblock at a time. Effectively it's the same as dd.
> šHow do you handle potential bad blocks in the flash ?

Bad blocks are detected using ioctl on mtd device (MEMGETBADBLOCK) and skipped,
though AFAIU gluebi mtd cannot have bad blocks.

>>> ššAlso I don't think you mentioned exactly your old setup. I'm assuming
>>> ššsquashfs on top of mtd, with no UBI involved, right?
>> ššNo, on top of UBI (to handle bad blocks and wear leveling).
> šSorry, my bad, reading your post again I see that you explicitly stated
> šsquashfs on top of gluebi ...
>>> ššI'm getting the impression your problem is based on the fact
>>> ššthat when updating the firmware, you are using update firmware which is
>>> ššnot UBI aware, and you don't get UBI-awareness on the system until you've
>>> ššdone the update.
>> ššExactly.
> š... which means that you've been running UBI all the time, but not ubifs.
> š(?)

Yes.

I guess that we should have written SquashFS images using UBI volume update
procedure as well, to UBI device instead of gluebi MTD. Code was written to
write filesystems like JFFS2 to raw MTD's and just reused here without second
thought.

>>> ššA chicken-and-egg-situation. One solution in that case
>>> ššwould be to have an intermediate firmware which was identical to what was
>>> ššin the device to start with but that had an UBI-aware upgrade application.
>> ššNot a solution, because end user of device might skip this intermediate
>> ššfirmware accidentally.
> šI was afraid of that ... :-)
>> ššIt would be perfectly OK if rootfs failed to mount after update because
>> ššit led to reflash once again with the same firmware. It would be possible
>> ššto do any new consistency check, because initramfs software had already
>> ššbeen upgraded.
>>
>> ššThe problem is that incorrectly flashed UBIFS mounts without error,
>> ššall content is readable and has valid md5sums, and file write and
>> ššmv operations also succeed.
> šBut in your original post, the following line was present in the log:
>
> šUBIFS warning (pid 383): ubifs_ro_mode: switched to read-only mode, error
> š-5
>
> šindicating that writing had been switched off due to the errors detected.
> šOf course, this might be arbitrary depending on exactly which errors
> šhappened to occur at that particular boot instance.

I've read code of gluebi_write in gluebi.c, vol_cdev_ioctl in cdev.c, and
ubi_start_update in upd.c - looks like the only difference between correct
update and what is done in my case is that volume is not wiped out before
writing new volume image here.

(I know that raw mtd on NAND should be erased as well, but this is not done
for gluebi MTD because our code erases MTD only if MTD type == MTD_NANDFLASH)

-- 
Regards,
Konstantin
