Received: from uproxy.gmail.com ([66.249.92.172])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZHtO-0003f0-Dc
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 21:35:37 -0400
Received: by uproxy.gmail.com with SMTP id j3so1597718ugf
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Apr 2006 18:35:32 -0700 (PDT)
Message-ID: <625fc13d0604271806q422fb20cm2f748cd669d5080@mail.gmail.com>
Date: Thu, 27 Apr 2006 20:06:28 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Phillip Lougher" <phillip@lougher.demon.co.uk>
In-Reply-To: <44515552.6040606@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
	<003301c66852$c7371280$153335bf@cabletime.com>
	<f9d2a5e10604271433y34b72c19p22bb10c79b305d97@mail.gmail.com>
	<44515552.6040606@lougher.demon.co.uk>
Cc: Russ Dill <russ.dill@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/27/06, Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> A couple of years ago I did some work making Squashfs work with NAND.
> Because of the inherent unreliability of NAND, and the constant MTD code
> base changes, I decided not to make this work publically available.

Just out of curiosity, did you do this in the filesystem itself or via
a FTL like what has been discussed so far?

> Providing native NAND support in Squashfs represents too much work for
> absolutely no gain.  It is unlikely this is going to change in the near
> future.

There is gain in providing a generic mechansim that block type
filesystems can use to do this though.  Simple economics are going to
drive more devices to have NAND parts than NOR, so something needs to
eventually fill this gap.

josh
