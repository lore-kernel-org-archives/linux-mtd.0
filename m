Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YY9bT-0000fF-5x
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 08:45:28 +0000
Message-ID: <55093B1E.2050805@dave.eu>
From: Andrea Marson <andrea.marson@dave.eu>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest,
 Vol 144, Issue 70)
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 18 Mar 2015 08:45:29 -0000

Hello,

I would like to discuss about another couple of topics: partitioning and 
SLC emulation.

1) IIUC read/program disturb effects exhibit at block level.
In a typical embedded linux systems there are software parts - 
bootloader, kernel image etc. - that virtually are never changed (almost 
...) but are read many times. Other parts - application libraries, log 
files etc. - are read and wrote many times instead.
If these two kinds of software are stored in different MTD partitions - 
ket's say partition A for bootloader, kernel etc. and partition B for 
application libraries, log files etc. - can we say that read/write 
operations performed on partition B have no disturb effects on partition A?

2) IIUC Boris has worked on SLC emulation too. This seems to be a 
promising feature because it would allow to partition NAND flash and to 
create higher reliability partition (at the cost of halving the size). 
Is it possibile to implement such functionality in software stack 
only(MTD/UBI) or is it necessary that NAND memory supports specific 
features?

Regards,
Andrea Marson


> Very nice explanation!  Not sure if I could have done better myself.
>
> Jeff Lauruhn
> NAND Application Engineer
> Embedded Business Unit
> Micron Technology, Inc
>
>
> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: Tuesday, March 17, 2015 3:02 AM
> To: Andrea Scian
> Cc: Jeff Lauruhn (jlauruhn); Richard Weinberger; dedekind1@gmail.com; mtd_mailinglist
> Subject: Re: RFC: detect and manage power cut on MLC NAND
>
> Hi Andrea,
>
> I'll let Jeff answer this question, but I'd like to share my understanding.
>
> On Tue, 17 Mar 2015 10:30:30 +0100
> Andrea Scian <rnd4@dave-tech.it> wrote:
>
>>
>>
>> Dear Jeff,
>>
>> Il 16/03/2015 22:11, Jeff Lauruhn (jlauruhn) ha scritto:
>>> Good morning Boris;
>>> RR is a new feature and not available on all parts few.  I'm not
>>> sure about others, but since these are features, you simply enable
>>> of disable via SET FEATURE/GET FEATURE.  If you already provide that
>>> SET/GET FEATURE functionality then an end-user determine if their
>>> device supports a feature and then write the code to enable when
>>> they need it on their particular design.
>>
>> I can confirm this. In fact I'm currently working with two Micron NAND:
>>
>> MT29F32G08CBACAWP
>> MT29F32G08CBADAWP
>>
>> The latter should be "just" a newer die revision of the former (at
>> least, this is what our distributor says)
>>
>> There's a technology change between the two and, in fact, the latter
>> supports RR while there's no mention of such a feature inside rev C.
>>
>> Jeff, could you please help me in understanding which if the following
>> sentences are true and which are false?
>> - rev D is more "robust" than rev C because it has RR (so an
>> additional feature that improve error correction)
>> - rev D is "robust" like rev C, if rev D is used with RR
>> - if RR is not used rev D is more error prone than rev C
>
> RR shouldn't change NAND robustness (or sensitivity to read/write disturbance generating bitflips).
>
> AFAIU RR will help you improve your NAND lifetime, because you're allowed to change voltage thresholds which means you can fix errors that were previously considered as unfixable and lead to blocks being marked bad earlier.
>
> I'll let Jeff correct me if I'm wrong ;-).
>
>>
>> I think this is crucial to understand how RR works and how much is
>> needed inside MTD/UBI code.
>
> Hopefully this can all be handled in the MTD layer, with some help from the UBI layer to feed the wear information (number of P/E cycles on each block).
>
> Best Regards,
>
> Boris
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
>
>
