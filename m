Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StMii-0000US-N2
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 17:47:00 +0000
Date: Mon, 23 Jul 2012 18:46:07 +0100
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
Message-ID: <20120723174605.GA23707@sirena.org.uk>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 18, 2012 at 02:22:00PM +0100, Pawel Moll wrote:

> +	info->vpp_regulator = devm_regulator_get(&dev->dev, "vpp");
> +	if (IS_ERR(info->vpp_regulator))
> +		info->vpp_regulator = NULL;
> +

No, this is very bad karma.  You shouldn't just silently ignore the
error here, if we didn't get the supply it's probably important and
otherwise why bother checking the error at all?  Systems should use
a fixed voltage regulator to stub out the supply if there's not any
runtime contol.

At a bare minimum you should be passing back -EPROBE_DEFER if you get
that.
