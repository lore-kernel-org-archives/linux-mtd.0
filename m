Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMhx0-000611-Bz
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 16:19:02 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so3310886vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2012 09:19:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20121012074100.GC639@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAMjpGUcRni7ni-FtVAN-pqnuHDK-WeeO6U=480K=1sCDhb7qjQ@mail.gmail.com>
 <20121012074100.GC639@pengutronix.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 12 Oct 2012 12:18:41 -0400
Message-ID: <CAMjpGUdKf98R1=YrAYBc8qv=soTq2erK6ievNwyWJZDkFwxNAA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the base
 address
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 12, 2012 at 3:41 AM, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Oct 11, 2012 at 12:21:59AM -0400, Mike Frysinger wrote:
>> i don't think's necessary either for the larger change here.  use the lo=
gic:
>>     if (physaddr !=3D -1)
>>         mapp->phys =3D physaddr;
>> and keep the default initialization.
>
> I keep my way as it seems to be more robust for possible future changes.
> (I don't know if that will ever happen, but consider platform device
> support or just a retry of instatiation after physaddr changed from
> something back to -1.)

i'm afraid that will still break things.  the arch code initializes
the mtd map in setup_arch() which i believe is before the
module_init() (which is device_initcall() when it is compiled into).
so clobbering uclinux_ram_map.phys in the module_init will undo what
was done in setup_arch().
-mike
