Received: from miranda.se.axis.com ([193.13.178.8])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LcFo9-0005kA-6w
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 09:12:04 +0000
Date: Wed, 25 Feb 2009 10:11:46 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Chakradhar thota <thota.chakradhar@gmail.com>
Subject: Re: query on UBIFS
In-Reply-To: <8ccea6aa0902240910k6da07085u7e122cb010a99a02@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0902251003230.23056@lnxricardw.se.axis.com>
References: <8ccea6aa0902240910k6da07085u7e122cb010a99a02@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 24 Feb 2009, Chakradhar thota wrote:

> =A0 I am in the process of using UBIfs on my embedded device.
> =A0 but i came across that JFFS2 cannot be used as swap partition.
> =A0 what about UBIfs? will UBIfs support swap paritition?
> =A0 what are the various issues to be taken care if it supports?
> =A0 thanks in advance.

Just seems unlikely that you'd want a swap partition on an embedded=20
device, unless you want to hibernate your application for faster booting?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
