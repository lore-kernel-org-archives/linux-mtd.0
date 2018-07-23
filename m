Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhYv2-0001Rk-9C
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 11:22:25 +0000
From: Richard Weinberger <richard@nod.at>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS file has zeroes at the end after an unclean reboot
Date: Mon, 23 Jul 2018 13:22:08 +0200
Message-ID: <1929018.rLX3MmPisr@blindfold>
In-Reply-To: <8f54ca9aee0947d49e7e99dd11f33a74@SIWEX5A.sing.micron.com>
References: <8f54ca9aee0947d49e7e99dd11f33a74@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am Montag, 23. Juli 2018, 13:12:09 CEST schrieb Bean Huo (beanhuo):
> Hi, Richard
> Do you have good suggestions about how to prevent this condiciton: http:/=
/www.linux-mtd.infradead.org/faq/ubifs.html#L_end_hole ?

Well, I'd start with making sure that userspaces does the right thing(tm) a=
nd to
be very sure what kind of problem the user is facing.
Did you verify whether the affected program is using fsync/fdatasync?

Does your kernel include
commit 1b7fc2c0069f3864a3dda15430b7aded31c0bfcc
Author: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
Date:   Tue Sep 20 10:36:15 2016 +0200

    ubifs: Use dirty_writeback_interval value for wbuf timer
   =20
    Right now wbuf timer has hardcoded timeouts and there is no place for
    manual adjustments. Some projects / cases many need that though. Few
    file systems allow doing that by respecting dirty_writeback_interval
    that can be set using sysctl (dirty_writeback_centisecs).
   =20
    Lowering dirty_writeback_interval could be some way of dealing with user
    space apps lacking proper fsyncs. This is definitely *not* a perfect
    solution but we don't have ideal (user space) world. There were already
    advanced discussions on this matter, mostly when ext4 was introduced and
    it wasn't behaving as ext3. Anyway, the final decision was to add some
    hacks to the ext4, as trying to fix whole user space or adding new API
    was pointless.
   =20
    We can't (and shouldn't?) just follow ext4. We can't e.g. sync on close
    as this would cause too many commits and flash wearing. On the other
    hand we still should allow some trade-off between -o sync and default
    wbuf timeout. Respecting dirty_writeback_interval should allow some sane
    cutomizations if used warily.
   =20
    Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
    Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>
?

Thanks,
//richard
