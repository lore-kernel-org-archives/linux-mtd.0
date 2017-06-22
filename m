Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO9Ib-00029k-Ta
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 21:05:59 +0000
Received: by mail-pg0-x22b.google.com with SMTP id u62so12706858pgb.3
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 14:05:37 -0700 (PDT)
Date: Thu, 22 Jun 2017 14:05:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting
 all master's partitions
Message-ID: <20170622210533.GD14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
 <20170621062647.6072-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170621062647.6072-3-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 21, 2017 at 08:26:43AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> When support for sysfs "offset" file was added it missed to update the
> del_mtd_partitions function. It deletes partitions just like
> mtd_del_partition does so both should also take care of removing sysfs
> files.
> 
> This change moves sysfs_remove_files call to the shared function to fix
> this issue.
> 
> Fixes: a62c24d755291 ("mtd: part: Add sysfs variable for offset of partition")
> Cc: Dan Ehrenberg <dehrenberg@chromium.org>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V7: Introduction of this patch, it was separated from the 1/6. It should
>     be clear now that this change is introduced. If something goes wrong
>     it should also be easier to revert it this way.

Thanks, splitting this out is nice actually. And thanks for looking up
the background on this oversight.

I'm not really sure what the actual effect of that omission would be;
the file won't be left dangling in sysfs (the device is removed
entirely), but I'm not sure if that'd trigger some kind of internal
kobject memory leak.

Anyway, looks good to me.

Side note: this patch series sort of massages the definition of this
"offset" file. Now, IIUC, subpartitions will have an "offset" file
relative to their parent partition, not the master flash device. I'm not
sure which way is expected.

Brian
