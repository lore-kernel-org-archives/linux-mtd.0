Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUlv-0000oa-2f
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:32:19 +0000
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <200901071022.46343.corentincj@iksaif.net>
References: <200901071022.46343.corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Jan 2009 11:32:36 +0200
Message-Id: <1231320756.6608.63.camel@localhost.localdomain>
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

On Wed, 2009-01-07 at 10:22 +0100, Corentin Chary wrote:
> Hi,x
> These are three patch to make a usespace program able to use map/unmap 
> operation and to query if a LEB is mapped.
> We are trying to do an UBI based userspace filesystem (using fuse) and we 
> needed these, but it could also be used for testing purpose.
> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.
> 
> The patch can also be download here:
> http://xf.iksaif.net/dev/uffs/linux/ubi/

The requested URL /dev/uffs/linux/ubi/ was not found on this server.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
