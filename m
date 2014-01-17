Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4B0F-0003e1-AO
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 15:06:36 +0000
Message-ID: <1389971161.31307.112.camel@sauron.fi.intel.com>
Subject: Re: Find & remove orphan LEBs from UBIFS partition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Date: Fri, 17 Jan 2014 17:06:01 +0200
In-Reply-To: <104461389971034@web1j.yandex.ru>
References: <123921389951584@web25m.yandex.ru>
 <1389970781.31307.110.camel@sauron.fi.intel.com>
 <104461389971034@web1j.yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-01-17 at 19:03 +0400, Konstantin Tokarev wrote:
> 
> 17.01.2014, 18:59, "Artem Bityutskiy" <dedekind1@gmail.com>:
> > On Fri, 2014-01-17 at 13:39 +0400, Konstantin Tokarev wrote:
> >
> >>  Hi all,
> >>
> >>  How can I find and remove LEBs which don't correspond to known files
> >>  using internal API of UBIFS?
> >>  AFAIU, somethinng like this is done on recovery during mount, but in
> >>  my case superblock is not dirty, so I'd like to force cleanup with
> >>  custom mount option.
> >
> > Are you trying to do something like 'secure deletion' ? Disclosing your
> > intentions would help understanding what you need. I do not quite
> > understand.
> >
> > Do you want to fine all LEBs which do not contain anything useful like
> > data or meta-data, and unmap them?
> 
> Yes, exactly.

Check 'fixup_free_space', it iterates over all useful ones, the rest can
be unmapped.

-- 
Best Regards,
Artem Bityutskiy
