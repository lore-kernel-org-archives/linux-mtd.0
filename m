Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOraQ-0002Fl-KU
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 10:42:33 +0000
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <1232359769.22350.24.camel@localhost.localdomain>
References: <200901071022.46343.corentincj@iksaif.net>
	<alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
	<71cd59b00901180924t4b61a22cw325b18789dd953b2@mail.gmail.com>
	<71cd59b00901190138n1e21a769lb6afc28b02c5fb75@mail.gmail.com>
	<1232359769.22350.24.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 19 Jan 2009 12:42:40 +0200
Message-Id: <1232361760.22350.25.camel@localhost.localdomain>
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

On Mon, 2009-01-19 at 12:09 +0200, Artem Bityutskiy wrote:
> Hi,
> 
> Some obvious things are commented below.
> 

Err, and also do not forget to zap the CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
from UBI Kconfig.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
