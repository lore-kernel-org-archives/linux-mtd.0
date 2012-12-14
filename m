Received: from mail.pce.us.com ([69.40.160.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TjLBv-0004K9-5M
 for linux-mtd@lists.infradead.org; Fri, 14 Dec 2012 02:39:59 +0000
Message-ID: <50CA917C.6070408@itwatchdogs.com>
Date: Thu, 13 Dec 2012 20:39:56 -0600
From: Zach Sadecki <zsadecki@itwatchdogs.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
 <1355398036.3400.45.camel@sauron.fi.intel.com>
In-Reply-To: <1355398036.3400.45.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/13/2012 05:27 AM, Artem Bityutskiy wrote:
> On Mon, 2012-12-10 at 09:18 -0600, Zach Sadecki wrote:
>> Always report corrected and failed ECC stats back up to the MTD layer.  Also
>> return max_bitflips from read_page() as is expected from NAND drivers now.
>>
>> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
>> Acked-by: Huang Shijie <b32955 at freescale.com>
>> ---
> Dunno, may be your patch is corrupted or something. Try to save it and
> apply. This is what I get:
>
> $ git apply --check ~/tmp/zach.mbox
> error: patch failed: drivers/mtd/nand/gpmi-nand/gpmi-nand.c:921
> error: drivers/mtd/nand/gpmi-nand/gpmi-nand.c: patch does not apply
>
> $ git log -1 --oneline
> 70df8b3 mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND startup problems
>
> I've attached the zach.mbox file for you.
>
OK.  I rebased the patch on the latest l2-mtd and I tested it with git 
apply, so this one should work...

Sent as a separate reply with only the patch in it.
