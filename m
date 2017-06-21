Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNUMS-0001FY-GM
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 01:23:15 +0000
Received: by mail-pg0-x232.google.com with SMTP id f185so70211572pgc.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 18:22:52 -0700 (PDT)
Date: Tue, 20 Jun 2017 18:22:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V6 2/5] mtd: partitions: rename "master" to the "parent"
 where appropriate
Message-ID: <20170621012247.GC14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170526131415.27186-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170526131415.27186-3-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 26, 2017 at 03:14:12PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This prepares mtd subsystem for the new feature: subpartitions. In some
> cases flash device partition can be a container with extra subpartitions
> (volumes).
> 
> So far there was a flat structure implemented. One master (flash device)
> could be partitioned into few partitions. Every partition got its master
> and it was enough to get things running.
> 
> To support subpartitions we need to store pointer to the parent for each
> partition. This is required to implement more natural tree structure and
> handle all recursion and offsets calculation.
> 
> To make code consistent this patch renamed "master" to the "parent" in
> places where we can be dealing with subpartitions.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V5: Introduction of this patch to prepare allocate_partition for further
>     modification.
> V6: Rename "master" in more places including callback functions

This patch has some conflicts with l2-mtd.git now. I might end up
working them out, but it'd be easier if you'd rebase.
