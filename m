Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjNms-0006St-Fg
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2013 05:58:35 +0000
Message-ID: <1370239282.21714.21.camel@sauron.fi.intel.com>
Subject: Re: UBIFS failure & stable page writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Mon, 03 Jun 2013 09:01:22 +0300
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-05-31 at 11:51 +0200, Prins Anton (ST-CO/ENG1.1) wrote:
> Hi Artem,
> 
> Some questions regarding this issue:
> - The orphan area is fixed size, in the implementation we unlink/delete a file 4 times a second... could there be any relation?
>   (How can we calculate the required orphan area size in LEBs?)

No, we stress-tested it with a lot more frequent deletions. I cannot
answer about size calculation off the top of my head, I'd need to read
the code and try calculating. But I guess it is easier to find this out
by writing a small test program which will create create/open/unlink
files until it fails. And you can experiment with amount of orphan LEBs
ans find all the numbers. You can also share them with us :-)

> - Initial the three file systems are programmed if 'flat-image' (ubinized and free space fix-up) from U-boot; can there be an issue?

There were several free space fix-up bug-fixes recently.

I wonder if you have these patches:

0c6c7fa1313fcb69cae35e34168d2e83b8da854a
fe96efc1a3c049f0a1bcd9b65e0faeb751ce5ec6

They prevent from unpleasant bugs in flashers - when you flash a new
image to a flash which alsready contains some UBI stuff, and flasher
does not erase some eraseblocks, the old contents may be treated as part
of the new image, causing really random and subtle problems.

>   (Every ubi-filesystem has its own MTD, so I guess partition separation is guaranteed by the MTD-layer).

Should be.

> - How can I find the orphan LEB(s), to send you some 'contents'?

The LEB numbers range is:

[c->orph_first, c->orph_last]

So all LEBs from c->orph_first to c->orph_last are orphan LEBs.

You can inject printk and print the numbers.

Then you can read the corresponding LEBs directly from /dev/ubiX_Y using
dd. You'll just need to calculate offsets. Offset is LEB number * LEB
size.

-- 
Best Regards,
Artem Bityutskiy
