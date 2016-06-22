Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFoho-0001y4-JM
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 20:25:01 +0000
Subject: Re: [RFC] Raising the UBI version
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57699356.4030802@nod.at> <20160622144344.07ba4d41@bbrezillon>
 <576A989A.6080502@nod.at> <20160622160118.28a4339a@bbrezillon>
 <576A9B1D.3010201@nod.at> <20160622161304.6a16da85@bbrezillon>
 <576A9EF0.9020007@nod.at> <20160622163947.36ac7f3e@bbrezillon>
 <576AA425.8070705@nod.at> <20160622165212.76c17d0a@bbrezillon>
 <576AA7E6.3040302@nod.at> <20160622170633.05321f15@bbrezillon>
 <576AEE32.5000602@nod.at> <20160622221207.2b1297d6@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Alexander Kaplan
 <alex@nextthing.co>, Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576AF405.3080803@nod.at>
Date: Wed, 22 Jun 2016 22:24:37 +0200
MIME-Version: 1.0
In-Reply-To: <20160622221207.2b1297d6@bbrezillon>
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

Am 22.06.2016 um 22:12 schrieb Boris Brezillon:
>> Don't get me wrong, I just want to be sure that all new sysfs files we add
>> have a clear defined use case and won't hurt us later.
> 
> Hm, maybe you're right, exposing this information through sysfs is not
> a requirement, but I think we need to store this information in the EC
> and/or VID headers, so that the UBI implementation can recognize the
> on-flash format.

Sure.

>>
>>>>  
>>>>> - /sys/class/ubi/supported-features: the features supported by the
>>>>>   implementation (each bit is a specific feature or a set of features).
>>>>>   The features may or may not be version dependent.
>>>>> - /sys/class/ubi/ubiX/on-flash-format: the on-flash format used on the
>>>>>   UBIX device
>>>>> - /sys/class/ubi/ubiX/features: the features exposed by this UBIX
>>>>>   device    
>>>>
>>>> I think we should make features depend on version = 2.
>>>> IOW when we change the UBI format in a major way version will be 3 and
>>>> we maybe use something else to expose features.  
>>>
>>> IIUC, we move to version 2 now, because we're using one of the padding
>>> byte (word?) to expose the feature flags, correct?
>>> It makes sense.  
>>
>> I'm not absolutely sure but keeping ->version and adding ->features seems
>> the most feasible solution so far.
> 
> Okay, let's forget what we expose through sysfs for a moment and focus
> on the on-flash format. Do we agree that it's better to keep a version
> field encoding the 'major' version of the on-flash format, and
> introducing a feature field to allow minor backward-compatible
> improvements of a given 'major' version?

Yes. That would be variant ii).

Thanks,
//richard
