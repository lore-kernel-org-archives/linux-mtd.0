Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6Tp-0002EU-KA
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:18:34 +0000
Date: Wed, 8 Feb 2012 13:18:32 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Userspace write to UBI partitions
In-Reply-To: <1328702346.22240.48.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1202081316510.22001@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
 <1328702346.22240.48.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Ricard Wanderlof <ricardw@axis.com>,
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


> >  In the meantime, there doesn't seem to be an ioctl for erasing
> > blocks?
>=20
> In UBI it is called "unmap" instead of "erase":
>=20
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_unmap

Thanks. I've been staring at the UBI page for too long now I guess, didn't=
=20
realize that was what I should have been looking for...

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
