Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTZcX-0001Dl-Ng
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 12:41:18 +0000
Received: by bwz14 with SMTP id 14so812591bwz.30
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2010 04:41:08 -0800 (PST)
Subject: Re: Static UBI volumes and ubiupdatevol ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1012171328380.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<1292516353.2364.101.camel@localhost>
	<Pine.LNX.4.64.1012170946190.7024@lnxricardw.se.axis.com>
	<1292588817.2412.7.camel@localhost>
	<Pine.LNX.4.64.1012171328380.7024@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Dec 2010 14:40:34 +0200
Message-ID: <1292589634.2412.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-17 at 13:31 +0100, Ricard Wanderlof wrote:
> On Fri, 17 Dec 2010, Artem Bityutskiy wrote:
> 
> > Ah, yes, you see, you know the things quite well yourself :-)
> 
> Well, I try to convince myself that I think I know, but there's always the 
> very real and likely possibilty that I'm wrong because I've misunderstood 
> something.
> 
> >> I guess I could read from the /dev/ubix_y device to just get the raw UBIFS
> >> data which shouldn't change even in the event of scrubbing? Or should I
> >> use gluebi to get both a raw mtd partition corresponding to the raw UBIFS
> >> data, as well as using UBIFS (on /dev/ubix_y) for the file system?
> >
> > No, gluebi is not needed, it would just give you an /dev/mtdZ device
> > with contents equivalent to /dev/ubiX_Y
> 
> So what does gluebi in fact add, does it just supply all the necessary 
> ioctl's to make /dev/ubiX_Y look like a /dev/mtdZ device, in addition to 
> the already existing functionality of being able to read and write to the 
> volume using read and write? (Yes, I could dig through the code, but even 
> though it might give me the answer on what it looks like right now, it 
> might not tell what the intention was...).

Original idea was to put JFFS2 on top of UBI volumes. Gluebi is doing
just that - turns UBI volume into an MTD device, then you have mount it
with JFFS2.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
