Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FP0BI-0005YE-HA
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 11:39:50 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<1143714902.3579.31.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 30 Mar 2006 20:38:59 +0400
Message-Id: <1143736739.3579.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-03-30 at 11:32 -0500, Nicolas Pitre wrote:
> While NOR flash can indeed write one byte (or even one bit) at a time, 
> it is not really useful, not in the context of stripe at least.  The NOR 
> write buffer size is a much more useful metric.
Err, what do you mean by "the NOR write buffer size"?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
