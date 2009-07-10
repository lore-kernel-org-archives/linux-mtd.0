Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MP93S-0008P8-Pi
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 05:54:01 +0000
Subject: Re: [PATCH] nand_base.c: removing function names from debug prints
	and  using macro '__func__'
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <61362.192.168.10.89.1246961989.squirrel@dbdmail.itg.ti.com>
References: <61362.192.168.10.89.1246961989.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Jul 2009 08:53:43 +0300
Message-Id: <1247205223.20721.350.camel@localhost.localdomain>
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

On Tue, 2009-07-07 at 15:49 +0530, vimal singh wrote:
> Correcting debug prints by removing function names from print messages
> and using '__func__' macro instead.
> 
> Function names were wrong in few places.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>

Yet another unapplicapple patch. Care to take a look at
Documentation/email-clients.txt?

Anyway, I've amended this one manually, thanks for the patch.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
