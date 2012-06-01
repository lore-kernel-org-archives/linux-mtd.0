Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaXpA-0005Oi-VX
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 19:47:53 +0000
Date: Fri, 1 Jun 2012 21:47:49 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: Resizing of an existing UBIFS
In-Reply-To: <4FC8AC00.7020309@intel.com>
Message-ID: <Pine.LNX.4.64.1206012135000.20240@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBB3E7F.3080807@bury.com> <4FBF2DF7.8030809@intel.com>
 <4FBF396D.4070000@bury.com>
 <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
 <4FC340D4.9020905@intel.com>
 <Pine.LNX.4.64.1206011133500.4247@lnxricardw.se.axis.com>
 <4FC8AC00.7020309@intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Homann <homann@bury.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 1 Jun 2012, Adrian Hunter wrote:

> If you let mkfs.ubifs calculate the journal size it will limit it to 8MiB=
 max.

Thanks, that explains the figures then.

> The journal must be scanned after an unclean unmount (e.g. power loss)
> so a small journal is better for that.  However once the journal is full =
it
> must be committed which involves a certain amount of overhead so a bigger
> journal is better for that, but at some point it makes hardly any differe=
nce.
>
> You can use the flash read speed to get an idea of how big a journal you =
can
> live with. e.g. in the worst case you want to mount in 3 seconds, your re=
ad
> speed is 4MiB/s so you need a journal less than 12MiB (but reading the
> journal is just one part of mounting so maybe 8MiB is better).

So what you're saying is that basically it's the worst-case mount time=20
that together with the read speed sets the maximum journal size? I assume=
=20
if the unmount was clean there is no need to read the journal, or does it=
=20
need to be scanned anyway? What if there was an unclean unmount but no=20
data recently written so nothing in the journal, does it still have to be=
=20
scanned in full?

> You can use the flash write speed to get an idea of how often a commit
> happens.  e.g. flash write speed is 3MiB/s, journal is 4MiB, a commit beg=
ins
> when the journal is 13/16 full, so there is a commit at most once per
> second, which sounds OK.

In my case there's not a lot of writes (much less than the flash write=20
speed would make possible), so even a small journal would probably be ok.=
=20
Even if there were the odd burst of writes we could live with a temporary=
=20
surge in flash writes.

One question here: when one mounts an empty volume, it seems the ubifs=20
creates a journal with some default value (which doesn't seem to be=20
identical to the defaults that mkfs.ubifs uses). Is there any way to=20
adjust those defaults, either with mount command options or with the=20
sysfs?

What I'm getting at in a more concrete sense, is that if I create an empty=
=20
8 MB UBI volume, then mount it as a ubifs file system (rather than=20
mkfs.ubifs'ing an empty directory, setting appropriate parameters on the=20
mkfs.ubifs command line, and ubiupdatevol'ing that), can I specify a=20
maximum LEB count (and fix the journal size) that would be appropriate=20
also for a future larger volume size?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
