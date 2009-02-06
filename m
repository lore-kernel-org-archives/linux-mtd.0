Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVLei-0004ss-Sq
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 08:01:45 +0000
Subject: Re: [PATCH 2/2] UBI: add fsync capability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1233869152-23992-2-git-send-email-corentincj@iksaif.net>
References: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
	<1233869152-23992-2-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Feb 2009 10:01:34 +0200
Message-Id: <1233907294.17790.26.camel@localhost.localdomain>
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

On Thu, 2009-02-05 at 22:25 +0100, Corentin Chary wrote:
> Now, we can call fsync() on an UBI volume.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
>  drivers/mtd/ubi/cdev.c |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)

Pushed to ubi-2.6.git, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
