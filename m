Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM05h-0005Dh-5C
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 04:57:30 -0500
Message-ID: <44211F79.1010503@intel.com>
Date: Wed, 22 Mar 2006 12:57:13 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142968084.13740.19.camel@sauron.oktetlabs.ru>
In-Reply-To: <1142968084.13740.19.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Artem B. Bityutskiy wrote:
> 1. In case of NAND concatenation, what do you do with bad eraseblocks?
> Say, you stripe 2 NAND flashes, and the fist one has bad eraseblock 0,
> and the second one has bad eraseblock 1? Am I right that in this case
> you'll just waste eraseblock 0 of chip 1 and eraseblock 1 of chip 0?
>   

Yes, you got it correctly.

> 2. Suppose we have a stripped device mtd2 which stripes mtd0 and mtd1.
> Suppose user calls mtd2->block_mark_bad(N) (the block_mark_bad(N) method
> of the mtd2 device). Your actions? Will you mark eraseblock N of both
> mtd0 and mtd1 as bad physically? Note, actually only one of them became
> bad...

Yes, in current implementation both blocks on subdevices, representing 
one superblock, will be marked as bad.

Thanks,
Alexander Belyakov
