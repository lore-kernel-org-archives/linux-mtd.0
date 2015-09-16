Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcCpJ-00088f-PI
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 13:32:47 +0000
Subject: Re: [RFC PATCH 00/27] Introduce ubifs_dump in ubifs-utils
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 computersforpeace@gmail.com
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55F96F61.8040201@nod.at>
Date: Wed, 16 Sep 2015 15:32:17 +0200
MIME-Version: 1.0
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yang,

Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
> Hi Atem, Richard and Brian,
> 	This patchset introduce a userspace tool named ubifs_dump
> to dump data from a ubi media.
> 	It will dump the areas in ubifs, such as super block,
> master, log, lpt and main.
> 	That's helpful for us to see what exactly written in
> media.
> 	the [1/patch] is a RESEND patch, it restructures the mtd-utils.
> Please Brian help to take a look at it. thanx a lot. :)
> 
> NOTE:
> 	This patch set depends on a patch I sent out [ubifs: correct the size of nnode in memset]
> But you can get a full code at:
> https://github.com/yangdongsheng/mtd-utils.git ubifs_dump_v1

I'm looking/testing right now your patches.
Your tools is useful. I like the idea, maybe the can change the name to
"ubifs_dump_meta"? Do you have plans to extend it?

I'm asking because I've started working on an ubifs.fsck/debugfs tool based on
some scripts and hacky other tools I wrote some time ago.
So, let's coordinate and avoid double work.

It's first feature is being able to extract all files from an UBIFS.
Scanning and identifying all UBIFS nodes, as your tool does, is a subset
of the needed functionality. As you sent patches first I'll happily rebase
my tool to your patches. One of the major differences is that it will work without the UBI/UBIFS kernel
modules. You can use /dev/ubiXY or a plain nanddump.
I hope I can release the first version soon.

Thanks,
//richard
