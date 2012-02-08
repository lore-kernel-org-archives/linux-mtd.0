Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv7ty-00082W-F4
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 13:49:39 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Ricard Wanderlof' <ricard.wanderlof@axis.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Date: Wed, 8 Feb 2012 08:49:35 -0500
Subject: RE: Userspace write to UBI partitions
Message-ID: <0A40042D85E7C84DB443060EC44B3FD332A14AAF7D@dekaexchange07.deka.local>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
 <1328702346.22240.48.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1202081316510.22001@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1202081316510.22001@lnxricardw.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

All:

  But there are times when you really want a block erased
  and erased NOW; in that case, "unmap" isn't what you
  want as it only schedules the PEB for erasure at some
  future time. And if a power cut intervenes, that
  scheduling for erasure may be lost and the ultimate
  erasure may not take place for a long, long time.

  So if you really intended to destroy the data, "unmap"
  is not the correct function to call.

                              Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Ricard Wanderlof
Sent: Wednesday, February 08, 2012 07:19
To: Artem Bityutskiy
Cc: Ricard Wanderlof; Linux mtd; Shmulik Ladkani
Subject: Re: Userspace write to UBI partitions


> >  In the meantime, there doesn't seem to be an ioctl for erasing
> > blocks?
>
> In UBI it is called "unmap" instead of "erase":
>
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_unmap

Thanks. I've been staring at the UBI page for too long now I guess, didn't
realize that was what I should have been looking for...

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/iNq3RabdjW!TndxI!oX7UskfEqpntbSQBh5+L=
1x62eAEpsHd6qIu4!3pOM!83jtSy7QxM5RExv!1lqOECv!Swg=3D=3D  to report this ema=
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
