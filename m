Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6T3M-00051B-E6
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 20:05:57 +0000
Received: by eyd9 with SMTP id 9so1565612eyd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 13:05:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110919145214.19341ml5c346kgzy@mail.sapo.pt>
References: <20110919145214.19341ml5c346kgzy@mail.sapo.pt>
Date: Wed, 21 Sep 2011 13:05:53 -0700
Message-ID: <CAN8TOE8GcH_BDK4=SaEM6vFO-bfWn5fcJhc0QOTUKJQe13jXeg@mail.gmail.com>
Subject: Re: flash_erase ERROR!
From: Brian Norris <computersforpeace@gmail.com>
To: dhlm83@sapo.pt
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 19, 2011 at 6:52 AM,  <dhlm83@sapo.pt> wrote:
> Hello.
> This is my first post.
>
> I am using uClinux (kernel 2.4.34.5-uc0 , dist: 20110603)
> I build a image to board NetBurner MOD5272.

That's a very old (and dare I say unsupported?) kernel. There may be
some things we can do to help, but generally, MTD developers don't
support that old of code.

> The problem is: The flash_eraseall and flash_erase dont work.
> =A0 =A0 ......
> =A0 =A0 # flash_eraseall -j /dev/mtd5 0 0
> =A0 =A0 /bin/flash_eraseall has been replaced by `flash_erase <mtddev> 0 =
0`;
> please use it
> =A0 =A0 Access Error Exception 12: Error on data read
> =A0 =A0 SIGSEGV
> =A0 =A0 ......
>
> =A0 =A0 ......
> =A0 =A0 # flash_erase -j -u -N /dev/mtd5 0 0
> =A0 =A0 libmtd: error!: MEMGETBADBLOCK ioctl failed
> =A0 =A0 =A0 =A0 =A0 =A0 error 25 (Inappropriate ioctl for device)
> =A0 =A0 flash_erase: error!: mtd_get_dev_info failed
> =A0 =A0 .....

What version of mtd-utils do you have? If it's old, then "flash_erase"
may not give a version # (try `flash_erase --version'). You could also
check other utilities, like:

nanddump --version
nandwrite --version
...

> Has anyone had this problem?
> Someone may give clues to solve the problem?

I'm guessing it's just that your kernel is really old. From the looks
of it, your flash_eraseall is pretty recent. Just a quick check of
some old kernel 2.4 code seems to tell me that MEMGETBADBLOCK didn't
even exist in your kernel, so obviously the current mtd-utils will be
incompatible.

Brian
