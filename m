Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdwOh-0004rU-Vh
 for linux-mtd@lists.infradead.org; Sun, 28 Aug 2016 09:29:01 +0000
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160828091017.06fc2312@gmail.com>
 <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
 <20160828111931.6eb3a10d@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <f7733dca-068a-38f4-f715-1abb439a71bc@nod.at>
Date: Sun, 28 Aug 2016 11:28:18 +0200
MIME-Version: 1.0
In-Reply-To: <20160828111931.6eb3a10d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph,

On 28.08.2016 11:19, Ralph Sennhauser wrote:
>>> On the other hand an initramfs can carry the logic to figure out
>>> which to mount and is what I use for my self. The busybox based
>>> implementation I use adds a tad over 300Kb to the uImage, perfectly
>>> acceptable in my case.  
>>
>> When your minimal initramfs consumes 300KiB you're doing something
>> wrong. As I said in another thread, for your special purpose you'd
>> need to create a minitmal userspace for initramfs, no fancy (eg)libc,
>> just a bare minimum /init program which does the mount probing.
>> Shouldn’t be more than a few system calls.
>>
>> Thanks,
>> //richard
> 
> Well, I use busybox because I'm lazy and still get away with only 300Kb.
> And as I said there is plenty space on my device. (6M per uImage OEM
> firmware configuration)

So, problem solved. Use an initramfs. :-)

</discussion>,
//richard
