Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AD9W-0003Hx-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:05:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0106131207230.23397-100000@xanadu.home> 
References: <Pine.LNX.4.33.0106131207230.23397-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Vipin Malik <vipin.malik@daniel.com>,
    Xavier DEBREUIL <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: Re: root jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 17:11:19 +0100
Message-ID: <1933.992448679@redhat.com>
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

nico@cam.org said:
>  That was my belief.  It seemed logical.  I was aparently wrong.  I
> too consider it a bug if it isn't that way.

Agreed. But the alternative bug - erasing the whole device if we tried to 
mount as jffs2 by mistake - was worse. 

--
dwmw2
