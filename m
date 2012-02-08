Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6W4-0005Kz-70
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:20:53 +0000
Date: Wed, 8 Feb 2012 13:20:47 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Userspace write to UBI partitions
In-Reply-To: <1328702434.22240.50.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1202081318360.22001@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
 <20120207190938.7a59fae9@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202080834220.17234@lnxricardw.se.axis.com>
 <1328702434.22240.50.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > For other reasons, gluebi is not a viable alternative for us. Mainly
> > because it puts an mtd device on _every_ ubi volume, meaning that
> > volumes can't be removed or resized while gluebi is enabled.
>=20
> I do not recommend to use gluebi in general - it is just a hack, but the=
=20
> limitation you brought up is fixable if you really need to :-)

Yes, I think there was a discussion here on the list a while ago about it.

It seemed to me that the work that might be put into making gluebi more=20
flexible would be better spent in making applications we have that rely on=
=20
mtd use ubi instead.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
