Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zuiw-00074j-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 15:45:14 +0100
Date: Wed, 31 Jul 2002 16:45:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Roee Friedman <roeef@mellanox.co.il>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling mkfs.jffs
Message-ID: <20020731144508.GA6695@wohnheim.fh-wedel.de>
References: <91DB792C7985D411BEC300B40080D29C457DC9@mtvex01.mtv.mtl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91DB792C7985D411BEC300B40080D29C457DC9@mtvex01.mtv.mtl.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 31 July 2002 16:38:32 +0300, Roee Friedman wrote:
> I want to compile mkfs.jffs only, without all the kernel support (I want to
> run it on the host and create a JFFS2 image which I will write to flash on
> the target). Is it possible? What are the compilation flags?

<checkout cvs / download and untar>
cd mtd/utils
make mkfs.jffs
su -c "cp mkfs.jffs /usr/local/bin"

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
