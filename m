Received: from na3sys009aog113.obsmtp.com ([74.125.149.209])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOsg0-0000Pu-Ui
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 14:33:42 +0000
Received: by mail-bw0-f46.google.com with SMTP id 15so7622994bwz.5
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 07:33:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1305872945.2630.119.camel@localhost>
References: <1305196419.2713.84.camel@localhost>
	<1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
	<BANLkTi=+V7PR_29pK3ooVggPmeicCG0eWg@mail.gmail.com>
	<BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
	<1305872945.2630.119.camel@localhost>
Date: Tue, 24 May 2011 10:33:37 -0400
Message-ID: <BANLkTinkqLV=7of1Ug=e-8a-A8qVJU98wA@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: don't fail on -EBADMSG when fixing free space
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, May 20, 2011 at 2:21 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-05-19 at 09:28 -0400, Ben Gardiner wrote:
>> [...]
>>
>> Because the "ubi_io_read: error -74 (ECC error)" is precisely what I
>> am encountering on my hardware when I do not flash with a utility that
>> drops empty pages at the end of eraseblocks. I imagined that this was
>> also the case for you. But I have also read that there are
>> peculiarities of the davinci nand driver (both in u-boot and linux).
>>
>> So, at least on my hardware, the -74 error is expected when the 0xff
>> pages are not dropped and so without the 'err != -EBADMSG' exception
>> the free space fixup will cause the volume to fail mount for me:
>
> I am confused. The fix Matthew made is about the following situation:

Sorry for the confusion. In the first 'Programming ubinized images'
thread I saw that Matthew mentioned seeing lots of -74 errors so I was
assuming that his and my problems are one and the same. Now that I
have tested his patch I am seeing that this is not the case.

> 1. You have completely erased flash (MTD partition) - no one has ever
> written there. If you now read the flash, you'll get all 0xFFs with no
> errors.
>
> 2. You use a "dumb" flasher to program an UBI image. This flasher will
> write empty NAND pages "as is". If you now read the flash after the
> "dumb" programming, you should have no errors.
>
> 3. You mount UBIFS for the very first time. It tries to fix up your
> flash. Whatever eraseblock UBIFS reads, it should not encounter any
> error.

Yes I agree with the context for the patch. I can say so far that on
da850evm 1. occurs as you described whereas for 2. and 3. ECC errors
are encountered on read.

> Isn't it weird that a freshly programmed flash cannot be read without
> -EBADMSG (ECC correction failure).

Yes it is very weird. :) I had been assuming up to this point that the
-74 errors were the result of writing the 0xff pages when they should
be dropped. I can see now that this is not the case.

On Fri, May 20, 2011 at 2:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-05-19 at 09:28 -0400, Ben Gardiner wrote:
>> So, at least on my hardware, the -74 error is expected when the 0xff
>> pages are not dropped and so without the 'err != -EBADMSG' exception
>> the free space fixup will cause the volume to fail mount for me:
>
> Still confused. If you have empty and erased flash, then you program it
> with all 0xFFs, you should be able to read it with no errors.

Right. In retrospect this seems to be a self-evident statement :)
I had been previously attributing the -74 errors to a combination of
1) writing 0xff pages when one should not and 2) lack of subpage
writing support workaround with -O 2048. But it is clearly (to me now)
a reading operation failure.

> If this is
> not the case for you, you should fix the driver. UBIFS cannot help in
> this case - we consider it as "broken flash driver" case.

Thank you. Yes, this appears to be the case and I'm glad to hear
confirmation of this from an expert such as yourself.

> I have not read your e-mail carefully because of limited amount of time,
> but with quick reading I became confused - too much information :-)

No problem. Thank you very much for what you have read and for your
insights into the ongoing NAND flash problems on da850evm.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
