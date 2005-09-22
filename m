Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIanj-0008Lr-4F
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 19:48:39 -0400
Message-ID: <433342CF.9000102@inf.u-szeged.hu>
Date: Fri, 23 Sep 2005 01:48:31 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050922122052.GB4548@wohnheim.fh-wedel.de>	<1127394310.3229.8.camel@windu.rchland.ibm.com>	<20050922132104.GA6354@wohnheim.fh-wedel.de>	<1127396504.28625.7.camel@sauron.oktetlabs.ru>	<20050922134811.GA6854@wohnheim.fh-wedel.de>	<1127397298.28625.12.camel@sauron.oktetlabs.ru>
	<20050922140223.GB6854@wohnheim.fh-wedel.de>
In-Reply-To: <20050922140223.GB6854@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:

>On Thu, 22 September 2005 17:54:58 +0400, Artem B. Bityutskiy wrote:
>  
>
>>On Thu, 2005-09-22 at 15:48 +0200, Jörn Engel wrote:
>>    
>>
>>>Can you explain "when JFFS2 has detected that the image is an old
>>>image" in C?
>>>      
>>>
>>Well, we may even do better. Scan FS. If we meet any node which crosses
>>the eraseblock boundary - bye bye. That must be easy to implement as
>>node headers contain the total node length.
>>    
>>
>
>Sounds fine.  Yes, that appears to be the best solution.
>  
>

Yes, that is the same I wrote in my letter. As Artem asked me to
implement it I wrote a patch, you can find it at
http://www.inf.u-szeged.hu/jffs2/cross-boundary.patch

I have not tested it yet (it will be task of tomorrow) I would just to
show what is in my mind.

Ferenc
