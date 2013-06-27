Received: from srv1.bluewind.it ([216.38.51.188])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsBkF-0000D9-1o
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 12:56:15 +0000
Received: from smtp.bluewind.it ([80.86.152.212]:44550 helo=[192.168.0.42])
 by srv1.bluewind.it with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.80.1) (envelope-from <enrico.benetti@bluewind.it>)
 id 1UsBjm-0007Sh-9s
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 14:55:46 +0200
Message-ID: <51CC3669.103@bluewind.it>
Date: Thu, 27 Jun 2013 14:56:09 +0200
From: enrico benetti <enrico.benetti@bluewind.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS: power cut test on 2.6.35 + NOR
References: <51CBDF47.709@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I'm using 2.6.35.14 (last 2.6.35) with all UBIFS patches from the
> repo you mentioned above. I have also added/ported all patches from
> mainline 3.9 stable (excluding those only dealing with debug prints etc).
>
> Still I have some minor (I hope) issues after running integck power-cut
> tests for several days. They manifest in errors on xattr nodes.
> There are some related patches in discussion, see:
> http://thread.gmane.org/gmane.linux.kernel.lsm/18746
> http://thread.gmane.org/gmane.linux.drivers.mtd/47021
>
>
Hi Mats, Norbert,
thanks for your kind feedbacks.

Mats, are you working on a NOR-based system or are you referring to NAND?

I'm going to merge from 2.6.35 back-port repo and I'll let you know.

Regards,
E
