Received: from tomts16.bellnexxia.net ([209.226.175.4] helo=tomts16-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HpeR-00089U-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 18:41:51 +0100
Date: Tue, 11 Jun 2002 13:41:48 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Matt Vestal <vestal@activmedia.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
In-Reply-To: <Pine.LNX.4.21.0206111201030.31856-100000@server.activmedia.com>
Message-ID: <Pine.LNX.4.44.0206111338410.407-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 11 Jun 2002, Matt Vestal wrote:

> The DOC loads Grub with no problem.  However, Grub has never been able to
> see the DOC filesystem(s).  I've tried root (dc0), root (dc0,0), root
> (dc0,1), etc, but nothing works.  I always get the "Selected disk does not
> exist, error"

Any debug output on the screen when GRUB starts?

Does this diagnostic message show up?

   Spare Media Header for NFTL %d found in flash sector %d

Ilguiz
