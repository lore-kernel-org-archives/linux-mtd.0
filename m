Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCvA1-0004T9-8C
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 12:05:54 +0000
Message-ID: <4948EB1C.1000906@linutronix.de>
Date: Wed, 17 Dec 2008 13:05:48 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC] remove -W from build process
References: <20081217101924.GB4999@www.tglx.de>	
	<8bd0f97a0812170229x40d7a9d1jb53a3bac2d5bd5a1@mail.gmail.com>	
	<4948DF7C.7060802@linutronix.de>
	<8bd0f97a0812170317s7485cd01rf7a332234c84ff97@mail.gmail.com>
In-Reply-To: <8bd0f97a0812170317s7485cd01rf7a332234c84ff97@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> On Wed, Dec 17, 2008 at 06:16, Sebastian Andrzej Siewior wrote:
>> Mike Frysinger wrote:
>>> On Wed, Dec 17, 2008 at 05:19, Sebastian Andrzej Siewior wrote:
>>>> Would it be possible to use autotools for a clean build environment?
>>> it would make no difference here
>> It won't fix compile error, right. I thing it could be easier the handle
>> CFLAGS, cross builds, install, build dir, rebuilds, ...
>> Alternatively one could clean up the current make scripts but I thing it
>> would be easier to handle this with auto tools.
> 
> ive already posted a patch to cleanup the build system and it should
> address every issue you highlighted here ...

Cool. I thing you refer to "unify all common build system parts". It looks 
promising and smaller than my attempt.

> -mike

Sebastian
-- 
Firmensitz: 88690 Uhldingen, Auf dem Berg 3
Registergericht: Amtsgericht Freiburg i. Br., HRB 700 806;
StNr. 87007/07777; Ust-Id Nr.: DE252739476
Geschäftsführer: Heinz Egger, Thomas Gleixner
