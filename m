Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXY3O-0006fl-2A
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 15:35:16 +0000
Message-ID: <1396968207.30750.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: avoid workqueue format string leak
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 08 Apr 2014 17:43:27 +0300
In-Reply-To: <20140408135729.GC2429@arch.cereza>
References: <20140408044407.GA13141@www.outflux.net>
 <20140408135729.GC2429@arch.cereza>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-08 at 10:57 -0300, Ezequiel Garcia wrote:
> Hello Kees,
> 
> Thanks for the patch.
> 
> On Apr 07, Kees Cook wrote:
> > When building the name for the workqueue thread, make sure a format
> > string cannot leak in from the disk name.
> > 
> 
> Could you enlighten me and explain why you want to avoid the name leak?
> Is it a security concern?
> 
> I'd like to understad this better, so I can avoid making such mistakes
> in the future.

Well, the basics seem to be simple, attacker makes sure gd->disk_name
contains a bunch of "%s" and other placeholders, and this leads
"workqueue_alloc()" to read kernel memory and form the workqueue name.

I did not think it through further, though, but that was enough for me
to apply the patch right away. But yeah, curios parts are:

1. How attacker could end up with a crafted "gd->disk_name"
2. How attacker gets the workqueue name then, I guess there is a sysfs
file or something, but I do not know off the top of my head.

Yeah, I am interested to get educated on this a too.

-- 
Best Regards,
Artem Bityutskiy
