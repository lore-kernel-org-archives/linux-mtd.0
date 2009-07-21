Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTEF1-0002Mt-6M
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 12:14:47 +0000
Subject: Re: [PATCH] UBI: Decrease I/O count in ubi_scan
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1248175591-4592-1-git-send-email-corentincj@iksaif.net>
References: <1248175591-4592-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Jul 2009 15:14:11 +0300
Message-Id: <1248178451.24676.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-21 at 13:26 +0200, Corentin Chary wrote:
> Merge ec_hdr and vid_hdr read in one ubi_io_read()
> This result in a 25% speedup with nandsim, and 6%
> speedup on an AT91SAM9263 board with a 200Mo UBI volume.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
>  drivers/mtd/ubi/io.c   |   67 ++++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/mtd/ubi/scan.c |   35 +++++++++++++------------
>  drivers/mtd/ubi/ubi.h  |    4 +++
>  3 files changed, 87 insertions(+), 19 deletions(-)

Yeah, I did the same optimization some time ago:

http://lists.infradead.org/pipermail/linux-mtd/2008-April/021311.html

Could you please take a look at those patches as well, and if they
are any better, use them or improve yours. I do not remember the
details, to be frank.

No one reported a significant improvement, so I dropped it.
nandsim improvement is not very interesting, but the AT91SAM9263 is.
Which flash is there? And why do you presume is the improvement -
just less calls to MTD or really less I/O? Note MTD usually caches
the last read NAND page, so usually this is not about less I/O.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
