Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg3Om-00080W-KI
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 02:08:13 +0000
Message-ID: <52818E3B.9000301@freescale.com>
Date: Tue, 12 Nov 2013 10:11:07 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH fix] mtd: gpmi: wake up the process at the end of the
 DMA callback
References: <1384135418-19019-1-git-send-email-b32955@freescale.com>
 <1384143225-21633-1-git-send-email-b32955@freescale.com>
 <20131111201545.GH20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131111201545.GH20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, stable@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8812=E6=97=A5 04:15, Brian Norris =E5=86=99=
=E9=81=93:
> I fixed the subject to describe the problem better ("mtd: gpmi: fix
> kernel BUG due to racing DMA operation") and pushed it to l2-mtd.git.
thanks!

Huang Shijie
