Received: from ideaobjects.com ([204.83.220.134] helo=www.ideaobjects.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CeTUO-00008y-Gk
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 02:22:27 -0500
Message-ID: <14876.203.125.107.14.1103095339.squirrel@203.125.107.14>
In-Reply-To: <c3d0340b041214192038f70c2e@mail.gmail.com>
References: <c3d0340b041214192038f70c2e@mail.gmail.com>
Date: Wed, 15 Dec 2004 15:22:19 +0800 (SGT)
From: "Prashant Alves" <prashant@pramatech.com>
To: "Shawn Jin" <shawnxjin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linuxmtd <linux-mtd@lists.infradead.org>
Subject: Re: 2.6.x cannot mount the root fs on a jffs2 image?
Reply-To: prashant@pramatech.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, December 15, 2004 11:20 am, Shawn Jin said:
> Hi,
>
> Can 2.6.x mount the root fs on a jffs2 image? After a while of
> research by googling, I found that do_mounts.c was re-written quite a
> lot compared with 2.4.x. In 2.4.x there is root_dev_names specifying
> all devices can be mounted as the root fs. But there isn't such a
> struct any more. Probably root_device_name is the sibling?
>
> How to add jffs2 support in do_mounts.c?
>
> Thanks,
> -Shawn.


Look at this
http://lists.infradead.org/pipermail/linux-mtd/2004-October/010611.html

Cheers,
Prashant Alves
