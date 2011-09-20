Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5uuf-00005X-MC
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 07:38:42 +0000
Received: by wwp14 with SMTP id 14so218269wwp.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 00:38:40 -0700 (PDT)
Subject: Re: RomFS MTD and NAND Flash with ECC (EUCLEAN).
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Pringlemeir <bpringle@sympatico.ca>
Date: Tue, 20 Sep 2011 10:41:20 +0300
In-Reply-To: <BLU0-SMTP67284C899E8D810036835EB80B0@phx.gbl>
References: <BLU0-SMTP394611D4685CA5AE953006B8060@phx.gbl>
	<1316408751.24366.55.camel@sauron>
	<BLU0-SMTP67284C899E8D810036835EB80B0@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316504487.4849.47.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-09-19 at 16:19 -0400, Bill Pringlemeir wrote:
> On 19 Sep 2011, dedekind1@gmail.com wrote:
> 
> On Fri, 2011-09-16 at 16:46 -0400, Bill Pringlemeir wrote:
> >>  #ifdef CONFIG_ROMFS_ON_MTD
> >> -#define ROMFS_MTD_READ(sb, ...) ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__))
> >> -
> >> +#define ROMFS_MTD_READ(sb, ...)                                        \
> >> +    ({ int res;                                                        \
> >> +        res = ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__)) == -EUCLEAN ? \
> >> +            0 : res; })                                                         
> 
> > I do not think this is the most elegant way to handle this, but yes,
> > EUCLEAN is used nowadays to report about bit-flips, which are actually
> > not an error, more like an info that this eraseblock needs some
> > attention.
> 
> Good.  Neither do I.  Sometimes code is better at describing a problem.
> 
> > I am not sure MTD is the right subsystem for this patch, could you try
> > to send it to fs-devel / Al Viro instead?
> 
> I kind of thought it was not a good patch. 

|I did not mean this patch is bad, on the opposite - it looks to be of
"similar style" as ROMFS. I just meant that this patch is for a
file-system, so most probably should go in via Al Viro. Feel free to put
me to CC when re-sending.

>  I will try to rework it.
> Now, I am sure of 'EUCLEAN's meaning.  I also observe that my romfs
> works fine with a NAND flash if the BLOCK device is used.
> 
> Currently the romfs code is making a decision based on...
> 
>    int romfs_dev_read(struct super_block *sb, unsigned long pos,
>    ...
>        if (sb->s_mtd)
>           return romfs_mtd_read(sb, pos, buf, buflen);
> 
> The NAND flash will not map directly to a CPU memory space like a NOR
> flash.  I *think* the main benefit of this MTD is for the non-MMU in
> directly mapping files?  What is the benefit of using the MTD versus the
> block device for NAND flash?  [I think that is not a fs-devel
> question...].

For R/O FS there is probably not much benefits, except of less layers ->
a bit faster.

> Also, it is not the place of RomFs to be writing flash.  However, if
> there is an EUCLEAN return code, is it worth a printk?

On the one hand, bit-flips happen very often in modern flashes, so if
you print a message on every bit-flip, you may have a lot of messages.

On the other hand, if you use RomFS on a modern flash, you are probably
doing wrong thing because it is unable to handle bit-flips. You should
rather use it on top of UBI. So printing messages is good, because it
would make the user to start thinking about an issue.

So I'd say, overall I think printing a warning is a good idea.


-- 
Best Regards,
Artem Bityutskiy
