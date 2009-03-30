Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LoJBK-00087Y-Fr
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 15:13:53 +0000
Subject: Re: [Patch] [ubifs] Don't define large array on local stack.
From: Artem Bityutskiy <dedekind@infradead.org>
To: sonic zhang <sonic.adi@gmail.com>
In-Reply-To: <1238401368.24899.2.camel@eight.analog.com>
References: <1238401368.24899.2.camel@eight.analog.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Mar 2009 18:11:13 +0300
Message-Id: <1238425873.20906.3.camel@localhost.localdomain>
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

On Mon, 2009-03-30 at 16:22 +0800, sonic zhang wrote:
> On nommu arch, local stack size is very limited and can't be enlarged on demand. So, don't define large array on local stack.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Well, this was not a proper patch applicable by git-am. But
I amended it and applied. Also I changed the patch a little
to make it nicer.

Thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
