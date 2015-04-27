Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmsAU-0001Fa-Od
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 23:10:27 +0000
Received: by obfe9 with SMTP id e9so95541533obf.1
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2015 16:10:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <553EBEDD.9050204@nod.at>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427223630.GA11721@bshelton-desktop> <553EBB4A.1040905@nod.at>
 <20150427225307.GC32500@ld-irv-0074> <553EBEDD.9050204@nod.at>
Date: Mon, 27 Apr 2015 16:10:02 -0700
Message-ID: <CAN8TOE8Wx_KKy_2Lu_8j8iUaL+Q+rff_mR=P8E8tFzuQaYcWPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Ben Shelton <ben.shelton@ni.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 27, 2015 at 3:57 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 28.04.2015 um 00:53 schrieb Brian Norris:
>> On Tue, Apr 28, 2015 at 12:42:18AM +0200, Richard Weinberger wrote:
>>> Am 28.04.2015 um 00:36 schrieb Ben Shelton:
>>>>>> When I build this without CONFIG_MTD_NAND_ECC_ON_DIE enabled, I get =
the
>>>>>> following warning here:
>>>>>>
>>>>>> In file included from drivers/mtd/nand/nand_base.c:46:0:
>>>>>> include/linux/mtd/nand_ondie.h: In function 'nand_read_subpage_on_di=
e':
>>>>>> include/linux/mtd/nand_ondie.h:28:1: warning: no return statement in=
 function returning non-void [-Wreturn-type]
>>>>>> include/linux/mtd/nand_ondie.h: In function 'nand_read_page_on_die':
>>>>>> include/linux/mtd/nand_ondie.h:34:1: warning: no return statement in=
 function returning non-void [-Wreturn-type]
>>>>>>
>>>>>> Perhaps return an error code here, even though you'll never get past=
 the BUG()?
>>>>>
>>>>> What gcc is this?
>>>>> gcc 4.8 here does not warn, I thought it is smart enough that this fu=
nction does never
>>>>> return. Can it be that your .config has CONFIG_BUG=3Dn?
>>>>> Anyway, this functions clearly needs a return statement. :)
>>>>
>>>> gcc 4.7.2, and you are correct that I had CONFIG_BUG off.  :)
>>>
>>> Yeah, just noticed that BUG() with CONFIG_BUG=3Dn does not have
>>> a nonreturn attribute. So, gcc cannot know...
>>
>> But it's an obvious infinite loop... all of my toolchains (4.2, 4.5,
>> 4.6, 4.8) are able to compile this without complaining (gcc -Wall):
>>
>> int test() { do { } while (1); }
>
> Not here. gcc 4.8 warns on that.
> As soon I add __attribute__ ((noreturn)) it does not longer complain.

Huh? Maybe I have a crazy modified gcc.

$ gcc --version
gcc (Ubuntu 4.8.2-19ubuntu1) 4.8.2
Copyright (C) 2013 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ gcc -Wall -Wextra -c a.c
$ cat a.c
int test() { do {} while (1); }

But:

$ gcc -Wall -Wextra -c b.c
b.c: In function =E2=80=98test=E2=80=99:
b.c:1:1: warning: control reaches end of non-void function [-Wreturn-type]
 int test() { }
 ^
$ cat b.c
int test() { }
