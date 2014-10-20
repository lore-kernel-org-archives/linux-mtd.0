Received: from mdfmta009.mxout.tch.inty.net ([91.221.169.50]
 helo=smtp.demon.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDO2-00030R-E4
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:52:39 +0000
Date: Mon, 20 Oct 2014 14:48:01 +0100 (BST)
From: Steve B <steve@baconbits.demon.co.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/UBFS: ubi_eba_read_leb() reporting unmapped LEB
In-Reply-To: <1413812127.7906.282.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.02.1410201442380.2556@ubuntu>
References: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
 <1413812127.7906.282.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem,

Thanks for the reply.

I have the kernel built with:
CONFIG_MTD_UBI_DEBUG=y
CONFIG_UBIFS_FS=y

The failure was seen on an embedded device, I dumped the flash
contents (raw format) and then re-constructed the image on my Linux PC
using nandsim with UBI and UBIFS modules i've built with some extra debugging.
The call stack in the log posted is the same as the one seen on the device
that showed the original problem.

Thanks,
Steve

On Mon, 20 Oct 2014, Artem Bityutskiy wrote:

> On Fri, 2014-10-10 at 14:45 +0100, Steve B wrote:
>> Our test setup has the facility of pulling the power on the unit if a GPIO line
>> is toggled, with this we can test sensitive areas of the code, can anyone suggest
>> where would be a good place to perform this action.
>
> Did you perform testing with UBI/UBIFS debug messages on? Or the
> messages in this e-mail were enable after the corruption happened?
>
> Artem.
>
>
