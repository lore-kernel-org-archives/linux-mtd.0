Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198QGU-0004W5-R0
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 20:50:47 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Sid Gluckman <sgluckman@omnitech.com>
Date: Thu, 24 Apr 2003 07:51:49 +1200
References: <OOEOKBMECIFAEPIMFOGIIEEBCBAA.sgluckman@omnitech.com>
	<1051089275.1989.25.camel@passion.cambridge.redhat.com>
In-Reply-To: <1051089275.1989.25.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20030423195052.993251528E@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD on a USB SmartMedai Reader
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 23 April 2003 21:14, David Woodhouse wrote:
> On Mon, 2003-04-21 at 18:00, Sid Gluckman wrote:
> > Hello,
> >
> > I want to access a SmartMedia card on a USB adapter with JFFS2
> > filesystem. The USB reader is recognized fine and seems to detect the
> > card correctly. My question is how can I direct the MTD subsystem to use
> > the USB adapter?
>
> I suspect that you don't. Although SmartMedia is basically just NAND
> flash, the USB 'cardreader' will probably be hiding all that from you
> and presenting itself USB mass storage device. Turn on CONFIG_SCSI and
> CONFIG_USB_STORAGE.

It depends on the card reader.

Some of them look like a USB mass storage device (which would not work with 
mtd as NAND). Some send read/write/erase commands over the USB link - these 
could be made visible as NAND under mtd.

-- CHarles
