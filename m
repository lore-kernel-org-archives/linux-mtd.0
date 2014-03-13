Received: from mail-de.keymile.com ([195.8.104.250])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO5yL-0000gr-DX
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 13:46:58 +0000
Message-ID: <5321B6AE.1050401@keymile.com>
Date: Thu, 13 Mar 2014 14:46:22 +0100
From: Gerlando Falauto <gerlando.falauto@keymile.com>
MIME-Version: 1.0
To: Austin Boyle <boyle.austin@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Flash protection support for STmicro chips
References: <1357257748.31023.12.camel@pc786-ubu.GNET.GLOBAL.VPN>
 <528D15B6.2030800@keymile.com> <530F4CDE.7010205@keymile.com>
 <20140305081008.GP13420@norris-Latitude-E6410>
 <20140305083153.GR13420@norris-Latitude-E6410>
 <CADnxWiqfaaRoaL+B_WQxx38-gpSDmdFQPLN-bs-moGRECXeJxg@mail.gmail.com>
 <531D80AB.5010209@keymile.com>
 <alpine.DEB.2.02.1403132239490.4383@austin-Satellite-L510>
In-Reply-To: <alpine.DEB.2.02.1403132239490.4383@austin-Satellite-L510>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Angus Clark <angus.clark@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 03/13/2014 01:57 PM, Austin Boyle wrote:
>
> Hi Gerlando,
[...]

>
>> In my opinion, we're breaking something here (call it userspace API or
>> otherwise). My suggestion would then be to make it an optional feature to be
>> explicitly enabled on the device tree, like Heicho did for CFI flashes:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2013-January/045536.html
>>
>> Or I guess another way would be to implement the _is_locked() function, so to
>> have the userspace tools check the locking status before unlocking, and only
>> lock it again if was locked in the first place.
>> It wouldn't fix my issue right away (as the userspace tools don't currenctly
>> perform this check), but at least it would provide some way out here without
>> breaking compatibility with the existing u-boot.
>>
> I prefer this suggestion of implementing _is_locked(). It is a simple
> change so may as well be done while fixing the lock/unlock code anyway.

I agree, plus it would be useful anyway (btw, shouldn't that be a 
requirement anyway?).
There is one thing I don't understand though.
The _lock()/_unlock()/_is_locked() functions will take arbitrary ranges 
of flash, whereas the BP only allows you to lock predefined portions of 
it (or, let's say, from a discrete number of predefined starting points 
up to the end).
What should be the expected behavior resp. return value when the 
specified portion crosses one of the starting points (resp. the current 
starting point)?

> One could say it is counterintuitive for ioctl(MEMLOCK) not to work
> without previous configuration, as in the first suggestion. If people are
> passionate about making the feature configurable it could be done
> separately once we've fixed the logic with _lock/_unlock and
> adding _is_locked.

Don't know how this falls into the whole device tree logic, but we could 
also have it default to "enabled", and provide a specific way to 
explicitly disable the feature.

> I will submit a change to the u-boot env tool to check the locking state
> if supported and restore the same state after - obviously more
> correct, regardless of the decision made here.

That would be great, thank you!
Back to my point above, I believe it should be put in a way so that no 
matter what the initial protection status, the whole sequence 
(check/unlock/lock) should put you back in the same status as before.
Not sure if/how this would be at all feasible though, especially if your 
u-boot environment(s) is(are) stored at very weird locations.

> Not ideal but in the meantime if someone needs to ensure the device is
> unlocked they can run the flash_unlock from mtd-utils after writing u-boot
> environment variables from the userspace tool. (Call it a user space
> work around for a user space bug?)

Definitely better than having to throw the whole board away ;-)

>
>> Uhm, I believe it should read like this (unprotected portion is of course "n
>> - protected portion"):
>>
>> SR BPs | Protected portion
>> ---------------------------
>>   0    | 0/n
>>   1    | 1/n
>>   2    | 2/n
>>   3    | min(4,n)/n
>>   4    | min(8,n)/n
>>   5    | min(16,n)/n
>>   6    | min(32,n)/n
>>   7    | min(64,n)/n
>>
> Yes sorry that was a typo in the previous email, should have been powers
> of 2 as above and the patch. Also technically correct about the min macro,
> as you saw I was just terminating the loop before that condition was met.
>
>>> A patch with this implementation follows. Let me know what you think. I
>>> have a spreadsheet summarising the block protect bits for the STmicro
>>> devices I can share if it will help.
>>
>> Could you please share this?
> It sounds like you have already done your own research but here is what I
> have:
> https://docs.google.com/spreadsheet/ccc?key=0AhKBO-EQCLLkdGR1Q05qLUs2RURsMFA4V2s2X1llY3c&usp=sharing

Thank you... BTW, I had only opened 2-3 datasheets, did not go through 
the whole family as you did. ;-)

> Thanks for your comments on this issue and patch. I will resubmit
> another version addressing your points soon.

Thank you for taking my complaints upon yourself ;-)

Best,
Gerlando
