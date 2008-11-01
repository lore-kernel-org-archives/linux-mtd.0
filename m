Received: from out01.mta.xmission.com ([166.70.13.231])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwEkp-0001LM-OM
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 11:34:56 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
	<1225524813.16774.140.camel@macbook.infradead.org>
	<m1skqbhmh2.fsf@frodo.ebiederm.org>
	<1225529384.16774.162.camel@macbook.infradead.org>
	<m1d4hfhhim.fsf@frodo.ebiederm.org>
	<m163n7hh8i.fsf_-_@frodo.ebiederm.org>
	<1225536182.16774.166.camel@macbook.infradead.org>
	<1225537139.16774.168.camel@macbook.infradead.org>
Date: Sat, 01 Nov 2008 04:26:50 -0700
In-Reply-To: <1225537139.16774.168.camel@macbook.infradead.org> (David
	Woodhouse's message of "Sat, 01 Nov 2008 10:58:59 +0000")
Message-ID: <m14p2rg005.fsf@frodo.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH 1/2] mtd: Fix cfi_send_gen_cmd the handling of x16 devices
	in x8 mode
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

> On Sat, 2008-11-01 at 10:43 +0000, David Woodhouse wrote:
>> I think this one is still broken by your patch -- it's the exception to
>> your observation that we only ever use addresses ending in 00, 55 or aa.
>
> No, I misunderstood how that works -- your patch is fine. Although I
> think I'll split patch 1/2 into cleanup vs. the actual fix, too.

Sounds good.   The (cmd_ofs & 0xff) == 0xaa might be less prone to false
positives.  Or perhaps it just doesn't make sense for the id reads in jedec_probe.
Sounds like you have a handle on it though.

Eric
