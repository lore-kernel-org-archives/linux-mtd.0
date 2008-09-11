Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kdgnn-0007Zu-H5
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 07:41:20 +0000
Date: Thu, 11 Sep 2008 09:41:04 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Sugathan, Rupesh" <rs@carriercomm.com>
Subject: Re: Erase Block size
In-Reply-To: <EE63F03D9E04774997AEBCD21FC77F25317838@ccomm-ex1.ccomm.com>
Message-ID: <Pine.LNX.4.64.0809110900220.5390@lnxricardw.se.axis.com>
References: <EE63F03D9E04774997AEBCD21FC77F25317838@ccomm-ex1.ccomm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
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


On Wed, 10 Sep 2008, Sugathan, Rupesh wrote:

> I have a scenario where I need to deploy the same jffs2 image on two
> flash memory parts, one with a 128KB sector size and the other with
> 256KB sector size.
>
> I read from http://www.linux-mtd.infradead.org/doc/jffs2.html that
> building the jffs2 image with smaller 'erase block size' should be
> harmless even in the flash with 256KB sector size, although there might
> be some warning messages at mount time. However, the warning messages
> are not desired since this is a production image.
>
> Can anyone tell me if there is any utility that can be used to alter the
> erase block size on-the-fly? Or I would greatly appreciate if anyone has
> some other solution to this problem.

I'm not aware of any such utility.

You could always patch the kernel in your production image to avoid the=20
warnings.

We had a similar situation where we wanted to run the same image on=20
several NAND flash types with different block sizes. In the end we gave=20
up, because the issues with managing multiple block sizes, especially=20
regarding live firmware upgrades, made it not worth while. Instead, we=20
simply said that changing the flash so that the block/sector size changes=
=20
is considered a hardware change and must be handled accordingly (separate=
=20
firmware, etc).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"
