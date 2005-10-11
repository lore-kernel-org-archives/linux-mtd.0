Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPLFD-0002mL-Nm
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2005 10:36:52 -0400
Message-ID: <434BCDF7.5080807@arcom.com>
Date: Tue, 11 Oct 2005 15:36:39 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <43216C69.2060404@arcom.com>
In-Reply-To: <43216C69.2060404@arcom.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: Re: Badness in do_exit after remounting JFFS2 read-only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:
> 
> With 2.6.13 remounting a JFFS2 filesystem read-only results in
> 
> Badness in do_exit at
> /home/dvrabel/embed/qed/linux-2.6-working/kernel/exit.c:787
> [<c001c8f8>] (dump_stack+0x0/0x14) from [<c002f9d0>] (do_exit+0x44/0xb0c)
> [<c002f98c>] (do_exit+0x0/0xb0c) from [<c00304b8>] (sys_exit+0x0/0x18)
> [<c0030498>] (complete_and_exit+0x0/0x20) from [<c00a4c30>]
> (jffs2_garbage_collect_thread+0x124/0x12c)
> [<c00a4b0c>] (jffs2_garbage_collect_thread+0x0/0x12c) from [<c002f98c>]
> (do_exit+0x0/0xb0c)
>  r6 = 00000000  r5 = 00000000  r4 = 00000000
> 
> This is the WARN_ON(atomic_read(&tsk->fs_excl)); in do_exit().

This no longer happens in (at least) 2.6.14-rc4.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
