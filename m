Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEdUr-0004fZ-VG
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 06:10:52 +0000
Subject: Re: write error while using UBI/UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manoj <manoj23@gmail.com>
In-Reply-To: <1c3f4270906101843u65d64a98recfa07b1a67f3d3d@mail.gmail.com>
References: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
	<1244440779.5847.334.camel@localhost.localdomain>
	<1c3f4270906081913g7e9b0334r183e87d782b2406d@mail.gmail.com>
	<1244525403.5847.370.camel@localhost.localdomain>
	<1c3f4270906101843u65d64a98recfa07b1a67f3d3d@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Jun 2009 09:10:30 +0300
Message-Id: <1244700630.5847.409.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-10 at 18:43 -0700, Manoj wrote:
> So I finally got all patches applied to my tree. I don't see an error
> with mount operation now.
> But I am seeing corrupted data messages.

Is this a real flash? Looks like you have a malfunctioning flash
or driver. Make sure your NAND is fine. You may try running
flash tests which you may find in drivers/mtd/tests in new
kernels, or here:
http://git.infradead.org/users/ahunter/nand-tests.git

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
