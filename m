Received: from mail-db9lp0248.outbound.messaging.microsoft.com
 ([213.199.154.248] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjQpc-0005Cs-7Z
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 09:45:52 +0000
Message-ID: <528DD70B.8010602@freescale.com>
Date: Thu, 21 Nov 2013 17:48:59 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com>
In-Reply-To: <528DCFBD.9000905@st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8821=E6=97=A5 17:17, Angus Clark =E5=86=99=
=E9=81=93:
> No, the s25fl129p1 only supports SDR "Quad Output Read" and "Quad I/O R=
ead".  I
> thought the M25P80_QUAD_READ flag was for the SDR operations though, he=
nce why I
> said the m25p80 driver was not sensitive to the differences between s25=
fl129p1
> and s25fl128s1.  Is that not the case?
the target of adding this item is to support the DDR quad read.
So we should add a new item for this nor.

thanks
Huang Shijie
