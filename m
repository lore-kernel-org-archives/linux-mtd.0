Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTQHR-0007jv-5g
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 11:51:22 +0000
Received: by mail-ot1-x343.google.com with SMTP id 40so9133962oth.4
 for <linux-mtd@lists.infradead.org>; Sun, 02 Dec 2018 03:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
 <20181129080923.GE13859@kroah.com> <1676802.TThbbZSlzy@blindfold>
In-Reply-To: <1676802.TThbbZSlzy@blindfold>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 2 Dec 2018 11:50:33 +0000
Message-ID: <CADVatmP1h7GJJRVURkinwSM44Y4iooMP-U_7zew4V+zsMva4Vw@mail.gmail.com>
Subject: Re: [PATCH] ubi: fastmap: Check each mapping only once
To: Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: martin.kepplinger@ginzinger.com, Stable <stable@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Juergen <juergen.lachmann@harman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

On Sun, Dec 2, 2018 at 8:51 AM Richard Weinberger <richard@nod.at> wrote:
>
> Greg,
>
> Am Donnerstag, 29. November 2018, 09:09:23 CET schrieb Greg KH:
> > On Mon, Nov 26, 2018 at 11:38:42AM +0100, Martin Kepplinger wrote:
> > > From: Richard Weinberger <richard@nod.at>
> > >
> > > [ Upstream commit 34653fd8c46e771585fce5975e4243f8fd401914 ]
> > >
<snip>
> >
> > Now queued up for 4.14.y, thanks.
>
> can you *please* slow a little down?

True. It will really help if you can have some sort of fixed schedule
for stable release, like maybe stablerc is ready on Thursday or Friday
and release the stable on Monday. Having a weekend in stablerc will be
helpful for people like me who only get the time in weekends for
upstream or stable kernel.

-- 
Regards
Sudip
