Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9KFg-00089I-9G
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 16:13:57 +0000
Received: by bwz5 with SMTP id 5so1173738bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 09:13:54 -0700 (PDT)
Subject: Re: [PATCH] block2mtd: dubious assignment
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20101022143416.GA12737@logfs.org>
References: <20101022124724.59eba464@absol.kitzblitz>
	<20101022143416.GA12737@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Oct 2010 19:13:50 +0300
Message-ID: <1287764030.7480.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Kaiser <nikai@nikai.net>, linux-mtd@lists.infradead.org,
	Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-22 at 16:34 +0200, Jörn Engel wrote:
> On Fri, 22 October 2010 12:47:24 +0200, Nicolas Kaiser wrote:
> > 
> > When block2mtd_erase fails, a duplicated assignment instantly
> > changes instr->state from MTD_ERASE_FAILED to MTD_ERASE_DONE.
> > 
> > It looks to me like this might not be intended, or is it?
> 
> Definitely not.  Just proves how well block device errors are tested.
> 
> > Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
> Acked-By: Joern Engel <joern@logfs.org>
> 
> Artem, can I leave this patch to you as well?

Yes, I'll put it to my l2 tree of course, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
