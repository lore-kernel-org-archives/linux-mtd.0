Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgQ2K-0001yx-PB
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 02:18:34 +0000
Message-ID: <5282E223.5060101@freescale.com>
Date: Wed, 13 Nov 2013 10:21:23 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the NULL pointer
References: <1384230188-29585-1-git-send-email-b32955@freescale.com>
 <20131112184304.GL20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131112184304.GL20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: fabio.estevam@freescale.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, stable@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8813=E6=97=A5 02:43, Brian Norris =E5=86=99=
=E9=81=93:
> instance, gpmi_pre_bbt_scan() doesn't have anything to do with the BBT
> scan any more, does it?
I will delete it in the clean-up patch set after the merge-window

thanks
Huang Shijie
