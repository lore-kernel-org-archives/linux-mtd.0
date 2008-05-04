Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JsTEx-0006Ta-IN
	for linux-mtd@lists.infradead.org; Sun, 04 May 2008 01:42:12 +0000
Received: by wf-out-1314.google.com with SMTP id 28so662943wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 03 May 2008 18:42:08 -0700 (PDT)
Message-ID: <bae050c10805031842g57a7a302hf36e1060fb7a90d1@mail.gmail.com>
Date: Sun, 4 May 2008 09:42:07 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: UBI: badblock management confusion!
In-Reply-To: <4818385E.5080207@nokia.com>
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
	<bae050c10804281906h7174a282n91e3c50e2b1e7220@mail.gmail.com>
	<4818385E.5080207@nokia.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you for your informations. They do help a lot!
3 days holiday delay this reply, sorry about that delay!

On 4/30/08, Adrian Hunter <ext-adrian.hunter@nokia.com> wrote:
> Nancy wrote:
> >
> > > Well, the number of initial bad blocks does not affect how many will
> become
> > > bad over time.  So it is not part of the calculation.  For example, if
> you
> > > have 2048 PEBs and 17 are bad initially and you want to reserve 1% for
> > > (more)
> > > bad blocks then the number reserved is (2048 - 17) / 100 = 20.  That
> makes
> > > the
> > > default maximum volume size 2048 - 17 - 20 = 2011.  Whereas, if you are
> > > lucky
> > > and there are no initial bad blocks, then the number reserved for bad
> block
> > > handling is 2048 / 100 = 20, and the default maximum volume size is
> > > 2048 - 20 = 2028.
> > >
> > > Just because 17 are initially bad in the first case does not mean only 3
> > > more
> > > will become bad in the time it takes for 20 to become bad in the second
> > > case.
> > >
> > > So 20 are reserved for bad block handling in both cases.
> > >
> > No, your implement says the initial bad blocks are part of the
> > reserved badblocks. As you figure out
> >     UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for
> > bad PEB handling, reserved 19, need 20
> > just Warning, it need reserved 20, but found there's one more badblock
> > comes out during the long using time, so reserved only 19.
> > Same code, same operation. Can you tell me how UBI figure out when is
> > the real initial time?
> >
>
> Initial bad blocks is the number of bad blocks when the flash comes from
> the factory.
>
> > I think it has no way to know, it have to admit
> > each attache MTD partition time is initial time. You said initial
> > time's badblocks Nand has are not part of reserved badblocks, but the
> > practice tell it is part of reserved badblock PEBs( the warning is a
> > prof). If it is part of reserved badblocks, then why the max volume
> > size have to - current badblocks (it is already in reserved
> > badblocks). That is a waist. That is what I confused about!
> >
>
> There are two numbers and they both depend on the number of bad blocks.
>
> The two numbers are:
>
>        beb_rsvd_pebs
>        beb_rsvd_level
>
> These numbers are not written to the flash, they are calculated as follows:
>
> beb_rsvd_level is the number of good PEBs multiplied by the bad block
> handling percentage.
>
> beb_rsvd_pebs is the same as beb_rsvd_level unless there are not enough
> PEBs.  That is, if the sum of the volume sizes plus beb_rsvd_pebs is
> greater than the number of good PEBs, then beb_rsvd_pebs is reduced.
>
> So the number of PEBs reserved for bad block handling depends on the
> volume size(s) and the number of bad blocks.
>
> When a new volume is created there must be enough PEBs for it plus the
> minimum bad block handling reserve (which is 2 PEBs minimum).
>
> When a new volume is created with ubimkvol, you can use the -m option and
> the size is calculated automatically to give the biggest volume size where
> beb_rsvd_pebs = beb_rsvd_level.
>
> When the volume size is specified with ubinize you can flag it as
> "autoresize"
> and it will be increased if possible.
>
> >
> > > And that means that the maximum volume size varies.
> > >
> > > What we do here is we don't have the same partition table.  We fix the
> size
> > > of
> > > every partition except the last and let the start of each partition be
> > > adjusted
> > > if there are bad blocks.  For the last partition, it ends up being
> smaller
> > > by the
> > > total number of bad blocks.  We then use the "autoresize" of UBI to
> > > automatically
> > > fit the volume size of the last volume to the partition size.  Since our
> > > last
> > > volume is UBIFS, there is no problem because UBIFS also automatically
> > > adjusts
> > > (so long as the volume size is larger that the flashed image created by
> > > mkfs.ubifs).
> > >
> > Oh, too complicated! I don't quite understand.
> >
>
> Sorry that wasn't very clear.  Please just ignore it.
>
> > en...
> > fix size of every partition except the last!  if last partitions is
> > full of data, then it can't give any free PEBs to other volumes right?
> > or you just keep last volume blank, do not use it, like a space
> > storehouse for other volume's need, if like that, why not simply
> > reserved the last volume size.
> >
>
> The image for the last partition or volume must always be small enough to
> fit.
>
> >
> > > If you want to have the same volume size, then you can but you must make
> the
> > > size smaller than the maximum.  You will need to consult your
> documentation
> > > about what the maximum number of initial bad blocks is.  For example,
> for
> > > OneNAND with 2048 PEBs, when a OneNAND comes from the factory it may
> have
> > > as many as 40 PEBs that are bad.  So 2048 - 40 = 2008 good PEBs minimum.
> > > 2008 / 100 = 20 PEBs reserved for (more) bad blocks (assuming you use
> the 1%
> > > setting).  2008 - 20 = 1988 PEBs for the volume size.  The exact volume
> size
> > > is
> > > then 1988 * LEB size = 1988 * 258048 (in your case) = 512999424.
> > >
> >
> > Compare with reserved badblocks(including the init and future go bad)
> > by a percentage UBI user can configure by wish. What good autoresize
> > has?
> >
>
> autoresize is for when you are creating images with ubinize and you want to
> use the maximum volume size.  Because the maximum volume size depends on
> the number of bad blocks, it changes from device to device.
>
> autoresize means you can specify the worst-case volume size and tell UBI to
> make the volume bigger if there are fewer bad blocks than the worst case.
>
> If you are using ubimkvol, you can just use the -m option to get the
> maximum size.
>
> If you are using ubimkvol, you can find UBI values in /sys/class/ubi/ubix
> where x is the UBI device number (0 if you only have 1 UBI device).
>
> For example, the following is the same as using the -m option:
>
>        modprobe ubi mtd=5
>
>        ebcnt=`cat /sys/class/ubi/ubi0/avail_eraseblocks`
>        ebsize=`cat /sys/class/ubi/ubi0/eraseblock_size`
>
>        volsize=`expr $ebcnt \* $ebsize`
>
>        ubimkvol /dev/ubi0 -Nvol -s$volsize
>
>
>


-- 
Best wishes,
Nancy
