Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdyVG-0006ah-6U
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2012 06:53:30 +0000
Received: by dadm1 with SMTP id m1so5474876dad.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 23:53:28 -0700 (PDT)
Message-ID: <4FD595E5.6070309@gmail.com>
Date: Sun, 10 Jun 2012 23:53:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] mtd: nand: ignore ecc errors during bbt reads
References: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
 <20120610145004.702d24d7@pixies.home.jungo.com>
 <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
 <20120611094117.73145dda@pixies.home.jungo.com>
In-Reply-To: <20120611094117.73145dda@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/10/2012 11:41 PM, Shmulik Ladkani wrote:
> Thanks Brian for your comments,

You're welcome. And thanks for the interest in reviewing the code. Few 
people actually delve into nand_bbt.c, it seems :)

> On Sun, 10 Jun 2012 22:45:50 -0700 Brian Norris<computersforpeace@gmail.com>  wrote:
>>> Why not use 'MTD_OPS_RAW' in 'scan_block_fast()' as well (as done in
>>> 'scan_block_full')?
>>
>> Because when ECC is available on OOB, it is good to utilize it, so
>> that bitflips don't cause good blocks to be marked bad. Less
>> importantly, when bad block markers are written by Linux (with ECC),
>> then these markers can be read back more reliably.
>
> Ok (due to the second reason, as we're discussing the BBM read
> implementation).

I guess I worded my 'first' reason a little wrong. I meant: so that 
bitflips don't cause good blocks (0xff) to be read as bad blocks 
(bitflip => non-0xff). I think this would be far more significant, as a 
single bitflip in the BBM byte could cause errors.

>> So, I can send a patch that straightens out naming and brings
>> scan_block_fast() and scan_block_full() into alignment on using
>> MTD_OPS_PLACE_OOB. Then I think that we should continue using this
>> code in both:
>>                  /* Ignore ECC errors when checking for BBM */
>>                  if (ret&&  !mtd_is_bitflip_or_eccerr(ret))
>
> Sounds reasonable.

OK, I'll do that this week.

>> And we can (as agreed previously?) avoid using/checking max_bitflips
>> in mtd_read_oob(), although there is the datbuf+oob case that calls
>> nand_do_read_ops...
>
> This is a separate thing that needs to be addressed.
> See my findings in [1].

Right, I saw both threads kinda simultaneously. It looks like Mike may 
need to add some max_bitflips logic to mtd_read_oob after all.

Brian
