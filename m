Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2nZd-0001y8-HW
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 12:54:03 +0000
Date: Thu, 13 Dec 2007 13:53:06 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: mtd-utils-1.1.0: build error
In-Reply-To: <1197549543.25999.22.camel@sauron>
Message-ID: <Pine.LNX.4.64.0712131352230.12929@lnxricardw.se.axis.com>
References: <31E09F73562D7A4D82119D7F6C17298603002AFD@sinse303.ap.infineon.com>
	<Pine.LNX.4.63.0712131159320.13593@redbean.intranet.gw-instruments.de>
	<Pine.LNX.4.64.0712131319400.12929@lnxricardw.se.axis.com>
	<1197549543.25999.22.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: KokHow.Teh@infineon.com, linux-mtd@lists.infradead.org,
	Peter Wippich <pewi@gw-instruments.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 13 Dec 2007, Artem Bityutskiy wrote:

>> I agree, or at least something should be done to make the error
>> clearer.
>
> The MTD web site can be cloned from git://git.infradead.org/mtd-www.git
>
> Feel free to send a patch which will add a FAQ entry about this.

I was thinking along the line of adding an #ifdef-something to the 
mkfs.jffs2.c which outputs a more informative #error.

I'll try to think up a patch.

/Ricard
