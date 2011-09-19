Received: from blu0-omc1-s6.blu0.hotmail.com ([65.55.116.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5kKj-0003yT-NB
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 20:20:54 +0000
Message-ID: <BLU0-SMTP67284C899E8D810036835EB80B0@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: dedekind1@gmail.com
Subject: Re: RomFS MTD and NAND Flash with ECC (EUCLEAN).
References: <BLU0-SMTP394611D4685CA5AE953006B8060@phx.gbl>
	<1316408751.24366.55.camel@sauron>
Date: Mon, 19 Sep 2011 16:19:11 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 Sep 2011, dedekind1@gmail.com wrote:

On Fri, 2011-09-16 at 16:46 -0400, Bill Pringlemeir wrote:
>>  #ifdef CONFIG_ROMFS_ON_MTD
>> -#define ROMFS_MTD_READ(sb, ...) ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__))
>> -
>> +#define ROMFS_MTD_READ(sb, ...)                                        \
>> +    ({ int res;                                                        \
>> +        res = ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__)) == -EUCLEAN ? \
>> +            0 : res; })                                                         

> I do not think this is the most elegant way to handle this, but yes,
> EUCLEAN is used nowadays to report about bit-flips, which are actually
> not an error, more like an info that this eraseblock needs some
> attention.

Good.  Neither do I.  Sometimes code is better at describing a problem.

> I am not sure MTD is the right subsystem for this patch, could you try
> to send it to fs-devel / Al Viro instead?

I kind of thought it was not a good patch.  I will try to rework it.
Now, I am sure of 'EUCLEAN's meaning.  I also observe that my romfs
works fine with a NAND flash if the BLOCK device is used.

Currently the romfs code is making a decision based on...

   int romfs_dev_read(struct super_block *sb, unsigned long pos,
   ...
       if (sb->s_mtd)
          return romfs_mtd_read(sb, pos, buf, buflen);

The NAND flash will not map directly to a CPU memory space like a NOR
flash.  I *think* the main benefit of this MTD is for the non-MMU in
directly mapping files?  What is the benefit of using the MTD versus the
block device for NAND flash?  [I think that is not a fs-devel
question...].

Can we look at sb->s_mtd->type for 'MTD_NANDFLASH' (etc) and bind a vptr
in romfs_get_sb(), so that 'romfs_dev_*()' would actually be function
pointers.  Then NAND and NOR mtd's could both have a RomFS on the same
system.  Err that only makes sense if I can get an answer to the last
question.

Also, it is not the place of RomFs to be writing flash.  However, if
there is an EUCLEAN return code, is it worth a printk?

tia,
Bill Pringlemeir.

-- 
It is reasoning and faith that bind truth .  - Rod Ryker...

-- 
A mind  that is stretched  to a new  idea never returns to  its original
dimension - Anonymous
