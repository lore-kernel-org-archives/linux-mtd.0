Received: from relay6.ptmail.sapo.pt ([212.55.154.26] helo=sapo.pt)
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6gJI-00060L-7d
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2011 10:15:17 +0000
Message-ID: <20110922111511.15615t65c0et2ban@mail.sapo.pt>
Date: Thu, 22 Sep 2011 11:15:11 +0100
From: dhlm83@sapo.pt
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: flash_erase ERROR!
References: <20110919145214.19341ml5c346kgzy@mail.sapo.pt>
	<CAN8TOE8GcH_BDK4=SaEM6vFO-bfWn5fcJhc0QOTUKJQe13jXeg@mail.gmail.com>
In-Reply-To: <CAN8TOE8GcH_BDK4=SaEM6vFO-bfWn5fcJhc0QOTUKJQe13jXeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; DelSp="Yes"; format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.
Thanks for repply, and help is welcome.

Citando Brian Norris <xxxx@gmail.com>:

> On Mon, Sep 19, 2011 at 6:52 AM,  <xxxx@sapo.pt> wrote:
>> Hello.
>> This is my first post.
>>
>> I am using uClinux (kernel 2.4.34.5-uc0 , dist: 20110603)
>> I build a image to board NetBurner MOD5272.
>
> That's a very old (and dare I say unsupported?) kernel. There may be
> some things we can do to help, but generally, MTD developers don't
> support that old of code.

I am forced to use this kernel (2.4.x) by limitation of my target =20
board, especially the only 2MB of flash.
I build successfully a 2.6.x image, but without my applications was =20
already near the limit of memory.

>> The problem is: The flash_eraseall and flash_erase dont work.
>> =A0 =A0 ......
>> =A0 =A0 # flash_eraseall -j /dev/mtd5 0 0
>> =A0 =A0 /bin/flash_eraseall has been replaced by `flash_erase <mtddev> 0 =
0`;
>> please use it
>> =A0 =A0 Access Error Exception 12: Error on data read
>> =A0 =A0 SIGSEGV
>> =A0 =A0 ......
>>
>> =A0 =A0 ......
>> =A0 =A0 # flash_erase -j -u -N /dev/mtd5 0 0
>> =A0 =A0 libmtd: error!: MEMGETBADBLOCK ioctl failed
>> =A0 =A0 =A0 =A0 =A0 =A0 error 25 (Inappropriate ioctl for device)
>> =A0 =A0 flash_erase: error!: mtd_get_dev_info failed
>> =A0 =A0 .....
>
> What version of mtd-utils do you have? If it's old, then "flash_erase"
> may not give a version # (try `flash_erase --version'). You could also
> check other utilities, like:
>
> nanddump --version
> nandwrite --version

The mtd-utils version is: in file mtd-utils.spec
      .....
      Version: 1.0
      Release: 1
      .....

  The flash_erase version:
      .....
      # flash_erase --version
      flash_erase version 2
      .....

I dont have nanddump and nandwrite utilities. My flash is NOR type =20
(am29lv160db).
But in source files:
      nanddump.c: "$Revision: 1.29 $"
      nandwrite.c: "$Revision: 1.32 $"

>> Has anyone had this problem?
>> Someone may give clues to solve the problem?
>
> I'm guessing it's just that your kernel is really old. From the looks
> of it, your flash_eraseall is pretty recent. Just a quick check of
> some old kernel 2.4 code seems to tell me that MEMGETBADBLOCK didn't
> even exist in your kernel, so obviously the current mtd-utils will be
> incompatible.
>
> Brian

I think the mtd-utils version is the same to kernel 2.4.x and 2.6.x in =20
my distro source.
This can not generate some compatibility issues?

In the past, mtd-utils have the utilities erase and erase_all. I think =20
that utilities work with my kernel, is that possible?
You know what version of mtd-utils are available (erase and erase_all)?
I can try this version.

Best Regards.
Domingos Goncalves
