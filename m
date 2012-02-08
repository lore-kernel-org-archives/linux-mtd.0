Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvC7G-0003m4-C3
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 18:19:38 +0000
Received: by wera10 with SMTP id a10so714199wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 10:19:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1202080837040.17234@lnxricardw.se.axis.com>
References: <CAF-d49SkoO33Wno2MoX+52uLb1VAgMKA0XAoJQS3GxA=USTtEw@mail.gmail.com>
 <Pine.LNX.4.64.1202080837040.17234@lnxricardw.se.axis.com>
Date: Wed, 8 Feb 2012 10:19:36 -0800
Message-ID: <CAF-d49RZ=yyZ58akiSeRxs-nXQnf84Z=b3jmTz9whRZfeiNOuw@mail.gmail.com>
Subject: Re: How to measure the mounting time in Linux
From: Wei Wang <wangw8210@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
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

I mean the length of time a a device has been mounted with a special filesy=
stem.

Thanks


On Tue, Feb 7, 2012 at 11:37 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Tue, 7 Feb 2012, Wei Wang wrote:
>
>> Hi All,
>>
>> Is there anyone know how to measure the mounting time in Linux? I have
>> searched on google, but cannot find anything about it.
>
>
> Do you mean the length of time a device has been mounted, or how long the
> actual mounting process takes? In the latter case, one could simply do
>
> # time mount <options>
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 Fax +46 46 13 61 30
