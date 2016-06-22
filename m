Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFoJm-0001U2-Ja
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 20:00:11 +0000
Subject: Re: [RFC] Raising the UBI version
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57699356.4030802@nod.at> <20160622144344.07ba4d41@bbrezillon>
 <576A989A.6080502@nod.at> <20160622160118.28a4339a@bbrezillon>
 <576A9B1D.3010201@nod.at> <20160622161304.6a16da85@bbrezillon>
 <576A9EF0.9020007@nod.at> <20160622163947.36ac7f3e@bbrezillon>
 <576AA425.8070705@nod.at> <20160622165212.76c17d0a@bbrezillon>
 <576AA7E6.3040302@nod.at> <20160622170633.05321f15@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Alexander Kaplan
 <alex@nextthing.co>, Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576AEE32.5000602@nod.at>
Date: Wed, 22 Jun 2016 21:59:46 +0200
MIME-Version: 1.0
In-Reply-To: <20160622170633.05321f15@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.06.2016 um 17:06 schrieb Boris Brezillon:
> On Wed, 22 Jun 2016 16:59:50 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> Am 22.06.2016 um 16:52 schrieb Boris Brezillon:
>>> So how about defining the following:
>>> - /sys/class/ubi/version: user-space ABI version (should always be one)  
>>
>> Yes. To not break libubi.
>>
>>> - /sys/class/ubi/supported-on-flash-formats: either a bitfield or an
>>>   integer representing the higher on-flash format version supported by
>>>   the implementation (which implies that implementations have to
>>>   support all on-flash formats up-to supported-on-flash-formats)  
>>
>> We can do that. But who will evaluate this file?
> 
> ubiformat may need that one to check if the provided ubi image is
> supported by the implementation.

What if someone wants to ubiformat (with MLC support) his mtd0 on an old
kernel and then reboots into the new one with MLC support?
I'm not sure if it is wise do forbid that use case since allowing it does not
hurt.

Don't get me wrong, I just want to be sure that all new sysfs files we add
have a clear defined use case and won't hurt us later.

>>
>>> - /sys/class/ubi/supported-features: the features supported by the
>>>   implementation (each bit is a specific feature or a set of features).
>>>   The features may or may not be version dependent.
>>> - /sys/class/ubi/ubiX/on-flash-format: the on-flash format used on the
>>>   UBIX device
>>> - /sys/class/ubi/ubiX/features: the features exposed by this UBIX
>>>   device  
>>
>> I think we should make features depend on version = 2.
>> IOW when we change the UBI format in a major way version will be 3 and
>> we maybe use something else to expose features.
> 
> IIUC, we move to version 2 now, because we're using one of the padding
> byte (word?) to expose the feature flags, correct?
> It makes sense.

I'm not absolutely sure but keeping ->version and adding ->features seems
the most feasible solution so far.

Thanks,
//richard
