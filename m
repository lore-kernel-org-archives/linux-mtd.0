Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RFuuK-0008Hb-Kz
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 21:39:41 +0000
Message-ID: <4E9CA094.4090002@grid-net.com>
Date: Mon, 17 Oct 2011 14:39:32 -0700
From: Steve Iribarne <siribarne@grid-net.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Need to recover from corruption
References: <4E975135.9090702@grid-net.com> <1318765406.2935.7.camel@sauron>
In-Reply-To: <1318765406.2935.7.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/16/2011 04:43 AM, Artem Bityutskiy wrote:
> On Thu, 2011-10-13 at 13:59 -0700, Steve Iribarne wrote:
>> I work on a system where we need to be as 100% uptime as possible.  The
>> other day we had an issue here where one of our applications was
>> crashing while a write to one of the partitions was happening.
>>
>> I then turned on UBIFS debugging in u-boot and I have a bunch of info
>> but I have no idea what is going on.
> Well, judging from the log UBIFS went nuts for some reason (negative
> free space). I've never seen this before.
>
> Could you please write some more information about your system, flash,
> kernel version, etc. Please, follow these instructions:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

I'm working on getting this info for you now.
>> Here is the output after (at the u-boot) prompt I do:
>>
>> ubi part nand0,1
>> ubifsmount boot-info
> So this problem happens all the time when you boot? Or how reproducible
> is it?
>

I have one board in this state now.  Once I get into this state it stays 
there until I re-"ubinize" it.

So I'm leaving this one board in this state to see if I can recover it.
> If this problem is reproducible, make a dump of your flash to save it
> for further investigations.
>
Will do.

The way in which our QA makes it happen (and this is very hard to 
reproduce)..

The volume that is corrupt is "boot-info".

In Linux, the user deleted a file in boot-info and does a reboot 
straight away.

I think it has to do when the system actually reboots.

We have reproduced this problem also when we had a hang in the kernel 
(which stopped the scheduler) and then our watchdog kicked in.  I'm 
guess some of the app guys were writing to the flash in the /home/conf 
volume.

This only happened twice in all our testing.

But I'll be much more verbose in the bug.

-stv

-- 

This e-mail and any of its attachments may contain proprietary
information, which is privileged, confidential or subject to copyright
belonging to Grid Net, Inc. This e-mail is intended solely for the use
of the individual or entity to which it is addressed. If you are not the
intended recipient, you are hereby notified that any dissemination,
distribution, copying or action taken in relation to the contents of
this e-mail is strictly prohibited and may be unlawful. If you have
received this e-mail in error, please notify the sender immediately and
permanently delete.
