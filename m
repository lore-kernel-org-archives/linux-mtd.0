Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160MMO-0004PM-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 12:26:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BE51956.740A1424@infineon.com> 
References: <3BE51956.740A1424@infineon.com>  <3BD6E171.3856A900@infineon.com> <3BD575F2.35D16336@infineon.com> <18479.1003845325@redhat.com> <8331.1003940932@redhat.com> 
To: amit lubovsky <amit.lubovsky@infineon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: boot kernel off an mtd device 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 04 Nov 2001 12:36:04 +0000
Message-ID: <28599.1004877364@redhat.com>
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

amit.lubovsky@infineon.com said:
> Is there a way to boot the linux kernel from CFI using mtd drivers ?

No. The MTD drivers run in Linux and cannot be used before Linux is 
running. 

> I use the MIPS-5kc and I have just seen this link that talks about x86
> systems, http://www.EmbeddedLinuxWorks.com/articles/rolo_guide.html 

ROLO is x86-only, I believe. Try RedBoot. Is it this board? 
http://sources.redhat.com/ecos/boards/atlas-5K.html

--
dwmw2
