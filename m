Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVedq-00071r-5d
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 18:55:27 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Zhang, Jian" <jzhang@ti.com>
In-Reply-To: <BA2832125C3C994384FCC051CDFC73690F4197@dlee2k05.ent.ti.com>
References: <BA2832125C3C994384FCC051CDFC73690F4197@dlee2k05.ent.ti.com>
Content-Type: text/plain
Message-Id: <1086216922.26119.869.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 02 Jun 2004 23:55:23 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: stable MTD snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-06-02 at 17:48 -0500, Zhang, Jian wrote:
> My reply to David's question has been bounced back twice. I still don't
> know how to configure outlook to reply in the way the list server likes.
> So I restart it.

Either use it in IMAP mode (you can do that even while it's talking to
the Exchange server, I'm told) or use a real, standards-compliant mail
program instead. Starting a new broken-thread without 'Re:' in the
subject line deliberately to get round the automatic filters will just
get you into the blacklist. :)

Talk to your IS department. Surely they have a responsibility to provide
you with a configuration which allows you to behave as a responsible
citizen in your interaction with the outside world?

> I have tried a few snapshots and encountered either compile failure or
> run-time errors. Can someone point me to a daily MTD snapshot that is
> known to pass compilation and do not have major issue with JFFS2 on
> NAND?

There's been quite a bit of work on the NAND drivers recently. Look at
the linux-mtd-cvs list archives and pick a date before the recent flurry
of activity, or try current CVS.

> 20040518:
> I was able to mount an empty NAND partition. The partition was
> erased/prepared by U-Boot. JFFS2 clean marker was programmed to OOB
> area. I could mount it cleanly. But I got message "jffs2: No clean,
> dirty _or_ erasable blocks to GC from! Where are they all" when I
> created a file. A 192K file was truncated after umount/re-mount. Files
> even disappeared after umount/re-mount.

If you can reproduce this today, it would be interesting to do so with
'CONFIG_JFFS2_FS_DEBUG=1' while you're writing and subsequently
remounting and trying to read the file. 

> 20040526:
> Kernel doesn't build because nand.c has compile error in
> single_erase_cmd()

Less interesting.

> 20040531:
> Kernel builds but I got I/O error when mounting a partition. The
> underlying MTD NAND driver works since I am able to read/write MTD
> nodes.

Can you be more precise about what happens? 

-- 
dwmw2
