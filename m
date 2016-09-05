Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgzGp-0003Dd-S3
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 19:09:28 +0000
Received: by mail-lf0-x242.google.com with SMTP id l131so3306565lfl.0
 for <linux-mtd@lists.infradead.org>; Mon, 05 Sep 2016 12:09:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <089ee0ab-89ca-4c88-6e8c-f070e0a8ee57@gmail.com>
References: <4d3db993-d030-3659-2f62-94c373f57038@gmail.com>
 <089ee0ab-89ca-4c88-6e8c-f070e0a8ee57@gmail.com>
From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 6 Sep 2016 00:39:04 +0530
Message-ID: <CAD6G_RQwCYKcZ_wLgNJEK41QUABtZyDkyTjvBb+ekiv-Wum1vg@mail.gmail.com>
Subject: Re: [PATCH v2] spi-nor: fix flags for s25fl128s
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 5, 2016 at 11:09 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> The Spansion S25FL128S also supports dual read mode.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - In addition remove SECT_4K flag. 4K erases are supported,
>   but not uniformly.

Better to mention this on to commit body as well.

Reviewed-by: Jagan Teki <jteki@openedev.com>

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
