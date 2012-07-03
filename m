Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm5Y7-0000vh-Ti
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 16:02:04 +0000
Received: by wgbds1 with SMTP id ds1so4441441wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2012 09:01:57 -0700 (PDT)
Date: Tue, 3 Jul 2012 19:01:53 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [Q] ubi->beb_rsvd_pebs calculations
Message-ID: <20120703190153.2dd1f9f6@pixies.home.jungo.com>
In-Reply-To: <1341319344.2979.62.camel@sauron.fi.intel.com>
References: <20120701195230.0f141288@pixies.home.jungo.com>
 <1341312827.2979.53.camel@sauron.fi.intel.com>
 <20120703153314.15948c90@pixies.home.jungo.com>
 <1341319344.2979.62.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

One more thing.

In my patchset I'm intorducing CONFIG_MTD_UBI_BEB_LIMIT which replaces
CONFIG_MTD_UBI_BEB_RESERVE.

I decided to use a different name as the semantics got different:

CONFIG_MTD_UBI_BEB_RESERVE specified how many physical eraseblocks
will be reserved for bad eraseblock handling (percents of total number
of good flash eraseblocks).

Whereas CONFIG_MTD_UBI_BEB_LIMIT specifies the maximum bad eraseblocks
UBI expects on the ubi device (percents of total number of flash
eraseblocks).

(Later on, the attach ioctl can support a per-ubi-device limit,
overriding the configured default).

Some might argue that the old name CONFIG_MTD_UBI_BEB_RESERVE can still
be used, describing the new semantic as well.

What's your opinion on the CONFIGs name change? Is it needed?

Regards,
Shmulik
