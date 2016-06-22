Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFicP-0002uZ-8W
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 13:55:03 +0000
Subject: Re: [RFC] Raising the UBI version
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57699356.4030802@nod.at> <20160622144344.07ba4d41@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Alexander Kaplan
 <alex@nextthing.co>, Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576A989A.6080502@nod.at>
Date: Wed, 22 Jun 2016 15:54:34 +0200
MIME-Version: 1.0
In-Reply-To: <20160622144344.07ba4d41@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.06.2016 um 14:43 schrieb Boris Brezillon:
> Why do we need to hardcode /sys/class/ubi/version to 1? We just need to
> update the mtd-utils to support version 2. Am I missing something?

We don't want to break existing userspace.
Why should ubimkvol or ubiattach fail on a system with SLC NAND and
CONFIG_MTD_UBI_CONSOLIDATE=y?

Especially since existing tools *will* work with CONFIG_MTD_UBI_CONSOLIDATE=y.
Rasing /sys/class/ubi/version and breaking existing tools is only acceptable
when we change all UBI ioctl() and sysfs files in a way such that version 1
userspace cannot work. Which is not the case here.

This is a nice example why version numbers is bad and feature flags should be used.
Currently UBI mixes the implementation version and the on-flash version.
We're changing only the on-flash version. The user visible ABI stays and will only
get extended.

Thanks,
//richard
