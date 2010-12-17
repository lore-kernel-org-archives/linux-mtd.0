Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTWmV-00035O-Jf
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 09:39:20 +0000
Date: Fri, 17 Dec 2010 10:39:18 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Static UBI volumes and ubiupdatevol ?
In-Reply-To: <1292516775.2364.108.camel@localhost>
Message-ID: <Pine.LNX.4.64.1012171036510.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<Pine.LNX.4.64.1012151129250.7024@lnxricardw.se.axis.com>
	<1292516775.2364.108.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


(Crud, I was trying to concatenate both replies into one message to avoid=
=20
two threads on the same issue but then I thought of something else after=20
sending the first one off).

On Thu, 16 Dec 2010, Artem Bityutskiy wrote:

>> With a system based on mtd+jffs2 it is actually possible to reflash the
>> partition with the [read only] root file system on it without unmounting=
,
>> as long as no accesses are made to the physical flash during the rewrite
>> or afterwards. In other words, immediately after reflashing the system
>> must be rebooted.
>
> Hmm, I presume you can do this with UBIFS, but you need to make sure all
> the backgound stuff like moving and eraseing eraseblocs is done before
> doing this by doing fsync() on your /dev/ubiX_Y device (UBI volume
> character device), see the 'vol_cdev_fsync()' function. Ah, and of
> course you need to sync UBIFS before this.
>
> Then if you can guarantee that no one is reading writing to it, you can
> change the flash.

It would be nice to use ubiupdatevol to do this, but it won't let me do=20
that if the volume is mounted (naturally). I don't know if this is=20
something that is enforced by ubiupdatevol or ubi. I would assume the=20
latter but I haven't checked the code.

Of course I could always write my own "ubiupdatevol" to deal with this but=
=20
it's always nice to use existing and supported tools.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
