Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QI5qH-0001lM-BI
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 21:12:14 +0000
Message-ID: <4DC31183.8060807@wi.rr.com>
Date: Thu, 05 May 2011 16:07:15 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
References: <4DADF9E6.9010709@wi.rr.com> <1303392001.2757.16.camel@localhost>
In-Reply-To: <1303392001.2757.16.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for your advice!  We were finally able to reproduce the problem.

> 1. Validate the pnode before packing, do the same validate_pnode() does.
> May be you'll catch the place where it we write incorrect pnode. Because
> what you see is a result of an error which might have happend long
> before you hit it.

We did validate_pnode() before the pnode was packed and have this output 
from dbg_dump_pnode():

(pid 6298) dumping pnode:
	address c631d380 parent c6005720 cnext c6005720
	flags 3 iip 3 level 0 num -969086448
	0: free 0 dirty 127984 flags 1 lnum 514
	1: free 129024 dirty 0 flags 4 lnum 515
	2: free 0 dirty 127920 flags 1 lnum 516
	3: free 129024 dirty 0 flags 4 lnum 517


It looks like 'num' is not valid.  Also, is it normal for 'parent' to be 
equal to 'cnext'?

We'll continue to look into this, but I thought it wouldn't hurt to get 
your opinion on the above debug.

Thanks!
Rick
