Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLVA8-0001hA-GD
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 10:04:25 +0000
From: Harini Katakam <harini.katakam@xilinx.com>
To: Jagan Teki <jagannadh.teki@gmail.com>, "chuck@mds.com" <chuck@mds.com>
Subject: RE: [PATCH] Check flag status register for Micron n25q512a
Date: Thu, 6 Mar 2014 10:03:50 +0000
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201403021542.09196.marex@denx.de>	<5314B336.7090306@mds.com>
 <201403040129.12504.marex@denx.de>	<5316498A.8080200@mds.com>
 <CAD6G_RSXtjNuGy83CbOQRjmcAXEXThr4dEBjboUYrk6+ftSY-w@mail.gmail.com>
In-Reply-To: <CAD6G_RSXtjNuGy83CbOQRjmcAXEXThr4dEBjboUYrk6+ftSY-w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <4090135b-c01f-43f1-a953-24dccbb5353d@AM1EHSMHS001.ehs.local>
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Todd Legler \(tlegler\)" <tlegler@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> -----Original Message-----
> From: Jagan Teki [mailto:jagannadh.teki@gmail.com]
> Sent: Thursday, March 06, 2014 2:56 PM
> To: chuck@mds.com
> Cc: Marek Vasut; linux-mtd@lists.infradead.org; Todd Legler (tlegler); Ha=
rini
> Katakam
> Subject: Re: [PATCH] Check flag status register for Micron n25q512a
>
> Hi All,
>
> On Wed, Mar 5, 2014 at 3:15 AM, Chuck Peplinski <chuck@mds.com> wrote:
> > On 3/3/2014 6:29 PM, Marek Vasut wrote:
> >>>
> >>> FSR can apparently toggle without SR.
> >>
> >> Is that documented anywhere ? How can that be ?
> >
> > I'm looking at the data sheet for the part, n25q_512mb_1ce3v_65nm.pdf,
> > from the Micron web site at
> > http://www.micron.com/products/nor-flash/serial-nor-
> flash#fullPart&236=3D10.
> > The comment that led us in this direction is on page 62:
> >
> > "ERASE Operations
> > When the operation is in progress, the program or erase controller bit
> > of the flag status register is set to 0. The flag status register must
> > be polled for the operation status. When the operation completes, that
> > bit is cleared to 1.
> > Note that the flag status register must be polled even if operation
> > times out."
> >
> >
> >> Hmmmm , I have a feeling that if you actually added wait_till_ready()
> >> call at the end of _erase() and _write(), you would get the same
> >> effect. This would in turn mean you are instead missing wait_till_read=
y()
> somewhere else.
> >> Can you try using wait_till_ready() at the end of _erase() and
> >> _write() please ?
> >
> >
> > That would be the standard code, right?  That's where we started and
> > it did not work.
> >
> > At some point I'll try some more tests.  I'm not blocked on this now,
> > so it's not totally critical.
> > One thing I notice:  The web site notes that this part stacks two 256M =
dies.
> > Maybe that's why it is non-standard?
> > Sure would be nice to hear from someone at Micron...
>
> BTW: I have some information regarding this part.
>
> We have tested this part both in u-boot and Linux where we could see an
> issue while polling read_status, and then we moved to use flag_status the=
n
> we saw the consistent behavior.
>
> Inputs we're got from Micron are:
> 1. Micron (though not clearly documented), stated that flag_status is cle=
arly
>     required to be polled, even though read_status reports the exact stat=
us.
>     They are not willing to change the datasheet but plan on releasing an=

>     app note or something because this has led to a lot of confusion.
> 2. At this moment, no one else has such weird design of needing an
> flag_status poll.
>     So checking for the device ID and polling flag_status looks like the =
only
> option.
>
> The same approach we tried as well.
>
> CCing - Harini (tested flag_status on Linux) CCing - Todd Legler from Mic=
ron.
>
> Todd and Harini - Please share your inputs.
>

Micron devices with more than one die i.e. n25q_512mb and n25q_1gb
have this additional check.
Notes 14 and 15 under command definition table 18 describe this best.
Although, it is stated that the WIP bit in status register is NOT of
bit 7 in Flag status register, FSR still needs to be polled.

We had a discussion with Micron from which we learnt the following:
1. Program/erase operations in multi-die devices are not complete until
Read FSR command receives a ready response form flash at least one time.
2. In addition, if you are doing a Write Non-volatile configuration registe=
r/
Write status register operation, the operation is only complete after
FSR poll returns ready consecutively 2 or 4 times (as many times as the num=
ber of die).
In this case, each time the chip select is toggled and Read FSR command is =
sent,
response is sent by alternate die (1,2,1,2... or 1,2,3,4,1,2,3,4.....).

Todd, please add to this if you would like to elaborate.

Regards,
Harini

>
> thanks!
> --
> Jagan.



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
