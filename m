Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7eo9-0000gQ-EB
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 18:42:37 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: gregmartin@lucent.com
Date: Fri, 10 Oct 2003 06:47:11 +1300
References: <000101c38e6c$469fdd40$1a53b987@na02.lucent.com>
	<1065708286.22298.1679.camel@hades.cambridge.redhat.com>
In-Reply-To: <1065708286.22298.1679.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20031009174133.8C422474D@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash with 2048 Byte Page sizes
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 10 October 2003 03:04, David Woodhouse wrote:
> On Thu, 2003-10-09 at 08:50 -0500, Greg A. Martin wrote:
> > Hi,
> > I haven't seen any references yet to the newer NAND devices from
> > Samsung that have 2048 byte pages with 64 bytes extra data. The Part
> > numbers are K9F1G08U0M and K92G08U0M. These are 1 and 2 Gbit devices
> > with 11 bit column addresses and 16 or 17 bit page addresses that need
> > two byte read commands. Any idea if support for these devices will be
> > forth coming soon, or do I get to blaze a trail?
>
> You get to blaze a trail. :)

I'd like to suggest that when you go blaze that trail you ask guidance before 
and you go. There are many possible direction, but certain of these are more 
useful to the file systems that get to use the code.

-- Charles
