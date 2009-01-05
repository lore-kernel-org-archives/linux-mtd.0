Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJqNf-0008BJ-4P
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 14:24:35 +0000
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <200901051458.17322.corentin.chary@gmail.com>
References: <200901051458.17322.corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Jan 2009 16:24:12 +0200
Message-Id: <1231165452.6608.15.camel@localhost.localdomain>
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

Hi,

On Mon, 2009-01-05 at 14:58 +0100, Corentin Chary wrote:
> These are three patch to make a usespace program able to use map/unmap 
> operation and to query if a LEB is mapped.
> We are trying to do an UBI based userspace filesystem (using fuse) and we 
> needed these, but it could also be used for testing purpose.

OK.

> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.

In your patches I do not see why these ioctl's are enabled only if the
CONFIG_MTD_UBI_DEBUG_USERSPACE_IO configuration option is switched on.
It looks like the ioctl's are always enabled.

Well, you probably also need direct LEB write functionality, which is
present only as a debugging option so far. We may make it non-debugging
at some point, I guess. The reason why we disabled this is because we
wanted to prevent dump users from doing stupid things.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
