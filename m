Received: from [2002:cde9:d907::1] (helo=canuck.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AcTv2-0007CM-Ot
	for linux-mtd@lists.infradead.org; Fri, 02 Jan 2004 18:21:09 +0000
Received: from mail9.messagelabs.com ([194.205.110.133])
	by canuck.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AcNCi-0004Ag-SZ
	for linux-mtd@lists.infradead.org; Fri, 02 Jan 2004 06:10:57 -0500
Message-ID: <3FF55208.9030300@arcom.com>
Date: Fri, 02 Jan 2004 11:12:08 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <326f4932ade4.32ade4326f49@shaw.ca>
In-Reply-To: <326f4932ade4.32ade4326f49@shaw.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Unable to access JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thomaspang@shaw.ca wrote:
> With David's patches, I am able to access the JFFS2 file system.  Thanks.
> However, the following weird behaviors are observed:
 >
> [...]
 >
> - The write performance is kind of poor.  I have tried to copy
>   files of different sizes from CRAMFS to JFFS2, or from JFFS2
>   to another JFFS2 partition.  On average, the copying speed
>   is approx. 7.5 kbytes/sec.  It seems too slow.

Yes. If you're using the patches I produced write performance will be 
very poor.  It disables erase suspends if you're trying to write because 
they didn't work correctly.

Don't hold your breath waiting for me to fix it.  Performance 
improvements are way down my list of things to do.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
