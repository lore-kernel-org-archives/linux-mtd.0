Received: from smtp26.msg.oleane.net ([62.161.4.26])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8nyA-0005kc-K7
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 07:54:47 +0000
Message-ID: <5045B3C3.8020500@interfaceconcept.com>
Date: Tue, 04 Sep 2012 09:54:43 +0200
From: =?UTF-8?B?Q8OpZHJpYyBDYW5v?= <ccano@interfaceconcept.com>
MIME-Version: 1.0
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH 1/2] drivers/mtd/devices/m25p80.c: Fix return code of
 read/write mtd callbacks
References: <5044D395.9050607@ic.fr>
 <CAJiQ=7AwRnbtDtTd9u-j5xqOCqYx89R8CfK7MpQCYG3OossY0A@mail.gmail.com>
In-Reply-To: <CAJiQ=7AwRnbtDtTd9u-j5xqOCqYx89R8CfK7MpQCYG3OossY0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 03/09/2012 20:26, Kevin Cernekee a écrit :
> On Mon, Sep 3, 2012 at 8:58 AM, Cédric Cano <ccano@interfaceconcept.com> wrote:
>> For SPI Flash devices, MTD read and write functions returns "1" if Flash is
>> busy (this status is returned by "wait_till_ready" fnuction). This return
> "function"
>
> It is usually a good idea to wrap the commit text around 72-74
> characters so that it is readable in "git log" on an 80-column
> terminal.
>
>> code is not an error code: if device is busy, MTD read or write are
>> successful with 1 byte length.
> Looking at mtd_read() - typically the transfer length is passed back
> through the "size_t *retlen" pointer, not the function's return value.
>
> In Linux 3.5, if m25p80_read() returns 1, mtd_read() will interpret it
> as a bitflip count not a byte count.  That isn't the correct behavior
> for a NOR device, but it probably wouldn't cause the symptom you are
> reporting.
>
> In Linux 3.4 and older, some functions like mtdchar_read() could
> interpret the '1' as an error code and pass it back as-is to the
> caller (who is expecting either a negative error code or a positive
> length).  Is this the case you are running into?

You're alright: I'm doing my test on kernel 3.4. In this case, '1' is
the return code of mtd_read() that is considered as a length, not an
error.
In kernel 3.5, it should work without this patch (I can't test it).

>
> Side note - it would be helpful to add kerneldoc markup to
> include/linux/mtd/mtd.h for struct mtd_info and the new mtd_* wrapper
> functions, so we have a clear definition of what the parameters and
> return values should look like.
>
>> --- linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-08-26
>> 04:32:13.000000000 +0200
>> +++ linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-09-03
>> 17:35:16.159741656 +0200
>> @@ -199,7 +199,7 @@
> Could you please use "git format-patch" for your submissions, and base
> them on the current head of tree?
>
> Thanks.
>
OK, I will repost my second patch with this method.

Thanks.
