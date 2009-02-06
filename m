Received: from krynn.se.axis.com ([193.13.178.10])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVQOS-0004Yj-Tj
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 13:05:19 +0000
Date: Fri, 6 Feb 2009 13:15:30 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Subject: Re: cannot access NAND STL partition
In-Reply-To: <D7819ED4DC5A46FDB0E7557B1ABBE32A@sky>
Message-ID: <Pine.LNX.4.64.0902061314260.19761@lnxricardw.se.axis.com>
References: <4C336FC8FE0F441DA6FAB8337E58BB54@sky>
	<Pine.LNX.4.64.0902061056160.19761@lnxricardw.se.axis.com>
	<D7819ED4DC5A46FDB0E7557B1ABBE32A@sky>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 6 Feb 2009, Iram Shahzad wrote:

> I also guess that when writing in BML, it writes raw data, so when read
> from u-boot/Linux, the data is as expected; but when writing in STL,
> it does some kind of translation for wear leveling etc. So I thought if
> there is a similar kind of translation layer in Linux, then I can put it
> on top of the raw Linux onenand driver to get the expected result.

I'm in deep waters here, but yes, there is a Flash Translation Layer in=20
Linux, but as far as I remember it's old code, not recommended anymore,=20
and probably not compatible with your STL.

Then again, you may be lucky :-)

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
