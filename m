Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGVd0-0003lS-Iy
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 12:52:15 +0000
Date: Wed, 19 Oct 2011 14:52:10 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Subject: RE: UBIFS recovery fails
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33254FA3B98@dekaexchange07.deka.local>
Message-ID: <Pine.LNX.4.64.1110191449210.30940@lnxricardw.se.axis.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<20111018153236.GA10466@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8F2@prod-svr-1.intranet.str.ca>
	<Pine.LNX.4.64.1110190845390.30940@lnxricardw.se.axis.com>
	<20111019102235.GA13501@parrot.com>
	<0A40042D85E7C84DB443060EC44B3FD33254FA3B98@dekaexchange07.deka.local>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: 'Ivan Djelic' <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
	=?iso-8859-1?Q?Jean-S=E9bastien_Gagnon?= <jsgagnon@vizimax.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 19 Oct 2011, Atlant Schmidt wrote:

> All:
>
>> On modern SLCs (at least I first saw it on 34 nm SLC flash), those bitfl=
ips
>> can be _unstable_, i.e. they can appear and disappear randomly as you re=
ad
>> pages. I experienced this phenomenon only on pages which were being prog=
rammed
>> or erased during a power cut.
>
>  This makes perfectly good sense. During erasing or programming,
>  charge is being deposited-upon or removed from the floating gates
>  and that's not an instantaneous process, so it can be interrupted
>  while on-going, leaving a gate that's only half charged or half
>  discharged.
>
>  At that point, the floating gate may have charge on it that's
>  all-too-near the threshold voltage for the cell and any given
>  read of that cell could "go either way" depending on minute
>  variations in other conditions.

That makes sense, but it doesn't explain why the effect is appearently=20
more pronounced on newer flashes than on older ones.

Of course, it could be that there is some other mechanism that also has=20
had to be changed with shrinking geometries, such as for example (note:=20
wildly speculating here) that the charge/discharge time for the individual=
=20
bit cells is longer on modern flashes for whatever reason, causing them to=
=20
be more sensitive to power cuts, as the programming operation (per bit)=20
takes place over a longer time.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
