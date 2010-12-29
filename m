Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PY2bt-0003gj-In
	for linux-mtd@lists.infradead.org; Wed, 29 Dec 2010 20:27:03 +0000
Received: by qyk27 with SMTP id 27so12251939qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Dec 2010 12:26:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1012171555320.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<Pine.LNX.4.64.1012151129250.7024@lnxricardw.se.axis.com>
	<1292516775.2364.108.camel@localhost>
	<Pine.LNX.4.64.1012171036510.7024@lnxricardw.se.axis.com>
	<1292591069.2412.25.camel@localhost>
	<Pine.LNX.4.64.1012171555320.7024@lnxricardw.se.axis.com>
Date: Wed, 29 Dec 2010 13:26:58 -0700
Message-ID: <AANLkTi=_FUG2_SO5yKn1Sj9ksi6DzTw7W=zS9jujNjtV@mail.gmail.com>
Subject: Re: Static UBI volumes and ubiupdatevol ?
From: Russ Dill <russ.dill@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 17, 2010 at 8:02 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Fri, 17 Dec 2010, Artem Bityutskiy wrote:
>
>>>>> With a system based on mtd+jffs2 it is actually possible to reflash the
>>>>> partition with the [read only] root file system on it without
>>>>> unmounting,
>>>>> as long as no accesses are made to the physical flash during the
>>>>> rewrite
>>>>> or afterwards. In other words, immediately after reflashing the system
>>>>> must be rebooted.
>>>>
>>>> Hmm, I presume you can do this with UBIFS, but you need to make sure all
>>>> the backgound stuff like moving and eraseing eraseblocs is done before
>>>> doing this by doing fsync() on your /dev/ubiX_Y device (UBI volume
>>>> character device), see the 'vol_cdev_fsync()' function. Ah, and of
>>>> course you need to sync UBIFS before this.
>>>>
>>>> Then if you can guarantee that no one is reading writing to it, you can
>>>> change the flash.
>>>
>>> It would be nice to use ubiupdatevol to do this, but it won't let me do
>>> that if the volume is mounted (naturally). I don't know if this is
>>> something that is enforced by ubiupdatevol or ubi. I would assume the
>>> latter but I haven't checked the code.
>>>
>>> Of course I could always write my own "ubiupdatevol" to deal with this
>>> but
>>> it's always nice to use existing and supported tools.
>>
>> This is UBI - it does not allow updating if someone keeps the volume
>> open. When UBI is mounted, it keeps the volume open. It closes the
>> volume when unmounted.
>
> Yes, it make definitely makes sense to have it work this way to avoid
> problems.
>
>> It looks error-prone to allow updating while there are users, from UBI
>> POW, I think.
>
> I agree. It just happens to be the way our firmware update process works
> currently ... :-)
>
>> And I cannot think of a nice way of doing this.
>>
>> Why can't you just
>> 1. lazily unmount UBIFS
>> 2. find all users of UBIFS and kill them
>> 3. this will make UBIFS finally unmount
>> 4. you safely update the UBI volume
>
> The problem is that in this case it is our root file system which is to be
> reflashed, so we can't just unmount it. I have an idea about using
> pivot_root though, in a similar manner to the way the root file system is
> switched from initrd to disk during an ordinary Linux boot with initrd.
>
> Something like
> 1. Close down everything.
> 2. Create a tmpfs and mount it.
> 3. Copy all necessary binaries and libraries to the tmpfs.
> 4. Use pivot_root to switch root file systems.
> 5. Unmount the original (UBIFS) root file system.
> 6. Rewrite the root file system using ubiupdatevol.
> 7. Reboot.
>
> Right now I'm stumped at how to restart init in order for it to relase its
> stdin,stdout and stderr, which still refer to the (old) /dev/console, but
> there must be a solution somehow as the same situation must occur with an
> ordinary (initrd) kernel booting.
>

Busybox init knows how to do this operation. If not, a straightforward
alternative is to kexec your kernel with a small initrd that can do
the work.
