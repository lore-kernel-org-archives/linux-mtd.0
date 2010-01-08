Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGkL-0007Cq-0J
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:27:33 +0000
Received: by fxm22 with SMTP id 22so21944935fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 07:27:28 -0800 (PST)
Subject: Re: [PATCH 2/9] MTD: create lockless versions of {get,put}_mtd_device
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20100108152119.GB31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<1262963198.12577.16.camel@maxim-laptop>
	<20100108152119.GB31872@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Jan 2010 17:27:24 +0200
Message-ID: <1262964444.12577.29.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-08 at 16:21 +0100, Jörn Engel wrote: 
> On Fri, 8 January 2010 17:06:38 +0200, Maxim Levitsky wrote:
> >
> > +	err = __get_mtd_device(ret);
> 
> Function is called here, afaics not declared and defined...
> 
> > [...]
> > +int __get_mtd_device(struct mtd_info *mtd)
> 
> ...further below.  Didn't gcc complain about this?  Or am I missing
> something?
> 
> Jörn
> 

Yep, you miss this:

+extern int __get_mtd_device(struct mtd_info *mtd);
+extern void __put_mtd_device(struct mtd_info *mtd);

I put that into the header, so these functions can be used outside.

When I compiled the kernel, there were no warnings.

Best regards,
Maxim Levitsky
