Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17J84d-0005RA-00
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jun 2002 08:34:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000f01c213fc$bf54fea0$2350580c@who> 
References: <000f01c213fc$bf54fea0$2350580c@who> 
To: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: why MTD model ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 15 Jun 2002 08:34:13 +0100
Message-ID: <30611.1024126453@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hansolofalcon@worldnet.att.net said:
> If by top posting you mean sending you mail, David, and then the other
> name, and finally the list, then fine. This one is only to the list.

By top-posting I mean annoying practice of quoting the entire mail and just 
typing your own response at the top. It is normal to quote only those parts 
of the mail to which you're actually responding, and your response to those 
parts immediately below the quoted text.

> And I'm just stating a simple fact. Yes, I agree with you, the FAT
> partition isn't necessary. The cards just came with it. And no the
> UMSDOS method of creating a Linux distribution does not work in the
> 2.4.x series. I don't know why. The folks at Slackware never told me.

UMSDOS was always a bit of an evil hack. When all the core Linux file system
code was overhauled during the 2.3 series, nobody cared enough to update it,
and I believe the new saner core VFS code was more difficult to abuse in the
ways the UMSDOS needed to.

> But I am curious which patches need to be applied within the patch
> directory of your MTD collection to the 2.2.17 kernel to make it work?

Just the inter-module-xxx one, I think.

--
dwmw2
