Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MK4zG-0000Vi-4H
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 06:32:44 +0000
Subject: Re: jffs2 on ubi volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thang Dao Duy <hanbaoquansexy@gmail.com>
In-Reply-To: <a1fb7300906252320k655298dcg33f56ca702736ac@mail.gmail.com>
References: <a1fb7300906252320k655298dcg33f56ca702736ac@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Jun 2009 09:32:13 +0300
Message-Id: <1245997933.9487.64.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: manoj23@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-26 at 13:20 +0700, Thang Dao Duy wrote:
> manoj23@gmail.com wrote:
> 
> >Answering my own question, I got it to work by creating a /dev/ubi0_1
> >device file and then using ubiupdatevol.
> 
> >>./ubimkvol /dev/ubi0 -s25MiB -Nubivol1 -n1
> >> mknod /dev/ubi0_1 c 253 2
> >> ./ubiupdatevol /dev/ubi0_1 sum.jffs2.rootfs
> >> mkdir /tmp/flash
> 
> 
> Command ubimkvol will create a device /dev/ubi0_1, so "mknod
> /dev/ubi0_1 c 253 2" may be unnecessary.

No, not really. Udev will do this, not ubimkvol. And if you do not
have udev, the device node will not be created. But may be it would
be a good idea to teach ubimkvol doing this.
> manoj23@gmail.com wrote:
> 
> >> mount -t jffs2 /dev/mtdb-nvdata /tmp/flash
> 
> jffs2 file system does not work on UBI API, it works on MTD API. so we
> cannot mount jffs2 on ubi volume. We can use ubifs on ubi volume:
> 
> mount -t ubifs ubi0_1 /mnt/

Right, but you still may use jffs2 with ubi. We have the gluebi emulator
for this:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_run_jffs2

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
