Received: from mail-px0-f196.google.com ([209.85.216.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIvax-0006xZ-U4
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 02:18:54 +0000
Received: by pxi34 with SMTP id 34so160215pxi.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 19:18:43 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 22 Jun 2009 19:18:43 -0700
Message-ID: <1c3f4270906221918x70ca8fb6q4d50afd552255981@mail.gmail.com>
Subject: jffs2 on ubi volume
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would like to use JFFS2 on top of UBI. I have enabled
CONFIG_MTD_UBI_GLUEBI in kernel config.

I have been able to create an empty FS by doing:
> modprobe ubi mtd=3D1
> ubimkvol /dev/ubi0 -s 25MiB -N ubivol1
> mount -t jffs2=A0 /dev/mtdb-nvdata /tmp/flash

I can read and write files to /tmp/flash.

How do I write a jffs2 filesystem image to a ubi volume? I tried
ubiupdatevol but I think I am not passing the right parameters.
Do I need to use ubinize to create the UBI image that can be then
programmed to the UBI volume?

Thanks for any help.
