Received: from web52709.mail.yahoo.com ([206.190.39.160])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYiJd-0004b0-6o
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 06:31:45 -0400
Message-ID: <20050519103148.2859.qmail@web52709.mail.yahoo.com>
Date: Thu, 19 May 2005 03:31:48 -0700 (PDT)
From: Gianluca Moro <giangiammy@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Compute flash life time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

and sorry for the obvious question, but I'm trying to
estimate my flash life, depending on write operation.

I'm using JFFS2:
If I have 1 M flash, and write 128byte/s in a circular 
buffer style: I compute, with 100000 write cycles to
have a 9000 day flash life (100000 * 1024*1024/128 seconds).

But in this way I suppose that each 128 blob of data
I write, effectively write 128 bytes of flash: but
I'm trying to understand:

- what is the filesystem overhead?
- when I write 128 bytes, the filesystem writes effectively
  128 bytes, or writes an entire sector?
- to do my computation, is it correct the formula I used,
  or do I need to substitute the 128 value with the flash
  sector size?

Sorry if the questions are obvious, but I'm almost new to JFFS2

thanks
giammy




		
___________________________________ 
Nuovo Yahoo! Messenger: E' molto più divertente: Audibles, Avatar, Webcam, Giochi, Rubrica… Scaricalo ora! 
http://it.messenger.yahoo.it
