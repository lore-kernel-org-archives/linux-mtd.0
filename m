Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti94l-0004Iw-BY
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 19:31:40 +0000
Message-ID: <50C638B0.8060007@newsguy.com>
Date: Mon, 10 Dec 2012 11:32:00 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/3] mtd: nand/docg4: add support for writing in reliable
 mode
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
 <1354910843-5598-2-git-send-email-mikedunn@newsguy.com>
 <87hanvplmy.fsf@free.fr>
In-Reply-To: <87hanvplmy.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Robert.  Nice to hear from you.

On 12/09/2012 02:25 AM, Robert Jarzmik wrote:
> Mike Dunn <mikedunn@newsguy.com> writes:
> 
>> The controller on the docg4 has a "reliable" mode, where consecutive 2k pages
>> are used in parallel.  The initial program loader (IPL) on my Treo 680 expects
>> the secondary program loader (SPL) to be written in this mode.  This patch adds
>> support for writing data in reliable mode, by way of a module parameter.
>> Support for reading in this mode (as the IPL does) is not supported yet, but
>> alternate (even-numbered) 2k pages written in reliable mode can be read normally
>> (odd-numbered pages will contain junk and generate ecc errors).
> 
> Hi Mike,
> 
> I was considering adding this to the docg3 driver, but I didn't because I was
> afraid what would happen if you change this mode *after* mounting a partition.


Well, it's a module parameter, so the mode can't change unless the module is
reloaded, which means everything must be umounted first, right?


> Imagine you have your rootfs mounted on /dev/mtd2, and u-boot is in /dev/mtd1 :
> wouldn't changing the reliable mode to write "mtd1" corrupt all writes to mtd2 ?


I think this may only apply to docg3 (and docp3).  If I'm interpreting your
point correctly and IIRC from working with the docp3... the docg4 doesn't have
"planes".  Reliable mode uses *consecutive* 2k pages on the docg4, so the
side-effects of writing in reliable mode are restricted to the adjacent page,
not some far-away offset.  The lack of "planes" on the docg4 greatly simplifies
things.

Does this make sense?


> 
> The patch I chose to make barebox (instead of u-boot) work was to write the
> barebox part with a special tool which "duplicates" pages, which ends up in the
> same flash writes.
> 
> My feeling here is this mode should be "mtd partition bound", not driver bound
> if you want to have it in your driver.


My thinking is that it's a special case, probably limited to writing the SPL, so
making it a module parameter where the user has to explicitly specify it would
make it available to users without too much risk.  I also put a scary warning
about it in a comment in the driver source.

BTW, I think that my factory babdblock tables are written in reliable mode, so
it would be useful to add support to the driver for reading in this mode as well
(this patch only writes in reliable mode).  Data written in reliable mode can
still be read normally from the even-numbered 2k pages (I don't recall if this
is the case for the docg3), so I can read the factory bbt now, just not as reliably.

Thanks,
Mike
