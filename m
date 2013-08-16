Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAKbf-00030m-V0
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 14:02:25 +0000
Message-ID: <1376662051.2089.371.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] ubi: remove and create MTD device back when UBI
 volume is resized
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Rybchenko <Andrew.Rybchenko@oktetlabs.ru>
Date: Fri, 16 Aug 2013 17:07:31 +0300
In-Reply-To: <1376306265-8671-1-git-send-email-Andrew.Rybchenko@oktetlabs.ru>
References: <1376306265-8671-1-git-send-email-Andrew.Rybchenko@oktetlabs.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-12 at 15:17 +0400, Andrew Rybchenko wrote:
> If underlying MTD device size is simply corrected (as it was before),
> MTD block device is not notified about MTD device size change. As the
> result, for example, mount fails after create with zero size, resize,
> write file system image.
> 
> Side effect of the patch is change of MTD device number on resize/update.
> 
> Signed-off-by: Andrew Rybchenko <Andrew.Rybchenko@oktetlabs.ru>

Usually MTD devices never change their size, and the whole MTD subsystem
is implemented with this assumption, and the users of the MTD interface
have the same assumption - MTD devices do not size change their size.

So this change is fixing one problem by introducing another problem -
now not only the size may change, but the device number may change, and
even more ...

> +		gluebi_remove(&nt->vi);

... the device may just disappear for a while (not, the mtd mutex is
dropped here).

> +		gluebi_create(&nt->di, &nt->vi);

... then appear again in a different form :-)

When you remove the device, you also remove its sysfs files. And then
re-creates it. What an app keeps it open? Not big deal, it'll just get a
read error next time it reads it.

Anyway, this patch is not ideal.

I guess the right way to solve the problem would be to just prohibit
re-sizing a UBI volumes if we use gluebi.

Or just put the entire emulated MTD device to some "invalid" state if
the underlying UBI volume was resized. May be not always, but only if it
became smaller.

Or something else.

Anyway, I do acknowledge this is a problem, but I am not sure this is a
good solution...

-- 
Best Regards,
Artem Bityutskiy
