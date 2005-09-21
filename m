Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHte0-0001tH-IN
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 21:43:39 -0400
Received: from cmsout01.mbox.net (cmsout01.mbox.net [165.212.64.31])
	by cmsout01.mbox.net (Postfix) with ESMTP id 41F077814A
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2005 01:43:30 +0000 (GMT)
Message-ID: <00ba01c5be4d$dcbe5eb0$0260a8c0@p4p800>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <A61771BC4AE2DD41B460E8D73082E6E307AA30FF@olympus.hekimian.com>
Date: Tue, 20 Sep 2005 20:43:27 -0500
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Re: CRC failed on node  ....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So, should the garbage collection eventually fix it by itself?


> In the power fail testing I have done, I did not see any files corrupted,
> other than the actual file data that was being actively written at the time
> of the power fail. I did see the same type of message and I assumed that
> that it was leftover junk that would get garbage collected later. I could
> not seem to force it to go away.
> 
> Vern Sauder
