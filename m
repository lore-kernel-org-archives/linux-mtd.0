Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188T23-0004c1-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2002 22:15:47 +0000
Date: Sun, 3 Nov 2002 23:45:59 +0100 (CET)
From: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
To: Joseph Teichman <af671@osfn.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with GRUB & nftl_format
In-Reply-To: <1036364578.1604.12.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.44.0211032339150.10855-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
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

You need to reserve sufficient amount of binary flash for the GRUB image
before the NFTL partition. This is set by the "<start offset>" argument to
nftl_format IIRC.

Alternatively, use the msys 5.X dformat tool to install GRUB. I think
current versions of the DOC GRUB should be compatible with msys dformat
5.x. (unfortunately I have not yet had time to verify)

Regards
Henrik Nordström
MARA Systems AB, Sweden


On Sun, 3 Nov 2002, Joseph Teichman wrote:

> partition it and set up an ext2 file system. Then, I used doc_loadbios
> tool to install GRUB. GRUB Installed successfully, and it works, but at
> the same time, it seems to have hosed up the doc again. The only thing
> that I can do is to reformat the doc, which of course overwrites GRUB,
> leaving back to square one. I am using a 2.4.19 kernel, with the latest
> cvs grab of mtd-linux. Can anyone tell me what is happening and how I
> can work around it?
