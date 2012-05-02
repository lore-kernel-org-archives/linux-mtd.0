Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPcHQ-00081Y-Nj
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 16:19:53 +0000
Received: by ghbf11 with SMTP id f11so969131ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 09:19:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335969816.10293.65.camel@sauron.fi.intel.com>
References: <CAGiDA6KgHTQehUPtN_wT90unaHwZPzre7V5WCOEipaVpzbxJOQ@mail.gmail.com>
 <1335969816.10293.65.camel@sauron.fi.intel.com>
Date: Wed, 2 May 2012 12:19:51 -0400
Message-ID: <CAGiDA6+_FxGh55DV7PCB-ZCGKXOVyjgAg8J0wb5x2+cCA_fpBQ@mail.gmail.com>
Subject: Re: ubiattach fails after mkvol with "vtbl_check: bad CRC..."
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 2, 2012 at 10:43 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Did you validate your flash using mtdtests:
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

Yes, as I said, mtd_stresstest and mtd_speedtest work fine.
I didn't say so, but mtd_readtest also works.
