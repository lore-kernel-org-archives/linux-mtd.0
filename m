Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOzEh-0004TD-Fn
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 10:39:03 -0500
Message-ID: <442BFB87.4050402@intel.com>
Date: Thu, 30 Mar 2006 19:38:47 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<1143714902.3579.31.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143714902.3579.31.camel@sauron.oktetlabs.ru>
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

Hi Artem,

Artem B. Bityutskiy wrote:
>> But due to some properties of interleaving algorithm it is very likely
>> get increased erase size in case of striping thre ore more devices with
>> different size.
> Brrr... The resulting eraseblock size is anyway increased. I guess you
> wanted to say that one may end up with *substantially* increased
> eraseblock size, right?

Yes, you're right.

> So, to be generic, we have to say that the interleave size has to be
> multiple to the minimal flash input/output unit size.

Thanks for your clarification!

Alexander Belyakov
