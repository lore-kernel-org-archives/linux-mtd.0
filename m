Received: from smtp2.linux-foundation.org ([207.189.120.14])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JC1JP-00059F-NP
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 23:23:26 +0000
Date: Mon, 7 Jan 2008 15:23:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] Claim maintainership for block2mtd and update email
	addresses
Message-Id: <20080107152300.2ed7cddb.akpm@linux-foundation.org>
In-Reply-To: <20080106135600.GB3120@lazybastard.org>
References: <20080106135600.GB3120@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 6 Jan 2008 14:56:01 +0100
J__rn Engel <joern@lazybastard.org> wrote:

> - * Copyright (C) 2004-2006	J=C3=B6rn Engel <joern@wh.fh-wedel.de>
> + * Copyright (C) 2004-2006	Joern Engel <joern@lazybastard.org>

Yup.  Your name comes out like that when sylpheed does its
save-email-to-a-file thing as well and I haven't got around to working out
why, or to reporting it.

In this case it looks like the dud characters came about due to "[MTD] Fix
legacy character sets throughout drivers/mtd, include/linux/mtd".  Which
doesn't look like it fixed anything much really.

Going with the asciified/anglicised/bastardised spelling is a practical
(albeit unhappy) solution.
