Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnYNB-0001Os-Bp
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 12:42:37 +0000
Received: by gxk3 with SMTP id 3so8167329gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Oct 2008 05:42:37 -0700 (PDT)
Date: Wed, 8 Oct 2008 08:34:20 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Philip Rakity <prakity@yahoo.com>
Subject: Re: PATCH - add cmdline partition support to cafe (eg mtdparts=
	boot command)
Message-ID: <20081008123420.GA3447@yoda.jdub.homelinux.org>
References: <148191.46055.qm@web58908.mail.re1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148191.46055.qm@web58908.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 01, 2008 at 02:00:51PM -0700, Philip Rakity wrote:
>Folks,
>
>Could we please incorporate this info the main line linux code.  Adds command line mtdparts= support for cafe_nand flash.
>
>NOTE:  I changed where add_mtd_device was done so that there is NOT a complete flash mount point following by the partitions that were added.  Before this n+1 partitions were added.  1 partition for the complete flash and then n partitions.

You need to add a proper Signed-off-by line to your patch before
it can be included.  Read Documenation/SubmittingPatches in the
kernel tree.

josh
