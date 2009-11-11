Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8ASl-0000YB-Lc
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 10:30:12 +0000
Subject: Re: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091111104615.2ea67205@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
	<20091103141903.23d0d0be@marrow.netinsight.se>
	<1257869493.21596.809.camel@localhost>
	<20091111104615.2ea67205@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Nov 2009 12:29:42 +0200
Message-Id: <1257935382.21596.1007.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-11-11 at 10:46 +0100, Simon Kagstrom wrote:
> On Tue, 10 Nov 2009 18:11:33 +0200
> 
> > Do we really need this notifiers? Would not it be better to open mtd
> > device straight in the module_init function instead?
> 
> If the mtdoops driver is built into the kernel, module_init might be
> (and I believe will be) called before the MTD partitions have been
> created. With the MTD notifiers, this problem is worked around.

But this is why we have late_initcall(), which we can use instead of
module_init().

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
