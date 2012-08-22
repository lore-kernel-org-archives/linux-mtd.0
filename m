Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T46ND-00046t-NE
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 08:33:12 +0000
Received: by lbbgf7 with SMTP id gf7so455397lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 01:33:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345557295.2848.112.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
 <1345557295.2848.112.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 10:32:45 +0200
Message-ID: <CACQ1gAiEBmUMWXr=FWmXqJUZ=ZwyLTCqKmUAMYpfJZBNJTPYSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] UBI: replace MTD_UBI_BEB_LIMIT with module
 parameter
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

2012/8/21 Artem Bityutskiy <dedekind1@gmail.com>:
> Changed this to 'printk(KERN_ERR' and wrapped the line.
>
> The former is because the entire function uses 'printk(KERN_ERR', and I
> am a fan of consistency. We can change them all to 'pr_err()' and
> 'pr_warn()' in a separate patch.
>
> Similar for wrapping - UBI wraps all messages. If we want, we can unwrap
> them all in a separate patch.
>
> Feel free to submit such a patch, I won't have objections.
>
>> -MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
>> -                   "mtd=<name|num|path>[,<vid_hdr_offs>].\n"
>
> You unwrapped this one and I pushed that as is, because it is just much
> more readable, and it is the only place where we describe a module, so
> no inconsistencies. :-)
>
> Thank you!
>
> --
> Best Regards,
> Artem Bityutskiy

Looking for consistency, I made a quick git grep "\<printk( *KERN_" | wc -l
the answer is  > 32000
Looks like I found something to do if I'm getting bored with openstreetmap :)


I double checked linux-ubi/master tree with mine, it's all right.

I'll resend the mtd-utils part updated with the new kernel header ubi-user.h

Best regards

Richard.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
