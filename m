Received: from linux2003-temp-17.226.gwc.org.uk ([212.240.17.226]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19id7E-0008Ko-UE
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2003 17:50:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Philippe <philippe@accuitee.com>
In-Reply-To: <000001c35846$4ebe3870$6401a8c0@jennifer>
References: <000001c35846$4ebe3870$6401a8c0@jennifer>
Message-Id: <1059756533.21873.5.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 01 Aug 2003 17:48:56 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: RE : DiskOnChip 2000 and CVS Drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-01 at 17:02, Philippe wrote:
> I checked it today, as you told me I merged the FAKE_PART_CODE.
> Everything seems OK (no compilation troubles etc...)

OK.

> I'll test it next week. If Everything works as expected, i'll send a
> diff against [kernel 2.4.20 + cvs / mtd patch]

OK, thanks. I probably won't merge it as-is, but it will be useful for
others in the meantime.
> a) when I turned off the machine -- when I launch the shutdown (via the
> app), I do "sync", "umount" and then shutdown -h now -- Nothing was
> saved on the DOC 

Hmmm. That sounds like a problem with the NFTL code. Were there any
error messages at the time this happened?

> b) the sync process is very long (about 30sec)

Some of that could possibly be avoided. See if it still happens with the
current CVS code.

-- 
dwmw2
