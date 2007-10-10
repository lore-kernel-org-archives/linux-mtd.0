Received: from py-out-1112.google.com ([64.233.166.176])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Iffpr-0002RY-Iu
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 18:59:09 +0100
Received: by py-out-1112.google.com with SMTP id a25so526656pyi
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Oct 2007 10:58:46 -0700 (PDT)
Message-ID: <f383264b0710101058p22c6e22ax23233f03b52e88ed@mail.gmail.com>
Date: Wed, 10 Oct 2007 10:58:45 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "catboat@texas.net" <catboat@texas.net>
Subject: Re: bit flip
In-Reply-To: <1192030627.470cf1a3b8f28@webmail.texas.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1191439970.4703ee62083f1@webmail.texas.net>
	<1191991698.578.92.camel@localhost.localdomain>
	<1192030627.470cf1a3b8f28@webmail.texas.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/10/07, catboat@texas.net <catboat@texas.net> wrote:
> Quoting David Woodhouse <dwmw2@infradead.org>:
>
> > On Wed, 2007-10-03 at 14:32 -0500, catboat@texas.net wrote:
> > > A NAND card flipped a bit and caused a data CRC problem in a data node.
> > > When I cat the file, this region is zeroes. cat exits with rc 0.

How big were the chunks of zeroes? I'm seeing something similar here
on a 128KB/2KB NAND flash part, where a 4KB chunk incorrectly reads as
zeroes.

Is there some kind of utility to map from a jffs2 inode to an offset
in flash? That would help me track down the corruption I'm seeing.

Matt
