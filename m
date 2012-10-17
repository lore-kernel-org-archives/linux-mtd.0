Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOYMV-0007Z4-Io
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 18:29:00 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so13163816iej.36
 for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2012 11:28:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1350480112.5769.160.camel@sauron.fi.intel.com>
References: <201210050345.49507.marex@denx.de>
 <201210111355.33836.marex@denx.de>
 <1350479529.5769.155.camel@sauron.fi.intel.com>
 <201210171516.55693.marex@denx.de>
 <1350480112.5769.160.camel@sauron.fi.intel.com>
Date: Wed, 17 Oct 2012 15:28:57 -0300
Message-ID: <CALF0-+W0SqnxBVaTHjpjTzdw-fJoQ1qHBY8u3-rMcZ6wwc7z3w@mail.gmail.com>
Subject: Re: GPMI NAND crashes with UBIFS
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 17, 2012 at 10:21 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-10-17 at 15:16 +0200, Marek Vasut wrote:
>> Ok, I'll re-check. Though I suspect this problem disappeared with the
>> recently
>> applied UBI patches.
>
> No, you ask UBIFS to emulate a power cut, so it switched to R/O mode at
> a random point. It printed scary error messages, which are normal
> because an I/O operation failed. Then integck reported you the error and
> stopped.
>
> All expected.
>
> If you use -p integck option you will just make integck _not_ fail when
> the file-system suddenly becomes R/O, integck will just unmount it,
> mount back, remove all its data, and start over. Then you'll get another
> emulated power cut, and so on.
>
> Ideally this should never stop. The idea is to test that UBIFS can mount
> the file-system in case of a power cut.
>
> If there is a problem, integck should die.
>
> To just stress-test your driver you do not need power-cut emulation.
>

Is this expected behavior documented somewhere?

Thanks!

    Ezequiel
