Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCNKZ-0004jT-0D
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 07:30:15 +0000
Received: by iecuq6 with SMTP id uq6so128911952iec.2
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2015 00:29:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwi7=4qNgkwXjXvMrj=VvmwbyrYNRYsB6xhZ_avczTSkw@mail.gmail.com>
References: <CAMf7+LjVE7ivjwOCMdPYHCV8PG9yH7A=eVJ_WGiagxzvVc-_aw@mail.gmail.com>
 <CAFLxGvwi7=4qNgkwXjXvMrj=VvmwbyrYNRYsB6xhZ_avczTSkw@mail.gmail.com>
Date: Tue, 7 Jul 2015 12:59:53 +0530
Message-ID: <CAMf7+Lj93m55AD0ORfvumxEF5NrZUjhkSZ-X6h2JZLtoRNLcAQ@mail.gmail.com>
Subject: Re: Query on ubifs_assert
From: pavi1729 <pavitra1729@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,
  Just wondering ..

On Wed, Jul 1, 2015 at 7:41 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Wed, Jul 1, 2015 at 1:03 PM, pavi1729 <pavitra1729@gmail.com> wrote:
>> Hi,
>>
>>  FILE: fs/ubifs/misc.h :
>>  FUNCTION : ubifs_compr_present
>>
>> "ubifs_compr_present" function has "ubifs_assert" which checks for the
>> valid compression value
>> and does a stack_dump if not.
>>
>> Could there be a case where the "compr_type" is corrupt; if yes, then
>> does a stack_dump  suffice?
>> Thus if compr_type is invalid then the below return is not reliable.
>>     return !!ubifs_compressors[compr_type]->capi_name;
>
> If compr_type is invalid something nasty is happening and the kernel will crash
> at some point.
> But using the ubifs_assert() we can see at least what went wrong.
.. if we know for sure that, the kernel will crash, then why not panic
here and halt the system.
We know for sure that it is going to crash anyways.
>
>> So where does this end, eventually does it go to a point where the
>> volume get corrupt and not unmountable ?
>
> As I said, if that value is corrupt we are already in trouble.
> The purpose of the assert is to report which value is bad.
>
> --
> Thanks,
> //richard
