Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PwyJG-0003VD-P6
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 14:54:52 +0000
Date: Tue, 8 Mar 2011 15:54:45 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
Subject: Re: Tool to generate NAN_ECC_SOFT OOB data?
In-Reply-To: <4D76400D.7070408@schmid-telecom.ch>
Message-ID: <Pine.LNX.4.64.1103081550510.10128@lnxricardw.se.axis.com>
References: <4D76400D.7070408@schmid-telecom.ch>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Frank Haverkamp <haver@vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 8 Mar 2011, Daniel Hobi wrote:

> Hi list,
>
> what is the preferred way to generate ECC data during manufacturing when=
=20
> using software ECC (NAND_ECC_SOFT)?

I don't know if there is a preferred way, but one way would be to download=
=20
a kernel image + file systems to RAM, boot it as an ordinary system, and
then use ordinary mtd tools on that system to flash the image. You then=20
get the benefit of using the same mtd algorithms etc as will be used when=
=20
the system is subsequently up and running.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
