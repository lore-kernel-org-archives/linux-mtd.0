Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MQh7-0003DQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 09:31:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02010409585400.10979@jocke.lumentis.se> 
References: <02010409585400.10979@jocke.lumentis.se>  <0111121314140A.28381@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CLEANMARKER question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Jan 2002 09:42:01 +0000
Message-ID: <1002.1010137321@redhat.com>
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

Joakim.Tjernlund@lumentis.se said:
> I have problems to understand the CLEANMARKER concept. Can a flash
> erase  sector which has a CLEANMARKER in the beginning contain any
> data or can one  assume that the rest of the erase sector is erased?

Yes, it can contain data. The CLEANMARKER is there just to show that the 
erase completed successfully. It's not erased before the block is actually 
filled with data.

What are your plans for improving the mount speed?

--
dwmw2
