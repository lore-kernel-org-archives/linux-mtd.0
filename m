Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPJBe-0007jC-MQ
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 07:57:14 -0500
Date: Fri, 31 Mar 2006 14:57:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20060331125701.GL14713@wohnheim.fh-wedel.de>
References: <20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442D207D.9030903@yandex.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 March 2006 16:28:45 +0400, Artem B. Bityutskiy wrote:
> 
> Whatever is the de-facto user, I orient to common principles. One of 
> them is modularization. JFFS2 and MTD are a distinc and separate thngs. 
> And having anything JFFS2-specific in MTD is insane in my humble 
> oppinion, sorry. And this does not depend on what is de-facto.

Full agreement.

Only difference is that I would grind my teeth and accept a
jffs2-specific flag in mtd, if the overall code is improved that way.
Adding 10 lines of cruft to mtd and removing 50 lines of cruft from
jffs2 would be a net win.

If someone smarter comes along and notices that the 10 lines of cruft
can be removed from mtd without reintroducing 50 lines to jffs2, even
better.  Just like you showed me to use "can flip bits" instead of
"can mark obsolete".

Jörn

-- 
Mac is for working, 
Linux is for Networking, 
Windows is for Solitaire! 
-- stolen from dc
