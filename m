Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4iTp-00013e-Vt
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 13:10:40 -0400
Message-ID: <4300CC8C.9090206@inf.u-szeged.hu>
Date: Mon, 15 Aug 2005 19:10:36 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
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
	<1123776399.16052.70.camel@sauron.oktetlabs.ru>
	<43007B6A.3040402@inf.u-szeged.hu> <43008930.5050405@yandex.ru>
In-Reply-To: <43008930.5050405@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
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

Artem B. Bityuckiy írta:

> Ferenc Havasi wrote:
>
>> I remember a letter you wrote to mtd list about "don't use recent 
>> JFFS2 - try earlier". I thought it means that you already know about 
>> some bugs, and our problem is related to them.
>>
> Hmm, I couldn't have say this, if I commit something this is assumed 
> to be usable...

I misunderstood you, sorry.

We analized the problem more deeply, and with mtdram it still works 
correctly. So it seems that the problem is not in the recent JFFS2 but 
in nandsim.

It writes

[nandsim] errorr: write_byte: chip is disabled, ignore write

with its default configuration. It worked well earlier. Maybe there were 
changes in mtd...

Ferenc
