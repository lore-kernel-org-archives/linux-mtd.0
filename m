Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKdp5-0006lH-1C
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 11:26:26 -0400
Message-ID: <433AB60D.4090107@cetrtapot.si>
Date: Wed, 28 Sep 2005 17:26:05 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si>
	<20050928100031.GA18192@wohnheim.fh-wedel.de>
In-Reply-To: <20050928100031.GA18192@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Wed, 28 September 2005 11:36:13 +0200, hinko.kocevar@cetrtapot.si wrote:
> 
>>On new setup - using yesterdays MTD CVS and 2.6.12 kernel with EBS enabled:
>>Mounting flash4 clean partition	[1]
>>real    0m 3.75s
>>user    0m 0.02s
>>sys     0m 1.17s
>>-- -- -- -- -- -- -- -- -- --
>>Mounting flash4 dirty partition	[2]
>>real    0m 0.75s
>>user    0m 0.02s
>>sys     0m 0.73s
> 
> 
> I assume above numbers are for a dirty partition and below for a clean
> one?

No.

I've used the same script - It seemed little weird, but ...
I'll do more tests in days to come, hopefully I'll be able solve this too.

regrds,
hinko
