Received: from mu-out-0910.google.com ([209.85.134.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HggXD-00082A-6D
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 08:23:48 -0400
Received: by mu-out-0910.google.com with SMTP id w1so214969mue
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Apr 2007 05:23:44 -0700 (PDT)
Message-ID: <625fc13d0704250523g26ad6d5cs69e7f4a53177b538@mail.gmail.com>
Date: Wed, 25 Apr 2007 07:23:44 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Semih Hazar" <semih.hazar@indefia.com>
Subject: Re: Slow NAND + JFFS2
In-Reply-To: <462F45B1.8020007@indefia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <462F45B1.8020007@indefia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/25/07, Semih Hazar <semih.hazar@indefia.com> wrote:
> Hi,
>
> I'm using a 256 MiB NAND Flash from ST -> Manufacturer ID: 0x20, Chip
> ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit) with JFFS2. The filesystem is
> mounted as rootfs and the size is around 60 megs.
>
> Filesystem operations seem very slow to me. Such as:
>
> It takes almost 1 and a half minutes to copy a 30 meg file.
> Mounting the filesystem takes around 1 minute.

Given your CPU speed and the size of the files involved, these timings
seem to be normal to me.

You might want to try using summary support to speed up mount time (at
the cost of some additional used space).  I'm not entirely sure you
can speed up the copy time of your file though.

josh
