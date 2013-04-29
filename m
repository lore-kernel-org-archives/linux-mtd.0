Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UWqt5-0004sE-8e
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2013 16:25:12 +0000
Received: by mail-we0-f180.google.com with SMTP id x43so5415433wey.25
 for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2013 09:25:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4ece0e3662e670af6982baa43c1d3fd0.squirrel@webmail.iitg.ernet.in>
References: <OFCF117D0B.61A9CA12-ON48257B4F.002F2292-48257B4F.0030E459@zte.com.cn>
 <CAFLxGvxqwpc5fbyGpy9o4qzEfn0i3eocs36TrkX9=SfZ_oT-5w@mail.gmail.com>
 <4ece0e3662e670af6982baa43c1d3fd0.squirrel@webmail.iitg.ernet.in>
Date: Mon, 29 Apr 2013 18:25:06 +0200
Message-ID: <CAFLxGvxMR-fGf2GgK+G5E3LOxQA73XRwqL3vyyPBhmZWyPWHBw@mail.gmail.com>
Subject: Re: Placing ext3 journal on mtd device
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: d.soumyajit@iitg.ernet.in
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, LKML <linux-kernel@vger.kernel.org>,
 liu.dong3@zte.com.cn,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 cui.yunfeng@zte.com.cn, wang.bo116@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 29, 2013 at 6:08 PM,  <d.soumyajit@iitg.ernet.in> wrote:
> Hi,
>
> In Ext3 performance can be improved by placing journal on SSD. I am able
> to place ext3 journal on an external device. Can you please help me
> placing ext3 journal on mtd device.

*very* bad idea.

--
Thanks,
//richard
