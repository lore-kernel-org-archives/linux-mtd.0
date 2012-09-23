Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFjl0-0004vz-Sw
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 10:49:51 +0000
Received: by lbbgf7 with SMTP id gf7so5511326lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 03:49:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345454375.2848.21.camel@sauron.fi.intel.com>
References: <1341410726-10562-1-git-send-email-hechtb@gmail.com>
 <CABYn4syMFh4smteHS-zCAy3ygKsyxoD2+FfaBeQxKvK_FA+5mA@mail.gmail.com>
 <1345454375.2848.21.camel@sauron.fi.intel.com>
Date: Sun, 23 Sep 2012 12:49:43 +0200
Message-ID: <CABYn4syVz46ChwYkhP=5TMb4N+Q0sTnuMu+C_d4LPuxrQ=WM-g@mail.gmail.com>
Subject: Re: [PATCH] mtd: sh_flctl: Switch from tick-based to time-based
 timeout
From: Bastian Hecht <hechtb@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

commit 19f5f7364a1cc770b14692f609bb9b802fc334d5
is still in l2-mtd. Please drop it, so it doesn't get merged and I can
base my new patches on the clean code.

Thanks!

Bastian


2012/8/20 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2012-07-25 at 17:21 +0200, Bastian Hecht wrote:
>> Hello Artem!
>>
>> Could you please pull out this patch of your tree? While reworking the
>> driver for IRQ-driven use, I've realized that this conversion makes no
>> sense as all loops use a udelay(1) in them. So the timeout is already
>> time based.
>
> Dropped, thanks!
>
> --
> Best Regards,
> Artem Bityutskiy
