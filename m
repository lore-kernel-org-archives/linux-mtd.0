Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLmDc-0008Mf-Pq
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 14:08:40 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
Content-Type: text/plain
Date: Tue, 21 Mar 2006 22:08:04 +0300
Message-Id: <1142968084.13740.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-03-21 at 15:36 +0300, Belyakov, Alexander wrote:
> Hello,
> 
> attached diff file is a patch to be applied on MTD snapshot 20060315
> introducing striping feature for Linux MTD. Despite striping
> is well known feature is was not implemented in MTD for some reason.
> We did it and ready to share with community. Hope, striping will find
> its
> place in Linux MTD.

More questions about how do you handle bad blocks. I do not look to the
source code so far. Actually I believe you should write a short text
file with some documentation...

1. In case of NAND concatenation, what do you do with bad eraseblocks?
Say, you stripe 2 NAND flashes, and the fist one has bad eraseblock 0,
and the second one has bad eraseblock 1? Am I right that in this case
you'll just waste eraseblock 0 of chip 1 and eraseblock 1 of chip 0?

2. Suppose we have a stripped device mtd2 which stripes mtd0 and mtd1.
Suppose user calls mtd2->block_mark_bad(N) (the block_mark_bad(N) method
of the mtd2 device). Your actions? Will you mark eraseblock N of both
mtd0 and mtd1 as bad physically? Note, actually only one of them became
bad...


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
