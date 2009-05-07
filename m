Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1zAi-0007Nl-Fi
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 08:41:46 +0000
Received: by wf-out-1314.google.com with SMTP id 23so546231wfg.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 May 2009 01:41:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241675856.27996.8.camel@localhost.localdomain>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
	<1241526066.3760.37.camel@localhost.localdomain>
	<71cd59b00905060522w191f5f19n6c67a1f33a55b061@mail.gmail.com>
	<1241675856.27996.8.camel@localhost.localdomain>
Date: Thu, 7 May 2009 10:41:38 +0200
Message-ID: <71cd59b00905070141l489ef4b2g55cb17e3370e895d@mail.gmail.com>
Subject: Re: mtdutils and libubiio
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org, Mike Frysinger <vapier.adi@gmail.com>
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

On Thu, May 7, 2009 at 7:57 AM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2009-05-06 at 14:22 +0200, Corentin Chary wrote:
>> Hi,
>> You'll find here some experiments:
>> http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=summary
>>
>> Before working on mkfs.ubifs I wanted to cleanup the mtd-utils dir, so
>> I tried some change,
>> including the use of CMake. As a lot of people here don't want to hear
>> about CMake, if the patchs
>> for mkfs are good enought, I'll rebase them on a vanilla version of mtd-utils.
>
> I have a pile of patches in my tree as well. I wait for dwmw2 to send
> my "export subpage via sysfs" patch to Linus, and after this I'll
> push my changes. They basically make libmtd use sysfs interface, but
> there are some random minor libubi changes and fixes. I'll try to
> push this ASAP.

Ok, so it'll probably add change to libubiio because like libubi we
use some sysfs files.

> Vs CMake. I do not know. I'm not very good in this at all. Mike kind
> of maintains the build system in the mtd-utils, and he lately improved
> it. So if you may convince him, probably. But the thing is that not
> many people care about mtd-utils, and if you introduce CMake and then
> disappear - who is going to maintain that ?
>
> I personally think that if Makefile can do the same stuff, there is
> no reason to change/add new build system only because it is fewer lines
> in CMake.
Well CMake is easy to maintain when the base CMakefile is done. Adding programs
is done with add_executable(prog prog1.c prog2.c) for example. And things like
cross-compiling, installation, debug, external buid,  are builtin.
Also, it have some dependencies checking functionality
(find_package(ZLIB REQUIRED) to make sure zlib is present before
compiling).

Using CMake I was able to move all shared code into lib/ (no more
crc32.c in each dirs). It can be done
with Makefiles, but it's more tricky.

wc `find . -name CMakeLists.txt`
  14   29  416 ./jffs/CMakeLists.txt
   7   21  213 ./mkfs.ubifs/CMakeLists.txt
  26   71  856 ./lib/CMakeLists.txt
  79  258 2511 ./CMakeLists.txt
  35   68  990 ./ubi-utils/CMakeLists.txt
  38   90 1474 ./mtd-utils/CMakeLists.txt
 199  537 6460 total

wc Makefile common.mk ubi-utils/Makefile mkfs.ubifs/Makefile
  66  148 1728 Makefile
  71  200 1772 common.mk
  59  172 1514 ubi-utils/Makefile
  23   48  502 mkfs.ubifs/Makefile
 219  568 5516 total

It's why I think maintaining a build system based on CMake is easier.
So if Mike is ok, I'll be happy to
help. If he is not, let's work with raw Makefiles.

But it's clear that moving to CMake is *certainly not a priority*
here, sot let's talk about usefull things: mkfs =).

>> What you'll find here:
>> - CMake "experiment" with dependencies check on zlib and libacl
>> - libubiio, provinding the same API the kernel does
>> - mkfs.ubifs using libubiio, can write the image directly on an ubi volume
>
> Would you please send patches. It is so much more convenient to
> people? Teaching mkfs.ubifs write directly into the volume sounds
> nice, BTW.
>

Well as I said it's just an experiment right now.
Now that it works, I'll be able to send a series of patch with small
and smooth changes.
I'm not sure of the dtype I chose, but you'll be able to check that
later with a clean patch.
Breaking the whole buildsystem is certainly not the right way for
merging such a thing... it's just that the current one is not really
easy to work with.

-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
