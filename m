Received: from hall.mail.mindspring.net ([207.69.200.60])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEwqo-0007QR-V1
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 20:23:31 +0000
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "Dan Post" <djp.mtd@onemyth.net>,
	"Karoliya,Abhishek" <Abhishek.Karoliya@fci.com>
Date: Wed, 29 Oct 2003 15:21:33 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGAELGEBAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <20031029181623.M2380@onemyth.net>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: Intel K3 Flash + MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Dan,

Abhishek sent me a response directly that he got it working
with the email I sent him, but then he had trouble getting
a msg back to the list that he is up and running now.

The reason it was in "status mode" was his unlock logic was
leaving it that way.

Chuck

> -----Original Message-----
> From: Dan Post [mailto:djp.mtd@onemyth.net]
> Sent: Wednesday, October 29, 2003 1:16 PM
> To: Chuck Meade; Karoliya,Abhishek
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: Intel K3 Flash + MTD
> 
> 
> On Sun, 26 Oct 2003 15:17:35 -0500, Chuck Meade wrote
> > That sounds like the status bit that you are reading back.
> > Most flashes give back status after you issue them commands
> > (like all of your unlocks, for instance).  Usually you put them 
> > back into "read mode" by writing a particular byte to them
> > after reading the status.  Try writing an FF to the flash.
> > Check your flash chip's datasheet for the exact sequence that
> > you must use to put it back in read mode.
> 
> For K3's, writing an FF should work, though I don't know why it's coming up in
> status mode.  I don't think that behavior is typical.  You probably should
> check the datasheet.  Or it could be your bootloader that's setting it to
> status mode (maybe not changing it to Read Array after a program or erase etc).
> 
> However, you should be aware that some NOR chips, such as Intel's L18/L30's,
> are multi-partitioned and each partition must be set to read array mode... the
> details of its multipartitioning can be very sticky, but very cool too...
> 
> Dan
