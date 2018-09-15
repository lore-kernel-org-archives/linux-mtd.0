Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g152f-0006Li-HB
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2018 07:30:58 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] ubifs: drop false positive assertion
Date: Sat, 15 Sep 2018 09:30:45 +0200
Message-ID: <2674138.VomuAnzpmK@blindfold>
In-Reply-To: <20180912125138.10751-1-s.hauer@pengutronix.de>
References: <20180912125138.10751-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha,

Am Mittwoch, 12. September 2018, 14:51:38 CEST schrieb Sascha Hauer:
> The following sequence triggers
> 
> 	ubifs_assert(c, c->lst.taken_empty_lebs > 0);
> 
> at the end of ubifs_remount_fs():
> 
> mount -t ubifs /dev/ubi0_0 /mnt
> echo 1 > /sys/kernel/debug/ubifs/ubi0_0/ro_error
> umount /mnt
> mount -t ubifs -o ro /dev/ubix_y /mnt
> mount -o remount,ro /mnt

Ahh, ok. You have a unclean mount and then a read-only mount.
Therefore UBIFs is still not clean but cannot do anything about that.

> The resulting
> 
> UBIFS assert failed in ubifs_remount_fs at 1878 (pid 161)
> 
> is a false positive. In the case above c->lst.taken_empty_lebs has
> never been changed from its initial zero value. This will only happen
> when th> e deferred recovery is done.
> 
> Fix this by doing the assertion only when recovery has been done
> already.

Makes sense!

Thanks,
//richard
