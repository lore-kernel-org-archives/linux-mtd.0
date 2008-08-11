Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KSPnz-00033U-IU
	for linux-mtd@lists.infradead.org; Mon, 11 Aug 2008 05:18:55 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1710418wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Aug 2008 22:18:54 -0700 (PDT)
Message-ID: <9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
Date: Mon, 11 Aug 2008 14:18:53 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Wolfgang Denk" <wd@denx.de>, jwboyer@linux.vnet.ibm.com
Subject: Re: [U-Boot] U-Boot and UBI
In-Reply-To: <20080808225824.138D3248BF@gemini.denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1218220016.2328.109.camel@localhost.localdomain>
	<20080808225824.138D3248BF@gemini.denx.de>
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org, arnez@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Josh,

First thank you for announcing UBI support on U-boot.

Actually the Samsung implemented the UBI support on U-boot already and
has used it internally. The big difference is the code base. It's
based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
it created the ubi wrapper for u-boot.

I saw your source codes and ubi commands. I think it supports minimal
features of UBI, no volume create, remove, read/write and so on like
these.

u-boot $ help ubi
ubi info [l[ayout]] - Display volume and ubi layout information
ubi create[vol] volume [size] [type] - create volume name with size
ubi write[vol] address volume size - Write volume from address with size
ubi read[vol] address volume [size] - Read volume to address with size
ubi remove[vol] volume - Remove volume
[Legends]
 volume: character name
 size: KiB, MiB, GiB, and bytes
 type: s[tatic] or d[ynamic] (default=dynamic)

I want to know what's the better way if there are two code bases.

Please give any options and comments

Thank you,
Kyungmin Park

P.S., we will post the patches ASAP


>> As has been stated before by various people, IBM has added some form of
>> UBI support to an older version of U-Boot.  While we would love to be
>> able to forward port this to the latest version of U-Boot, we have
>> simply not found the time and don't see that being the case in the near
>> future.
>>
>> So as an alternative, I have cleaned up the code slightly and pushed out
>> a version that applies to U-Boot 1.1.6.  This way there is at least some
>> form of code release that people can use as a reference.  I am not
>> pushing this for inclusion into the current U-Boot, as we are well aware
>> of the need for further adaptation and cleanup.
> ...

> Thanks a lot.
>
> I guess we will pick up this work ASAP.
>
> If anybody else has intentions to work in this area, I'd appreciate if
> you contact me so we can coordinate efforts.
>
