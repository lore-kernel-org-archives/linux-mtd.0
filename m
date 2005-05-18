Received: from kecgate02.progeon.com ([61.95.162.76]
	helo=Kecgate02.infosys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYF88-0008No-72
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 23:21:57 -0400
From: Bharat Joshi <bharat_joshi@infosys.com>
To: Gianluca Moro <giangiammy@yahoo.com>
In-Reply-To: <20050517154056.91995.qmail@web52709.mail.yahoo.com>
References: <20050517154056.91995.qmail@web52709.mail.yahoo.com>
Content-Type: text/plain
Date: Wed, 18 May 2005 09:05:37 +0530
Message-Id: <1116387337.17586.52.camel@magadha.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 cycling write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-17 at 08:40 -0700, Gianluca Moro wrote:
> Hi all,
> 
> I have not found an answer to the following question
> about JFFS2:
> The write on the flash are clycled, so to write everywhere
> on the flash to use it at the better, but, if my flash
> is 70% full with data I never touch, and on the other 30%
> I  continuously write, the driver write onfluy on the
> 30% free space, or does it uses even the 70% moving around
> data?

Hi,

   If I recall it correctly, JFFS2 take care of this situation
by moving the untouched data. As per the algorithm, JFFS2 
maintains two list (actually more than two to maintain erase
block at different stages) one is clean list (contains nodes
full of valid nodes i.e. ur 70% flash) and another is dirty
list(contains at least one obsoleted nodes i.e. 30% flash). 
JFFS2 do the 99 erase operation on the erase blocks from
dirty list and 100th operation on the erase block from the
clean list.

   This way it make sure that it moves untouched data around
for wear leveling.

   Please correct me if I am wrong here.

Thanks & Regards,
Bharat

> 
> In the first case I would end to acocmplish all the allowed write
> on a 30% of my flash, having the other 70% almost new!
> 
> bye
> giammy
> 
> 
> 
> 
> 		
> ___________________________________ 
> Nuovo Yahoo! Messenger: E' molto pi divertente: Audibles, Avatar, Webcam, Giochi, Rubrica Scaricalo ora! 
> http://it.messenger.yahoo.it
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
