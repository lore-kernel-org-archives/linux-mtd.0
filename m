Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or6zC-0007sC-Sx
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 10:25:39 +0000
Received: by gyg8 with SMTP id 8so91751gyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 03:25:38 -0700 (PDT)
Subject: Re: [PATCH 1/2] ubi-utils: provide default value for /dev/ubi_ctrl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <jon.povey@racelogic.co.uk>
In-Reply-To: <1283395673-4710-1-git-send-email-jon.povey@racelogic.co.uk>
References: <1283395673-4710-1-git-send-email-jon.povey@racelogic.co.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 13:25:11 +0300
Message-ID: <1283423111.1748.8.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-02 at 11:47 +0900, Jon Povey wrote:
> Modify ubiattach and ubidetach to default to /dev/ubi_ctrl if not supplied
> rather than requiring the user to type it in every time.
> 
> Also bump version from 1.0 to 1.1
> 
> Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>

Pushed both, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
