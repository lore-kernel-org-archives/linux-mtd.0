Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4VAF-0007BR-C5
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 11:01:28 +0000
Received: by lagu2 with SMTP id u2so324651lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 04:01:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120823133655.72157b18@pixies.home.jungo.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 13:01:04 +0200
Message-ID: <CACQ1gAhFqWhEVhcPmqQrZd3X1RBFjrxdmhzkgzuRVKVXt0Mn0A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/23 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> Artem, this is now located *after* the call to
>         io_init(ubi, max_beb_per1024)
> So falling to the default (in case max_beb_per1024 is zero) won't work.
>
> Also, why displaying the error if max_beb_per1024 was NOT povided?
> Shouldn't it be displayed only when max_beb_per1024 is other than zero?
> What am I missing?
+1
mounting NOR flash without the max_beb_per1024 will fail, that's
really not what we want.

Regards,
Richard.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
