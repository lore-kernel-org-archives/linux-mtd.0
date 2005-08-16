Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4vps-00020x-Ir
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 03:26:16 -0400
Message-ID: <430194F4.60802@yandex.ru>
Date: Tue, 16 Aug 2005 11:25:40 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050815115943.GD27229@wohnheim.fh-wedel.de>	
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>	
	<20050815125254.GA32209@wohnheim.fh-wedel.de>	
	<430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>	
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
	<43009FFC.3090200@yandex.ru>	
	<20050815140530.GE3829@wohnheim.fh-wedel.de>	
	<1124115547.6148.17.camel@sauron.oktetlabs.ru>	
	<20050815143241.GA7045@wohnheim.fh-wedel.de>
	<4300B335.6050006@yandex.ru>
	<1124176573.6148.27.camel@sauron.oktetlabs.ru>
In-Reply-To: <1124176573.6148.27.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Wait, but how will you then find the needed struct jffs2_eraseblock
> object by its physical offset on flash ? Use Hash / lists ? Bad idea
> (slow). Use array of pointers to each object ? It will be rather large,
> and I cannot take easy the fact that we will use distinct pointers for
> objects which are mostly physically contiguous in RAM (they are laying
> contiguously in slabs). This probably will neglect the pluses of
> colouring, which, BTW, we may also organize using my way...
> 
> Comments?

This assumed to be a question for Joern, not to myself :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
