Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ki9ns-0004jJ-46
	for linux-mtd@lists.infradead.org; Tue, 23 Sep 2008 15:27:52 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2951546rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Sep 2008 08:27:50 -0700 (PDT)
Message-ID: <8bd0f97a0809230827s5b56ed1i19b63dea4b8020f@mail.gmail.com>
Date: Tue, 23 Sep 2008 11:27:50 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Jim Ramsay" <i.am@jimramsay.com>
Subject: Re: Should MTD_WRITEABLE be split into MTD_WRITEABLE and
	MTD_ERASEABLE?
In-Reply-To: <20080922150332.57fb2252@altair.jimramsay.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080922150332.57fb2252@altair.jimramsay.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 22, 2008 at 15:03, Jim Ramsay wrote:
> Currently, MTD partitions that do not begin and end exactly on an erase
> sector boundary are forced to be read-only (The MTD_WRITEABLE flag is
> forcibly removed).  I understand that this is required so that you
> don't try to erase that partition and accidentally blow away other
> information on other partitions that may also share the erase sector.
>
> However, in the case of embedded systems, it can be very useful to
> create a very small MTD partition for a simple write-once facility
> (such as for capturing part of a log file or crash dump), and this
> check makes such a partition impossible - Even if the code that
> actually adds the partition is clever enough to properly erase that
> area of flash before adding it.  There is no technical reason of which
> I am aware that prevents normal mtd_write code from working on a small
> non-erase-aligned partition if it has been previously erased.
>
> So I would suggest that splitting MTD_WRITEABLE into two flags,
> MTD_WRITEABLE and MTD_ERASEABLE would be a good idea.  The current
> check for erase boundaries would then only remove MTD_ERASEABLE, whereas
> MTD_WRITEABLE could still be removed via the mtd_partition.mask_flags
> when required.

if you split it into MTD_ERASEABLE and MTD_APPENDABLE, then you could
keep compatibility with:
#define MTD_WRITABLE (MTD_ERASEABLE | MTD_APPENDABLE)

otherwise you just volunteered to update every single
board/driver/core out there that is using MTD_WRITABLE
-mike
