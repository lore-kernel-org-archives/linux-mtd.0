Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZfNK-0005EL-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:21:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:21:51 +0100
Message-ID: <14572.1028067711@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Allen.Curtis@Thales-IFS.com said:
> While testing power-fail operation of JFFS2, I can consistently
> produce this error which occurs when the partition is mounted.

> jffs2_scan_eraseblock() - Node at 0xXXXXXX {0x1985, 0xe002,
> 0x1985c002) has invalid CRC)

> I do not remember if the error is always CRC related and the Node
> location changes but the hex values displayed within the parens is
> consistent.

> Has anyone seen this before? Some concerns are: 1. Once the error
> occurs, it never gets fixed. 2. There does not appear to be a utility
> to fix errors.

> We are using MVista 2.1, which is 2.4.17. I was able to produce this
> error with only 13 power-cycles. 

It's harmless. We were in the middle of writing that node when we lost
power, and hadn't finished writing the payload -- hence the CRC fails.
That's sort of what the CRC is there for. No data were lost -- either we
were garbage-collecting and the original copy of the data will still be on
the flash, or it was a write of new data which never made it to flash
because the write() call never returned -- just as if you pulled the plug a
moment sooner. 

It's actually possible to avoid the cosmetic annoyance by marking the node 
as obsolete, so we don't check the CRC and hence don't bitch about it 
failing. Older versions of JFFS2 did that, as does the current version in 
2.4.19-rc3. But it's harmless and expected behaviour.


--
dwmw2
