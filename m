Received: from srv1.bluewind.it ([216.38.51.188])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsaD4-0007f8-72
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 15:03:38 +0000
Received: from smtp.bluewind.it ([80.86.152.212]:44775 helo=[192.168.0.42])
 by srv1.bluewind.it with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.80.1) (envelope-from <enrico.benetti@bluewind.it>)
 id 1UsaCi-0000uH-TX
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 17:03:17 +0200
Message-ID: <51CDA5CC.7010808@bluewind.it>
Date: Fri, 28 Jun 2013 17:03:40 +0200
From: enrico benetti <enrico.benetti@bluewind.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS: power cut test on 2.6.35 + NOR
References: <51CBDF47.709@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>,
 <51CC3669.103@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA8354@post.tritech.se>
 <51CD9168.7000902@bluewind.it>
In-Reply-To: <51CD9168.7000902@bluewind.it>
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


> Please note that I'm using a 'slow' device (M29EW), with a maximum
> sector erasure time of 4 secs, and this seems to stress asynchronous
> operations with ubifs and integck test.
>
> I'll go on with commit log analysis to check if this kind of issue is
> already solved/discussed.
>
Hi,
at least two commits for M29EW NOR chips within MTD repo...trying to 
merge and then check again.

E
