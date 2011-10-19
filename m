Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGWE2-0004It-OG
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 13:30:33 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Ricard Wanderlof' <ricard.wanderlof@axis.com>
Date: Wed, 19 Oct 2011 09:30:28 -0400
Subject: RE: UBIFS recovery fails
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33254FA3B99@dekaexchange07.deka.local>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<20111018153236.GA10466@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8F2@prod-svr-1.intranet.str.ca>
	<Pine.LNX.4.64.1110190845390.30940@lnxricardw.se.axis.com>
	<20111019102235.GA13501@parrot.com>
	<0A40042D85E7C84DB443060EC44B3FD33254FA3B98@dekaexchange07.deka.local>
	<Pine.LNX.4.64.1110191449210.30940@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1110191449210.30940@lnxricardw.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Ricard:

  One mechanism is that newer flashes simply store fewer
  electrons on the floating gate so a very few electrons
  one way or the other now makes a bigger difference.

  I read an article from Siemens/Infineon a few years ago
  that was explaining how at the then-upcoming design node,
  the difference between a "1" and "0" was going to be less
  than 100 electrons!

  At those levels, there's not a lot of room for error
  in the deposited charge!

                               Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Ricard Wanderlof
Sent: Wednesday, October 19, 2011 08:52
To: Atlant Schmidt
Cc: 'Ivan Djelic'; linux-mtd@lists.infradead.org; Ricard Wanderl=F6f; Jean-=
S=E9bastien Gagnon
Subject: RE: UBIFS recovery fails


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

That makes sense, but it doesn't explain why the effect is appearently
more pronounced on newer flashes than on older ones.

Of course, it could be that there is some other mechanism that also has
had to be changed with shrinking geometries, such as for example (note:
wildly speculating here) that the charge/discharge time for the individual
bit cells is longer on modern flashes for whatever reason, causing them to
be more sensitive to power cuts, as the programming operation (per bit)
takes place over a longer time.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/Ymlp8zmNZXXTndxI!oX7Ul+sZxelw3DREV2Pu=
RGYiNNRbPV17wAWqXkuNhUQVZCj21OCp49t+CbC8dmstCo9uQ=3D=3D  to report this ema=
il as spam.

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
