Received: from mail-vn0-x232.google.com ([2607:f8b0:400c:c0f::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAIkR-0008E4-03
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 14:12:23 +0000
Received: by vnbf129 with SMTP id f129so6665697vnb.4
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2015 07:12:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMf7+LjVE7ivjwOCMdPYHCV8PG9yH7A=eVJ_WGiagxzvVc-_aw@mail.gmail.com>
References: <CAMf7+LjVE7ivjwOCMdPYHCV8PG9yH7A=eVJ_WGiagxzvVc-_aw@mail.gmail.com>
Date: Wed, 1 Jul 2015 16:11:59 +0200
Message-ID: <CAFLxGvwi7=4qNgkwXjXvMrj=VvmwbyrYNRYsB6xhZ_avczTSkw@mail.gmail.com>
Subject: Re: Query on ubifs_assert
From: Richard Weinberger <richard.weinberger@gmail.com>
To: pavi1729 <pavitra1729@gmail.com>
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

On Wed, Jul 1, 2015 at 1:03 PM, pavi1729 <pavitra1729@gmail.com> wrote:
> Hi,
>
>  FILE: fs/ubifs/misc.h :
>  FUNCTION : ubifs_compr_present
>
> "ubifs_compr_present" function has "ubifs_assert" which checks for the
> valid compression value
> and does a stack_dump if not.
>
> Could there be a case where the "compr_type" is corrupt; if yes, then
> does a stack_dump  suffice?
> Thus if compr_type is invalid then the below return is not reliable.
>     return !!ubifs_compressors[compr_type]->capi_name;

If compr_type is invalid something nasty is happening and the kernel will crash
at some point.
But using the ubifs_assert() we can see at least what went wrong.

> So where does this end, eventually does it go to a point where the
> volume get corrupt and not unmountable ?

As I said, if that value is corrupt we are already in trouble.
The purpose of the assert is to report which value is bad.

-- 
Thanks,
//richard
