Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7ZXb-0001UV-Mt
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 22:18:16 +0000
Received: by lbbgf7 with SMTP id gf7so1466162lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 15:18:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346416026.9709.47.camel@sauron.fi.intel.com>
References: <886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8@BBMBX.backbone.local>
 <1346416026.9709.47.camel@sauron.fi.intel.com>
Date: Fri, 31 Aug 2012 15:18:12 -0700
Message-ID: <CAN8TOE8j9gxpXAmL51gqaW8=TFLQLPhp03inryx_-uZv4901Ng@mail.gmail.com>
Subject: Re: FW: UBIFS tools and latest 2.6.33 kernel from
 http://git.infradead.org/users/dedekind/ubifs-v2.6.33.git
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com, David Clark <dclark@tantalus.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 31, 2012 at 5:27 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Hi,
>
> On Fri, 2012-08-24 at 12:39 -0700, David Clark wrote:
>> UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit
>
> This means your NOR driver should be fixed and it should return
> _correct_ write buffer size, not 0.

I'm guessing that you're using m25p80, which is missing this mainline
patch in the backport tree:

commit b54f47c8bcfc5f766bf13ec31bd7dd1d4726d33b
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Tue Jan 31 00:06:03 2012 -0800

    mtd: m25p80: set writebufsize

Artem,

There was a series of 'writebufsize' fixes that may be missing from
multiple backport trees. I can help you track them down, if you'd like
the help.

Brian
