Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9xTf-0003pz-2J
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 09:34:43 +0000
Date: Thu, 6 May 2010 11:34:40 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 2/4] UBI: introduce a new IO return code
Message-ID: <20100506093440.GA15335@Chamillionaire.breakpoint.cc>
References: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
	<1272881582-17196-3-git-send-email-Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1272881582-17196-3-git-send-email-Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2010-05-03 13:13:00 [+0300]:

>diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
>index f52adca..65d03b5 100644
>--- a/drivers/mtd/ubi/scan.c
>+++ b/drivers/mtd/ubi/scan.c
>@@ -745,7 +745,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
> 		bitflips = 1;
> 	else if (err == UBI_IO_PEB_EMPTY)
> 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
>-	else if (err == UBI_IO_BAD_HDR) {
>+	else if (err = UBI_IO_BAD_HDR_READ || err == UBI_IO_BAD_HDR) {

That part should be == and not = but you fix this in the next patch so I
guess it is okay.

> 		/*
> 		 * We have to also look at the VID header, possibly it is not
> 		 * corrupted. Set %bitflips flag in order to make this PEB be

Sebastian
