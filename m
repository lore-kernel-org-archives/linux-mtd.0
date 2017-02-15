Received: from mail-ve1eur01on0711.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::711]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdtzB-0007qS-LN
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2017 07:27:01 +0000
Subject: Re: UBI/UBIFS corruptions during random power-cuts
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
 <961abad6-7d46-4427-fb2b-97477a4a6a10@toradex.com>
 <2be57b2b-8fad-a987-8257-18f8ea024621@nod.at>
 <89cd8327-581b-4285-d9ae-138d800211cf@toradex.com>
 <bceb976b-0aac-fe04-a540-f24823366233@nod.at>
 <c5cc6f86-fb4e-cdb4-8b0b-10d4dfd33735@toradex.com>
 <5a769de2-31f1-f011-c6bc-e94427407751@nod.at>
 <a27bc761-b8d2-4f69-468a-b9a4d61c68f8@toradex.com>
 <306876cd-0855-b9ee-659d-2164cfc3b2c4@nod.at>
 <877dea3c-717d-9b1a-c01d-537f3b46b2de@toradex.com>
 <ff60b696-ffec-8ddd-16bd-407a9bacb3e0@nod.at>
 <47db4d54-f8f5-a663-75b3-d2cd5fd0769f@toradex.com>
 <c3c9dcff-5738-d36c-189d-8aa0e9be98ca@nod.at>
 <17f16834-e200-60c7-62d4-b083b00335ac@toradex.com>
 <24fa997a-ba80-efb7-231d-8d4fddcd954d@nod.at>
 <ce043ab8-2a2b-804d-ac22-67d404fc5578@toradex.com>
 <f64c07b7-3cb2-2667-7e20-fb751c54fdea@nod.at>
 <750f1307-de2d-8735-d407-ac92b001d009@toradex.com>
 <c3f9049e-545b-5740-56a8-973034df00e6@nod.at>
 <fa7157e6-5bdf-f366-f13e-6df9ae3bfecf@toradex.com>
CC: Artem Bityutskiy <dedekind1@gmail.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Message-ID: <1b2da57c-a202-df5d-f906-2e0d865d2dbb@toradex.com>
Date: Wed, 15 Feb 2017 12:52:16 +0530
MIME-Version: 1.0
In-Reply-To: <fa7157e6-5bdf-f366-f13e-6df9ae3bfecf@toradex.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/13/2017 05:15 PM, Bhuvanchandra DV wrote:
> On 02/13/2017 01:27 PM, Richard Weinberger wrote:
>
>> Bhuvan,
>>
>> Am 13.02.2017 um 04:34 schrieb Bhuvanchandra DV:
>>> On 02/10/2017 06:31 PM, Richard Weinberger wrote:
>>>
>>>> Bhuvan,
>>>>
>>>> Am 09.02.2017 um 05:59 schrieb Bhuvanchandra DV:
>>>>>> Just in case, you can trigger this also with a fresh filesystem?
>>>>>> Or did you always keep the same one?
>>>>> Yes, I triggered it with fresh filesystem.
>>>> Okay. Not good.
>>>>
>>>> How do you trigger this? What workload is running while the power-cut
>>>> happens?
>>> The issue is triggered when doing a continous external power-cut for 
>>> every
>>> 25sec since power ON. After a week or two observed this issue. There 
>>> is no
>>> additional work load on CPU during the test, it just boots to a lxde 
>>> desktop.
>> So, the power-cut happens while the system is idle? Hmm.
>
> May be not, sometimes power-cut might happen during boot. Sometimes I 
> observed
> journalctl logging just before power-cut.
>
>>
>>>> Did you try also kernel 4.9?
>>> I did ran similar testes on our downstream kernel 4.4 and 4.9 kernel 
>>> few weeks
>>> back, observed similar issues.
>> Okay, so I didn't break it lately. Puh... ;)
>
> :)
>
>>
>>>> Does it also only happen then xattrs are used?
>>> Didn't check that. How exactly to check whether xattr is used ?
>> i.e. is a LSM such das SELinux being used?
>
> No, not used so far.

I was wrong, systemd version which we use lately is enabled with access control lists(ACL).
...
[    3.324846] systemd[1]: systemd 230 running in system mode. (+PAM -AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKI)
...

Will do the test with a systemd without ACL support.

--
Bhuvan


>
> -- 
> Bhuvan
>
>>
>> Thanks,
>> //richard
>
