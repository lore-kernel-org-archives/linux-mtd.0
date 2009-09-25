Received: from mx1.redhat.com ([209.132.183.28])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mr5fL-0000km-Uk
	for linux-mtd@lists.infradead.org; Fri, 25 Sep 2009 07:56:36 +0000
Date: Fri, 25 Sep 2009 09:56:26 +0200
From: Karel Zak <kzak@redhat.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
Message-ID: <20090925075625.GE27905@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<20090924141433.GC27905@nb.net.home>
	<71cd59b00909241457p3b9247a1q661ea63bde584f26@mail.gmail.com>
	<1253863159.3778.38.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1253863159.3778.38.camel@localhost>
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org,
	Corentin Chary <corentin.chary@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 25, 2009 at 10:19:19AM +0300, Artem Bityutskiy wrote:
> To check whether this char. device node is an UBI volume and not
> something else, you should scan all /sys/class/ubi/ubiX/Y/dev files, and
> see if there is a device with the same major:minor.
> 
> The other possibility would be to look at /proc/devices, and make sure
> there is an ubiX device with the same major number as your /dev/ubiX_Y
> device.

 Yes, we have such function (blkid_driver_has_major()), but I think
 it's overkill in this context. It seems that check for the "ubi" 
 device name in ubi_probe_all() is enough.

 Thanks.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
