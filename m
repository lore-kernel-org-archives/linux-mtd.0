Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUC7L-0007XP-Q9
 for linux-mtd@lists.infradead.org; Mon, 01 Aug 2016 12:14:51 +0000
Received: by mail-wm0-x232.google.com with SMTP id q128so53009204wma.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Aug 2016 05:14:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1469783966.24141.8.camel@suse.cz>
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
 <579A737A.6090308@nod.at> <1469783966.24141.8.camel@suse.cz>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 1 Aug 2016 15:14:24 +0300
Message-ID: <CAAqcGH=PsEukiUirzRVsnmnd3Dou0Pjq_X_SSYWje+T8J5FKLg@mail.gmail.com>
Subject: Re: mtd-utils: Swtich to autotools based build system
To: Martin Pluskal <mpluskal@suse.cz>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>, otavio@debian.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, pascal.bleser@opensuse.org,
 gustavo@zacarias.com.ar
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 July 2016 at 12:19, Martin Pluskal <mpluskal@suse.cz> wrote:
> On Thu, 2016-07-28 at 23:04 +0200, Richard Weinberger wrote:
>> You can find the whole series on:
>> https://github.com/sigma-star/mtd-utils.git autoconf_25072016
>>
>> Thanks,
>> //richard
>>
> Hello

> definitely autotools - issue with custom makefiles is that they often
> ignore conventions, when trying to enforce distribution specific things
> one has to go through them, in case of mtd-utils for openSUSE [1], to
> use distribution specific flags and have verbose build following has to
> be done:

Autotools have their annoyances, but at least they are familiar
annoyances. So for Debian this would be prefferable too.

Riku
