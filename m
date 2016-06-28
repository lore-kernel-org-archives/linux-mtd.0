Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHrm4-0003mY-9p
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 12:05:53 +0000
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <57726800.1020103@nod.at>
Date: Tue, 28 Jun 2016 14:05:20 +0200
MIME-Version: 1.0
In-Reply-To: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.06.2016 um 13:51 schrieb Sascha Hauer:
> When reading the vid hdr from the device UBI always reads a whole
> page. Instead, read only the data we actually need and speed up
> attachment of UBI devices by potentially making use of reading
> subpages if the NAND driver supports it.
> 
> Since the VID header may be at offset vid_hdr_shift in the page and
> we can only read from the beginning of a page we have to add that
> offset to the read size.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Looks good, queued for v4.8. :-)

Thanks,
//richard
