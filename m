Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxrLW-00039T-Tm
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 14:09:10 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Raghav K <raghavk@myw.ltindia.com>
In-Reply-To: <s1253243.044@EMAIL>
References: <s1253243.044@EMAIL>
Content-Type: text/plain
Message-Id: <1092938914.2991.17.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 19 Aug 2004 13:08:34 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mouting JFFS2 parition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-19 at 12:35, Raghav K wrote:
> Greetings all,
> 
> Hi, I'm a novice at using flash chips and MTD, so please bear with me if this is a trivial 
> question.
> 
> I am able to mount my completely erased parition, "without" copying an image on to it.
> The memory dump of the partition after umounting the same, shows some data being
> written to this parition.  I have a couple of questions in this regard.
> 
> Is it a necessary to copy an JFFS2 image to an MTD parition before using the same? 
> Is this an acceptable way of using the parition? 

As long as the partition is "empty" (i.e. freshly erased) on the _first_
mount, you do not need to copy a JFFS2 image to it.  Subsequent mounts
on that partition will also work because JFFS2 will have written valid
data to it during it's mount lifetime (eraseblock headers, etc).

Seems to be perfectly valid to use the partition this way, if you are
going to just use it as storage.  Cases like using JFFS2 as a root
filesystem would require writing an image to it before hand (obviously).

And that was a pretty good question for a novice ;).

josh
