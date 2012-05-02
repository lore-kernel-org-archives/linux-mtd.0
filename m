Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPW9c-0001cL-5Y
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 09:47:24 +0000
Received: by lagy4 with SMTP id y4so333862lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 02:47:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE9fnQJb6ivwg997cE93g+PcxvvgZzGHsm2Ua6o_ZzH=HQ@mail.gmail.com>
References: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
 <1335362618-4559-10-git-send-email-hechtb@gmail.com>
 <CAN8TOE9fnQJb6ivwg997cE93g+PcxvvgZzGHsm2Ua6o_ZzH=HQ@mail.gmail.com>
Date: Wed, 2 May 2012 11:47:21 +0200
Message-ID: <CABYn4swN7PrGPVx2+FPkYx+g6Y=0v9e86KXVx2UVxDwhOaZPCg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] mtd: sh_flctl: Use user oob data in hardware ECC
 mode
From: Bastian Hecht <hechtb@googlemail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> I don't know about the HW-specific details here, but read/write
> data+OOB seems good.
>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
>
> If these patches are accepted, I will try to make sure this driver
> switches to conditionally reading/writing OOB in my patch series. Keep
> an eye out for them, though.

Thanks! I've submitted a new version of my patchset and they don't
stack out of the box with your patch-set - either way if yours comes
first or mine, it should require little to adapt.

> BTW, from the changes I'm seeing in this patch series, your driver was
> previously fairly broken. Or at least, several features of it were...
> Good luck with the cleanup!

Yeah thanks! I like the driver and learned a lot from it - but the ECC
part was broken like hell, true :)

Best regards,

 Bastian

> Brian
