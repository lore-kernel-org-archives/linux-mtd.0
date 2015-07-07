Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCNRc-0002SM-Hq
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 07:37:33 +0000
Message-ID: <559B81A1.7010302@nod.at>
Date: Tue, 07 Jul 2015 09:37:05 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: pavi1729 <pavitra1729@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Query on ubifs_assert
References: <CAMf7+LjVE7ivjwOCMdPYHCV8PG9yH7A=eVJ_WGiagxzvVc-_aw@mail.gmail.com>	<CAFLxGvwi7=4qNgkwXjXvMrj=VvmwbyrYNRYsB6xhZ_avczTSkw@mail.gmail.com>
 <CAMf7+Lj93m55AD0ORfvumxEF5NrZUjhkSZ-X6h2JZLtoRNLcAQ@mail.gmail.com>
In-Reply-To: <CAMf7+Lj93m55AD0ORfvumxEF5NrZUjhkSZ-X6h2JZLtoRNLcAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.07.2015 um 09:29 schrieb pavi1729:
> Richard,
>   Just wondering ..
> 
> On Wed, Jul 1, 2015 at 7:41 PM, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Wed, Jul 1, 2015 at 1:03 PM, pavi1729 <pavitra1729@gmail.com> wrote:
>>> Hi,
>>>
>>>  FILE: fs/ubifs/misc.h :
>>>  FUNCTION : ubifs_compr_present
>>>
>>> "ubifs_compr_present" function has "ubifs_assert" which checks for the
>>> valid compression value
>>> and does a stack_dump if not.
>>>
>>> Could there be a case where the "compr_type" is corrupt; if yes, then
>>> does a stack_dump  suffice?
>>> Thus if compr_type is invalid then the below return is not reliable.
>>>     return !!ubifs_compressors[compr_type]->capi_name;
>>
>> If compr_type is invalid something nasty is happening and the kernel will crash
>> at some point.
>> But using the ubifs_assert() we can see at least what went wrong.
> .. if we know for sure that, the kernel will crash, then why not panic
> here and halt the system.
> We know for sure that it is going to crash anyways.

Because we don't want to stop the machine. Maybe only the current thread
dies...
But I'm sure some ubifs_assert() could be converted to WARN_ON().

Thanks,
//richard
