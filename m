Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkPTc-0006Ri-KP
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2015 04:40:18 +0000
Subject: Re: [PATCH] UBI: rename free variable
To: Al Viro <viro@ZenIV.linux.org.uk>
References: <1444361361-12219-1-git-send-email-hs@denx.de>
 <20151009041351.GZ22011@ZenIV.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <56174518.3050906@denx.de>
Date: Fri, 9 Oct 2015 06:39:52 +0200
MIME-Version: 1.0
In-Reply-To: <20151009041351.GZ22011@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Al,

Am 09.10.2015 um 06:13 schrieb Al Viro:
> On Fri, Oct 09, 2015 at 05:29:21AM +0200, Heiko Schocher wrote:
>> rename free variable into not "free", as "free" prevents
>> ubi sources compiling under U-Boot. So rename "free"
>> into "pfree" where it is a pointer, and into "freel",
>> where it is a free list.
>
> Huh?  If U-Boot has free defined as an object-like macro, it's an outright bug
> in U-Boot and it should be fixed there.  If it's something else, it looks like
> a toolchain bug.   Details, please...

Sorry, I should have added this info immediately into the patch ...

We have in U-Boot a compat.h file, in which we collect all things
we need to make linux code running under U-Boot, and there we map
kfree() to free(), see:

http://git.denx.de/?p=u-boot.git;a=blob;f=include/linux/compat.h;h=fbebf910addd994d265d21c4fbaa0a2f48f4ccb1;hb=996ec1dcc58a34b53891acde0ec5df9141b5fcc2#l58

So, if we use a var name "free", this will conflict ... and I get
for example when compiling the UBI code:

   CC      drivers/mtd/ubi/fastmap.o
drivers/mtd/ubi/fastmap.c: In function 'scan_pool':
drivers/mtd/ubi/fastmap.c:475:3: error: called object 'free' is not a function

So with this patch, we have less differences to kernel files ...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
