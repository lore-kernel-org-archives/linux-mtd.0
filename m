Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgqav-0002Cs-Gk
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 01:49:41 +0000
Received: by wa-out-1112.google.com with SMTP id j5so382971wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 18:49:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a64f67eb0908271818t6971df98y2705c76e04ba4728@mail.gmail.com>
References: <a64f67eb0908202331q73230351pe27f1434470707ae@mail.gmail.com>
	<1c3f4270908211108w416019deh9aa4b2575d6a1b82@mail.gmail.com>
	<a64f67eb0908231707k80cf8c9m11e9074c11c48abe@mail.gmail.com>
	<4A926F79.4030700@users.sourceforge.net>
	<a64f67eb0908242247v7b10551q96c63b95f66bd41c@mail.gmail.com>
	<a64f67eb0908271818t6971df98y2705c76e04ba4728@mail.gmail.com>
Date: Thu, 27 Aug 2009 18:49:34 -0700
Message-ID: <1c3f4270908271849y754323ft462f772623d1f0a7@mail.gmail.com>
Subject: Re: JFFS2 crash in linux-2.6.30
From: Manoj <manoj23@gmail.com>
To: linux newbie <linux.newbie79@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It might be a timing issue. Make sure the you got the timing cycles
configured right in the NAND driver. Also, as an experiment, disable
JFFS2 debugging and enable CONFIG_JFFS2_WBUF_VERIFY, See if this
throws up an error.
I would also make sure that the driver passes nand tests.

On Thu, Aug 27, 2009 at 6:18 PM, linux newbie<linux.newbie79@gmail.com> wro=
te:
> before setting CONFIG_JFFS2_WBUF_VERIFY, if I enable jffs2 debug
> messages, things are working fine.
>
> I suspect there should be some timing issue.
>
> any thoughts in this regard?
>
> On Tue, Aug 25, 2009 at 3:47 PM, linux newbie<linux.newbie79@gmail.com> w=
rote:
>> Hi All,
>>
>> Thanks for your support.
>>
>> I havent set CONFIG_JFFS2_FS_WBUF_VERIFY and after enabling it, its
>> working fine.
>>
>> Thanking You
>>
>> On Mon, Aug 24, 2009 at 8:46 PM, Anders
>> Grafstr=F6m<grfstrm@users.sourceforge.net> wrote:
>>> linux newbie wrote:
>>>> I tried this patch, after which I am not getting crash, but instead it=
 shows
>>>> cp: input/output error. and this is not consistent. somtimes, file
>>>> copying is perfect and some times its not.
>>>
>>> You get this when you write to a dnode whose previous data resides
>>> in a NAND block that has gone bad.
>>>
>>> Have you set CONFIG_JFFS2_FS_WBUF_VERIFY?
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>>
>
