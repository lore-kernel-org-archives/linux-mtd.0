Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSv1R-0002j2-6M
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 18:57:02 +0000
Received: by obqv19 with SMTP id v19so4680687obq.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 11:56:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336744984.2625.79.camel@sauron.fi.intel.com>
References: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
 <1336744984.2625.79.camel@sauron.fi.intel.com>
Date: Fri, 11 May 2012 14:56:57 -0400
Message-ID: <CAEg8X7UCSoTCLyynVbRaN6Z7M6PvJn7-nBiDf+UhwmcZ91muyg@mail.gmail.com>
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

On Fri, May 11, 2012 at 10:03 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-05-09 at 09:45 -0400, James Nute wrote:
>> Hello
>>
>> I'm getting a UBIFS Corruption during a power failure with a fail
>> signature that I believe is different from what has been seen in the
>> past.
>> When I flash a new UBI image onto my device and boot it for the first
>> time everything comes up as expected. However if I force a power
>> failure before any major file writes occur the device will crash when
>> UBIFS attempts to recover during the next reboot. If I force a sync
>> command before the power failure I am able to successfully avert the
>> recovery failure. I worry that this indicates something ugly is going
>> on that I can't detect.
>
> Unfortunately you did not really enable the debugging messages or you
> forgot to type "dmesg". Anyway, they are absent.
>
>>
>> To get more debug messages I have enabled UBIFS debugging and enabled
>> the recovery and mount messages by booting with
>> ""ubifs.debug_msgs=6144 ignore_loglevel" kernel parameters
>
> Can you actually enable them and share the log?

I did the following to enable debugging:
1. "CONFIG_UBIFS_FS_DEBUG=y" in kernel config
2. Added "ubifs.debug_msgs=6144" to the kernel command line
3. Added "ignore_loglevel" to the kernel command line
4. Captured all console output with putty and uploaded to
http://mcreech.com/work/ubifs-2012-05-08.txt

I'm not sure what step I missed to enable the full debugging messages.
I am getting some UBIFS DBG messages in my log but not many.


> Or may be you can dump
> the image and share it - I should be able to put it to nandsim and try
> to mount and see.

I will look into dumping the image for you but I have not done this before.
Do you want a dump from before the power fail or after?


> Is this problem reproducible?
Yes I have had no trouble recreating this fail.

I will continue to try to figure out why I am not getting all the
debug messages.
Thank you for help
