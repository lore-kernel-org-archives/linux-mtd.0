Received: from out02.mta.xmission.com ([166.70.13.232])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwDf6-0004P8-Fm
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 10:24:56 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
	<1225524813.16774.140.camel@macbook.infradead.org>
	<m1skqbhmh2.fsf@frodo.ebiederm.org>
	<1225529384.16774.162.camel@macbook.infradead.org>
Date: Sat, 01 Nov 2008 03:23:13 -0700
In-Reply-To: <1225529384.16774.162.camel@macbook.infradead.org> (David
	Woodhouse's message of "Sat, 01 Nov 2008 08:49:44 +0000")
Message-ID: <m1d4hfhhim.fsf@frodo.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: ST M29W320D incorrectly configured
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	Corinna Schultz <cschultz@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Sat, 2008-11-01 at 01:36 -0700, Eric W. Biederman wrote:
>> Likewise the addresses in jedec_probe whose word address ends
>> in the bits 10 also need their low bit set.
>
> Some of these places in jedec_probe.c use cfi_build_cmd_addr() directly,
> and this version of the patch puts the low-bit-mangling into
> cfi_gen_send_cmd() so those bits miss out...

Sorry.  It's late and was tired.   One more try.
This time as a patch series.

The first patch is the bug fix.  The second patch kills
the unnecessary arguments to cfi_send_gen_cmd, making the
code that uses it more readable.

Eric
