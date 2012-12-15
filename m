Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tjp7y-0001Ee-O1
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2012 10:37:56 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 1/3] mtd: nand/docg4: add support for writing in reliable
 mode
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
 <1354910843-5598-2-git-send-email-mikedunn@newsguy.com>
 <87hanvplmy.fsf@free.fr> <50C638B0.8060007@newsguy.com>
Date: Sat, 15 Dec 2012 11:37:43 +0100
In-Reply-To: <50C638B0.8060007@newsguy.com> (Mike Dunn's message of "Mon, 10
 Dec 2012 11:32:00 -0800")
Message-ID: <87ip83ob2g.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

Hi Mike,

Sorry for the late reply, I was taken over by work.

> Well, it's a module parameter, so the mode can't change unless the module is
> reloaded, which means everything must be umounted first, right?
Right.

>> Imagine you have your rootfs mounted on /dev/mtd2, and u-boot is in /dev/mtd1 :
>> wouldn't changing the reliable mode to write "mtd1" corrupt all writes to mtd2 ?
> I think this may only apply to docg3 (and docp3).  If I'm interpreting your
> point correctly and IIRC from working with the docp3... the docg4 doesn't have
> "planes".  Reliable mode uses *consecutive* 2k pages on the docg4, so the
> side-effects of writing in reliable mode are restricted to the adjacent page,
> not some far-away offset.  The lack of "planes" on the docg4 greatly simplifies
> things.
>
> Does this make sense?
Yes. As a side note, the reliable mode of docg3 write on consecutive 512b pages
(see log in commit c3de8a8a5a28603f8d318245992dbcda2e88a007).

>> The patch I chose to make barebox (instead of u-boot) work was to write the
>> barebox part with a special tool which "duplicates" pages, which ends up in the
>> same flash writes.
>> 
>> My feeling here is this mode should be "mtd partition bound", not driver bound
>> if you want to have it in your driver.
> My thinking is that it's a special case, probably limited to writing the SPL, so
> making it a module parameter where the user has to explicitly specify it would
> make it available to users without too much risk.  I also put a scary warning
> about it in a comment in the driver source.
OK, your choice.

As I have now the rootfs (ubifs on /dev/mtd2) on /, I cannot use docg3 as a
module and remove it anymore. Hence my hope somebody comes out with a solution
so that I have :
 - /dev/mtd1 in reliable mode (for the SPL)
 - /dev/mtd2 in normal mode (for root filesystem)

By now, I chose to use the SPL to rewrite itself (ie. barebox overwrites
/dev/mtd2 content). That's a bit sub-optimal as a fully booted kernel would be
able to make more checks (reread written blocks, check OOB signatures, ...).

> BTW, I think that my factory babdblock tables are written in reliable mode, so
> it would be useful to add support to the driver for reading in this mode as well
> (this patch only writes in reliable mode).  Data written in reliable mode can
> still be read normally from the even-numbered 2k pages (I don't recall if this
> is the case for the docg3), so I can read the factory bbt now, just not as
> reliably.
Ah good point, I will check on the docg3 how it worked, to see if they used also
the reliable mode for BBT table.

Cheers.

-- 
Robert
