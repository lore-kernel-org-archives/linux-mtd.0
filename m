Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcBGb-0002Jv-I8
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 09:43:46 +0000
Date: Fri, 1 Nov 2013 10:43:23 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Subject: Re: Flashing UBIFS image to gluebi mtd
In-Reply-To: <620221383297125@web13h.yandex.ru>
Message-ID: <alpine.DEB.2.00.1311011036080.29641@lnxricardw.se.axis.com>
References: <72811383227314@web24j.yandex.ru>
 <20131031150844.GA1092@localhost> <16161383242430@web27h.yandex.ru>
 <alpine.DEB.2.00.1311010844450.29641@lnxricardw.se.axis.com>
 <620221383297125@web13h.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 1 Nov 2013, Konstantin Tokarev wrote:

>>>  Btw, I'm more interested in finding out in what way my UBIFS volume can be
>>>  broken in given scenario and how can I detect it (to reflash once again,
>>>  using UBI-aware updater this time).
>>
>> You didn't mention how you overwrote your UBI partition with new data. dd
>> ? nandwrite ?
>
> I write data to mtd device file (gluebi-based in this case) using write()
> function, one mtd eraseblock at a time. Effectively it's the same as dd.

How do you handle potential bad blocks in the flash ?

>> Also I don't think you mentioned exactly your old setup. I'm assuming
>> squashfs on top of mtd, with no UBI involved, right?
>
> No, on top of UBI (to handle bad blocks and wear leveling).

Sorry, my bad, reading your post again I see that you explicitly stated 
squashfs on top of gluebi ...

>> I'm getting the impression your problem is based on the fact
>> that when updating the firmware, you are using update firmware which is
>> not UBI aware, and you don't get UBI-awareness on the system until you've
>> done the update.
>
> Exactly.

... which means that you've been running UBI all the time, but not ubifs. 
(?)

>> A chicken-and-egg-situation. One solution in that case
>> would be to have an intermediate firmware which was identical to what was
>> in the device to start with but that had an UBI-aware upgrade application.
>
> Not a solution, because end user of device might skip this intermediate
> firmware accidentally.

I was afraid of that ... :-)

>
> It would be perfectly OK if rootfs failed to mount after update because
> it led to reflash once again with the same firmware. It would be possible
> to do any new consistency check, because initramfs software had already
> been upgraded.
>
> The problem is that incorrectly flashed UBIFS mounts without error,
> all content is readable and has valid md5sums, and file write and
> mv operations also succeed.

But in your original post, the following line was present in the log:

UBIFS warning (pid 383): ubifs_ro_mode: switched to read-only mode, error 
-5

indicating that writing had been switched off due to the errors detected. 
Of course, this might be arbitrary depending on exactly which errors 
happened to occur at that particular boot instance.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
