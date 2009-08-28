Received: from mail-vw0-f193.google.com ([209.85.212.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgq79-00005U-8Y
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 01:18:55 +0000
Received: by vws31 with SMTP id 31so520895vws.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 18:18:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a64f67eb0908242247v7b10551q96c63b95f66bd41c@mail.gmail.com>
References: <a64f67eb0908202331q73230351pe27f1434470707ae@mail.gmail.com>
	<1c3f4270908211108w416019deh9aa4b2575d6a1b82@mail.gmail.com>
	<a64f67eb0908231707k80cf8c9m11e9074c11c48abe@mail.gmail.com>
	<4A926F79.4030700@users.sourceforge.net>
	<a64f67eb0908242247v7b10551q96c63b95f66bd41c@mail.gmail.com>
Date: Fri, 28 Aug 2009 11:18:48 +1000
Message-ID: <a64f67eb0908271818t6971df98y2705c76e04ba4728@mail.gmail.com>
Subject: Re: JFFS2 crash in linux-2.6.30
From: linux newbie <linux.newbie79@gmail.com>
To: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Manoj <manoj23@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

before setting CONFIG_JFFS2_WBUF_VERIFY, if I enable jffs2 debug
messages, things are working fine.

I suspect there should be some timing issue.

any thoughts in this regard?

On Tue, Aug 25, 2009 at 3:47 PM, linux newbie<linux.newbie79@gmail.com> wro=
te:
> Hi All,
>
> Thanks for your support.
>
> I havent set CONFIG_JFFS2_FS_WBUF_VERIFY and after enabling it, its
> working fine.
>
> Thanking You
>
> On Mon, Aug 24, 2009 at 8:46 PM, Anders
> Grafstr=F6m<grfstrm@users.sourceforge.net> wrote:
>> linux newbie wrote:
>>> I tried this patch, after which I am not getting crash, but instead it =
shows
>>> cp: input/output error. and this is not consistent. somtimes, file
>>> copying is perfect and some times its not.
>>
>> You get this when you write to a dnode whose previous data resides
>> in a NAND block that has gone bad.
>>
>> Have you set CONFIG_JFFS2_FS_WBUF_VERIFY?
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
