Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFoQ2-0002xt-Rw
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 15:48:31 +0000
Received: by wibhn17 with SMTP id hn17so2808631wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 08:48:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <1346413469.9709.44.camel@sauron.fi.intel.com>
 <CAP+RiCBRopbShAGf_fWCvK2R=uPPR1j4Pz12JfJxdEMUjwofNw@mail.gmail.com>
 <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
Date: Sun, 23 Sep 2012 10:48:28 -0500
Message-ID: <CAP+RiCDHZYMZPFYmE6YfkLoA1gH=z8cTSRZ+9iQqQ=ei1xXFYg@mail.gmail.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Brent Taylor <motobud@gmail.com>
To: dedekind1@gmail.com
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

On Mon, Sep 17, 2012 at 8:34 AM, Brent Taylor <motobud@gmail.com> wrote:
> On Fri, Aug 31, 2012 at 8:23 AM, Brent Taylor <motobud@gmail.com> wrote:
>>
>> I'm currently running the test again, and will know the results on wed, =
sept 5.  If I do see a failure, I can send you an image, the problem is tha=
t the image will be either 256MB, 1GB, or 15GB depending on which partition=
 fails.  Will either of the larger sizes be an issue for you?  What would b=
e the best way to get the image to you?
>>
>> Thanks for your time.
>> Bud
>>
>> On Aug 31, 2012 7:39 AM, "Artem Bityutskiy" <dedekind1@gmail.com> wrote:
>>>
>>> On Mon, 2012-07-16 at 13:22 -0500, Brent Taylor wrote:
>>> > I'm developing on custom hardware using an at91sam9g45 processor with
>>> > 64 MB of RAM and 64 MB of NOR flash running Linux 3.0.13.
>>> >
>>> > I'm doing some power-cycle testing and after several hours, UBIFS
>>> > failed to mount the root partition and printed the message
>>> > "grab_empty_leb: could not find an empty LEB".  The system boots and
>>> > starts a script that will power cycle the board anytime between 10 an=
d
>>> > 20 seconds after the script has started.  Just before a power cycle
>>> > occurs, syslog and our main process are the only processes that could
>>> > be writing to disk.
>>> >
>>> I was trying to do power cut emulation testing with mtdram, and I see
>>> there are some issues which do not seem to exist on NAND. But they are
>>> different to yours. I remember I saw these -ENOSPC issues in the past,
>>> but they were very difficult to reproduce.
>>>
>>> I will try to investigate why power-cut emulation testing fails on
>>> mtdram, but I have limited amount of time and I do not know when I'll b=
e
>>> able to do this.
>>>
>>> --
>>> Best Regards,
>>> Artem Bityutskiy
>
>
> Artem,
>    I was finally able to capture the issue again with linux version
> 3.5.1, and I now have a 64MB mtd image for you to look at.  The issue
> occurred in the root filesystem this time.  Let me know what's the
> best way to get this image to you.  The image was retrieved from a NOR
> flash chip instead of a NAND flash chip, but I've seen the error on
> both which leads me to believe it's not a flash driver issue and it's
> something in the UBIFS subsystem.  If there is more data you need from
> me to help track this down, just let me know.
>
> Thanks for your time,
> Bud

Ping,  I just didn't want to get lost in the e-mail shuffle.
