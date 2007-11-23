Received: from smtp-2.sys.kth.se ([130.237.32.160])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvhWJ-0007pB-4P
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 18:01:17 -0500
Message-ID: <61172.212.247.11.1.1195857363.squirrel@webmail.sys.kth.se>
In-Reply-To: <214802.55189.qm@web59211.mail.re1.yahoo.com>
References: <214802.55189.qm@web59211.mail.re1.yahoo.com>
Date: Fri, 23 Nov 2007 23:36:03 +0100 (CET)
Subject: Re: Very slow nor flash write
From: Anders =?iso-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>
To: "tike64" <tike64@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: jamie@shareable.org, nico@cam.org, linux-mtd@lists.infradead.org,
	akorolev@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tike64 wrote:
> Of course the code must always allow for possible timeouts.But wouldn't the
> cfi_cmdset_0001.c code take care of that:
>
>         if (!timeo) {
>             map_write(map, CMD(0x70), cmd_adr);
>             chip->state = FL_STATUS;
>             return -ETIME;

This is where the state is lost. chip->state is changed to FL_STATUS
but the hardware remains in FL_ERASING or FL_WRITING state until it
completes the operation or times out after the max erase or write time.

What then happens is get_chip() timing out saying
"Waiting for chip to be ready timed out. Status xxxx"
and jffs2 complaining about not being able to read or write.
But this is probably only an issue for erase operations.

For me this resulted in failure to read the file system at boot time
and thus a system that could not be booted.

I guess there is something wrong with the timeout error path.
Should chip->state be left unchanged?

> I think I understand the principle of the patch and it seems fine to me. But
> it seems to solve the problem only for the CFI parts. I think there should be
> respective timing fields in the jedec_table in jedec_probe.c.

Yes, it only solves it for parts that have timing values specified. There is
more to do. Quick version could be to set the timeouts to the old defaults and
the write and erase time to short values.
