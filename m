Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXUtL-0002LG-Ay
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 10:03:35 +0000
Message-ID: <4FBE0770.60702@nod.at>
Date: Thu, 24 May 2012 12:03:28 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
 <1337847472.15137.81.camel@sauron.fi.intel.com>
 <20120524125612.39d3e6aa@halley>
In-Reply-To: <20120524125612.39d3e6aa@halley>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24.05.2012 11:56, Shmulik Ladkani wrote:
> Hi Artem,
>
> On Thu, 24 May 2012 11:17:52 +0300 Artem Bityutskiy<dedekind1@gmail.com>  wrote:
>> On Tue, 2012-05-22 at 18:55 +0200, Richard Weinberger wrote:
>>>>> +    e = find_early_wl_entry(&ubi->free, max_pnum);
>>>>
>>>> This picks the eb with the lowest pnum within 'ubi->free'.
>>>>
>>>> When called with INT_MAX (for the FM_DATA), why do you need to pick
>>> a
>>>> free eb with the minimal pnum? The FM_DATA EBs may reside everywhere
>>> (as
>>>> the FM_SB holds their location).
>>>> So why not pick the eb with a medium EC value (as done for standard
>>>> get_peb calls)? That might be better wear-leveling wise.
>>>
>>> Fair point.
>>> I'll fix that.
>>> Artem, any comments on that?
>>
>> The 'find_early_wl_entry()' function is used (currently) only at early
>> stages. At these stages the we do not have the PEBs sorted by EC. We
>> have just a list. This function should not be use after the WL subsystem
>> is initialized.
>
> 'find_early_wl_entry' is only called from 'ubi_wl_get_fm_peb'.

Correct.

> 'ubi_wl_get_fm_peb' is called twice from within 'ubi_update_fastmap':
> First call, to get the FM_SB, with 'max_pnum' set as UBI_FM_MAX_START.
> Second, to get FM_DATA pebs, with 'max_pnum' as -1, do indicate "no
> matter the location, give me pebs from the free pool".

Correct. Maybe I should rename find_early_wl_entry() to 
find_wl_entry_for_fastmap() or something like that...

> 'ubi_update_fastmap' is called from 'ubi_volume_notify' and from
> 'ubi_wl_get_peb' - at both points, I assume ubi->free rbtree is properly
> populated. Am I mistaken?

Also correct.

Thanks,
//richard
