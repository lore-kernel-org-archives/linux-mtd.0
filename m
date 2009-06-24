Received: from mail-px0-f196.google.com ([209.85.216.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJGd0-0001MB-MC
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 00:46:25 +0000
Received: by pxi34 with SMTP id 34so352862pxi.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jun 2009 17:46:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1c3f4270906221918x70ca8fb6q4d50afd552255981@mail.gmail.com>
References: <1c3f4270906221918x70ca8fb6q4d50afd552255981@mail.gmail.com>
Date: Tue, 23 Jun 2009 17:46:16 -0700
Message-ID: <1c3f4270906231746j66b1f0a6h599268604cf73221@mail.gmail.com>
Subject: Re: jffs2 on ubi volume
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

Answering my own question, I got it to work by creating a /dev/ubi0_1
device file and then using ubiupdatevol.

>./ubimkvol /dev/ubi0 -s25MiB -Nubivol1 -n1
> mknod /dev/ubi0_1 c 253 2
> ./ubiupdatevol /dev/ubi0_1 sum.jffs2.rootfs
> mkdir /tmp/flash
> mount -t jffs2 /dev/mtdb-nvdata /tmp/flash




On Mon, Jun 22, 2009 at 7:18 PM, Manoj<manoj23@gmail.com> wrote:
> Hi,
>
> I would like to use JFFS2 on top of UBI. I have enabled
> CONFIG_MTD_UBI_GLUEBI in kernel config.
>
> I have been able to create an empty FS by doing:
>> modprobe ubi mtd=3D1
>> ubimkvol /dev/ubi0 -s 25MiB -N ubivol1
>> mount -t jffs2=A0 /dev/mtdb-nvdata /tmp/flash
>
> I can read and write files to /tmp/flash.
>
> How do I write a jffs2 filesystem image to a ubi volume? I tried
> ubiupdatevol but I think I am not passing the right parameters.
> Do I need to use ubinize to create the UBI image that can be then
> programmed to the UBI volume?
>
> Thanks for any help.
>
