Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSopg-00047J-IH
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 10:43:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 382C319D7F
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 11:43:39 +0100 (CET)
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kSKH1gs-HqnH for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 11:43:38 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by anubis.se.axis.com (Postfix) with ESMTP id 7B3D919D7E
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 11:43:38 +0100 (CET)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by seth.se.axis.com (Postfix) with ESMTP id 6E06E3E0AD
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 11:43:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	oBFAhcEB016158
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2010 11:43:38 +0100
Date: Wed, 15 Dec 2010 11:43:38 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Static UBI volumes and ubiupdatevol ?
In-Reply-To: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
Message-ID: <Pine.LNX.4.64.1012151129250.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 15 Dec 2010, Ricard Wanderlof wrote:

> I've tried using ubimkvol to create a static volume, then using
> ubiupdatevol to write an ubifs image to it. That works, but when I try to
> mount it subsequently I get things like
>
> [ 6656.114000] UBIFS: static UBI volume - read-only mode
> [ 6656.129000] UBIFS error (pid 866): mount_ubifs: can't format empty UBI
> volume: read-only UBI volume
> mount: mounting ubi1_0 on /volume1/ failed: Read-only file system

I don't know if I screwed up big time when I was trying this out before,=20
it seems to work fine now just as well as with dynamic volumes. I don't=20
know if I was doing ubiupdatevol to the wrong volume (which would explain=
=20
the above error message) or what.

I'd still like to get some input on the other two questions in my previous=
=20
email though...

> A related question: With static volumes, I assume you still get the
> benefit of scrubbing, which in turn means that UBI can move the data
> around if it deems necessary?
>
> Which begs a final question: is it possible to verify the integrity of a
> static UBI volume? Even with JFFS2, if mounted readonly the flash in that
> particular partition is never written to, so it is possible to use a
> simple checksum to verify data integrity. With JFFS2 this can be
> important, as missing JFFS2 nodes don't necessarily result in mount time
> or run time failures, it just results in missing files or parts of files.

I'm also wondering if anyone has any thoughts on upgrading a 'live'=20
system, when the flash is managed by UBI.

With a system based on mtd+jffs2 it is actually possible to reflash the=20
partition with the [read only] root file system on it without unmounting,=
=20
as long as no accesses are made to the physical flash during the rewrite=20
or afterwards. In other words, immediately after reflashing the system=20
must be rebooted.

However, with UBI, given that there are background threads which might be=
=20
doing garbage collection etc I'm suspecting such a solution might not be=20
as suitable when the flash is managed by UBI. Or is there a some solution=
=20
that someone has tried with any level of success?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
