Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcC7t-0003vO-M4
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 06:20:45 +0000
Received: by fxm1 with SMTP id 1so2173689fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 22:20:40 -0800 (PST)
Subject: Re: static vs. dynamic UBI volume
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61001190641l14a0603kfe9b45f52576da60@mail.gmail.com>
References: <dbdb2ea61001190641l14a0603kfe9b45f52576da60@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 08:20:37 +0200
Message-Id: <1265091637.2517.30.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2010-01-19 at 09:41 -0500, twebb wrote:
> Can a UBI volume be declared vol_type=static, but mounted with "ro"?

Yes. Static volumes are not writable, so this is the only way they can
be mounted.

> Conversely, if a volume is declared vol_type=dynamic, is it acceptable
> to mount "ro" or "rw"?

Yes. Dynamic volumes are writable, so you can choose R/O or R/W.

> I'm seeing a very occasional problem on a volume that is
> vol_type=dynamic, and is mounted "rw" during startup, then finally
> "ro".

If UBIFS switches to R/O mode, this means there is some problem, e.g.,
there are unexpected corruptions, etc. Switching to R/O mode is a
defensive measure.

>   The ubiattach works fine, but when trying to initially mount
> (as "rw"), I've seen...
> 
> [   12.887251] UBI error: ubi_io_read: error -74 while reading 516096
> bytes from PEB 4:8192, read 516096 bytes

-74 is -EBADMSG. It is returned by the MTD driver and should mean that
the driver found an unrecoverable ECC error.

UBIFS is reading whole LEB. MTD returns -EBADMSG. So somewhere in these
516096 bytes of data an unrecoverable ECC error happened.

But UBIFS does not give up. It's logic is that "I have everything
protected by CRC32, if there are problems, I'll detect them". So UBIFS
continues.

> [   12.897619] UBIFS error (pid 1): ubifs_scan: corrupt empty space at
> LEB 2:268135

So UBIFS continues. I probably finds valid nodes, or may be not. Anyway,
UBIFS sees that 0xFF bytes, and concludes the rest of the LEB should
contain only 0xFFs, i.e., empty space.

However, at offset 268135 UBIFS findes non-0xFFs, which is invalid.

If you followed my instructions here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

You would have hexdump of the data and we could see what is in the
buffer. It could help.

> [   12.905060] UBIFS error (pid 1): ubifs_scanned_corruption:
> corruption at LEB 2:268135
> [   12.922940] UBIFS error (pid 1): ubifs_scan: LEB 2 scanning failed
> [   13.048269] UBI error: ubi_io_read: error -74 while reading 516096
> bytes from PEB 4:8192, read 516096 bytes
> [   13.058549] UBIFS error (pid 1): ubifs_recover_master_node: failed
> to recover master node

And UBIFS does not know how to proceed with that.

> Not sure if this is corruption within NAND or something else.

May be something specific to MLC. May be a bug in the NAND driver. May
be a bug in UBIFS. May be you made some mistake at some point, dunno.

Is this reproducible?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
