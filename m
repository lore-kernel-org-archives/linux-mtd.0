Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvWSW-0000qt-JP
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 19:16:33 +0000
Received: by mail-vc0-f179.google.com with SMTP id le20so5050503vcb.10
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 11:16:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAF3KAoTMWCiAfHhNd_OR3QAteYC8vBLL=W_SUR28iCTOz+YbiA@mail.gmail.com>
References: <CAF3KAoTMWCiAfHhNd_OR3QAteYC8vBLL=W_SUR28iCTOz+YbiA@mail.gmail.com>
Date: Mon, 1 Dec 2014 20:16:10 +0100
Message-ID: <CAFLxGvzOR92mqxqC-dzgr4SDke+K=NfC7mi4kZHi3KrBiVfcNQ@mail.gmail.com>
Subject: Re: Building nandsim for Fedora
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Bruno Vernay <brunovern.a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 1, 2014 at 6:23 PM, Bruno Vernay <brunovern.a@gmail.com> wrote:
> Hi,
>
> I would like to mount a UBI  image, and for this I need "nandsim", but
> it is not available on Fedora.
> I can't even find a RPM for the sources.
>
> I would like to get the sources for nandsim, it seems that the repository is
> http://git.infradead.org/linux-mtd.git/tree/HEAD:/drivers/mtd/nand
>
> But I am not even sure, if it is the right place to start ???

nandsim is a Linux kernel module.

-- 
Thanks,
//richard
