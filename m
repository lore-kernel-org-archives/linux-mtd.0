Received: from nproxy.gmail.com ([64.233.182.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfIKv-00042Y-RP
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 09:44:41 -0500
Received: by nproxy.gmail.com with SMTP id x4so281825nfb
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Nov 2005 06:44:32 -0800 (PST)
Message-ID: <2bef0a880511240644y5ed27a9auee33fa152d78b5b2@mail.gmail.com>
Date: Thu, 24 Nov 2005 15:44:32 +0100
From: Lorenzo Orsatti <lorenzo.orsatti@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <2bef0a880511240618v123978bfq12a182564a982f7a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <2bef0a880511240618v123978bfq12a182564a982f7a@mail.gmail.com>
Subject: Re: ioctl(MEMGETINFO): Inappropriate ioctl for device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I answer myself...
The correct device to use is the /dev/mtd0,
which is a char device with major 90 and minor 0 (rw)...

Lorenzo

On 11/24/05, Lorenzo Orsatti <lorenzo.orsatti@gmail.com> wrote:
> Hallo,
>
> Trying to format a DiskOnChip 2000 with the nftl_format, I obtain:
>
> /mnt/usb1 # ./nftl_format /dev/doc
> $Id: nftl_format.c,v 1.24 2005/11/07 11:15:13 gleixner Exp $
> ioctl(MEMGETINFO): Inappropriate ioctl for device
>
> where /dev/doc is a block device and it has major 93 and minor 0.
>
> I use a Vanilla kernel 2.6.10 with the NAND drivers installed.
>
> What is the cause? What should I do?
>
> TIA
>
> Lorenzo
>
