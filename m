Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OOG-0008Q8-Vr
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:32:58 +0000
Message-ID: <53C670DF.5010209@nod.at>
Date: Wed, 16 Jul 2014 14:32:31 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: ubifs error at boot "bad node type"
References: <53BBC39F.7010307@gmail.com>
 <1405499347.1906.2.camel@sauron.fi.intel.com>
 <CAFLxGvwzzAAswamDJVq0UW7DLdHdgA4N_KOY9K5FhAREaFit+g@mail.gmail.com>
 <CACQ1gAjM-=ZnjFQocXq1Ygg0gN-D-1G1Q-=kZqsfm-Du7jmFow@mail.gmail.com>
In-Reply-To: <CACQ1gAjM-=ZnjFQocXq1Ygg0gN-D-1G1Q-=kZqsfm-Du7jmFow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.07.2014 14:26, schrieb Richard Genoud:
> 2014-07-16 14:02 GMT+02:00 Richard Weinberger <richard.weinberger@gmail.com>:
>> On Wed, Jul 16, 2014 at 10:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>> On Tue, 2014-07-08 at 12:10 +0200, Richard Genoud wrote:
>>>> ubiattach is ok:
>>>> # ubiattach -m 3
>>>> [   50.164062] UBI: default fastmap pool size: 95
>>>> [   50.164062] UBI: default fastmap WL pool size: 25
>>>
>>> I do not know why this happened, I never saw reports like this before.
>>> Most probably this is because of fastmap. I did not hear any report that
>>> it was extensively verified WRT power cuts, and my theory is that there
>>> is a bug in fastmap which causes this, and this may be related to power
>>> cuts. I do not have proves, but suggest you to dig in this direction.
>>> E.g., setup power-cut testing.
>>
>> The logs don't show the "attached by fastmap" message. So UBI got
>> attached by scanning.
>> So, fastmap support is here but not used.
>>
>> Only the fastmap pools are used.
> 
> Well, actually, fastmap is used on this volume when I boot from NAND.
> (and I must say, It's fast !)
> Just this time, as I boot from nfsroot, or from a unclean state,
> fastmap didn't attached UBI.
> I'll check if it's still operational.

Okay, this explains your logs.
I fear you don't have the original image anymore?
Just thinking of how to understand/analyze this issue... :-\

Thanks,
//richard
