Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SbdWe-0006Tx-3e
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2012 20:05:18 +0000
Received: by obqv19 with SMTP id v19so8969939obq.36
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2012 13:05:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1337066521.2528.130.camel@sauron.fi.intel.com>
References: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
 <1336744984.2625.79.camel@sauron.fi.intel.com>
 <CAEg8X7UCSoTCLyynVbRaN6Z7M6PvJn7-nBiDf+UhwmcZ91muyg@mail.gmail.com>
 <1337066521.2528.130.camel@sauron.fi.intel.com>
Date: Mon, 4 Jun 2012 16:05:12 -0400
Message-ID: <CAEg8X7XVOpyanEtkz1YPbECJTQWfamnhq4yQsyeMyeBSqUnvgw@mail.gmail.com>
Subject: Re: UBIFS error: replay_log_leb: first log node at LEB 3:0 is not CS
 node
From: James Nute <newten82@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2012 at 3:22 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-05-11 at 14:56 -0400, James Nute wrote:
>> On Fri, May 11, 2012 at 10:03 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > On Wed, 2012-05-09 at 09:45 -0400, James Nute wrote:
>> >> Hello
>> >>
>> >> I'm getting a UBIFS Corruption during a power failure with a fail
>> >> signature that I believe is different from what has been seen in the
>> >> past.
>> >> When I flash a new UBI image onto my device and boot it for the first
>> >> time everything comes up as expected. However if I force a power
>> >> failure before any major file writes occur the device will crash when
>> >> UBIFS attempts to recover during the next reboot. If I force a sync
>> >> command before the power failure I am able to successfully avert the
>> >> recovery failure. I worry that this indicates something ugly is going
>> >> on that I can't detect.
>> >
>> > Unfortunately you did not really enable the debugging messages or you
>> > forgot to type "dmesg". Anyway, they are absent.
>> >
>> >>
>> >> To get more debug messages I have enabled UBIFS debugging and enabled
>> >> the recovery and mount messages by booting with
>> >> ""ubifs.debug_msgs=6144 ignore_loglevel" kernel parameters
>> >
>> > Can you actually enable them and share the log?
>>
>> I did the following to enable debugging:
>> 1. "CONFIG_UBIFS_FS_DEBUG=y" in kernel config
>> 2. Added "ubifs.debug_msgs=6144" to the kernel command line
>> 3. Added "ignore_loglevel" to the kernel command line
>> 4. Captured all console output with putty and uploaded to
>> http://mcreech.com/work/ubifs-2012-05-08.txt
>>
>> I'm not sure what step I missed to enable the full debugging messages.
>> I am getting some UBIFS DBG messages in my log but not many.
>
> Did you pull the latest UBIFS from the back-port trees? In the latest
> UBIFS we switch to dynamic debugging. I did not do good documentation
> how to use it because of lack of time. But you can read the general
> instructions in the Documentation directory.
>
> You may as well hack ubifs and force it to use printk with KERN_ERROR to
> make sure everything goes to your serial console. See the debug.h file.
>
>> > the image and share it - I should be able to put it to nandsim and try
>> > to mount and see.
>>
>> I will look into dumping the image for you but I have not done this before.
>> Do you want a dump from before the power fail or after?
>
> After the failure. The ideal is the one after the failure but _before_
> you first mount it.
>
>> > Is this problem reproducible?
>> Yes I have had no trouble recreating this fail.
>
> Hmm, then I suspect you have issues on driver level. Did you validate
> your driver with MTD tests?

This particular product has been all through the MTD tests and has
been running uboot and and UBIFS for several years.
We always try to stay up to date with the latest of both the kernel
and uboot. Because of this I was able to track back to a kernel that
did not exhibit the issue and followed that back to the free space
fixup function.

I wrote a quick patch to remove the call to the ubifs_fixup_free_space
function from fs/ubifs/super.c and the problem goes away.
I currently do not understand enough of the UBIFS internal to see why
this particular function is at fault. Is it possible that it is
incorrectly erasing the new master node?

>> I will continue to try to figure out why I am not getting all the
>> debug messages.
>
> Depends on your version. If it uses printk - I described various things
> here:
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug
>
> It is for UBI, but the information about printk and and log buffer is
> generic.
>
> The newest UBIFS used dynamic debugging infrastructure instead:
>
> Documentation/dynamic-debug-howto.txt
>
> You can enable various debugging messages using that infrastructure. See
> the debug.h file in ubifs - it prefixes messages from various subsystems
> - you can use them to see the messages.
>
> Not that dynamic prints have KERN_DEBUG level and they do not go to your
> serial console. You can boot with ignore_loglevel kernel option to see
> _all_ the messages.
>
> This stuff needs good documentation on the web site - many people get
> confused ... :-(

Thanks,
James Nute
