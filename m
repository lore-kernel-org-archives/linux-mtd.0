Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPDvU-0006ah-II
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 02:20:24 -0500
Message-ID: <442CD81F.5020702@intel.com>
Date: Fri, 31 Mar 2006 11:19:59 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<1143714902.3579.31.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> While NOR flash can indeed write one byte (or even one bit) at a time, 
> it is not really useful, not in the context of stripe at least.  The NOR 
> write buffer size is a much more useful metric.

That was mentioned in documentation for striping layer core. "For NOR 
devices the bottom border for interleave size is defined by flash buffer 
size". But anyway I think it is worth to mention that interleave size in 
general case can be less than buffer size.
