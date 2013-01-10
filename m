Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tt8pV-0004c8-Dg
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2013 03:29:22 +0000
Message-ID: <50EE356A.1000108@freescale.com>
Date: Thu, 10 Jan 2013 11:28:42 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
 <1355398036.3400.45.camel@sauron.fi.intel.com>
 <50CA917C.6070408@itwatchdogs.com>
In-Reply-To: <50CA917C.6070408@itwatchdogs.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B412=E6=9C=8814=E6=97=A5 10:39, Zach Sadecki =E5=86=99=
=E9=81=93:
> On 12/13/2012 05:27 AM, Artem Bityutskiy wrote:
>> On Mon, 2012-12-10 at 09:18 -0600, Zach Sadecki wrote:
>>> Always report corrected and failed ECC stats back up to the MTD=20
>>> layer. Also
>>> return max_bitflips from read_page() as is expected from NAND=20
>>> drivers now.
>>>
>>> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
>>> Acked-by: Huang Shijie <b32955 at freescale.com>
>>> ---
>> Dunno, may be your patch is corrupted or something. Try to save it and
>> apply. This is what I get:
>>
>> $ git apply --check ~/tmp/zach.mbox
>> error: patch failed: drivers/mtd/nand/gpmi-nand/gpmi-nand.c:921
>> error: drivers/mtd/nand/gpmi-nand/gpmi-nand.c: patch does not apply
>>
>> $ git log -1 --oneline
>> 70df8b3 mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND=20
>> startup problems
>>
>> I've attached the zach.mbox file for you.
>>
> OK. I rebased the patch on the latest l2-mtd and I tested it with git=20
> apply, so this one should work...
>
> Sent as a separate reply with only the patch in it.
Dear Zach,
I think you'd better check the patch with /scripts/checkpatch.pl before=20
you send out the patch.
I saw many "trailing whitespace" in your patch.

thanks.

Huang Shijie
