Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16doUl-0003I9-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 08:22:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <441701c1ba2c$2cf1dc60$1900000a@v.vmanage.com> 
References: <441701c1ba2c$2cf1dc60$1900000a@v.vmanage.com>  <20020220063356.59191.qmail@web14702.mail.yahoo.com> 
To: "Gad Hayisraeli" <gad@syete.co.il>
Cc: "Michael Michael" <memmel2@yahoo.com>, linux-mtd@lists.infradead.org
Subject: Re: Slow jffs2 startup on DOM 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Feb 2002 08:33:35 +0000
Message-ID: <24611.1014280415@redhat.com>
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

gad@syete.co.il said:
>  in my case (mediaEngine + assabet), i encountered some slowness like
> you did, just when i previously shutdown the device without unmounting
> + syncing first

Er, if that makes a difference to JFFS2 I'll be _very_ surprised. JFFS2 
does nothing special on unmount. Checkpointing, either on unmount or 
periodic opportunistic checkpoints, has been discussed a lot but never 
actually implemented. I'm happy to give pointers if you seriously intend to 
work on it.

--
dwmw2
