Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cmbvs-0000U0-9l
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2005 13:00:25 -0500
Received: by wproxy.gmail.com with SMTP id 36so107731wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Jan 2005 10:00:22 -0800 (PST)
Message-ID: <9f920bdf0501061000699d8d77@mail.gmail.com>
Date: Thu, 6 Jan 2005 10:00:22 -0800
From: Dan Post <postster@gmail.com>
To: Olav Kongas <ok@artecdesign.ee>
In-Reply-To: <Pine.LNX.4.44.0501061248210.5515-100000@pcx>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.44.0501061248210.5515-100000@pcx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.10, Intel chip, incorrect numparts detection
Reply-To: Dan Post <postster@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 6 Jan 2005 13:18:17 +0200 (EET), Olav Kongas <ok@artecdesign.ee> wrote:
> On 2.6.10, the detected hw partition number seems to be
> insane. All is ok on 2.6.9. I added few printk's to the
> cfi_intelext_partition_fixup() in 2.6.10 hoping that this
> will provide some more useful info (probably not).  Below I
> give the code fragment sprinkled with my printk's and both
> unsuccessful 2.6.10 and successful 2.6.9 boot dumps.

Olav,

What flash chip are you using, e.g. model, density, etc?
I see you're using a x16 buswidth, not a x32 pair.  That could be
related to the problem--e.g. one small piece of code not taking into
account the interleave--but I'm just making a wild stab in the dark,
which could be utterly wrong.  Latest MTD code works for me on L18,
32MiB (28F256L18), albeit on a 2.4 kernel (I have yet to try 2.6.10).

As you can tell, 2.6.9 uses a constant number for the partshift, which
was wrong.  On 8 and 16MiB L18, the partshift should be 20 (1MiB); on
32MiB L18, it should be 21, and it gets more complicated from there.
K3 and J3 don't have hardware partitions, so the partition fixup code
shouldn't be activated.

Later MTD code, including that in 2.6.10, actually looks at the CFI,
and in a rather nice manner (thanks Nicolas), but sounds like it has
some missing cases...

Also, on L18, numregions should be 2.  You're getting 1.

Are you, by chance, using W18?  I've never tested it there, and there
may be subtle CFI differences.

Dan
