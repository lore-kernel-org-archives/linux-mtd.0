Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4MWi-0006cY-P7
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 23:06:45 +0000
Received: by fg-out-1718.google.com with SMTP id e21so3386961fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Apr 2010 16:06:23 -0700 (PDT)
Subject: Re: Erase race?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
References: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Apr 2010 02:04:00 +0300
Message-Id: <1271804640.11751.1363.camel@localhost.localdomain>
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

On Tue, 2010-04-13 at 16:15 -0400, Jon Ringle wrote:
> Hi,
> I have a few machines that have UBI and UBIFS on NOR flash that are
> undergoing continuous reboot testing.
> One of them just caught the following failure:
> 
> [   51.250000] IXP4XX-Flash.0: buffer write error (status 0xd0)
> [   51.250000] UBI error: ubi_io_write: error -22 while writing 64
> bytes to PEB 226:0, written 0 bytes
> [   51.270000] UBI error: erase_worker: failed to erase PEB 226, error -22
> [   51.270000] UBI warning: ubi_ro_mode: switch to read-only mode
> [   51.290000] UBI error: do_work: work failed with error code -22
> [   51.290000] UBI error: ubi_thread: ubi_bgt0d: work failed with error code -22
> 
> Looking at this it appears that the failure might have been caused due
> to the erase_worker and ubi_io_write occurring out of order... since
> it looks like ubi_io_write was trying to write at offset 0 of the PEB,
> which I imagine would have to be the EC header, which should happen
> after the block is erased. But it doesn't seem to be the case here.

I'm out of office and have a long queue of unanswered mails, so please,
do not wait for help from me soon, and just debug this.

The erase_worker function writes the EC header after the eraseblock is
erased. IOW, I think erase_worker calls ubi_io_write, which fails with
-EINVAL for some reasons, and you see these prints. So this does not
look like a race, at least not an UBI race. If you had UBI debugging
enabled (which is a good idea), you'd have few more info and a stackdump
printed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
