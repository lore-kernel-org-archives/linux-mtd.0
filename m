Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLEiP-0007OG-Aa
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 14:53:53 +0000
Date: Mon, 8 Oct 2012 16:53:51 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: kyak <bas@bmail.ru>
Subject: Re: output file cannot be in the UBIFS root directory check is not
 working quite well
In-Reply-To: <alpine.LNX.2.02.1210081833560.1375@bas>
Message-ID: <alpine.DEB.2.00.1210081650200.19047@lnxricardw.se.axis.com>
References: <alpine.LNX.2.02.1210032322590.1375@bas>
 <alpine.LNX.2.02.1210051949390.1375@bas>
 <alpine.DEB.2.00.1210081556130.19047@lnxricardw.se.axis.com>
 <alpine.LNX.2.02.1210081833560.1375@bas>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 8 Oct 2012, kyak wrote:

> If a directory is not readable it only means that you can't list its
> contents. But it doesn't mean that you can't list contents of directories
> below that directory.
>
> Once again, here is a simple (my) use case. My /home is not readable (i
> can't list its contents), and this prevents me from building any ubifs
> image inside of /home/user (which is readable).
>
> I really hope i made myself clear this time.

Definitely. I see your point now. This must be a definite bug in 
in_path().

One problem though is that when in_path() traverses the tree upwards, and 
encounters a directory which it can't read it can't complete its job. On 
the other hand, it shouldn't have to do that, it really only needs to see 
that the output file is not below the top level of the input tree. Or am I 
missing a case here?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
