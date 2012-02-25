Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S19Gw-0007tT-DF
 for linux-mtd@lists.infradead.org; Sat, 25 Feb 2012 04:30:15 +0000
Received: by ggnf2 with SMTP id f2so1594178ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Feb 2012 20:30:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F44AA27.9090605@freescale.com>
References: <1329476273-14381-1-git-send-email-b32955@freescale.com>
 <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
 <4F430DA5.9040003@freescale.com>
 <CAN8TOE8MVdnG4jc785H5r9J5gAf2cEe_GZYCh0nSN7jrnYYzRg@mail.gmail.com>
 <4F44AA27.9090605@freescale.com>
Date: Fri, 24 Feb 2012 20:30:09 -0800
Message-ID: <CAN8TOE_=zbTVnLZqeYmT_323=443BCwNSmgD-QNKrSGisfK9pw@mail.gmail.com>
Subject: Re: [PATCH] mtd: use the full-id string as the keyword to search the
 id table
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 22, 2012 at 12:41 AM, Huang Shijie <b32955@freescale.com> wrote=
:
> =D3=DA 2012=C4=EA02=D4=C222=C8=D5 16:18, Brian Norris =D0=B4=B5=C0:
>> There is already a 0xD7 device ID, but it's correct, isn't it? I mean,
>> H27UBG8T2A is 32 Gbit and so is 0xD7? There's still a problem with
>
> :(, yes, you are right. I am an idiot.
>
> It seems there is no need to add a new table now.
> The only thing is to add parsing functions for Hynix.

OK, well I still might work on updating the detection/table
infrastructure soon anyway. And we need to come up with a way to
determine *when* to use this parsing scheme. It looks like it could
work for all MLC Hynix NAND, but I'll have a closer look later.

Brian
