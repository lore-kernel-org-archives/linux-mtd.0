Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEcik-00077R-CW
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:30:07 +0000
Date: Tue, 26 Apr 2011 09:30:02 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
In-Reply-To: <4DB14439.1050507@parrot.com>
Message-ID: <Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 22 Apr 2011, Matthieu CASTET wrote:

>> So I bet
>> your device is actually an x8 device and so the 1st/6th byte pattern is
>> correct. I think the fact that this conflicts with your ECC patterns is
>> something you must deal with.
> I don't agree, that's a big mtd regression. If you update your kernel on =
such
> flash, you brick it.

I agree, even if the behavior may have been incorrect in the past, we=20
should think very carefully about changing this for exactly this reason.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
