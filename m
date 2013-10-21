Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY5fB-0000Se-A2
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 02:56:13 +0000
Message-ID: <52649857.2040306@freescale.com>
Date: Mon, 21 Oct 2013 10:58:31 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 00/10] About the SLC/MLC
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <20130826144153.568f2b1c@skate> <20130827033020.GA2182@gmail.com>
 <20131019133205.GD2470@localhost>
In-Reply-To: <20131019133205.GD2470@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8819=E6=97=A5 21:32, Ezequiel Garcia =E5=86=
=99=E9=81=93:
> Do you mean that JFFS2 will write twice: one write to the spare region,
> one write in the data region, with no erase between those two?
yes. The first time to write the clean marker, the another is to write=20
the data.

thanks
Huang Shijie
