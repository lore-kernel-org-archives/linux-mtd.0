Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZtp0-0008EO-Al
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 02:09:35 +0000
Message-ID: <5189B446.7010101@freescale.com>
Date: Wed, 8 May 2013 10:11:18 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: [PATCH] nand_base: fix for ONFI chips that do not support GET/SET
 FEATURES
References: <CACwUX0MqswPeSTis3woPfZufaW2kEdd7-zqe+5o8jLXt8VZnrw@mail.gmail.com>
In-Reply-To: <CACwUX0MqswPeSTis3woPfZufaW2kEdd7-zqe+5o8jLXt8VZnrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8807=E6=97=A5 23:08, David Mosberger-Tang=
 =E5=86=99=E9=81=93:
> I not seen any ACK that this patch has been queued for merging, so I'm
> re-sending.  Please let me know what you intend to do with it.
>
I can not git-am your patch. I think you'd better create a patch with=20
git-format-patch,
and send it out with git-send-email.

You can add my
Reviewed-by: Huang Shijie <b32955@freescale.com>


thanks
Huang Shijie
