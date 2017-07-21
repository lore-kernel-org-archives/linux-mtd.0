Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYeV1-0002up-8Z
 for linux-mtd@lists.infradead.org; Fri, 21 Jul 2017 20:26:12 +0000
Received: by mail-pf0-x242.google.com with SMTP id a11so5520379pfj.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2017 13:25:50 -0700 (PDT)
Date: Fri, 21 Jul 2017 13:25:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH v8] mtd: create per-device and module-scope debugfs entries
Message-ID: <20170721202546.GL55942@google.com>
References: <20170516155616.26558-1-mrugiero@gmail.com>
 <20170529113841.3850-1-mrugiero@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170529113841.3850-1-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 29, 2017 at 08:38:41AM -0300, Mario J. Rugiero wrote:
> Several MTD devices are using debugfs entries created in the root.
> This commit provides the means for a standardized subtree, creating
> one "mtd" entry at root, and one entry per device inside it, named
> after the device.
> The tree is registered in add_mtd_device, and released in
> del_mtd_device.
> Devices docg3, mtdswap and nandsim were updated to use this subtree
> instead of custom ones, and their entries were prefixed with the
> drivers' names.
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> v8: - fix CONFIG_DEBUG_FS typo.
> v7: - as per derRichard and bbrezillon suggestion, dev_names are used
>       instead of 'pretty' names for the entries, and driver-specific
>       entries are prefixed with the drivers' names.
> v6: - as per bbrezillon suggestion, more cleanups were done in the drivers,
>       removing now unused structure members and functions.
>     - dropped explicit setting to NULL to the dfs_dir member for the MTD,
>       as it is expected to be zeroed out, thanks again to bbrezillon for
>       pointing this out.
>     - removed an extern declaration of a symbol which was never defined,
>       spotted by bbrezillon.
> v5: - cleanup drivers creating their own debugfs sub-tree.
>     - separate the patch again, as it makes sense on its own as cleanup.
> v4: - include in a bigger patchset which explains the use of this tree.
> v3: - move the changelog out of the commit message
> v2: - remove unused macros and add a commit message
> v1: - create the debugfs entries

Applied to l2-mtd.git
