Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rcbuq-00025L-RX
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 12:02:01 +0000
Received: by wera10 with SMTP id a10so1619239wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2011 04:01:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324292192.32675.6.camel@sauron.fi.intel.com>
References: <1324208821.17534.0.camel@sauron.fi.intel.com>
 <1324290964-14096-1-git-send-email-jonas.gorski@gmail.com>
 <1324292192.32675.6.camel@sauron.fi.intel.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 19 Dec 2011 13:01:37 +0100
Message-ID: <CAOiHx=kV8ovXQc2TTdxigMuVbSwj3GwsGs8K+vxMd_VepD3hSg@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM
 partitions are at least 64K
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 December 2011 11:56, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2011-12-19 at 11:36 +0100, Jonas Gorski wrote:
>> The CFE boot loader on BCM63XX platforms assumes itself and the NVRAM
>> partition to be 64 KiB (or erase block sized, if larger).
>> Ensure this assumption is also met when creating the partitions to
>> prevent accidential erasure of CFE or NVRAM.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>
> If someone creates a partition smaller than 64 KiB, then why it is
> better to silently make it 64 KiB (and thus doing not what the user
> asked to do and possibly confusing him), rather than returning an error
> or just printing a warning?

This adjustment to 64 KiB is only done for the CFE and NVRAM
partitions, not for the rootfs or kernel partitions. The CFE and NVRAM
lengths/offsets are defined in the CFE boot loader at build time and
fixed, so to change them you would need to build and flash your own
CFE (and the sources are not public, so you also need to be a Broadcom
customer). I have yet to see a device where this was done, so this is
currently just a theoretical possibility.

Also you can't create/modify partitions arbitrarily as there is no
partition table, just a fixed image header format (which the CFE
parses on boot). So the only two partitions changeable from the
outside are the kernel and rootfs partitions, which are defined in the
image tag, which always resides at the beginning of the first erase
block after the CFE. Changing the CFE length would result in a changed
offset of the image tag, leading to a "wrong" image tag being read (or
in case after patch 5, a warning that the image tag is likely corrupt,
and no rootfs/kernel partitions created).

Of course everything is done under the assumption the boot loader is
CFE (there are a few devices with RedBoot out there), but the parser
already bails out if no CFE is detected.

Hope that clears things up.

Jonas
