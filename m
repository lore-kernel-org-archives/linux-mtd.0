Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7fKl-0006W9-Ky
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 09:52:05 +0000
Received: by mail-oi0-x235.google.com with SMTP id l18so44251768oig.2
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 02:51:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170508092846.GA11029@amd>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <20170508092846.GA11029@amd>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 8 May 2017 11:51:40 +0200
Message-ID: <CAFLxGvydhh7XWSQHKpNnuMS0GvU+Edovdm1MeYwiSiBAi_rwgg@mail.gmail.com>
Subject: Re: Race to power off harming SATA SSDs
To: Pavel Machek <pavel@ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>, Tejun Heo <tj@kernel.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 linux-ide@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pavel,

On Mon, May 8, 2017 at 11:28 AM, Pavel Machek <pavel@ucw.cz> wrote:
> Are you sure you have it right in JFFS2? Do you journal block erases?
> Apparently, that was pretty much non-issue on older flashes.

This is what the website says, yes. Do you have hardware where you can
trigger it?
If so, I'd love to get access to it.

So far I never saw the issue, sometimes people claim to suffer from it
but when I
inspect the problems in detail it is always something else.

-- 
Thanks,
//richard
