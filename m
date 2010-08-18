Received: from lvps87-230-0-242.dedicated.hosteurope.de ([87.230.0.242])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlbaL-0000Uv-PO
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 05:53:14 +0000
Date: Wed, 18 Aug 2010 07:53:02 +0200
From: Michael Guntsche <mike@it-loops.com>
To: Brian Norris <norris@broadcom.com>
Subject: Re: [BUG] Nand support broken with v2.6.36-rc1
Message-ID: <20100818055302.GA24116@gibson.comsick.at>
References: <20100817113644.GA31317@gibson.comsick.at>
	<4C6AC037.7070205@broadcom.com>
	<20100817174704.GA1322@gibson.comsick.at>
	<4C6AD9C2.1070705@broadcom.com>
	<20100817200559.GA4542@gibson.comsick.at>
	<4C6B024A.7040505@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C6B024A.7040505@broadcom.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 Aug 10 14:42, Brian Norris wrote:
> In place of that, though, you can just try this patch on 2.6.36-rc1.
> I believe it should satisfy the intention of my previous (faulty)
> commit while reverting the regression behavior. If this works OK, I
> will submit it to be included in the mainline kernel.

Hi Brian,

Applying this patch fixes the problem for me. I removed my workaround
and just tried your patch and was able to mount both mtdblock devices.

Thank you for fixing this,
Michael Guntsche
