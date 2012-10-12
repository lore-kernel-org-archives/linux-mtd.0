Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMi1w-0006I2-Mo
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 16:24:09 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so3316782vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2012 09:24:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 12 Oct 2012 12:23:47 -0400
Message-ID: <CAMjpGUd4t4fVeK+OsKGij4LcQS=mL-pGb+vRpT=wjK7Kn+GRJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/uclinux: add a comment about why uclinux_ram_map
 must not be static
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
> I was (at least) the second person trying to fix a warning by sparse, so
> document in the code why this is a bad idea.

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
