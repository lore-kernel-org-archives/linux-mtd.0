Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMO27-00049n-MY
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 06:59:40 -0400
Date: Mon, 3 Oct 2005 12:58:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20051003105857.GC4639@wohnheim.fh-wedel.de>
References: <BAY17-F294C924184D625D98CF65FE88C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F294C924184D625D98CF65FE88C0@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase count tracking in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 15:15:30 +0800, zhao forrest wrote:
> 
> Here I port my original patch to make it adapt
> to eraseblock header.
> Since EBH has include erase count, part of erase count
> tracking work has been done in EBH patch.
> The main functionality of this patch is to record
> max_erase_count, and assign the average erase_count
> to blocks, which has no EBH previously.
> 
> The patch is at:
> http://www.infradead.org/~forrest/ect.patch

BTW, having the patch either inlined or attached to the mail would
make life easier for me.  Downloading, including and quoting are all
manual steps.

And since you have patches that depend on each other, a patch series
would be even nicer.  The usual thing with
[PATCH 0/2] description of patchset
[PATCH 1/2] introduce infrastructure
[PATCH 2/2] actually use infrastructure

or something similar.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
