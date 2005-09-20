Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHfQp-00029Y-3a
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 06:33:10 -0400
Received: from [80.176.67.250] (helo=baydel-adsl.demon.co.uk)
	by anchor-post-32.mail.demon.net with esmtp (Exim 4.42)
	id 1EHfQk-0006nF-98
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 10:32:55 +0000
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 20 Sep 2005 11:26:22 +0100
References: <Pine.LNX.4.44.0509191525180.1130-100000@hkn.eecs.berkeley.edu>
In-Reply-To: <Pine.LNX.4.44.0509191525180.1130-100000@hkn.eecs.berkeley.edu>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200509201126.23141.simon@baydel.com>
Subject: Re: FAT on raw Nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 19 September 2005 23:36, Gagan Prakash wrote:
> Hi
>
> I am trying to solve the problem of allowing a device with raw nand to be
> exposed to any Desktop OS (OS 10, Windows and Linux) without having to
> install any sort of driver on the Desktop OS that is not already present.

A while ago I wrote a SSFDC traslation layer to do exactly this. It should be 
in the mtd CVS. To save myself time I restricted the development to exactly 
what I needed. This will probably mean you need to do some work to get
things going.

Cheers

Simon. 
