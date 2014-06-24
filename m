Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzJu6-0007uD-Hg
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 06:08:28 +0000
Received: by mail-qa0-f53.google.com with SMTP id j15so6632455qaq.12
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2014 23:07:56 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315D6EFB@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315D6E23@NTXXIAMBX02.xacn.micron.com>
 <CABkLObpG0+Z6ostWZ2czieQDBkW1AD_Q5Qru6oZuao=enM9O0A@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315D6EFB@NTXXIAMBX02.xacn.micron.com>
Date: Tue, 24 Jun 2014 08:07:56 +0200
Message-ID: <CABkLObraMfKKPT_XzG56BUXgF+j-1FGF9OBL3yBq64=GDYMOhQ@mail.gmail.com>
Subject: Re: [PATCH V2] mtd:nor:timeout:fix do_write_buffer() timeout error
From: Christian Riesch <christian.riesch@omicron.at>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Kees Cook <keescook@chromium.org>, Alexander Shiyan <shc_work@mail.ru>,
 Jingoo Han <jg1.han@samsung.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jun 24, 2014 at 2:50 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
> Hi,
>>I tried to test this version of your patch, but cannot apply it. On which=
 kernel version does it apply?
> This patch checkout from mainline 3.15.0-rc8,and git address as below:
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

I took your patch (v2) from patchwork and tried with 3.15-rc8:

$ cd linux
$ git checkout v3.15-rc8
HEAD is now at fad01e8... Linux 3.15-rc8
$ wget -nv http://patchwork.ozlabs.org/patch/362656/mbox/ -O pw-362656.patc=
h
2014-06-24 07:58:02 URL:http://patchwork.ozlabs.org/patch/362656/mbox/
[3918/3918] -> "pw-362656.patch" [1]
$ git am pw-362656.patch
Applying: mtd:nor:timeout:fix do_write_buffer() timeout error
/home/chrrie00/linux/.git/rebase-apply/patch:53: trailing whitespace.
        unsigned long uWriteTimeout =3D
error: patch failed: drivers/mtd/chips/cfi_cmdset_0002.c:1462
error: drivers/mtd/chips/cfi_cmdset_0002.c: patch does not apply
Patch failed at 0001 mtd:nor:timeout:fix do_write_buffer() timeout error
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
$

Using git am --whitespace=3Dfix didn't work either.

>
>>>         unsigned long timeo =3D jiffies + HZ;
>>> -       /* see comments in do_write_oneword() regarding uWriteTimeo. */
>>> -       unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
>>> +       /* The size of the buffer program has been increased from 256 t=
o 512,
>>> +        * 2ms maximum timeout can not adapt to all the different vendo=
r's
>>> +        * norflash.There maximum timeout information in the CFI area,s=
o the
>>> +        * best way is to choose the result calculated according to tim=
eout
>>> +        * field of struct cfi_ident that probed from norflash's CFI ae=
ra,see
>>> +        * comments in cfi_cmdset_0002().uWriteTimeout is used for time=
out step,
>>> +        * it must be concerted into jiffies.
>
>>I think the reference to the old 2ms timeout only confuses readers, since=
 they don't know the old code. Putting this into the commit message is suff=
icient.
>
> I think you could delete this comment here.
> OK,thanks for your suggest,I will put this message into commit message.
>
>>> +        */
>>> +       unsigned long uWriteTimeout =3D
>
>>Trailing whitespace, please remove that. Please run your patch through sc=
ripts/checkpatch.pl to detect such errors.
>
> I have checked it by checkpatch.pl,but no error and warning.

$ ./scripts/checkpatch.pl pw-362656.patch
ERROR: trailing whitespace
#78: FILE: drivers/mtd/chips/cfi_cmdset_0002.c:1486:
+^Iunsigned long uWriteTimeout =3D $

total: 1 errors, 0 warnings, 42 lines checked

NOTE: whitespace errors detected, you may wish to use scripts/cleanpatch or
      scripts/cleanfile

pw-362656.patch has style problems, please review.

If any of these errors are false positives, please report
them to the maintainer, see CHECKPATCH in MAINTAINERS.

> i will double check it in the next version.

I will try with v3 now.
Maybe your email client messes the patch up? Are you using git
send-email or something else?

> i hope this patch can be accepted as soon as possible. I want to commit o=
ther timeout error patches.thanks!

Please note that I am not the maintainer here.

Regards, Christian
