Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7zGH-0003GM-IH
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 07:08:47 +0000
Received: by mail-oi0-x244.google.com with SMTP id h4so13182568oib.0
 for <linux-mtd@lists.infradead.org>; Tue, 09 May 2017 00:08:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f4b9118e-dcff-32d0-2861-d520f75ea250@nod.at>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
 <20170412054828.GA20561@infradead.org>
 <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
 <803a8cc8-d2d1-dddf-2e07-621b1484218a@nod.at>
 <dd90ac49-574b-54b9-902a-ba5948134ba8@nod.at>
 <CAOQ4uxjqsm2h6N9qdOO2BxwOnnkY1KQCmDa6Ba8xPC0JGCVUiw@mail.gmail.com>
 <b7d49751-8345-b5c4-1b6d-761e91ddd89e@nod.at>
 <3fa90f95-c522-ad9f-3f4c-8c45a6cd93c1@pengutronix.de>
 <CAOQ4uxiEGJLSGS5rK8V8GRNvf9aWqbVG5odu2=nv73xTOmvfNQ@mail.gmail.com>
 <e258d0f2-6117-8ca3-0ed7-a8f6498ad9d4@pengutronix.de>
 <f4b9118e-dcff-32d0-2861-d520f75ea250@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 9 May 2017 10:08:24 +0300
Message-ID: <CAOQ4uxgn59hxAOgRD87VdVPv2srtcLjoFCVVrkAnezEN0_ZFxg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
To: Richard Weinberger <richard@nod.at>
Cc: Oleksij Rempel <ore@pengutronix.de>, Christoph Hellwig <hch@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 9, 2017 at 10:01 AM, Richard Weinberger <richard@nod.at> wrote:
>
> Oleksij,
>
> Am 09.05.2017 um 07:52 schrieb Oleksij Rempel:
> >>
> >>         If VFS maintainers are fine with that, I'll take it.
> >>         From UBIFS' POV it does not matter much. :-)
> >>
> >>
> >>     Ping to VFS maintainers?
> >>
> >>
> >> What ping? Al made it clear that a flag is not needed.
> >> BTW, xfs s_uuid patch was merged to master.
> >
> >
> > I'm talking about ubifs patch.

Me too.

>
> Then we can queue this patch for 4.13.
> Please resend and make sure it addresses everything what was also
> suggested for the xfs s_uuid patch.
>

Just to be clear, the xfs s_uuid patch is just a memcpy,
no different from Oleksij's patch.

Thanks,
Amir.
