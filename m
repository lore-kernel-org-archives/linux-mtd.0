Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFQeB-0002tt-Gi
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 15:30:04 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr4so2008546pbb.34
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 08:29:41 -0700 (PDT)
Date: Fri, 30 Aug 2013 23:34:40 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Message-ID: <20130831033438.GA13704@gmail.com>
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5220B8F6.3080405@digi.com>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 30, 2013 at 05:23:34PM +0200, Hector Palacios wrote:
> On 08/31/2013 04:53 AM, Huang Shijie wrote:
> >On Fri, Aug 30, 2013 at 04:24:53PM +0200, Hector Palacios wrote:
> Sorry, what repo/branch did you base your original patchset on? The
> patchset did not apply correctly and this one you sent won't apply
> either because the function set_geometry_by_ecc_info() does not
> exist. Instead, it is called common_nfc_set_geometry(). I'm using a
> v3.10 kernel but this driver has not changed since then (at least in
> the vanilla kernel).
please apply this patch set with the l2-mtd tree or the linux-next.

thanks
Huang Shijie
