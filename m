Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erZMm-0005eT-3T
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 01:20:10 +0000
Received: by mail-wm0-x236.google.com with SMTP id s206so879999wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2018 17:19:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9684795.NoKKx6Kvh2@blindfold>
References: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
 <9684795.NoKKx6Kvh2@blindfold>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 1 Mar 2018 17:19:54 -0800
Message-ID: <CAJ+vNU3hx8rGh-Kx-UpBU-eYvkT-zspggndChg16Hzu7v_8mBA@mail.gmail.com>
Subject: Re: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Scott Bowman <wbowma01@harris.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 1, 2018 at 8:32 AM, Richard Weinberger <richard@nod.at> wrote:
> Tim,
>
> Am Donnerstag, 1. M=C3=A4rz 2018, 17:15:44 CET schrieb Tim Harvey:
>> Greetings,
>>
>> I have a user with an IMX6 and raw NAND using UBI/UBIFS who has been
>> able to reproduce a NAND corruption:
>
> What does your user to reproduce this?

Richard,

It's unclear at the moment. It's one of those 'this happened twice on
two different boards' reports without a lot of detail. However I do
know they do write to the filesystem on every boot and do encounter
random power-cuts.

>
>> [   10.611972] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started,=
 PID
>> 631 [   10.634365] ubi0 warning: ubi_io_read: error -74 (ECC error) whil=
e
>> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [
>> 10.657492] ubi0 warning: ubi_io_read: error -74 (ECC error) while readin=
g
>> 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [
>> 10.681137] ubi0 warning: ubi_io_read: error -74 (ECC error) while readin=
g
>> 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [
>> 10.704267] ubi0 error: ubi_io_read: error -74 (ECC error) while reading
>> 253952 bytes from PEB 2807:8192, read 253952 bytes
>>
>> The kernel they are using is a bit out of date but does have
>> 'gpmi-nand: Handle ECC Errors in erased pages' [1] patch
>>
>> I'm wondering if the 'unstable bits issue' [2] is still an issue or if
>> the UBI/UBFS Documentation is out of date and this has been resolved.
>> If it has been resolved, can anyone point me to the patches.
>
> This issue is highly theoretical and I never actually saw it in the wild.
> Every single time someone claimed to suffer from that, it turned out to b=
e
> something else. Currently UBI/UBIFS has no counter measurement, for the s=
aid
> reasons.
> This reminds me that we have to update the website...
>
> So did you verify (with your NAND vendor) that this really is the named i=
ssue?

I have no idea if what the user reported is the unstable bits issue
but the fact you've never seen it occur in the wild tells me probably
not.

They are using a rather old kernel (4.4 but with a patch to gpmi-nand
backported from 4.7). I will setup a controlled test with random
power-cuts in a test fixture I have to see if I can get it to re-occur
on a) the old kernel and then b) the current kernel.

Thanks for the feedback!

Tim
