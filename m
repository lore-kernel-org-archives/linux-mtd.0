Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7NvH-0002ut-Lk
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:03:01 +0000
Received: by mail-vc0-f177.google.com with SMTP id hy4so1374321vcb.8
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2014 05:02:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1405499347.1906.2.camel@sauron.fi.intel.com>
References: <53BBC39F.7010307@gmail.com>
 <1405499347.1906.2.camel@sauron.fi.intel.com>
Date: Wed, 16 Jul 2014 14:02:37 +0200
Message-ID: <CAFLxGvwzzAAswamDJVq0UW7DLdHdgA4N_KOY9K5FhAREaFit+g@mail.gmail.com>
Subject: Re: ubifs error at boot "bad node type"
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Genoud <richard.genoud@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 16, 2014 at 10:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2014-07-08 at 12:10 +0200, Richard Genoud wrote:
>> ubiattach is ok:
>> # ubiattach -m 3
>> [   50.164062] UBI: default fastmap pool size: 95
>> [   50.164062] UBI: default fastmap WL pool size: 25
>
> I do not know why this happened, I never saw reports like this before.
> Most probably this is because of fastmap. I did not hear any report that
> it was extensively verified WRT power cuts, and my theory is that there
> is a bug in fastmap which causes this, and this may be related to power
> cuts. I do not have proves, but suggest you to dig in this direction.
> E.g., setup power-cut testing.

The logs don't show the "attached by fastmap" message. So UBI got
attached by scanning.
So, fastmap support is here but not used.

Only the fastmap pools are used.

> --
> Best Regards,
> Artem Bityutskiy
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
