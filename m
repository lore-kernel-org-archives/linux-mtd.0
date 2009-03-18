Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LjqXU-00019C-GB
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 07:50:18 +0000
Date: Wed, 18 Mar 2009 08:50:08 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
	devices
In-Reply-To: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0903180848080.20271@lnxricardw.se.axis.com>
References: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 18 Mar 2009, Kevin Cernekee wrote:

> This patch depends on "CORE: New ioctl calls for >4GiB device support".
>
> Use the new kernel ioctls to support >4GiB flash devices in mtd-utils.

> -               if(ioctl(Fd,MEMGETREGIONINFO,&(reginfo[i])) !=3D 0)
> +               if(ioctl(Fd,MEMGETREGIONINFO64,&(reginfo[i])) !=3D 0)

Wouldn't it be an idea to support both the old and new calls for a while=20
(using compile time switching), in case someone wants to grab a newer=20
version of mtdtools but doesn't have a newer kernel for whatever reason?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
