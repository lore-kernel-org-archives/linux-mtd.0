Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QszNe-0004E2-Np
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 15:47:11 +0000
Received: by yic13 with SMTP id 13so3436702yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 08:47:06 -0700 (PDT)
Subject: Re: 'nandwrite -o' on MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 15 Aug 2011 18:48:46 +0300
In-Reply-To: <CAN8TOE8VHm2jMkFonfi+4bvmP8ORVVdXA0vb3-X8+XCGfTuAaw@mail.gmail.com>
References: <CAN8TOE8VHm2jMkFonfi+4bvmP8ORVVdXA0vb3-X8+XCGfTuAaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313423331.8691.11.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-02 at 12:01 -0700, Brian Norris wrote:
> Hi,
> 
> For a while, I've been having problems with using `nandwrite -o' on
> MLC NAND flash. Nandwrite is never able to write the combined data+OOB
> properly and instead leaves the flash filled with junk. This is,
> apparently, because `nandwrite -o' writes to the flash twice, once for
> the page data and once for the OOB data. This is not allowed on MLC
> NAND, which allow only single writes.
> 
> This is a problem with the user interface to the kernel as well as
> with nandwrite itself, since there is no interface that nandwrite can
> use to write data+OOB to flash in a single write. As I see it, we need
> to do three things:
> 
> 1) Support a (new?) ioctl that handles writing data+oob in one go. I'm
> not sure if an existing interface can be extended or if this actually
> has to be a new one...
> 2) Update nandwrite (i.e., update the libmtd routines in mtd-utils) to
> utilize the new interface when possible.
> 3) Ensure that the raw/no-ECC options for nandwrite are operational
> with the new interface (i.e., `nandwrite -r')

I guess making the old interfaces to be based on the new one internally
is also needed to keep things clean. Then we can declare the old
interfaces "legacy and obsolete", but will have to support anyway, of
course.

-- 
Best Regards,
Artem Bityutskiy
