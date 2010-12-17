Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTZPL-0006Vk-Qx
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 12:27:46 +0000
Received: by bwz14 with SMTP id 14so801261bwz.30
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2010 04:27:31 -0800 (PST)
Subject: Re: Static UBI volumes and ubiupdatevol ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1012170946190.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<1292516353.2364.101.camel@localhost>
	<Pine.LNX.4.64.1012170946190.7024@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Dec 2010 14:26:57 +0200
Message-ID: <1292588817.2412.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ricard =?ISO-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-17 at 10:33 +0100, Ricard Wanderlof wrote:
> > The same with UBIFS - we never write when we are mounted R/O. There are
> > many ubifs_assert()s to check this as well.
> 
> ... but UBI might still do writes during the course of scrubbing I guess, 
> unless ...

Yes, you are right.

> > >  so it is possible to use a 
> > > simple checksum to verify data integrity.
> > 
> > You can do this with UBIFS I think, did not try though.
> 
> What I meant was 'a simple checksum on the raw mtd partition', which can't 
> work with UBIFS as the UBI erase counters etc can change over time as a 
> result of scrubbing.

Ah, yes, you see, you know the things quite well yourself :-)

> I guess I could read from the /dev/ubix_y device to just get the raw UBIFS 
> data which shouldn't change even in the event of scrubbing? Or should I 
> use gluebi to get both a raw mtd partition corresponding to the raw UBIFS 
> data, as well as using UBIFS (on /dev/ubix_y) for the file system?

No, gluebi is not needed, it would just give you an /dev/mtdZ device
with contents equivalent to /dev/ubiX_Y

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
