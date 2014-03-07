Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLq48-00073A-5k
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 08:23:36 +0000
Message-ID: <5319821D.6080606@freescale.com>
Date: Fri, 7 Mar 2014 16:23:57 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
 <20140221060833.GA29360@shlinux2.ap.freescale.net>
 <CAGWqfig_LO69C6dHt0qwVEtt0Winu5Jqk7Ef5N6H1qaPMnw58A@mail.gmail.com>
 <20140307075615.GG31517@norris-Latitude-E6410>
In-Reply-To: <20140307075615.GG31517@norris-Latitude-E6410>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 Elie De Brauwer <eliedebrauwer@gmail.com>, bpringlemeir@nbsps.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vikram.Narayanan@in.bosch.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8807=E6=97=A5 15:56, Brian Norris =E5=86=99=
=E9=81=93:
> What do you think? All interested parties please chime in. I can try to
> push a patch out soon for you all to test soon, or else I can see about
it's okay to me to add a common default routine to handle the erased page=
,
and also let the driver can implement its own check rountine.

thanks
Huang Shijie
