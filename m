Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4UEL-0007Eb-HE
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 10:01:38 +0000
Received: by lagu2 with SMTP id u2so297825lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 03:01:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345715732.2848.224.camel@sauron.fi.intel.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-5-git-send-email-richard.genoud@gmail.com>
 <1345715732.2848.224.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 12:01:14 +0200
Message-ID: <CACQ1gAh94Hu5PSH3XBSjk5LK3-O3WsSckaGsijF6bqGAASB7Sw@mail.gmail.com>
Subject: Re: [PATCH MTD-UTILS v2 4/4] ubiattach: fail if kernel ignores
 max_beb_per1024
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
>> +     } else if (err == 1) {
>> +             /*
>> +              * The kernel did not support the max_beb_per1024 parameter.
>> +              */
>> +             (void) ubi_detach_mtd(libubi, args.node, req.mtd_num);
>> +             errmsg("Your UBI driver does not allow changing the reserved PEBs count, probably you run an old kernel ? The support was added in kernel version 3.7.");
>> +             goto out_libubi;
>
> Here I've removed the ubi_detach_mtd() call and the goto. Since we have
> already spent energy for attaching, I think it is nicer to just print a
> warning and not detach, and let the user decide if he wants to detach.
Yes, I hesitate between error and warning.

Thanks !

Richard.
