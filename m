Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1InPI4-0008Vn-WE
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 21:56:20 -0400
Received: by py-out-1112.google.com with SMTP id a25so655460pyi
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Oct 2007 18:56:11 -0700 (PDT)
Date: Wed, 31 Oct 2007 20:56:02 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
Subject: Re: UBI Used In Commercial Products ??
Message-ID: <20071031205602.00539205@vader.jdub.homelinux.org>
In-Reply-To: <loom.20071031T224633-341@post.gmane.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
	<loom.20071031T215155-403@post.gmane.org>
	<B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
	<loom.20071031T224633-341@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 Oct 2007 23:01:07 +0000 (UTC)
Sergei Sharonov <sergei.sharonov@halliburton.com> wrote:

> Hi,
> > JFFS2 has been modified to sit on top of UBI.
> 
> Yes, I know. Is that better then JFFS2 on top of mtdblock device?

It depends.  If you have multiple partitions then yes, UBI is better.
It will wear-level across the entire root MTD device, whereas JFFS2 on
top of a partition will only wear-level within that partition.  UBI
also allows you to run other filesystems in different volumes, or have
static volumes.

If you have just a single JFFS2 filesystem that spans the whole flash
chip anyway, then maybe not.

josh
