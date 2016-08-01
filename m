Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUCuw-0005Zy-QW
 for linux-mtd@lists.infradead.org; Mon, 01 Aug 2016 13:06:06 +0000
Received: by mail-ua0-x234.google.com with SMTP id k90so105596092uak.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Aug 2016 06:05:40 -0700 (PDT)
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com.
 [209.85.217.178])
 by smtp.gmail.com with ESMTPSA id v138sm1081800vke.20.2016.08.01.06.05.37
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Aug 2016 06:05:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Received: by mail-ua0-f178.google.com with SMTP id j59so105482655uaj.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Aug 2016 06:05:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <579A737A.6090308@nod.at>
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
 <579A737A.6090308@nod.at>
Date: Mon, 1 Aug 2016 10:05:36 -0300
Message-ID: <CAP9ODKpJtw+21yA0FnRgTWnLNRqoDTRCWC3t5ZYALC77UFeMwQ@mail.gmail.com>
Subject: Re: mtd-utils: Swtich to autotools based build system
To: Richard Weinberger <richard@nod.at>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, gustavo@zacarias.com.ar,
 Riku Voipio <riku.voipio@linaro.org>, pascal.bleser@opensuse.org,
 mpluskal@suse.com, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 28, 2016 at 6:04 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 25.07.2016 um 17:02 schrieb David Oberhollenzer:
>> This patch series is based on Richards RFC to replace the hand
>> written Makefiles with an autoconf/automake based build system
>> to gain all the advantages of having an _actual_ build system
>> that is high level, widely used, well known and mature/stable.
>>
>> Switching to the GNU buildsystem should make it a lot easier for
>> people to [cross] compile the mtd-utils and integrating them into
>> existing, automated [cross] build toolchains, as the autotools are
>> very widely used/known, effectively representing a pseudo-standard
>> that people are familiar with and that a lot of tools have been
>> adapted to.
>>
>> The GNU build system also had a few more decades time and a _lot_
>> more testing to mature in regards to cross compilation setups and
>> toolchains than the previous mtd-utils build system that would have
>> to be further supported and maintained in its entirety.
>>
>> The proposed autotools based build system should also be easier to
>> maintain than a hurdle of makefiles. The automake files are more
>> high level and only contain a list of input files for each program.
>> Generating the makefiles with precise dependencies and build steps
>> is done by the build system.
>>
>> Furthermore, files like the test scripts can fairly easily be
>> processed with autoconf at compile time to (for instance) replace
>> file locations with the actual path where a program is configured
>> to be installed.
>
> Let's ask also package maintainers for their opinion.
> They have to (cross)build and package mtd-utils. :-)
>
> You can find the whole series on:
> https://github.com/sigma-star/mtd-utils.git autoconf_25072016

>From OpenEmbedded/Yocto Project point of view, it would be good as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
