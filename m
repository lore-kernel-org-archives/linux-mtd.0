Received: from [2002:c053:f936::1] (helo=terminus.zytor.com)
	by pentafluge.infradead.org with esmtps (Exim 4.60 #1 (Red Hat Linux))
	id 1FP6lA-0006BD-J8
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 00:41:01 +0100
Message-ID: <442C6B78.3060706@zytor.com>
Date: Thu, 30 Mar 2006 15:36:24 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
To: joern@wohnheim.fh-wedel.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
References: <20060329232520.1677d2b3.akpm@osdl.org>	<442C0494.2040609@zytor.com>
	<20060330114014.53150d1b.akpm@osdl.org>
In-Reply-To: <20060330114014.53150d1b.akpm@osdl.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: 
Subject: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm trying to revamp the Linux kernel by moving a lot of (mainly) 
initialization code to "early userspace" -- a tiny userspace carried 
with the kernel image.  This is sometimes referred to as the "klibc" 
project.

I sent a git tree to Andrew Morton for possible integration in -mm, and 
it got rejected due to the fact that the blkmtd driver uses 
name_to_dev_t() when compiled into the kernel, which is removed in the 
klibc tree -- it is now strictly a matter of userspace policy.

I talked to Jörg Engel about this; he indicated that the blkmtd driver 
(which is the one that has this problem) is already deprecated in favour 
of block2mtd.  Hence I'm hesitant to spend a lot of time on this, 
especially in the light of the fact that keeping a 90,000-line patch up 
to date with an evolving kernel is a challenge in itself.

There seems to be a few options, in order from least work to more work:

- Removing the blkmtd driver and tell people to use block2mtd;
- Have kinit intercept blkmtd configuration options and emulate them 
using block2mtd;
- Adjust blkmtd to have a configuration interface, and then make kinit 
configure it.

I would appreciate any opinions on this.  Clearly, I'm eager at getting 
unblocked on this, but my submitting a tree to Andrew which disables a 
driver without the maintainers' OK isn't exactly going to fly :)

For what it's worth, the klibc tree is at:

git://git.kernel.org/pub/scm/linux/kernel/git/hpa/linux-2.6-klibc.git

	-=hpa
