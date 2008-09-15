Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KfAAf-0002o7-CF
	for linux-mtd@lists.infradead.org; Mon, 15 Sep 2008 09:15:02 +0000
Date: Mon, 15 Sep 2008 11:14:55 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Sugathan, Rupesh" <rs@carriercomm.com>
Subject: RE: Erase Block size
In-Reply-To: <EE63F03D9E04774997AEBCD21FC77F253178CC@ccomm-ex1.ccomm.com>
Message-ID: <Pine.LNX.4.64.0809151114380.14452@lnxricardw.se.axis.com>
References: <EE63F03D9E04774997AEBCD21FC77F253178CC@ccomm-ex1.ccomm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <Ricard.Wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 11 Sep 2008, Sugathan, Rupesh wrote:

> Thanks for sharing your solution. Can you please comment if the below
> understanding correct.
> Cause of the warning messages are 'empty space' within the erase block.
> One of the problems of these empty spaces is a small waste of space in
> Flash. Is there any other problem in having these empty space on a
> write-able partition?

No, I don't think so.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"
