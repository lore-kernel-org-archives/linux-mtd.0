Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMf2I-0004rt-Px
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 07:49:46 +0000
Date: Wed, 6 Feb 2008 08:48:22 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: DMcLeod <dmcleod@bittware.com>
Subject: Re: Filling RAM
In-Reply-To: <47A89DDF.4050505@bittware.com>
Message-ID: <Pine.LNX.4.64.0802060845290.24892@lnxricardw.se.axis.com>
References: <47A89DDF.4050505@bittware.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org,
	uClinux development list <uclinux-dev@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Feb 2008, DMcLeod wrote:

> I am seeing that as files are created, their approximate size is
> subtracted from the available memory. For example, assume I have /home
> mounted from /dev/mtdblock2, which is a jffs2 filesystem on NOR flash.
> ...
> ]# cd /home
> ]# grep MemFree /proc/meminfo
> 22588 kB
> ...

MemFree in /proc/meminfo is not a good indicator of how much available=20
memory there is to the system. Linux tends to gobble up memory for file=20
buffers etc, freeing them on an as-needed basis. IIUC MemFree principally
indicates how much memory has never been touched, not how much is actually=
=20
available.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
