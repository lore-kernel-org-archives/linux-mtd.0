Message-ID: <4A66BF8D.9010902@gmail.com>
Date: Wed, 22 Jul 2009 10:28:13 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] OneNAND: Runtime badblock check support
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>	
	<9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>	
	<9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>	
	<1248243590.24676.17.camel@localhost>
	<9c9fda240907220011r10d76dfya3366c170a496e19@mail.gmail.com>
In-Reply-To: <9c9fda240907220011r10d76dfya3366c170a496e19@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/22/2009 10:11 AM, Kyungmin Park wrote:
> It don't avoid the double-scanning issue. only partial scan at
> bootloader. In my environemt kernel has 2MiB partition and we only
> scan this partition at load kernel command.
> Exactly that it skip the bad block scanning except the kernel
> partition at bootloader
> As bootcmd load kernel, it first check that read block is bad, if not
> read this block, next check again next block, and read next block and
> so on.

So you have a small kernel partition, you store the kernel there.
Your boot-loader reads the kernel partition and loads the kernel
from there. And of course the boot-loader scans the kernel partition
for bad block. And your boot-loader does not need to scan anything
else. I understand this part.

But what is next? Do you want to tell the kernel to avoid scanning the
kernel partition because boot-loader has already scanned it? Sorry, I
still cannot get the idea...

> I don't have any idea about on-flash BBT.

It is standard mechanism which exists in MTD from early tglx1 times.
MTD can keep BBT on flash, AFAIR, in the last eraseblock. Look for the
NAND_USE_FLASH_BBT constant. And this is the way to go if you want to
optimize BBT scanning, IMO.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
