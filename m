Subject: Re: [PATCHv3 0/9] mtd: Remove static limit on device numbers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Feb 2010 17:54:34 +0200
Message-ID: <1265644474.2006.98.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-29 at 20:55 +0000, Ben Hutchings wrote:
> This is the third version of this patch series.  Please give me some
> feedback, David?
> 
> Changes since v2:
> - Export idr_get_next() to support building mtdcore as a module
> - Correct the limit on block device numbers in mtd_blkdevs
> - Register the full range of minor numbers in mtdchar

Looks good for me. I did not test mtdblock, but tested that this does
not break UBIFS.

Pushed to my l2-mtd-2.6/master, thanks.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
