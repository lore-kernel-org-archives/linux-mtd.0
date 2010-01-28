Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaVyN-0003dk-Pm
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 15:08:00 +0000
Subject: Re: Memory leak on UBI volume truncating
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Skuczynski <mareksk7@gmail.com>
In-Reply-To: <a328840c1001180036j771339a7t780960627e742c9b@mail.gmail.com>
References: <a328840c1001130628h4bb0f03auad84dd1564fc08a7@mail.gmail.com>
	<1263724633.8276.135.camel@localhost.localdomain>
	<1263724992.8276.140.camel@localhost.localdomain>
	<a328840c1001180034n7fd1c3e9m420afef60f7c97ab@mail.gmail.com>
	<a328840c1001180036j771339a7t780960627e742c9b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Jan 2010 17:07:18 +0200
Message-ID: <1264691238.1973.139.camel@localhost>
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

On Mon, 2010-01-18 at 09:36 +0100, Marek Skuczynski wrote:
> >> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
> >> index c1d7b88..425bf5a 100644
> >> --- a/drivers/mtd/ubi/upd.c
> >> +++ b/drivers/mtd/ubi/upd.c
> >> @@ -155,6 +155,7 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
> >>                if (err)
> >>                        return err;
> >>                vol->updating = 0;
> >> +               return 0;
> >>        }
> >>
> >>        vol->upd_buf = vmalloc(ubi->leb_size);
> >>
> >> --
> 
> Thanks for you reply. It seems the fix solve the issue.

FYI, the fix is merged to the Linus's tree.

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
