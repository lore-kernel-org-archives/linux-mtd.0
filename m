Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTWjw-0000ND-Ea
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 07:59:57 +0000
Received: by qyk6 with SMTP id 6so14610qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jul 2009 00:59:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4A66BF8D.9010902@gmail.com>
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>
	<9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
	<9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>
	<1248243590.24676.17.camel@localhost>
	<9c9fda240907220011r10d76dfya3366c170a496e19@mail.gmail.com>
	<4A66BF8D.9010902@gmail.com>
Date: Wed, 22 Jul 2009 16:59:51 +0900
Message-ID: <9c9fda240907220059r4f1fb9cet3715d5502c19ed64@mail.gmail.com>
Subject: Re: [PATCH] OneNAND: Runtime badblock check support
From: Kyungmin Park <kmpark@infradead.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 22, 2009 at 4:28 PM, Artem Bityutskiy<dedekind1@gmail.com> wrote:
> On 07/22/2009 10:11 AM, Kyungmin Park wrote:
>>
>> It don't avoid the double-scanning issue. only partial scan at
>> bootloader. In my environemt kernel has 2MiB partition and we only
>> scan this partition at load kernel command.
>> Exactly that it skip the bad block scanning except the kernel
>> partition at bootloader
>> As bootcmd load kernel, it first check that read block is bad, if not
>> read this block, next check again next block, and read next block and
>> so on.
>
> So you have a small kernel partition, you store the kernel there.
> Your boot-loader reads the kernel partition and loads the kernel
> from there. And of course the boot-loader scans the kernel partition
> for bad block. And your boot-loader does not need to scan anything
> else. I understand this part.

Right

>
> But what is next? Do you want to tell the kernel to avoid scanning the
> kernel partition because boot-loader has already scanned it? Sorry, I
> still cannot get the idea...

Kernel part is same as before. Now I just optimize the boot loader part.


>> I don't have any idea about on-flash BBT.
>
> It is standard mechanism which exists in MTD from early tglx1 times.
> MTD can keep BBT on flash, AFAIR, in the last eraseblock. Look for the
> NAND_USE_FLASH_BBT constant. And this is the way to go if you want to
> optimize BBT scanning, IMO.

Yes I know, I mean no plan to implement it now. Sorry

Thank you,
Kyungmin Park
