Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M23ex-0007lr-C0
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 13:29:28 +0000
Received: by wf-out-1314.google.com with SMTP id 23so642516wfg.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 May 2009 06:29:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090507125723.GA1932@yoda.jdub.homelinux.org>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<20090507125723.GA1932@yoda.jdub.homelinux.org>
Date: Thu, 7 May 2009 15:29:08 +0200
Message-ID: <71cd59b00905070629p5363e631t260155e616615c6@mail.gmail.com>
Subject: Re: [PATCH 0/2] mkfs.ubifs and libubiio
From: Corentin Chary <corentin.chary@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 7, 2009 at 2:57 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Thu, May 07, 2009 at 12:21:47PM +0200, Corentin Chary wrote:
>>These patchs will allow mkfs.ubifs to write the image directly
>>on an UBI volume.
>>libubiio adds a lot of code, but as it provide the same API the kernel
>>does we may export it latter as a shared library.
>
> Aside from mkfs.ubifs, are there other applications you envision using
> libubiio as a library?
Currently, we use also libubiio for uffs (wich will be GPL'ed when released=
).
I think it could also be used in some ubi utils, but it's not the case
right now.

> I ask because the code, as posted, is licensed under the GPL. =A0That
> isn't really bad per se, but it does have implications for applications
> that wish to link to it.
>
It's licensed under the GPL because a lot of code come from UBI, UBIFS
and mtd-tools, wich are GPL.

--=20
Corentin Chary
http://xf.iksaif.net
