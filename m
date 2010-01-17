Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NWSbD-0007tb-2H
	for linux-mtd@lists.infradead.org; Sun, 17 Jan 2010 10:43:19 +0000
Received: by fxm3 with SMTP id 3so1434546fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Jan 2010 02:43:14 -0800 (PST)
Subject: Re: Memory leak on UBI volume truncating
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Skuczynski <mareksk7@gmail.com>
In-Reply-To: <1263724633.8276.135.camel@localhost.localdomain>
References: <a328840c1001130628h4bb0f03auad84dd1564fc08a7@mail.gmail.com>
	<1263724633.8276.135.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Jan 2010 12:43:12 +0200
Message-Id: <1263724992.8276.140.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-17 at 12:37 +0200, Artem Bityutskiy wrote:
> Hi,
> 
> On Wed, 2010-01-13 at 15:28 +0100, Marek Skuczynski wrote:
> > Hello,
> >   I have prepare a simple volume update stress test (see test code below).
> >   This test has been run for kernel 2.6.23 with some updates from 2.6.28,
> >   and always after a few minutes the OOM killer was launched.
> > 
> >   What i found it that each an UBI volume truncate operation with
> > ubiupdatevol tool
> >   causes memory leak. I think this happens because:
> > 
> >   - ubi_start_update()  param "bytes" is equal 0
> > 
> >   - vol->updating flag is re-set to 0
> > 
> >   - vol->upd_buf is allocated regardless of vol->updating flag,
> >      but not released on device close by vol_cdev_release()
> > 
> >   I never run the test on a newer kernel version, so I cannot confirm
> > that this problem still exists.
> > 
> >   Please confirm, whether my findings are correct or not, thanks.
> 
> thanks for this finding. Looks like your analysis is right. Does this
> simple patch help?

Actually this even simpler patch should fix the issue. Could you please
test it and let me know if it helps.

diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index c1d7b88..425bf5a 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -155,6 +155,7 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
                if (err)
                        return err;
                vol->updating = 0;
+               return 0;
        }

        vol->upd_buf = vmalloc(ubi->leb_size);

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
