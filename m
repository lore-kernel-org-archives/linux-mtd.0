Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYiwn-00079f-1S
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 18:43:57 +0000
Message-ID: <4EE10568.9070002@freescale.com>
Date: Thu, 8 Dec 2011 12:43:52 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: LiuShuo <b35362@freescale.com>
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <4EDEAEB9.6020703@freescale.com> <4EDEE3AC.7060000@freescale.com>
 <4EDFBA6D.9080500@freescale.com> <4EE09526.5040705@freescale.com>
In-Reply-To: <4EE09526.5040705@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/08/2011 04:44 AM, LiuShuo wrote:
> =E4=BA=8E 2011=E5=B9=B412=E6=9C=8808=E6=97=A5 03:11, Scott Wood =E5=86=99=
=E9=81=93:
>> And if we do want to make such assumptions, we could rip out all usage
>> of index/column here, and just handle "oob" and "full page" cases.
> The function nand_do_write_ops() in nandbase.c is a Nand internal
> interface.
> It always is called when application write to nand flash. (e.g. dd)
> In this function, partial page write is dealt with by filling '0xff' to
> buffer before data copy.
> (nand_do_write_oob() is similar)
> So I don't think we need to do it in our controller driver again, it
> should be a job of upper layer.

If this is to be considered part of the interface contract, then perhaps
do a WARN_ON() if we see an unexpected index/column?  And after that,
only consider full-page or full-oob possibilities.

-Scott
