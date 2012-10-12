Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMi15-0006BJ-TT
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 16:23:16 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so3315815vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2012 09:23:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUf0Jq_fPCHsUwN+OFL-RJSA2a-Usqih39hc22jM8Q7KNg@mail.gmail.com>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50739A2A.9070405@snapgear.com> <20121009084418.GH18531@pengutronix.de>
 <5073FE55.2000402@snapgear.com>
 <CAMjpGUe_aTEjGF9q1uraU_ikCif0J-+bSTLkr-X6jEYqjMHOtQ@mail.gmail.com>
 <5077B167.40009@snapgear.com> <20121012072221.GB639@pengutronix.de>
 <CAMjpGUf0Jq_fPCHsUwN+OFL-RJSA2a-Usqih39hc22jM8Q7KNg@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 12 Oct 2012 12:22:54 -0400
Message-ID: <CAMjpGUfpmUSBhk7QWexqXUtiuG=BFFuexnneyVbMWmoTDHxZgA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the base
 address
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Greg Ungerer <gerg@snapgear.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 12, 2012 at 12:09 PM, Mike Frysinger wrote:
> On Fri, Oct 12, 2012 at 3:22 AM, Uwe Kleine-K=C3=B6nig wrote:
>> I really don't know the situation on
>> blackfin, but this really has potential for generalisation.
>
> sure ... we're open to doing it differently as long as it's backwards com=
patible

thinking a bit more, i think the answer here is:
 - move all the mtd_size checks out of Blackfin's memory_setup() into
the uclinux mtd map's uclinux_mtd_init() logic
 - rename your new physaddr to "uclinux_ram_map_physaddr", drop the
"static", and add a comment that this needs to stay externally visible
 - change Blackfin's memory_setup() logic to set
"uclinux_ram_map_physaddr" rather than "uclinux_ram_map"
-mike
