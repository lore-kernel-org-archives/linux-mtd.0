Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKPwE-000800-8p
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 07:03:58 +0000
Date: Thu, 12 May 2011 09:03:34 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Wagner <david.wagner@free-electrons.com>
Subject: Re: inappropriate ioctl when attaching
In-Reply-To: <4DCAB697.90906@free-electrons.com>
Message-ID: <Pine.LNX.4.64.1105120903090.15966@lnxricardw.se.axis.com>
References: <4DCAB697.90906@free-electrons.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 11 May 2011, David Wagner wrote:

> Hi,
>
> I put a ubi image on a sheevaplug but got those errors:
> uncorrectable error :
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
> from PEB 39:512, read 512 bytes
>
> So I tried to use ubiformat and ubiattach but after a successful
> ubiformat, I got the following error:
>
> # ubiattach -p /dev/mtd2
> ubiattach: error!: cannot attach "/dev/mtd2"
>           error 25 (Inappropriate ioctl for device)
>
> I've never seen this and google doesn't help much. I could flash a jffs2
> image w/o problem.

What happens if you do ubiattach -m 2 instead, i.e. specifying the mtd=20
number rather than the complete device path?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
