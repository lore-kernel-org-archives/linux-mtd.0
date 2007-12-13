Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2n5A-0008BL-Jt
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 12:22:34 +0000
Date: Thu, 13 Dec 2007 13:21:46 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Peter Wippich <pewi@gw-instruments.de>
Subject: Re: mtd-utils-1.1.0: build error
In-Reply-To: <Pine.LNX.4.63.0712131159320.13593@redbean.intranet.gw-instruments.de>
Message-ID: <Pine.LNX.4.64.0712131319400.12929@lnxricardw.se.axis.com>
References: <31E09F73562D7A4D82119D7F6C17298603002AFD@sinse303.ap.infineon.com>
	<Pine.LNX.4.63.0712131159320.13593@redbean.intranet.gw-instruments.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org, KokHow.Teh@infineon.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 13 Dec 2007, Peter Wippich wrote:

> This one should go into the FAQ...., it's a commmon pitfall. I'm not sure
> if this is already fixed in 1.1.0, but at least in a recent GIT version
> you can add WITHOUT_XATTR=1 to the make command to compile without
> Posix ACL (which, IMHO, should be the default because I never came across
> any embedded system which uses Posix ACLs).

I agree, or at least something should be done to make the error 
clearer.

/Ricard
