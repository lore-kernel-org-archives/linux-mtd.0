Received: from lechat.rtp-net.org ([88.191.19.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZkAG-0005qm-5K
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 09:55:56 +0000
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
To: =?utf-8?Q?J=C3=B6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] Fix oops on reboot in physmap
References: <87fxuv816l.fsf@lechat.rtp-net.org>
	<20080313082224.GA2187@logfs.org>
Date: Thu, 13 Mar 2008 11:10:37 +0100
In-Reply-To: <20080313082224.GA2187@logfs.org> (=?utf-8?Q?=22J=C3=B6rn?=
	Engel"'s message of "Thu\, 13 Mar 2008 09\:22\:24 +0100")
Message-ID: <87fxuv2aua.fsf@lechat.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel <joern@logfs.org> writes:

Hi,

> On Thu, 13 March 2008 09:42:42 +0100, Arnaud Patard wrote:
>> 
>> I sent this patch to David Woodhouse, but I forgot to put the list in
>> CC: (and I'm not even sure that I used the right email address :( ). So,
>> I'm sending the patch here so everyone can have my fix.
>
> There were various small errors in it, afaics.  Does this patch achieve
> the same result for you?

>From what I can see, this patch is fine. I can't test it now but will do asap.

>
> Added dwmw2 on Cc:.  This could be material for -stable.

-stable ? why ? iirc, the faulty commit has been merged for
25-rc..something so 2.6.24 is not affected. Are you talking about 2.6.25?

Arnaud
