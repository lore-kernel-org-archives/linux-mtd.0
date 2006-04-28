Received: from uproxy.gmail.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZSD3-0003Ab-D7
	for linux-mtd@lists.infradead.org; Fri, 28 Apr 2006 08:36:40 -0400
Received: by uproxy.gmail.com with SMTP id j3so1691782ugf
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Apr 2006 05:36:31 -0700 (PDT)
Message-ID: <625fc13d0604280536v1a9768a8q362ea91f7bea8e82@mail.gmail.com>
Date: Fri, 28 Apr 2006 07:36:31 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Phillip Lougher" <phillip@lougher.demon.co.uk>
In-Reply-To: <445206A9.7040803@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
	<003301c66852$c7371280$153335bf@cabletime.com>
	<f9d2a5e10604271433y34b72c19p22bb10c79b305d97@mail.gmail.com>
	<44515552.6040606@lougher.demon.co.uk>
	<625fc13d0604271806q422fb20cm2f748cd669d5080@mail.gmail.com>
	<445206A9.7040803@lougher.demon.co.uk>
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

On 4/28/06, Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> Josh Boyer wrote:
> > There is gain in providing a generic mechansim that block type
> > filesystems can use to do this though.  Simple economics are going to
> > drive more devices to have NAND parts than NOR, so something needs to
> > eventually fill this gap.
> >
>
> I think I was maybe a little unclear as to what I meant.  I think a
> generic mechanism that block filesystems could use would be very useful.
>   What I meant was providing NAND support in Squashfs would generate a
> lot more support requests and require more maintenance.  Unfortunately,
> I don't have the resources to do this.

Oh, sure.  That's understandable.  You should be busy trying to get
squashfs into mainline ;)

josh
