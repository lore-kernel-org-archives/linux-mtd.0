Received: from forward4h.mail.yandex.net ([2a02:6b8:0:f05::4])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcAmL-0001YP-Ff
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 09:12:31 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <alpine.DEB.2.00.1311010844450.29641@lnxricardw.se.axis.com>
References: <72811383227314@web24j.yandex.ru>
 <20131031150844.GA1092@localhost> <16161383242430@web27h.yandex.ru>
 <alpine.DEB.2.00.1311010844450.29641@lnxricardw.se.axis.com>
Subject: Re: Flashing UBIFS image to gluebi mtd
MIME-Version: 1.0
Message-Id: <620221383297125@web13h.yandex.ru>
Date: Fri, 01 Nov 2013 13:12:05 +0400
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



01.11.2013, 11:48, "Ricard Wanderlof" <ricard.wanderlof@axis.com>:
> On Thu, 31 Oct 2013, Konstantin Tokarev wrote:
>
>> š31.10.2013, 19:08, "Ezequiel Garcia" <ezequiel.garcia@free-electrons.com>:
>>> šHi Konstantin,
>>>
>>> šOn Thu, Oct 31, 2013 at 05:48:34PM +0400, Konstantin Tokarev wrote:
>>>> ššI'm migrating rootfs of device from SquashFS on top of gluebi to UBIFS.
>>> šSounds like you could use ubiblock for that setup, which is suitable
>>> šfor squashfs, and completely independent of ubifs (thus less cpu and
>>> šmemory hungry and easier to setup).
>> šCould you elaborate this a bit more? Do you mean that block device emultaion
>> šlayer on top of UBI + FS on top of that can work faster than UBIFS on top of
>> šUBI?
>>
>> šBtw, I'm more interested in finding out in what way my UBIFS volume can be
>> šbroken in given scenario and how can I detect it (to reflash once again,
>> šusing UBI-aware updater this time).
>
> You didn't mention how you overwrote your UBI partition with new data. dd
> ? nandwrite ?

I write data to mtd device file (gluebi-based in this case) using write()
function, one mtd eraseblock at a time. Effectively it's the same as dd.

> I'm getting the impression your problem is based on the fact
> that when updating the firmware, you are using update firmware which is
> not UBI aware, and you don't get UBI-awareness on the system until you've
> done the update.

Exactly.

> A chicken-and-egg-situation. One solution in that case
> would be to have an intermediate firmware which was identical to what was
> in the device to start with but that had an UBI-aware upgrade application.

Not a solution, because end user of device might skip this intermediate
firmware accidentally.

It would be perfectly OK if rootfs failed to mount after update because
it led to reflash once again with the same firmware. It would be possible
to do any new consistency check, because initramfs software had already
been upgraded.

The problem is that incorrectly flashed UBIFS mounts without error,
all content is readable and has valid md5sums, and file write and
mv operations also succeed.

>
> Also I don't think you mentioned exactly your old setup. I'm assuming
> squashfs on top of mtd, with no UBI involved, right?

No, on top of UBI (to handle bad blocks and wear leveling).

-- 
Regards,
Konstantin
