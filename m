From: dwmw2@infradead.org (David Woodhouse)
Date: 10 Feb 2003 08:34:00 +0000
Subject: About flash chip writing/erasing, reading chip status.
In-Reply-To: <20030115151745.R1589@brecis.com>
References: <20030115113705.P1589@brecis.com>
 <20030115151745.R1589@brecis.com>
Message-ID: <1044866039.22021.8.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-01-15 at 21:17, Steve Wahl wrote:
> I therefore think the correct test of bit5 is:
> 
> 	/* assumes ( (CMD(1<<6) >> 1) == CMD(1<<5) ) for all cases */
> 	/* I believe this is true from inspection... */
> 
> 	dq6 = CMD(1<<6);
> 
> 	do {
> 
> 		oldstatus = cfi_read(map, adr);
> 		status = cfi_read(map, addr) ;
> 
> 		toggling = ( oldstatus ^ status ) & dq6 ;
> 		dq5s_set = ( oldstatus & (toggling >> 1) ) ;
> 
> 	} while ( (toggling != 0) && (dq5s_set == 0) && !time_after(xxx));

> I'm willing to work this in to my patch.  But I want to see what
> others have to say before I put the work in.

Looks sane to me. Sorry for the delayed response.

-- 
dwmw2
