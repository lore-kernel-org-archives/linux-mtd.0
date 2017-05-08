Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7gUw-0007ER-H6
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 11:06:40 +0000
Received: by mail-oi0-x22e.google.com with SMTP id b204so45936006oii.1
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 04:06:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170508104953.GA17773@amd>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <20170508092846.GA11029@amd> <1494236048.6528.32.camel@infradead.org>
 <20170508104953.GA17773@amd>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 8 May 2017 13:06:17 +0200
Message-ID: <CAFLxGvzAmURHU_6K3gmBfOqHKgvQOkkO_+qgMKsmzhWZwwGnqw@mail.gmail.com>
Subject: Re: Race to power off harming SATA SSDs
To: Pavel Machek <pavel@ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-ide@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 8, 2017 at 12:49 PM, Pavel Machek <pavel@ucw.cz> wrote:
> Aha, nice, so it looks like ubifs is a step back here.
>
> 'clean marker' is a good idea... empty pages have plenty of space.

If UBI (not UBIFS) faces an empty block, it also re-erases it.
The EC header is uses as clean marker.

> How do you handle the issue during regular write? Always ignore last
> successfully written block?

The last page of a block is inspected and allowed to be corrupted.

> Do you handle "paired pages" problem on MLC?

Nope, no MLC support in mainline so far.

-- 
Thanks,
//richard
