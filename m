Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E3FaK-0000Bg-2U
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 12:07:13 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <42FB8402.5000705@inf.u-szeged.hu>
References: <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu> <42FB732B.5040405@yandex.ru>
	<42FB8402.5000705@inf.u-szeged.hu>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 20:06:39 +0400
Message-Id: <1123776399.16052.70.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 17:59 +0100, Ferenc Havasi wrote:
> Hi Artem,
> 
> > I wonder, did you try your summaries with my last fragtree changes? 
> > Does they work well ?
> 
> We tried the latest snapshot with summary and without summary and it 
> reported CRC errors. We tried it with older JFFS2 snapshot and it worked 
> well.
Which CRC errors?
Ferenc, please, if you've met some problems, don't keeps silence. You
know the procedure - logs, debug enable, etc. Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
