Received: from mail-vc0-f179.google.com ([209.85.220.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR5MK-0000UZ-Kj
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 19:44:05 +0000
Received: by mail-vc0-f179.google.com with SMTP id ij19so3106439vcb.24
 for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2014 12:43:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140321185446.GA18141@arch.cereza>
References: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
 <20140321180547.GA11793@arch.cereza>
 <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
 <20140321185446.GA18141@arch.cereza>
Date: Fri, 21 Mar 2014 13:43:41 -0600
Message-ID: <CALnQHM0U4FPi22P+SGuJqPb2QvjRHq3-oAR4i1QvCyMrnoXh5w@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
From: David Mosberger <davidm@egauge.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 12:54 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> (Ccing Brian and Uwe)

> AFAIK, the issue for GET_FEATURES and SET_FEATURES was also fixed.
> IIRC, it was done here:
>
> commit 05f7835975dad6b3b517f9e23415985e648fb875

This commit fixes the transfer, but not the addressing.

Let me switch to linux-next and take it from there.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
