Received: from blount.mail.mindspring.net ([207.69.200.226])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19L3pE-0008Lg-UI
	for <linux-mtd@lists.infradead.org>; Wed, 28 May 2003 17:30:53 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 28 May 2003 12:32:10 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGKEJDDFAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <3ECE1C02.3090105@visi.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: RobertS <RobertS@visi.com>
Subject: RE: A solution for a particular "Magic bitmask 0x1985 not found"error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: RobertS [mailto:RobertS@visi.com]
> Sent: Friday, May 23, 2003 9:03 AM
> To: Chuck Meade
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: A solution for a particular "Magic bitmask 0x1985 not
> found"error
> 
> 
> Chuck Meade wrote:
> 
> >Hello,
> >
> >Regarding this error message sequence at boot time:
> >
> >...
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000: 0x2003 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004: 0x000c instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008: 0xdc6d instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000: 0x2003 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004: 0x000c instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008: 0xdc6d instead
> >...
> >
> >I had this happen for a long time each time I booted Linux.
> >I finally found a solution which stopped it, and maybe this
> >will help anyone else out there who is getting it.  I have
> >seen it mentioned in the archives, so I know I am not the 
> >first to get this error "triplet".
> >
> >The solution was to simply make the jffs2 filesystem with a
> >newer version of mkfs.jffs2.  I had been using version 1.9
> >(see output of your "mkfs.jffs2 --version") when I got the
> >errors, and it stopped when I began using version 1.35.  So
> >it looks like this message is due to compatibility issues
> >between the jffs2 support in your kernel and the version of
> >mkfs.jffs2 that you use.
> >
> >One thing of note is that the filesystem did work OK after
> >spewing all these msgs, they were just a nuisance -- I guess
> >that's why I lived with them for a while before seeking the
> >answer. :)
> >
> >Chuck Meade
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> >  
> >
> It seems that we are having similiar experiences. I have also 
> experienced a similiar problem. The addresses were different but the 
> values returned were the same.  When I updated to the latest snapshot of 
> the mkfs.jffs2 utility and started with a fresh file system, the 
> messages went away but only briefly.  After I had been exercising the 
> file system, the messages returned again when powering up.
> 
> I investigated further and came to the conclusion that the file system 
> was unable to "reclaim" the first node on an erase block. In my case 
> these are the nodes at addresses on a multiple of 0x20000.  I verified 
> this by completing filling my file system, then erasing the entire 
> contents, then rebooting the system.  When I did this, the message: 
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not .... at 0x.....20000: 
> 0x2003 instead ... occurred for every eraseblock boundary in the mounted 
> partition.
> 
> This problem is just another non-critical item on my open issues list. I 
> will be returning to it at a later date. I expect that your problem has 
> just been masked by the creation of the new file system. It may be 
> worthwhile to test for this problem in a manner similiar to mine.

Yes I think that is exactly what happened.  After working with the
filesystem a bit, the messages are back. :(

Well I am back to the drawing board.  If anyone knows what causes the
0x2003, 0x000c, 0xdc6d triplet (see above for the exact error msg format)
it would be good to know.

Chuck
