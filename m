Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GgUx-0005nk-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 13:11:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01121914160800.03136@rob> 
References: <01121914160800.03136@rob>  <Pine.LNX.4.21.0112181832140.3242-100000@dagobert.svc.sysgo.de> <20544.1008697534@redhat.com> 
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org,
    =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
    Aleksander Sanochkin <asanochkin@Lnxw.COM>
Subject: Re: Map driver usage 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Wed, 19 Dec 2001 13:21:37 +0000
Message-ID: <12142.1008768097@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

rob@sysgo.de said:
>  I just looked at Aleksander Sanochkin's code as Jörn suggested. It
> looks as if it indeed implements just what I need for my mapping
> driver. (Actually it  implements quite a few more things, I only need
> support for partitions that  are not physically contiguous). I see
> that his code has not made it into the   MTD CVS so far. Is that
> because you have objections ? I would really like to  build on this
> stuff in my mapping driver.

The plan, such as there was one, was to leave 2.4 as it is for a while, and 
to adopt Jörn's code in 2.5 - so I hadn't applied Aleksander's patch; I was 
hoping that its extra functionality would be merged into Jörn's version 
before the time comes to start paying attention to 2.5 and playing with the 
MTD code.

--
dwmw2
