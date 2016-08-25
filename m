Received: from smtp.bredband2.com ([83.219.192.166])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcq5R-0002Gu-O6
 for linux-mtd@lists.infradead.org; Thu, 25 Aug 2016 08:32:35 +0000
Subject: Re: UBI: Race between fastmap_write and wear_leveling_worker
To: Richard Weinberger <richard@nod.at>
References: <7595faa3-6baa-a3d2-0bd6-ea0468a007f3@mazeda.se>
 <CAFLxGvxzNZqcFGfZzN4Lw28_czzKXBb0tukQrbF41HatnTMeBw@mail.gmail.com>
 <2022685b-c766-b37a-c6cb-5d662b260008@mazeda.se>
 <34d645bd-3c72-5d93-dd26-3215db9f92b9@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Anders Olofsson <pingu@mazeda.se>
Message-ID: <d05b2f1d-8fb7-d660-2855-642add16ef91@mazeda.se>
Date: Thu, 25 Aug 2016 10:32:09 +0200
MIME-Version: 1.0
In-Reply-To: <34d645bd-3c72-5d93-dd26-3215db9f92b9@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2016-08-25 09:38, Richard Weinberger wrote:
> On 25.08.2016 08:52, Anders Olofsson wrote:
>> On 2016-08-24 17:04, Richard Weinberger wrote:
>>> Anders,
>>>
>>> On Wed, Aug 24, 2016 at 1:37 PM, Anders Olofsson <pingu@mazeda.se> wrote:
>>>> After enabling fastmap I sometimes get the following warning at boot:
>>>>
>>>
>>> Hehe, you're lucky I've recently fixed an issue in this area, can you
>>> please try:
>>> http://lists.infradead.org/pipermail/linux-mtd/2016-August/068919.html
>>>
>>> I did these fixes on top of an rather old customer kernel and started
>>> upstreaming
>>> them.
>>>
>>
>> Tested it and from what I can tell it solves my problem as well. I've run a bunch of reboots and the wear leveling worker no longer runs while the fastmap is being updated.
>>
>> Good work and thanks a lot for solving it so quickly.
>
> How do you test? I wonder how you can trigger this so easily.
> The said patch emerged while a customer did excessive Fastmap testing
> and the race appeared only once. I found it while staring at the code.

I don't know what I'm doing that makes my system special. I can only 
guess it's related to the size of the UBI partition since it only 
happens on the smaller of the two partitions we use (160 PEBs vs. 1830 
in the larger partition where I've never seen this happen).
Having only 160 PEBs means the WL pool consists of only 4 PEBs if that 
could be any clue to the behaviors I'm describing here.

If size is the key, then the setup is a 20MB partition with a 8MB UBIFS 
volume in it and the only thing I need to do to trigger this is to 
attach the partition and mount the filesystem. I think my system may 
also do some small write to a file in the filesystem, but mostly just 
reading. Clean reboot or power cycle seems to work equally well in 
triggering the fault.

What I have seen is that at every boot, the wear leveling worker always 
wants to relocate one PEB and always fails. The source PEB varies but 
the target PEB is always the first one from the WL pool. The relocation 
always fails, either because the source block is unused or because it is 
locked and the handling in the worker is to always erase the destination 
PEB and this was happening while the fastmap was being updated.
This by itself sounds like a bug somewhere, there should be no need to 
erase the destination PEB when the wear leveling was aborted before 
anything was written. Since it is always the same PEB, the result is 
this PEB having a much higher erase count than the other PEBs in the 
partition.

The wear leveling always seems to happen right after attaching and the 
fastmap is also always rewritten at this time. From what I've understood 
so far from the fastmap logic, I don't see why it needs to update the 
map at every boot though, but it happens on my partition and since both 
of these happens at the same time the race occurs often enough to be 
visible as more than just a small glitch.
This behavior is of course the same with your patch. The only difference 
is that the wear leveling worker isn't allowed to run until after the 
fastmap update is completed.

I did notice the fault happening more easily while I was debugging, so 
having a lot of debug prints in the code made the race window larger, 
but I still got this at least 1/10 of every boot before adding any 
prints on the multi-core systems.


> But it is good to see that finally after years embedded Folks start
> using Fastmap and non-obvious issues can get sorted out.

I'm working on an embedded system where boot times are becoming more and 
more important. Using fastmap removes a whole second from our total boot 
time (half in boot loader and half in kernel) so this was definitely a 
good feature for us.

/Anders
