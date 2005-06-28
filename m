Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DnASM-0006e9-Dy
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 03:24:32 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: charles.tilbury@comcast.net
In-Reply-To: <200506271409.42449.charles.tilbury@comcast.net>
References: <200506271409.42449.charles.tilbury@comcast.net>
Content-Type: text/plain
Date: Tue, 28 Jun 2005 11:23:56 +0400
Message-Id: <1119943436.16978.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash question
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-06-27 at 14:09 -0700, Charles Tilbury wrote:
> I am using an ST Micro 64M byte x 8 bit flash part and JFFS2.  It mostly works 
> except that when the board reboots, JFFS2 reports CRC error messages when the 
> partition mounts again.  The strange part is that there does not seem to be 
> any data corruption or lost data.  Also, I do not see any error messages 
> while reading and writing.  However, the CRC errors seem to accumulate over 
> time.  Is there some way to prevent this from happening?  Repair it?  Should 
> I just ignore it?
As Sergey said, these errors appear because of unclean reboots you do.
Normally they are harmless. Yes, ignore them.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
