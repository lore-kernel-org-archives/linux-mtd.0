Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdyjF-0008RC-OF
 for linux-mtd@lists.infradead.org; Sun, 28 Aug 2016 11:58:23 +0000
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
To: Daniel Golle <daniel@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160828091017.06fc2312@gmail.com>
 <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
 <20160828111931.6eb3a10d@gmail.com>
 <f7733dca-068a-38f4-f715-1abb439a71bc@nod.at>
 <20160828114445.GA1623@makrotopia.org>
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 linux-mtd@lists.infradead.org, Zoltan HERPAI <wigyori@uid0.hu>,
 Hauke Mehrtens <hauke@hauke-m.de>, lede-dev@lists.infradead.org,
 openwrt-devel@lists.openwrt.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <c6400202-25a2-e9f7-77bf-d1819d6d181b@nod.at>
Date: Sun, 28 Aug 2016 13:57:40 +0200
MIME-Version: 1.0
In-Reply-To: <20160828114445.GA1623@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel,

On 28.08.2016 13:44, Daniel Golle wrote:
> Hi Richard,
> 
> On Sun, Aug 28, 2016 at 11:28:18AM +0200, Richard Weinberger wrote:
>> Ralph,
>>
>> On 28.08.2016 11:19, Ralph Sennhauser wrote:
>>>>> On the other hand an initramfs can carry the logic to figure out
>>>>> which to mount and is what I use for my self. The busybox based
>>>>> implementation I use adds a tad over 300Kb to the uImage, perfectly
>>>>> acceptable in my case.  
>>>>
>>>> When your minimal initramfs consumes 300KiB you're doing something
>>>> wrong. As I said in another thread, for your special purpose you'd
>>>> need to create a minitmal userspace for initramfs, no fancy (eg)libc,
>>>> just a bare minimum /init program which does the mount probing.
>>>> Shouldn’t be more than a few system calls.
> 
> That would indeed be nice, however, I fail to see how this can work
> with little effort *before* having devtmpfs ready. Also, we'll need a
> non-standard kernel parameter (usually "real_root=") to pass the
> selected rootfs down to our to-be-implemented micro-sized initramfs.

devtmpfs is available in initramfs.

>>>>
>>>> Thanks,
>>>> //richard
>>>
>>> Well, I use busybox because I'm lazy and still get away with only 300Kb.
>>> And as I said there is plenty space on my device. (6M per uImage OEM
>>> firmware configuration)
>>
>> So, problem solved. Use an initramfs. :-)
> 
> I agree this might be acceptable for some, but certainly not all
> cases. Unlike to your previous statement, I'm not generally opposed
> to having an initramfs included in the kernel as that can also provide
> other nice features such as recovery/failsafe methods.
> We've had this discussion before and my goal is, as I explained, to
> make the kernel as reusable as possible and even allow people to use
> OpenWrt/LEDE's kernel binary with other distributions. I'm sure
> this is also possible when using an initramfs, however, I still fail to
> see the necessity for that on simple devices.
> Imho, using an initramfs shouldn't be mandatory which is why there are
> patches (now down to about 80 LoC, resulting in probably less than 1kB
> in added binary size) to mount the rootfs without the need of an
> initramfs, simply because I do not consider that to be a
> "complex setup" if there is no less complex and yet generic way
> imaginable to boot on that platform at all.
> Hence I'm not buying the argument that ubiX_Y and ubiblockX_Y are two
> different devices and thus, this is a device selection problem and thus
> initramfs is the recommended way -- in fact, all other filesystems
> which do *not* build upon a block device provide some probing hacks in
> early userspace. Take MTD as an example: mtdblock devices are
> automagically provided and needed for block-based filesystems, no need
> for initramfs or kernel parameters to achieve that. For UBI, ubiblock
> (or gluebi...) is required to use UBI for anything else than UBIFS.
> Anyway, I'm afraid you have made your decission and additional
> arguments have no influence what-so-ever.
> 
>>
>> </discussion>,
> 
> If that's the whole answer ("Use initramfs. End of story."), that's
> pretty disappointing. Dispite your previous invitation to discuss the
> matter and collaborate to address the needs of all parties involved,
> you are now offering only one option which is not agreeable by all
> parties (which is the obvious reason for those nasty patches to exist
> in first place). Carrying a few patches in our local overlay doesn't
> truly hurt in a technical sense, however, it'd be nicer to discuss how
> those features could be brought upstream or mitigate our local patches
> in other ways.
> In the case of not finding room for a debate and your answer is a
> straight "we don't want this feature upstream" this is never the less
> a good reference to remember when touching those patches in future:
> falls into "we tried, they didn't want it" and thus we'll keep carrying
> them around, at least as long as there are platforms needing them.

Well, it is more a "use initramfs or cmdline via bootloader or cmdline via DT"
but you refuse to use *all* of these.
I asked to discuss and explain your use case and patches on linux-mtd. You did.
We explained you how to solve your issues without the need of any kernel hack.
You refused.

You bring over and over the same arguments and we showed you every single time
that your kernel hacks are not needed and everything can be solved perfectly fine
using existing features. This is disappointing.
Discussing a patch to death does not get it merged.

So it is not a thing of not finding room for a debate. We debated all aspects
multiple times and provided solutions.

Thanks,
//richard
