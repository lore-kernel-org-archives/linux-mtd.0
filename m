Received: from el-out-1112.google.com ([209.85.162.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIrxb-0007Z7-R3
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 16:16:56 -0400
Received: by el-out-1112.google.com with SMTP id y26so64143ele
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Aug 2007 13:16:50 -0700 (PDT)
Message-ID: <ac921f990708081316j3c8abbf5t78b632f8ad3ae4d7@mail.gmail.com>
Date: Wed, 8 Aug 2007 16:16:50 -0400
From: "James Olin Oden" <james.oden@gmail.com>
To: "Ralph Siemsen" <ralphs@netwinder.org>
Subject: Re: What is the correct way to make an mtdchar device available?
In-Reply-To: <20070808192832.GA21249@marvin.netwinder.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
	<20070808192832.GA21249@marvin.netwinder.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/8/07, Ralph Siemsen <ralphs@netwinder.org> wrote:
> On Wed, Aug 08, 2007 at 01:50:29PM -0400, James Olin Oden wrote:
>
> > I have a system with the ST Micro M50FW080 firmware hub.  I have
> > checked the source code and the jedec_probe module has detection code
> > for that driver.  So I've done:
>
> I'm not familiar with this device, but you appear to be missing a
> mapping driver (see drivers/mtd/maps, the most common being "physmap").
> You'll likely need to know the physical address and size of your flash
> device.  Once addresses are known, then the xyz_probe routines will be
> called to identify the device supposedly there.
>
Yeah, I saw something about "physmap" in one web page.  The module was
not available on my system, but it looks like its in the source code,
which means RedHat did not have it configured to build.  I can work
with that.

> I could be way off base, maybe the "firmware hub" works more magically.
> My description is more for flash that is soldered on the board.
No its just a flash chip soldered on the board, that they call a
firmware hub, because the intent of the mother board manufacturer was
to place BIOS in it.

Thank you...james

>
> -R
>
