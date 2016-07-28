Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSsiK-0003s4-6I
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 21:19:32 +0000
Date: Thu, 28 Jul 2016 23:18:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 gustavo@zacarias.com.ar, otavio@debian.org, riku.voipio@linaro.org,
 pascal.bleser@opensuse.org, mpluskal@suse.com, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: mtd-utils: Swtich to autotools based build system
Message-ID: <20160728231859.5d9f0a6a@free-electrons.com>
In-Reply-To: <579A737A.6090308@nod.at>
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
 <579A737A.6090308@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, 28 Jul 2016 23:04:58 +0200, Richard Weinberger wrote:

> Let's ask also package maintainers for their opinion.
> They have to (cross)build and package mtd-utils. :-)

I haven't tested David patches yet, but what I can say is that moving
to autotools is definitely a very, very wise move.
Non-standard hand-written Makefiles are really a pain.

I'll try to give it a test in terms of Buildroot packaging, and report
back.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
