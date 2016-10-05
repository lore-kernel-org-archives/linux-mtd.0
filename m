Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brtvO-0004F3-C3
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 21:40:27 +0000
Received: by mail-oi0-x243.google.com with SMTP id h186so49855oia.3
 for <linux-mtd@lists.infradead.org>; Wed, 05 Oct 2016 14:40:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1610012252190.3445@hadrien>
References: <alpine.DEB.2.10.1610012252190.3445@hadrien>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 5 Oct 2016 23:40:04 +0200
Message-ID: <CAFLxGvxHuosxhrwW0N63jJOatpn3nNE79o_UqBkdUWRepUNfaA@mail.gmail.com>
Subject: Re: [PATCH 01/15 v2] UBIFS: improve function-level documentation
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Richard Weinberger <richard@nod.at>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 1, 2016 at 10:53 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> Fix various inconsistencies in the documentation associated with various
> functions.
>
> In the case of fs/ubifs/lprops.c, the second parameter of
> ubifs_get_lp_stats was renamed from st to lst in commit 84abf972ccff
> ("UBIFS: add re-mount debugging checks")
>
> In the case of fs/ubifs/lpt_commit.c, the excess variables have never
> existed in the associated functions since the code was introduced into the
> kernel.
>
> The others appear to be straightforward typos.
>
> Issues detected using Coccinelle (http://coccinelle.lip6.fr/)
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.

-- 
Thanks,
//richard
