Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1g8h-00037a-KR
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 12:22:37 +0000
Received: by wf-out-1314.google.com with SMTP id 23so47475wfg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 May 2009 05:22:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241526066.3760.37.camel@localhost.localdomain>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
	<1241526066.3760.37.camel@localhost.localdomain>
Date: Wed, 6 May 2009 14:22:17 +0200
Message-ID: <71cd59b00905060522w191f5f19n6c67a1f33a55b061@mail.gmail.com>
Subject: Re: mtdutils and libubiio
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 5, 2009 at 2:21 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Tue, 2009-05-05 at 11:49 +0200, Corentin Chary wrote:
>> Hi,
>> Some time ago we made libubiio available at :
>> http://git.iksaif.net/?p=libubiio.git;a=summary
>> I wanted to know how it can be used in mtd-utils, so we can start
>> making patch for inclusion into mtd-utils.
>> The first thing I see is mkfs.ubifs, using libubiio we will be able to
>> run mkfs on an ubi volume. I believe it's
>> simpler than creating a image, and using other tools to write it to the volume.
>> Where can libubiio be used ?
>
> Sure, go ahead.
>
>> Another question, do you use static Makefiles for a reason ? Maybe we
>> could move to CMake ?
>
> I do not know CMake, buy I thought Makefiles work just fine.
>

Hi,
You'll find here some experiments:
http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=summary

Before working on mkfs.ubifs I wanted to cleanup the mtd-utils dir, so
I tried some change,
including the use of CMake. As a lot of people here don't want to hear
about CMake, if the patchs
for mkfs are good enought, I'll rebase them on a vanilla version of mtd-utils.

What you'll find here:
- CMake "experiment" with dependencies check on zlib and libacl
- libubiio, provinding the same API the kernel does
- mkfs.ubifs using libubiio, can write the image directly on an ubi volume

libubiio need a very recent kernel with the new UBI ioctl()

It's not a finished work, it's more a request for comments ;).
thanks
-- 
Corentin Chary
http://xf.iksaif.net
