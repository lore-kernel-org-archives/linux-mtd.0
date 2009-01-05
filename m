Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJw2e-0002nx-LH
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 20:27:17 +0000
Received: by rv-out-0708.google.com with SMTP id b17so7491164rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 12:27:14 -0800 (PST)
Message-ID: <782515bb0901051227k7c8b8a13o13016f0178058bf@mail.gmail.com>
Date: Mon, 5 Jan 2009 14:27:14 -0600
From: "Nishanth Menon" <menon.nishanth@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: nand_default_bbt and x8 large page nand devices
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Scott Wood <scottwood@freescale.com>, maragani2000@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looping in mtd list on this.
Ref: http://www.nabble.com/-U-Boot--Bug-in-nand_default_bbt--to21237193.html

On Mon, Jan 5, 2009 at 2:01 PM, Scott Wood <scottwood@freescale.com> wrote:
> On Wed, Dec 31, 2008 at 03:31:41PM -0600, Nishanth Menon wrote:
>> A gentle question on drivers/mtd/nand/nand_bbt.c:largepage_flashbased
>> in Micron devices, the bb marker is the first word. for a x8 device is
>> 1 byte and x16 device it is 2 bytes. .len = 2 makes sense for an x16
>> device in the above variable, however the marker does a false postive
>> detection for x8 devices.
>
> Right, simplest way to work around this is to just keep the first two
> bytes reserved even on x8 devices.  If you need to maintain compatibility
> with a map that doesn't do that, then override the badblock pattern in
> the driver as you describe.
>
>> I can over ride this by using nand_chip->badblock_pattern in my board
>> file, but from an mtd layer perspective, does it make sense to fix
>> this for a generic usage?
>
> Possibly, but that's not a point on which I want to deviate from Linux.
> Feel free to try to get it changed there.

I guess the real question could be: is this a bug in reality? Do all x8 large
page devices expect 1 byte bb marker or is it just micron?

Regards,
Nishanth Menon
