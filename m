Received: from dns.uswo.net ([207.153.115.5] helo=mail.uswo.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vqKm-0003Ye-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 01:54:08 +0100
From: "Jason Walker" <jasonw@uswo.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: RE: MTD and 2.4 
Date: Fri, 4 May 2001 20:54:59 -0400
Message-ID: <NEBBIDMHCLDPHDHEGDMLKEGLCBAA.jasonw@uswo.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <32275.989022180@redhat.com>
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

of course, when I am using the 2.2.17 kernel used to install this stuff, it
says this then running dLILO:
cannot locate block-major-93

when I have /dev/nftla1 in my lilo.conf. hmmmm. I assume that's because I
don't have nftla in thsi mystery 2.2.x kernel.

perhaps rdev'ing the 2.4 kernel I am working on would be a better approach.

Jason

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Friday, May 04, 2001 8:23 PM
To: Jason Walker
Cc: MTD Mailing List
Subject: Re: MTD and 2.4



jasonw@uswo.net said:
> request_module[block-major-100]: root fs not mounted cannot open root
> device 6401 blah blah blah

Quite why someone felt it necessary to register block major 100 for the
strangely named 'fla' device, when there was already a perfectly usable
major assigned for NFTL, I have no idea.

Switching your root device to /dev/nftla1 should fix it.

--
dwmw2
