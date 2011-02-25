Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psx4M-0003mo-KD
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 12:46:51 +0000
Received: by wyf23 with SMTP id 23so1610371wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 04:46:49 -0800 (PST)
Subject: Re: Mean Time Between Failure - UBI clarifications
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1102251339360.2784@lnxricardw.se.axis.com>
References: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
	<Pine.LNX.4.64.1102241445050.2784@lnxricardw.se.axis.com>
	<1298637391.2798.101.camel@localhost>
	<Pine.LNX.4.64.1102251339360.2784@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 14:45:21 +0200
Message-ID: <1298637921.2798.108.camel@localhost>
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

On Fri, 2011-02-25 at 13:40 +0100, Ricard Wanderlof wrote:
> On Fri, 25 Feb 2011, Artem Bityutskiy wrote:
> 
> > On Thu, 2011-02-24 at 15:04 +0100, Ricard Wanderlof wrote:
> >> I don't know about UBI, someone else probably does.
> >
> > No, UBI does not collect bit-flips statistics. It could be changed
> > though, someone could send a patch.
> 
> But don't bit flips eventually trigger bit scrubbing in UBI?

Yes, they do, but after scrubbing we forget about them.

But we could store the bit-flips counter in UBI headers, so "paranoid"
users could get per-eraseblock bit-flips count.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
