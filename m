Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OAGHA-00057F-MJ
	for linux-mtd@lists.infradead.org; Fri, 07 May 2010 05:39:06 +0000
Subject: Re: [PATCH 2/4] UBI: introduce a new IO return code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100506093440.GA15335@Chamillionaire.breakpoint.cc>
References: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
	<1272881582-17196-3-git-send-email-Artem.Bityutskiy@nokia.com>
	<20100506093440.GA15335@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 07 May 2010 08:37:31 +0300
Message-ID: <1273210651.2178.2.camel@localhost>
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

On Thu, 2010-05-06 at 11:34 +0200, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2010-05-03 13:13:00 [+0300]:
> 
> >diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
> >index f52adca..65d03b5 100644
> >--- a/drivers/mtd/ubi/scan.c
> >+++ b/drivers/mtd/ubi/scan.c
> >@@ -745,7 +745,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
> > 		bitflips = 1;
> > 	else if (err == UBI_IO_PEB_EMPTY)
> > 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
> >-	else if (err == UBI_IO_BAD_HDR) {
> >+	else if (err = UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR) {
> 
> That part should be == and not = but you fix this in the next patch so I
> guess it is okay.

Fixed this in the wrong patch, I'll amend them and make sure this typo
goes away, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
