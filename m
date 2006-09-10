Received: from tide.yandex.ru ([213.180.200.37])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMSj3-0006Op-Rj
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 18:04:10 +0100
Date: Sun, 10 Sep 2006 21:00:04 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <45044494.000002.04222@tide.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: dwmw2@infradead.org
Subject: Re: State of UBI
In-Reply-To: <1157885559.2977.136.camel@pmac.infradead.org>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<1157885559.2977.136.camel@pmac.infradead.org>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, jwboyer@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>I had envisaged that it would be fairly much akin to
>another partitioning layer, perhaps requiring a few extra methods to be
>added to the mtd_info.

To be more persuadive - I'll add to my previous mail.

It is similar to disc partitions and LVM volumes.
One can create can create several partitions. Then feed some of them to
LVM and create one or more volume groups (which is similar to UBI device(s)).
Then create logical volumes in each volume group (similar to create UBI volumes
within each UBI device).

E.g., the simplest configuration:
1. hda1 for /boot (otherwise the bootloader has to be smart and understand
   LVM tables)
2. hda2 for LVM
3. and then create as many logical volumes as you want.

And in my previous example it is similar.

1. mtd0 for the kernel (otherwise the bootloader has to be smart enough
   to understand UBI format)
2. mtd1 for UBI
3. then create as many UBI volumes as you want.

Full analogy with LVM. It'd be strange not to follow this model.

Artem.
