Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AvGj-00088H-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 15:44:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0112030726090.14716-100000@newbast.lynuxworks.com> 
References: <Pine.LNX.4.33.0112030726090.14716-100000@newbast.lynuxworks.com> 
To: Aleksander Sanochkin <asanochkin@Lnxw.COM>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS1/MTD bug-fixes 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Mon, 03 Dec 2001 15:55:01 +0000
Message-ID: <11102.1007394901@redhat.com>
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

asanochkin@Lnxw.COM said:
> 
>  1) To be consistent with cfi_cmdset_002.c which always initializes
>     eraseregions.
>  2) We have also modified JFFS1 code so as it now works for flash
>     partitions with non-uniform sectors, and our code is based on
>     the assumption that eraseregions are always initialized. 

If possible, I would prefer to keep the individual listing of erase regions
optional for the common case where it's not necessary - how difficult would
it be to make the JFFS1 code deal with that?

>  We have also added a possibility for run-time partitioning of an MTD
> device, and use this usage_counter to prevent deleting of a partition
> while it is being used by some process.

In that context, I agree that it makes sense. Have you seen Jörn Engel's
rewrite of the partitioning code, which I was intending to look at merging
in 2.5? It would be useful to make that does what you require before we
merge it.

--
dwmw2
