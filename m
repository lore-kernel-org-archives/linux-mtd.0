Received: from mail-oa0-x22f.google.com ([2607:f8b0:4003:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ulo9N-0005A4-Nk
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 22:31:50 +0000
Received: by mail-oa0-f47.google.com with SMTP id m1so3078747oag.6
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2013 15:31:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130609221808.GY23987@mwanda>
References: <1370812614-5724-1-git-send-email-andy.shevchenko@gmail.com>
 <20130609221808.GY23987@mwanda>
Date: Mon, 10 Jun 2013 01:31:27 +0300
Message-ID: <CAHp75VfYUL-odEZH4S3eskzD5Xs2Xc8Sbvy_7xE=yJaM1PiUBg@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: convert printk to dev_*
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset=UTF-8
Cc: artem.bityutskiy@linux.intel.com, Emil Goode <emilgoode@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 10, 2013 at 1:18 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Mon, Jun 10, 2013 at 12:16:54AM +0300, Andy Shevchenko wrote:
>> It's better to use actual device name as a prefix in error messages.
>>
>
> Gar...
>
> This doesn't apply on top of Emil's patch.  Emil's patch was first
> so it should go in first.  Also Emil's patch was a bugfix so it is
> more important than this printk cleanup patch.

Which tree has that patch incorporated? I'm okay to rebase it against that tree.
Current version was done against recent linux-next.

--
With Best Regards,
Andy Shevchenko
