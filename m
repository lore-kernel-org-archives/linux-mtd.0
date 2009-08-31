Received: from mail-ew0-f209.google.com ([209.85.219.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MiCBA-0007yK-GT
	for linux-mtd@lists.infradead.org; Mon, 31 Aug 2009 19:04:40 +0000
Received: by ewy5 with SMTP id 5so1814338ewy.27
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Aug 2009 12:04:34 -0700 (PDT)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/3] Add support for UBI and UBIFS
Date: Mon, 31 Aug 2009 21:03:59 +0200
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200908312103.59906.corentincj@iksaif.net>
Cc: util-linux-ng@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Karel Zak <kzak@redhat.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 24 August 2009 13:11:53 Corentin Chary wrote:
> Hi,
> Here is some patchs to add support for UBI and UBIFS in libblkid.
>
> UBIFS works on top of UBI volumes, there are 3 subsystems involved:
>   * MTD subsystem, which provides uniform interface to access flash chips.
>     MTD provides an notion of MTD devices (e.g., /dev/mtd0) which basically
> represents raw flash; * UBI subsystem, which is a wear-leveling and volume
> management system for flash devices; UBI works on top of MTD devices and
> provides a notion of UBI volumes (e.g.m /dev/ubi0_0); * UBIFS file system,
> which works on top of UBI volumes.
>
> The first patch add support for UBI volumes, which are represented as char
> devices in /dev/. This allow to probe for UBIFS filesystem on UBI volumes.
>
> Thanks,

Hi,
No feedback, but I forgot to CC Karel and Theodore.
I've got another series of patch for the old e2fsprogs, do you want me to send 
it ?

Thanks,

-- 
Corentin Chary
http://xf.iksaif.net
