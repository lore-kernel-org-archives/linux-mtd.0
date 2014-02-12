Received: from mail-ve0-x22a.google.com ([2607:f8b0:400c:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDNzb-0001Hh-FC
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 00:48:00 +0000
Received: by mail-ve0-f170.google.com with SMTP id cz12so6832669veb.15
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 16:47:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1392163570.6733.409.camel@snotra.buserror.net>
References: <52e923ea-96b0-4e9b-9c3f-b733cf46b144@CO9EHSMHS020.ehs.local>
 <1391546816.6733.172.camel@snotra.buserror.net>
 <52F247DA.2010209@monstr.eu>
 <1391627762.6733.202.camel@snotra.buserror.net>
 <155aac48-cedd-4daa-80b0-577f85080950@CO1EHSMHS005.ehs.local>
 <1392163570.6733.409.camel@snotra.buserror.net>
Date: Tue, 11 Feb 2014 16:47:36 -0800
Message-ID: <CAN8TOE_uaeGRaAWGK3TeMCx6GwTMDkEzXq_GHTOSuSzWgOxu4A@mail.gmail.com>
Subject: Re: [U-Boot] NAND bad block table
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Naveen Mamindlapalli <naveen.mamindlapalli@xilinx.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "monstr@monstr.eu" <monstr@monstr.eu>, Michal Simek <michals@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[BTW, I'm not a U-Boot subscriber, so this cross-post probably won't go through]

Hi Scott,

On Tue, Feb 11, 2014 at 4:06 PM, Scott Wood <scottwood@freescale.com> wrote:
> On Mon, 2014-02-10 at 15:05 +0000, Naveen Mamindlapalli wrote:
>> Yes, the searching of BBT happens from the end of flash when
>> NAND_BBT_USE_FLASH option is used & NAND_BBT_ABSPAGE option is not
>> used. The searching of BBT happens by scanning the last 4 blocks for
>> BBT signature starting from end block. The number of blocks to scan
>> from the end for BBT signature is defined by macro
>> NAND_BBT_SCAN_MAXBLOCKS in "include/linux/mtd/bbm.h" which is currently
>> set to value 4.
>>
>> If the last 4 blocks are factory marked bad by the vendor, then the
>> flash is not usable by u-boot or Linux. We can fix this issue by
>> changing the macro value NAND_BBT_SCAN_MAXBLOCKS to a value greater
>> than 4 (depending on the flash part) which doesn't seem to be a good
>> solution since the change has to be done to the MTD layer default
>> values.
>>
>> It would be good if there is a device tree binding to specify the
>> number of blocks to scan to check if BBT is present in the flash.
>> Currently there is no such device tree option is available.
>>
>> Thanks and Regards,
>> Naveen
>
> I see.  I wonder where the value of 4 came from -- it seems a bit small.

Not sure. The BBT uses one block for the main table and one for the
"mirror", and I assume the other two reservations were a (safe at the
time?) guess that each of those tables' eraseblock could go bad once
at some time. But yes, it's a bit small.

> The only downside of increasing NAND_BBT_SCAN_MAXBLOCKS would be a
> little extra startup latency when no BBT is present, right?

No, it also means you can no longer use those blocks for anything
else. MTD reserves them and pretends they are bad so that no one can
place data there. MTD reserves the right to reclaim any of these
blocks if one of the other BBT blocks goes bad.

As a consequence, increasing this macro potentially can break people's
existing systems if they upgrade kernels. If they were using the N-5th
block for data and you increase NAND_BBT_SCAN_MAXBLOCKS, the user
suddenly lost their data.

The NAND BBT could really use some improvements in this regard.
Perhaps a DT property is a start, so that users can specify this
parameter portably across kernel versions. But perhaps nand_bbt could
also use some work to decouple the maximum # of blocks to scan from
the act of a-priori "reserving" of blocks. It's a difficult question
to reason out, as you don't want to block the user from utilizing too
much of the flash. (And please note that we should carefully consider
the latter problem before going forward with a DT binding; it may turn
out that committing to a "max # of reserved BBT blocks" property won't
exactly make sense if we want a more comprehensive solution to this
problem.)

Brian
