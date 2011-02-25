Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pswxr-0003hv-NH
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 12:40:09 +0000
Received: by wyf23 with SMTP id 23so1604934wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 04:40:06 -0800 (PST)
Subject: Re: Slab memory leak in JFFS2 filesystems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johns Daniel <johns.daniel@gmail.com>
In-Reply-To: <AANLkTimN5eBifpcyfJYo9s51U+kEi1ZemFnOm7p2rcxQ@mail.gmail.com>
References: <AANLkTimN5eBifpcyfJYo9s51U+kEi1ZemFnOm7p2rcxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 14:38:44 +0200
Message-ID: <1298637524.2798.103.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-24 at 18:41 -0600, Johns Daniel wrote:
> I have discovered a kernel memory leak associated with JFFS2
> filesystems. I have verified the leak in kernels 2.6.28 and 2.6.36 on
> a Freescale PowerPC board using this script:
> 
> while :; do FN=$(mktemp /jffs2fs/TMP.XXXXXXXX); \
>    cat /proc/slabinfo |grep "dentry\|size-64 "; sleep 1; /bin/rm $FN; done

Please, check whether they go away after:

echo 3 > /proc/sys/vm/drop_caches

See Documentation/sysctl/vm.txt for more information about what this
means.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
