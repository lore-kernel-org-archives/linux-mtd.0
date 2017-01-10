Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQwnG-0006AM-2m
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 13:48:55 +0000
Message-ID: <1484056111.2133.16.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] UBI: Make mtd parameter readable
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Date: Tue, 10 Jan 2017 15:48:31 +0200
In-Reply-To: <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
 <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
 <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-01-10 at 14:33 +0100, Richard Weinberger wrote:
> Andy,
> 
> On Tue, Jan 10, 2017 at 1:56 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Fix permissions to allow read mtd parameter back (only for owner).
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Please CC all maintainers in future. Otherwise the chance is high that
> I'll miss a patch.

Noted.

> > -module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
> > +module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 0400);

> What is the use case?
> AFAIKT the permissions are 000

If it's not 0 in current case than you easily crash the kernel because
parser will be gone at that time. This is fixed by patch 1.

>  because a parser is involved and to
> "understand" the parameter,
> a reader needs the ubi_mtd_param_parse() function.

Are you implying that writer is a bot and reader is human being? 
The use case is obvious (any security reasons are implied?) -- allow
user to see what was written there in the first place.

Permissions 0000 are error prone.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
