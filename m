Date: Wed, 8 Aug 2007 15:28:32 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: James Olin Oden <james.oden@gmail.com>
Subject: Re: What is the correct way to make an mtdchar device available?
Message-ID: <20070808192832.GA21249@marvin.netwinder.org>
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 08, 2007 at 01:50:29PM -0400, James Olin Oden wrote:

> I have a system with the ST Micro M50FW080 firmware hub.  I have
> checked the source code and the jedec_probe module has detection code
> for that driver.  So I've done:

I'm not familiar with this device, but you appear to be missing a
mapping driver (see drivers/mtd/maps, the most common being "physmap").
You'll likely need to know the physical address and size of your flash
device.  Once addresses are known, then the xyz_probe routines will be
called to identify the device supposedly there.

I could be way off base, maybe the "firmware hub" works more magically.
My description is more for flash that is soldered on the board.

-R
