Received: from rdrz.de ([217.160.107.209])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM7bY-0006Im-GI
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 12:54:13 -0400
Date: Thu, 14 Apr 2005 18:54:09 +0200
From: Raphael Zimmerer <killekulla@rdrz.de>
To: Franz de Rama <pranss@gmail.com>
Message-ID: <20050414165409.GG19001@rdrz.de>
References: <d59cd780050413233072eafaef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d59cd780050413233072eafaef@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: flash_eraseall error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 14, 2005 at 02:30:43PM +0800, Franz de Rama wrote:
> I am trying to move my DoC Millennium Plus 32mb file system from ext2
> to jffs2. but when I issued the command '# flash_eraseall -j

[...]

> Any ideas where i went wrong? 

What Kernel and mtd-version are you using?

A DOC Millennium Plus 32MB driver for the current nand subsystem is
in development.

- Raphael
