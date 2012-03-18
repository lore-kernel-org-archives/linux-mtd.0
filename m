Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9Gr9-0003G3-2V
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2012 14:13:11 +0000
Received: by lbol5 with SMTP id l5so3471738lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Mar 2012 07:13:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331637313.3595.10.camel@sauron.fi.intel.com>
References: <1331393478-30850-1-git-send-email-hechtb@gmail.com>
 <1331637313.3595.10.camel@sauron.fi.intel.com>
Date: Sun, 18 Mar 2012 15:13:07 +0100
Message-ID: <CABYn4swpzrmpcSw_KgUOBsWUrigBdiH1yeRuf58Jqmc1S32+-w@mail.gmail.com>
Subject: Re: [PATCH] mtd: sh_flctl: Add power management support
From: Bastian Hecht <hechtb@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/3/13 Artem Bityutskiy <dedekind1@gmail.com>:
> On Sat, 2012-03-10 at 16:31 +0100, Bastian Hecht wrote:
>> All transactions with the NAND chip require a chip enable signal. So we
>> wrap the runtime_pm_get()/put()s around it. As registers are cached, we
>> need no suspend()/resume() callbacks.
>>
>> Signed-off-by: Bastian Hecht <hechtb@gmail.com>
>
> Pushed to l2-mtd.git, thanks.

Ouch, I've realized that I've sent an old incorrect version where 2
code blocks are swapped.
I write to the device before calling runtime_pm_get().

As I was on the way to a new version anyway, I've finished it today
and suggest you drop this one and consider pushing the new one. I post
it after this mail. Sorry.

Best regards,

 Bastian Hecht


> --
> Best Regards,
> Artem Bityutskiy
