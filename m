Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhPeV-0002Hm-0G
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 21:42:51 +0000
Message-ID: <552AE6C3.8040605@nod.at>
Date: Sun, 12 Apr 2015 23:42:27 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrea Scian <rnd4@dave-tech.it>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking (linux-mtd Digest,
 Vol 145, Issue 24)
References: <mailman.40253.1428858576.22890.linux-mtd@lists.infradead.org>
 <mailman.40253.1428858576.22890.linux-mtd.{2b889d2f-ba39-4abc-aea3-8920fd29865f}.0@lists.infradead.org>
 <552AA390.3070700@nod.at> <552AD8A6.6000406@dave-tech.it>
 <552ADD27.6080703@nod.at> <552AE48C.8070500@dave-tech.it>
In-Reply-To: <552AE48C.8070500@dave-tech.it>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.04.2015 um 23:33 schrieb Andrea Scian:
>>> I think is always useful to give some additional information in userspace, from both debugging and diagnostic point of view.
>> The question is, why does userspace care?
> 
> Because the userspace trigger it

As written in the previous mail, then userspace knows anyway the state.

> 
>> Other UBI operations are also not visible...
> 
> I don't really know much about UBI internals, but I think not many operation are triggered from userspace (apart from ubiformat and mount ;-) )
> 
> 
>>>> But I can add this feature, no problem.
>>> Thanks ;-)
>>>
>>> May I ask if can be useful to abort the (IMHO quite long running) operation?
>>> I think it can be useful to save power, e.g. when running on batteries: smart systems will trigger the operation when charging and aborting it if on batteries (or on low
>>> batteries).
>> If the system is running on low power mode just don't trigger the run...
>> Userspace controls it.
> 
> It heavily depends on how long the operation takes, we may have 4 to 32 GiB devices so I think it may take more than just a few minutes to scan the whole device (and additional
> time depending on how many scrub operation are needed).
> You may start the operation when power is not an issue (e.g. while charging) and when it is (e.g. when running on batteries and you need to save any mAh you have ;-) ) it may be
> still running for a while..
> I know that this is some kind of advance feature, but I would like to point this out for comments.

In such a scenario one definitely wants the emerging ioctl() interface.

>>
>>> What happens if the system need to reboot in the middle of scanning?
>> Just reboot, UBI can handle that. Work will be canceled.
> 
> Thanks for the confirm
> 
>>
>>> Probably nothing at all but I think it's worth asking ;-)
>>> Anyway I think it's better if we can, on runlevel 6, shutdown the operation in a clean way
>>>
>>> To ask a little bit more from the current implementation, can it be useful expand sysfs entry with the current status (stopped, running, completed)?
>>> In this way the userspace knows whenever the operation it has triggered, it completed successfully or something interrupt it (e.g. an internal error). I will schedule a new
>>> operation sooner if I have no evidence that the last one completed successfully.. WDYT?
>>> But maybe all of this stuff will be implemented inside a daemon with additional ioctl() (IIRC Richard already is working on this).
>> That's the plan. The interface proposed in that patch series it designed to be a simple replacement for the dd if=/dev/ubiXY of=/dev/null hack.
> 
> dd can be stopped if needed and you may also have the progress status :-)
> 
> for sure you probably don't need all of the above additional stuff but it may be useful anyway
> Maybe it's better to have an initial working implementation and add some more (backward compatible?) features later.

I agree.

BTW: Thanks a lot for your comments, Boris and Andrea!

Thanks,
//richard
