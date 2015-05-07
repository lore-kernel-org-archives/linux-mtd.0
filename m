Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqCTN-0004Kr-IN
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 03:27:43 +0000
Received: by pabtp1 with SMTP id tp1so27619321pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 20:27:20 -0700 (PDT)
Date: Wed, 6 May 2015 20:27:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
Message-ID: <20150507032712.GA6055@norris-Latitude-E6410>
References: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
 <20150429214648.GF32500@ld-irv-0074>
 <20150430173659.GA30177@bshelton-desktop>
 <CAOiHx==fAPcji2=zjmO+m6yBX1xgB83XQk4+WgYgop=L4uZq7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx==fAPcji2=zjmO+m6yBX1xgB83XQk4+WgYgop=L4uZq7Q@mail.gmail.com>
Cc: Ben Shelton <ben.shelton@ni.com>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 01, 2015 at 01:57:13PM +0200, Jonas Gorski wrote:
> On Thu, Apr 30, 2015 at 7:36 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> > The reason for doing this as a Kconfig option rather than with an additional
> > partition is that we use the same .itb boot image (and kernel arguments) for
> > a series of embedded controllers that have different NAND flash sizes, and we
> > use the '-' command line parameter to give the root partition all the available
> > space after the other partitions.
> 
> Wouldn't it make more sense to make cmdlineparts to recognize if it is
> run on a nand flash that has on-flash BBT enabled, and then reduce the
> SIZE_REMAINING partition's size by the amount of nand_bbt_descr's
> maxblocks * erase block size?

That's a possibility, but that seems like a bit too much hidden policy
to add on top of the cmdlineparts format, which is pretty precise.

A better improvement, if you're dead set on using cmdlineparts rather
than some other better parser, might be to support something like:

  mtdparts=name:-(main),bbt(1M)

So the "remaining space" partition will allow for following partitions.
IOW, you would need to handle this case, which is currently an error:

        /* test if more partitions are following */
        if (*s == ',') {
                if (size == SIZE_REMAINING) {
                        printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
                        return ERR_PTR(-EINVAL);
                }
		...
	}

> Currently your proposed solution would break if boards have differing
> erase block sizes, or if some have NOR flash, which makes it an option
> for a rather narrow use case IMHO.

Yeah, consider this a NAK for the current patch.

Brian
