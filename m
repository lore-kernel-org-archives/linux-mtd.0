Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GdSWD-0006G5-Ch
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 15:17:11 +0100
Date: Fri, 27 Oct 2006 16:18:15 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: mtd-utils/flash_erase modifications
In-Reply-To: <1161957584.3080.19.camel@sauron>
Message-ID: <Pine.LNX.4.64.0610271616420.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610261052070.25906@lnxricardw.se.axis.com>
	<1161952796.3080.8.camel@sauron>
	<Pine.LNX.4.64.0610271446220.25906@lnxricardw.se.axis.com>
	<1161957584.3080.19.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 27 Oct 2006, Artem Bityutskiy wrote:

>>> Err, are you talking about flash_erase?
> I just thought that it works only with one eraseblock.

By default it erases a single block, but you can specify more than one=20
block in which case it erases them all in sequence. E.g. flash_erase=20
/dev/mtd1 0 2048  erases a whole 32 MB flash (assuming there are no bad=20
blocks).

>> 2. modify flash_eraseall to handle partial erases, change name to
>>     flash_erase (and throw out the old flash_erase).
> I would be happier with this.

Makes sense.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
