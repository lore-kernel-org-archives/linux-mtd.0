Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17G1a0-0008DJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2002 19:01:48 +0100
Message-ID: <3CFFA37C.F222E9E0@analog.com>
Date: Thu, 06 Jun 2002 11:01:32 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: Gad Hayisraeli <gad@syete.co.il>
CC: Linux - MTD list <linux-mtd@lists.infradead.org>
Subject: Re: Fw: jffs2 crc errors
References: <006801c20d82$697b6800$1900000a@v.vmanage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Gad Hayisraeli wrote:
> 
> > i encounter this err in boot:
> >
> > jffs2_scan_inode_node(): Data CRC failed on node at 0x001eaa24: Read
> > 0xda7b03c2,
> >  calculated 0x0da9fb30
> >
> > and it keeps appearing every boot.
> >
> > is it bad ?
> >
> > maybe its not fixed becuse i'm terminating the jffs optimization thread in
> > the middle of the init process ?
> >
> > thanks
> >
> > Gad
> 

Well, this could mean that the sector the node is in is going bad
(which would be a bad thing for you). Or it could mean that the write
process didn't complete, and so the calculated CRC is coming off of
stale data.

Why are you killing off the optimization thread? 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
