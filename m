Received: from mail-fx0-f223.google.com ([209.85.220.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NfK3Q-0000fZ-H6
	for linux-mtd@lists.infradead.org; Wed, 10 Feb 2010 21:25:05 +0000
Received: by fxm23 with SMTP id 23so495857fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Feb 2010 13:24:58 -0800 (PST)
Subject: Re: [PATCH 01/17] MTD: create lockless versions of
	{get,put}_mtd_device This will be used to resolve deadlock in block
	translation layer.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <1265737574.9195.16.camel@maxim-laptop>
References: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
	<1265734665-22656-2-git-send-email-maximlevitsky@gmail.com>
	<1265735693.11509.253.camel@laptop>
	<1265736206.9195.4.camel@maxim-laptop>
	<1265737574.9195.16.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Feb 2010 23:22:33 +0200
Message-ID: <1265836953.8276.9.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-09 at 19:46 +0200, Maxim Levitsky wrote: 
> On Tue, 2010-02-09 at 19:23 +0200, Maxim Levitsky wrote: 
> > On Tue, 2010-02-09 at 18:14 +0100, Peter Zijlstra wrote: 
> > > On Tue, 2010-02-09 at 18:57 +0200, Maxim Levitsky wrote:
> > > > These functions can be used as long as we don't need access to global mtd table, but have
> > > > a pointer to the mtd device.
> > > > 
> > > > Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> > > > ---

David, I just got a great idea how to resolve the same issue in much
cleaner way.

Why not to drop the mtd table lock before calling the add notifers?
If we assume no add_mtd_device/del_mtd_device running concurrently this
should be ok. After all mtd table lock should protect only the mtd
table.
And the table only purpose it to locate an mtd device by number or name.
This purpose will always be useful, be it a static table or not.

I also remove all that mtd table junk from mtd_blktrans.c

Best regards,
Maxim Levitsky
