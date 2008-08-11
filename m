Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KSR6i-0004fN-MZ
	for linux-mtd@lists.infradead.org; Mon, 11 Aug 2008 06:42:21 +0000
To: "Kyungmin Park" <kmpark@infradead.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [U-Boot] U-Boot and UBI
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
References: <1218220016.2328.109.camel@localhost.localdomain>
	<20080808225824.138D3248BF@gemini.denx.de>
	<9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
Date: Mon, 11 Aug 2008 08:42:17 +0200
Sender: wd@denx.de
Message-Id: <20080811064217.A3729248EA@gemini.denx.de>
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Kyungmin Park,

In message <9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com> you wrote:
> 
> Actually the Samsung implemented the UBI support on U-boot already and
> has used it internally. The big difference is the code base. It's

The big problem  is  always  that  such  ports  are  done  completely
internally, and nothing is given back to the community. This causes a
lot of duplicated (and thus avoidavle) efforts. Samsung is one of the
companies hich have a notoriously bad record on this :-(

> based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
> it created the ubi wrapper for u-boot.

It would have been nice if such issued whould have been discussed
brfore implementing the stuff behind closed doors.

> I saw your source codes and ubi commands. I think it supports minimal
> features of UBI, no volume create, remove, read/write and so on like
> these.
> 
> u-boot $ help ubi
> ubi info [l[ayout]] - Display volume and ubi layout information
> ubi create[vol] volume [size] [type] - create volume name with size
> ubi write[vol] address volume size - Write volume from address with size
> ubi read[vol] address volume [size] - Read volume to address with size
> ubi remove[vol] volume - Remove volume
> [Legends]
>  volume: character name
>  size: KiB, MiB, GiB, and bytes
>  type: s[tatic] or d[ynamic] (default=dynamic)
> 
> I want to know what's the better way if there are two code bases.

The first thing that should be done is publishing the Samsung code
without further delay. Even if it is against an old code base.

> P.S., we will post the patches ASAP

Please do this *now*.


Thanks.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Hacking's just another word for nothing left to kludge.
