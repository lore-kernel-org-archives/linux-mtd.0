Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqfEi-0004Bk-VQ
	for linux-mtd@lists.infradead.org; Tue, 29 Apr 2008 02:06:29 +0000
Received: by wf-out-1314.google.com with SMTP id 29so4544832wff.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 19:06:27 -0700 (PDT)
Message-ID: <bae050c10804281906h7174a282n91e3c50e2b1e7220@mail.gmail.com>
Date: Tue, 29 Apr 2008 10:06:27 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: UBI: badblock management confusion!
In-Reply-To: <4815DA46.60403@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>
	<4811B6BF.9020200@nokia.com>
	<bae050c10804250508g68df553qcce03bb6551aa5c5@mail.gmail.com>
	<48158370.9090001@nokia.com>
	<bae050c10804280450g591c74bfn711f668863b693f1@mail.gmail.com>
	<4815BBDD.4090004@nokia.com>
	<bae050c10804280524o6555551cm90088d816674965b@mail.gmail.com>
	<4815DA46.60403@nokia.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Well, the number of initial bad blocks does not affect how many will become
> bad over time.  So it is not part of the calculation.  For example, if you
> have 2048 PEBs and 17 are bad initially and you want to reserve 1% for
> (more)
> bad blocks then the number reserved is (2048 - 17) / 100 = 20.  That makes
> the
> default maximum volume size 2048 - 17 - 20 = 2011.  Whereas, if you are
> lucky
> and there are no initial bad blocks, then the number reserved for bad block
> handling is 2048 / 100 = 20, and the default maximum volume size is
> 2048 - 20 = 2028.
>
> Just because 17 are initially bad in the first case does not mean only 3
> more
> will become bad in the time it takes for 20 to become bad in the second
> case.
>
> So 20 are reserved for bad block handling in both cases.
No, your implement says the initial bad blocks are part of the
reserved badblocks. As you figure out
     UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for
bad PEB handling, reserved 19, need 20
just Warning, it need reserved 20, but found there's one more badblock
comes out during the long using time, so reserved only 19.
Same code, same operation. Can you tell me how UBI figure out when is
the real initial time? I think it has no way to know, it have to admit
each attache MTD partition time is initial time. You said initial
time's badblocks Nand has are not part of reserved badblocks, but the
practice tell it is part of reserved badblock PEBs( the warning is a
prof). If it is part of reserved badblocks, then why the max volume
size have to - current badblocks (it is already in reserved
badblocks). That is a waist. That is what I confused about!


> And that means that the maximum volume size varies.
>
> What we do here is we don't have the same partition table.  We fix the size
> of
> every partition except the last and let the start of each partition be
> adjusted
> if there are bad blocks.  For the last partition, it ends up being smaller
> by the
> total number of bad blocks.  We then use the "autoresize" of UBI to
> automatically
> fit the volume size of the last volume to the partition size.  Since our
> last
> volume is UBIFS, there is no problem because UBIFS also automatically
> adjusts
> (so long as the volume size is larger that the flashed image created by
> mkfs.ubifs).
Oh, too complicated! I don't quite understand.
en...
fix size of every partition except the last!  if last partitions is
full of data, then it can't give any free PEBs to other volumes right?
or you just keep last volume blank, do not use it, like a space
storehouse for other volume's need, if like that, why not simply
reserved the last volume size.


> If you want to have the same volume size, then you can but you must make the
> size smaller than the maximum.  You will need to consult your documentation
> about what the maximum number of initial bad blocks is.  For example, for
> OneNAND with 2048 PEBs, when a OneNAND comes from the factory it may have
> as many as 40 PEBs that are bad.  So 2048 - 40 = 2008 good PEBs minimum.
> 2008 / 100 = 20 PEBs reserved for (more) bad blocks (assuming you use the 1%
> setting).  2008 - 20 = 1988 PEBs for the volume size.  The exact volume size
> is
> then 1988 * LEB size = 1988 * 258048 (in your case) = 512999424.

Compare with reserved badblocks(including the init and future go bad)
by a percentage UBI user can configure by wish. What good autoresize
has?


-- 
Best wishes,
Nancy
