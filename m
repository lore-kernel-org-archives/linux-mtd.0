Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JyrY-0002t7-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 16:56:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLGEKNFEAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLGEKNFEAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: point()/unpoint() questions + small cfi_cmdset_0001.c patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 16:56:15 +0100
Message-ID: <30217.1024329375@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  I am mainly interested in using point() in scan.c to reduce mount
> time. A quick and dirty hack to impl. point() gives me better a scan
> time, from 4.43 sec to 3.53 sec, but this will probably go up a bit if
> I do a proper impl. of point(). 

Is this on your board with burst reads working? Are you using a cached 
mapping for point()? 

>  They do? I have not seen any evidence of this, do you happen to known
> any perticular AMD device that does this? 

Looking at the AM29LV320D datasheet, page 26, under 'Sector Erase Command 
Sequence'...

"Note that while the Embedded Erase operation is in progress, the system can
read data from the non-erasing sector. The system can determine the status
of the erase operation by reading DQ7, DQ6, DQ2 or RY/BY# in the erasing
sector."

(http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/23579a3.pdf)

OTOH, the next page talks about the Erase Suspend command, which "allows 
the system to interrupt a sector erase operation and then read data from, 
or program data to, any sector not selected for erasure." So perhaps I was 
imagining it.

--
dwmw2
