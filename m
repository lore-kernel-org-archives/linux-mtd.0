Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gsg1U-0004qq-R2
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 08:44:23 -0500
Date: Fri, 8 Dec 2006 14:43:13 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Eraseblocks torture: OneNAND results
In-Reply-To: <1165558783.20337.112.camel@sauron>
Message-ID: <Pine.LNX.4.64.0612081405270.22217@lnxricardw.se.axis.com>
References: <19898399.377451165543227681.JavaMail.weblogic@ep_ml03>
	<1165558783.20337.112.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 8 Dec 2006, Artem Bityutskiy wrote:

> 1. Although the documented eraseblock lifetime is about 100000, we 
> started getting errors after about 6 million erase cycles. May be 
> because our test is not torturous enough.

Isn't 100000 a figure quoted by the flash manufacturer to be the _minimum_ 
number of erase cycles, a specification which all devices must meet, even 
at extreme operating conditions (e.g. high temperature and extreme supply 
voltages)? That would imply that during more ordinary conditions, a random 
sample of flash chip would very likely be erasable many more times.

Another thing: Why implement it as a kernel module? Speed I would assume?

/Ricard
