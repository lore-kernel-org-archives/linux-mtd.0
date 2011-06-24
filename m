Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCB7-0001s7-6H
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 19:36:33 +0000
Received: by bwf12 with SMTP id 12so220613bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 12:36:26 -0700 (PDT)
Subject: Re: [PATCH 0/5] Few additional cleanup patches
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 24 Jun 2011 22:36:17 +0300
In-Reply-To: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
References: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308944185.13493.17.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 16:05 +0400, Dmitry Eremin-Solenikov wrote:
> The following changes since commit 8c2ce1c78ba6cce94d0dfe6c674ea6c0cba56899:
> 
>   mtd: socrates_nand.c: use mtd_device_parse_register (2011-06-23 10:43:39 +0300)
> 
> are available in the git repository at:
>   git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup
> 
> Dmitry Eremin-Solenikov (5):
>       mtd/maps: drop edb7312 support
>       mtd/nand: drop edb7312 support
>       mtd: hide parse_mtd_partitions
>       mtd: remove put_partition_parser() from public header
>       mtd: drop mtd_device_register

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
