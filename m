Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lovkt-0003TJ-1C
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 08:25:10 +0000
Date: Wed, 1 Apr 2009 10:25:00 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
In-Reply-To: <200904010105.33674.david-b@pacbell.net>
Message-ID: <Pine.LNX.4.64.0904011023560.9213@lnxricardw.se.axis.com>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
	<200904010105.33674.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	Kay Sievers <kay.sievers@vrfy.org>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <Ricard.Wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 1 Apr 2009, David Brownell wrote:

> Erasing an MTD partition may require an ioctl forever.  :)

Well, I can imagine that one actually being accomplished with a simple=20
write to a sysfs file ... but we might not want to make it that simple.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
