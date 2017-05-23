Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD68i-0004dN-2W
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 09:30:05 +0000
Received: by mail-oi0-x236.google.com with SMTP id h4so193593890oib.3
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 02:29:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALtMJEBb19Etkds1wVtBgOOzEC7g8NZOk2SMNXiVQORLoEH2CQ@mail.gmail.com>
References: <CALtMJEBb19Etkds1wVtBgOOzEC7g8NZOk2SMNXiVQORLoEH2CQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 23 May 2017 11:29:42 +0200
Message-ID: <CAFLxGvw6hyeqdJhwhVEM2Xh=LvL-pK6W5uriRDkD=cLTqCq8ng@mail.gmail.com>
Subject: Re: howto mark blocks with correctable bitflip errors as bad blocks
 explicitly
To: Andreas Fenkart <afenkart@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andreas,

On Tue, May 23, 2017 at 11:18 AM, Andreas Fenkart <afenkart@gmail.com> wrote:
> Hi list,
>
> Is there a way to mark a block as bad explicitly with one of the
> nandwrite/nandtest tools?

Not explicitly. AFAIK nandtest marks a block as bad if erasure fails.
But you can create a tiny c program and use the MEMSETBADBLOCK
ioctl().

You should set a block as bad only as last resort and when you are really
sure that the block is bad.

> I had a device that reports bitflip errors, and I had the suspicion that
> the u-boot is not correcting those errors, hence it fails to verify the CRC
> checksum in the uimage header.
>
> $ nanddump --bb=skipbad --omitoob -l ${FSIZE} ${PART} -f $TMPFILE
> ECC failed: 0
> ECC corrected: 5
> Number of bad blocks: 0
> Number of bbt blocks: 0
> ECC: 1 corrected bitflip(s) at offset 0x003da000

A single bitflip should be no problem for any ECC engine. :)

> The problem happened on a remote system and I don't have access to the
> console. I made a custom tool to mark that single block as bad and now,
> u-boot is booting the new kernel. Hence it seems u-boot has is not able to
> recover the same errors as the kernel. Probably it uses a weaker ECC
> algorithm. (need to verify check this)

Please double check. Marking blocks as bad is not a good solution.

> Since there are other installations, I would like to automate marking
> bitflips as errors too. Does this make sense?  I don't want to update u-boot
> and using a stronger ECC still makes sense for the rootfs that u-boot is not
> accessing.
>
> Is there already a tool that can do that automatically?  What would be the best
> place to add such a function?

Please no. Correctable bitflips are perfectly fine and can happen all the time.
If you're using UBI it will test blocks and mark them as bad if they really turn
out to be bad.

> I was looking into nandtest and wanted to add some '--zero-error' flag to mark
> buffers with recovered ECC errors as bad forcefully. Unfortunately nandtest
> does not report those bitflip errors at all.
>
> Everytime nandump reports a bitflip error the 'ECC failed' counter increases on
> the next run. But when running nandtest it never does. Maybe it's because
> nanddump reads it min_io_size chunks while nandtest reads back the whole erase
> block.

What NAND driver is that? To me it seems like your ECC setup has problems.

-- 
Thanks,
//richard
