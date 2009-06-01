Received: from mail-qy0-f118.google.com ([209.85.221.118])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MB0MU-0000CO-GE
	for linux-mtd@lists.infradead.org; Mon, 01 Jun 2009 05:47:13 +0000
Received: by qyk16 with SMTP id 16so504598qyk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 31 May 2009 22:47:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243705298-21814-2-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
Date: Mon, 1 Jun 2009 13:47:04 +0800
Message-ID: <f17812d70905312247g3159bb6chdfb90b00222195e9@mail.gmail.com>
Subject: Re: [MTD] [NAND] S3C2410: Move to using platform device table
From: Eric Miao <eric.y.miao@gmail.com>
To: Ben Dooks <ben-linux@fluff.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.miao@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 31, 2009 at 1:41 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> Commit 57fee4a58fe802272742caae248872c392a60670 added an
> method to specify the platform device compatibility by using
> an id-table instead of registering multiple drivers.
>
> Move the S3C24XX NAND driver to using this ID table.
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> CC: Eric Miao <eric.miao@marvell.com>

Yeah, looks much cleaner.
