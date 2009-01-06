Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKDzs-0002lH-9x
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2009 15:37:37 +0000
Subject: Re: [PATCH 1/3] UBI: map operation via ioctl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <71cd59b00901050605s4ec76e9avb146bb61deaf2159@mail.gmail.com>
References: <71cd59b00901050605s4ec76e9avb146bb61deaf2159@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Jan 2009 17:38:13 +0200
Message-Id: <1231256293.6608.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-01-05 at 15:05 +0100, Corentin Chary wrote:
> From: Corentin Chary <corentincj@iksaif.net>
> 
> UBI: map operation via ioctl
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Argh. The patch is corrupted:

patching file drivers/mtd/ubi/cdev.c
patch: **** malformed patch at line 11: struct file *file,

Could you please glance at Documentation/SubmittingPatches in the
kernel tree? Could you please re-send the series properly? Or send
me the patches as an attachment. Thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
