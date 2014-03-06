Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLWZ7-0004Ct-H3
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 11:34:19 +0000
Date: Thu, 6 Mar 2014 08:33:34 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: ayaka <lxr1234@hotmail.com>
Subject: Re: about porting ubiblock to make squashfs work on it
Message-ID: <20140306113334.GD532@arch.cereza>
References: <BLU0-SMTP222D7E8438812853BF4B0AAD880@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BLU0-SMTP222D7E8438812853BF4B0AAD880@phx.gbl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 06, ayaka wrote:
> 
>    I will do a overlayfs on nand flash, about overlayfs, I will ask
> linux-fsdevel for help, now I want to talking about ubiblcok.
> As I know that the squashfs is not suitable for raw nand flash, so I
> need the ubiblock to manage the nand flash then I will create a squashfs
> on it as the lower of overlayfs, about the upper, I will try, ubifs,

Putting squashfs on top of an UBI volume can be achieved using a recent
UBI feature, that allows block creation on UBI volumes.

You can find the latest kernel patches at:

http://git.infradead.org/linux-ubifs.git

These patches are very easy to backport on v3.10 (I use them on v3.2).

The website documentation should be updated soon, but here's something
until that happens:

http://patchwork.ozlabs.org/patch/323628/

The userspace tool to handle this will be pushed soon.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
