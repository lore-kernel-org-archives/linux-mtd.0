Received: from mail-he1eur01on0095.outbound.protection.outlook.com
 ([104.47.0.95] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Png-0008Q9-FT
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 04:52:38 +0000
Subject: Re: UBI/UBIFS corruptions during random power-cuts
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
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
 <1b2da57c-a202-df5d-f906-2e0d865d2dbb@toradex.com>
 <ad766a48-e3f5-c932-56fe-4777bf871d7c@nod.at>
 <00e8f39a-81d3-c593-0c1d-9d2614189409@toradex.com>
 <428bf369-22b7-42e0-519c-4b98af8a845a@nod.at>
 <48d2f2b5-28e4-8d90-5fe6-6e3e4cbc383d@toradex.com>
CC: Artem Bityutskiy <dedekind1@gmail.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Message-ID: <dc7dce73-c83f-ad5b-a8de-bee951c6afbe@toradex.com>
Date: Tue, 2 May 2017 10:17:43 +0530
MIME-Version: 1.0
In-Reply-To: <48d2f2b5-28e4-8d90-5fe6-6e3e4cbc383d@toradex.com>
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

Hello Richard,

On 02/16/2017 09:46 AM, Bhuvanchandra DV wrote:

> On 02/15/2017 08:44 PM, Richard Weinberger wrote:
>
>> Am 15.02.2017 um 16:06 schrieb Bhuvanchandra DV:
>>> On 02/15/2017 02:42 PM, Richard Weinberger wrote:
>>>
>>>> Am 15.02.2017 um 08:22 schrieb Bhuvanchandra DV:
>>>>> I was wrong, systemd version which we use lately is enabled with 
>>>>> access control lists(ACL).
>>>>> ...
>>>>> [    3.324846] systemd[1]: systemd 230 running in system mode. 
>>>>> (+PAM -AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP 
>>>>> -LIBCRYPTSETUP -GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP
>>>>> +BLKI)
>>>>> ...
>>>>>
>>>>> Will do the test with a systemd without ACL support.
>>>> Well, do files have xattrs?
>>>> See getfattr.
>>>> I'm trying to understand why your system makes so different.
>>> systemd's journald uses ACL, the journald's logs files seems to have 
>>> extended attributes.
>>>
>>> root@colibri-vf:~# getfattr -R 
>>> /var/log/journal/3e283b492ea046a29683c0801ceaba91
>>> getfattr: Removing leading '/' from absolute path names
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@000547ec00621f43-a0f5cd8e864efc36.journal~
>>> user.crtime_usec
>>>
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@000547ec25f38147-3ede62d61071df3c.journal~
>>> user.crtime_usec
>>>
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@0820e4037f504446ad35bb362be7b809-0000000000000001-l
>>> user.crtime_usec
>>>
>>> # file: var/log/journal/3e283b492ea046a29683c0801ceaba91/system.journal
>>> user.crtime_usec
>>>
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@37549ee306da42479500fb717cb2dada-0000000000000001-l
>>> user.crtime_usec
>>>
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@000547ecafe0f654-e0c2574255c05aed.journal~
>>> user.crtime_usec
>>>
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@000547ec78bce8a1-02b48f08c5d6a410.journal~
>>> user.crtime_usec
>>>
>>> # file: 
>>> var/log/journal/3e283b492ea046a29683c0801ceaba91/system@0005488c6421da38-c4690dc0bb71068f.journal~
>>> user.crtime_usec
>> Hmm, not sure whether systemd journal triggers such a bug in UBIFS.
>> Anyway, can you provide me a UBIFS image after a failure?
>> A dd from the UBI volume (i.e. /dev/ubiX_Y) will do it.
>>
>> Maybe it can give me some hint.
>
> Here[1] is the raw image of the corrupted UBI volume.
>
>
> [1] https://share.toradex.com/xbczmjz0b2pntfv

The UBI/UBIFs corruption issue is still there even, with/without xattar,
we disabled systemd ACL support and ran the power-cut tests.
Tests are done on our down stream kernel and mainline kernel.

Here are the logs:

Kernel v4.4.59 without ACL:
https://pastebin.com/8MUrzqsL

Mainline kernel 4.11.0-rc4 without ACL:
https://pastebin.com/g0qJN7rJ

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
