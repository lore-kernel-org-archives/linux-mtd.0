Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Vje-0001YI-R9
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 08:40:49 +0000
Subject: Re: [PATCH 2/2] mkfs.ubifs: use libubi to format UBI volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905250123o516a293an3c5c541cc417fc94@mail.gmail.com>
References: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-2-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-3-git-send-email-corentincj@iksaif.net>
	<1243238323.21646.64.camel@localhost.localdomain>
	<71cd59b00905250123o516a293an3c5c541cc417fc94@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 11:40:16 +0300
Message-Id: <1243240816.21646.102.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 10:23 +0200, Corentin Chary wrote:
> On Mon, May 25, 2009 at 9:58 AM, Artem Bityutskiy
> <dedekind@infradead.org> wrote:
> >
> > I know this is nit-picking, but would be nicer to close libubi
> > in case of errors. Namely, in the second and third checks.
> 
> In case of error, close_target() will close libubi. (if(ubi) libubi_close(ubi)).
> But maybe you want to explicitly close libubi here ?

Ah, OK. NP then.

> The comma is just at the 80 column limit.
> Using Lindent, we get:
>                         return
>                             sys_err_msg("bad root file-system directory '%s'",
>                                         root);
> 
> Is this ok ?

I think you may just ignore the 80 chars limit and make it 81 chars :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
