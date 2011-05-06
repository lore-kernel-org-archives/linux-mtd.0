Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIQQo-0002W5-7m
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 19:11:18 +0000
Received: by ewy3 with SMTP id 3so1198259ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 12:11:16 -0700 (PDT)
Subject: Re: ubirmvol:ing gluebied volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1105061412050.15966@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1105061412050.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 22:07:45 +0300
Message-ID: <1304708865.7222.106.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 14:17 +0200, Ricard Wanderlof wrote:
> I enabled the gluebi MTD emulation layer in the kernel, and was pleased to 
> see all the UBI volumes coming up in /proc/mtd as mtd volumes.

Hehe :-)

> However, one thing though, if I try to ubirmvol one of the UBI volumes, I 
> get:
> 
> ubirmvol: error!: cannot UBI remove volume
>            error 16 (Device or resource busy)

Yeah.

> similar to what I get if I have a mounted ubifs residing in an UBI volume 
> and try and ubirmvol the volume without umounting the file system.

Yes.

> Fair enough, I guess gluebi is keeping the UBI volume busy? But then how 
> do I free it up?

I think the only way is to rmmod gluebi.

>  There's normally no way to disassociate mtd partitions 
> from the underlying media, and I can't see any ubi tool that would do this 
> either.

Right.

> So is this an (unfortunate) consequence of using gluebi: that the 
> underlying UBI volumes can't be removed?

In current implementation yes. But you can rmomod it, shuffle UBI
volumes, and modprobe it again.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
