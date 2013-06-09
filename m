Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ulmxk-0003xs-0D
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 21:15:44 +0000
Received: by mail-oa0-f51.google.com with SMTP id i4so1003664oah.38
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2013 14:15:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130609205747.GX23987@mwanda>
References: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
 <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
 <20130609191732.GK28112@mwanda>
 <CAHp75VcOMUVtfgXOQ+cyVpJN-XS7=yO1H8+8Nnw+LCgYWp7RPw@mail.gmail.com>
 <20130609205747.GX23987@mwanda>
Date: Mon, 10 Jun 2013 00:15:22 +0300
Message-ID: <CAHp75VeDtfq3APDQsy2SP=wLrRPUJdVaBbfu4NcrWrC70wCebg@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: Improve error handling in
 orion_nand_probe
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset=UTF-8
Cc: andrew@lunn.ch, Bill Pemberton <wfp5p@virginia.edu>,
 artem.bityutskiy@linux.intel.com, Jingoo Han <jg1.han@samsung.com>,
 kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Emil Goode <emilgoode@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 9, 2013 at 11:57 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Sun, Jun 09, 2013 at 10:27:03PM +0300, Andy Shevchenko wrote:
>> On Sun, Jun 9, 2013 at 10:17 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> > On Sun, Jun 09, 2013 at 08:15:20PM +0300, Andy Shevchenko wrote:

>> >> What about another patch (that I guess should go first)  that converts
>> >> printk to dev_* or pr_*?
>>
>> > Huh, what?  Those are two totally unrelated things.  Emil's patch is
>> > a bug fix.
>>
>> To be precise his patch is bugfix and cleanup at once.
>> My proposal is to add a clean up patch.
>
> The printk idea isn't a bad one, it's just totally unrelated to what
> the patch is doing.

I don't agree with word 'totally'. It touches probe function and
shuffles code there.

>  You can't just randomly tell people to do a
> bunch of work for no reason.  "Good bugfix, but before we apply it
> you have to mow my lawn."

In this particular case I didn't think it's a big deal to fix 3 printfs.
Anyway, see patch in the next message.


--
With Best Regards,
Andy Shevchenko
