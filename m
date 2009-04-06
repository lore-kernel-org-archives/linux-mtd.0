Date: Mon, 6 Apr 2009 10:15:34 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: How to update UBIFS while running an application ?
In-Reply-To: <1238858745.15222.19.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.64.0904061012100.9213@lnxricardw.se.axis.com>
References: <49D622FA.187F.00BC.1@feig.de>
	<1238858745.15222.19.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Manuel Sahm <Manuel.Sahm@feig.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 4 Apr 2009, Artem Bityutskiy wrote:

>I'm not sure what exactly you ask, but you cannot update UBIFS file=20
> system while it is mounted. You have to unmount it first. Does any=20
> file-system allows this at all?

While not entirely koscher, one way around the problem of upgrading a=20
system with a root file system is flash based, is to get the application=20
into memory (possibly lock down the pages), rewrite the root file system=20
without unmounting it, then rebooting immediately after.

I don't know if this would work with UBIFS, but given the right=20
circumstances it works fine with JFFS2.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
