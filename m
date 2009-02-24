Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbrtR-0003Im-4i
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2009 07:40:06 +0000
Subject: Re: [PATCH 2/2] fix lzo usage on 64bit systems
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090223213854.GB15989@Chamillionaire.breakpoint.cc>
References: <20090223213854.GB15989@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Feb 2009 09:38:56 +0200
Message-Id: <1235461136.25808.8.camel@localhost.localdomain>
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

On Mon, 2009-02-23 at 22:38 +0100, Sebastian Andrzej Siewior wrote:
> the compress size parameter in lzo is defined in the header file as lzo_uint.
> This looks very much like uint32_t, I know, but is defined as unsigned long.
> So on 64bit LE systems we zero some bytes near by and on BE systems we
> get a size of zero.
> 
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

Pushed, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
