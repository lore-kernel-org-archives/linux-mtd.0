Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AIDM-0003nb-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 22:30:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0106131645450.23397-100000@xanadu.home> 
References: <Pine.LNX.4.33.0106131645450.23397-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Vipin Malik <vipin.malik@daniel.com>,
    Xavier DEBREUIL <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: Re: root jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 22:35:32 +0100
Message-ID: <24263.992468132@redhat.com>
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
>  If a sector is empty, it is simply put in the queue for signature
> stamping. 

It's easier to erase it again than prove it's empty. Reading the whole 
thing ten times wasn't sufficient - an improperly erased bit could return a 
zero on the eleventh read, after the whole device was reading 0xFF on the ten 
previous reads.

The erases aren't done synchronously - they're done in the background. They 
shouldn't hold the mount up. I suspect the patch you committed will make it 
start failing Vipin's powerfail tests again.

--
dwmw2
