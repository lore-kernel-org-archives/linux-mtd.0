Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6kRc-00055t-Tm
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 13:03:21 +0000
Subject: Re: Erase race?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <z2z152584231004201324tc69525a0hb86ff9fdeb679ca4@mail.gmail.com>
References: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
	<z2z152584231004201324tc69525a0hb86ff9fdeb679ca4@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 15:59:02 +0300
Message-ID: <1272373142.7750.5.camel@localhost>
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

On Tue, 2010-04-20 at 16:24 -0400, Jon Ringle wrote:
> On Tue, Apr 13, 2010 at 4:15 PM, Jon Ringle <jon@ringle.org> wrote:
> > Hi,
> > I have a few machines that have UBI and UBIFS on NOR flash that are
> > undergoing continuous reboot testing.
> > One of them just caught the following failure:
> >
> > [   51.250000] IXP4XX-Flash.0: buffer write error (status 0xd0)
> > [   51.250000] UBI error: ubi_io_write: error -22 while writing 64
> > bytes to PEB 226:0, written 0 bytes
> > [   51.270000] UBI error: erase_worker: failed to erase PEB 226, error -22
> > [   51.270000] UBI warning: ubi_ro_mode: switch to read-only mode
> > [   51.290000] UBI error: do_work: work failed with error code -22
> > [   51.290000] UBI error: ubi_thread: ubi_bgt0d: work failed with error code -22
> >
> > Looking at this it appears that the failure might have been caused due
> > to the erase_worker and ubi_io_write occurring out of order... since
> > it looks like ubi_io_write was trying to write at offset 0 of the PEB,
> > which I imagine would have to be the EC header, which should happen
> > after the block is erased. But it doesn't seem to be the case here.
> 
> I had this issue occur again on another system:
> [   48.250000] IXP4XX-Flash.0: buffer write error (status 0xd0)
> [   48.250000] UBI error: ubi_io_write: error -22 while writing 64
> bytes to PEB 111:0, written 0 bytes
> [   48.280000] UBI error: erase_worker: failed to erase PEB 111, error -22
> [   48.280000] UBI warning: ubi_ro_mode: switch to read-only mode
> [   48.310000] UBI error: do_work: work failed with error code -22
> [   48.310000] UBI error: ubi_thread: ubi_bgt0d: work failed with error code -22
> 
> Can anyone comment as to my theory that this is a race condition
> between ubi_io_write and erase_worker occurring out of order?

Did you debug this further? Any new findings?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
