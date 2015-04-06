Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YevLA-0006kN-TN
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 00:56:37 +0000
Received: by pddn5 with SMTP id n5so28273657pdd.2
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 17:56:14 -0700 (PDT)
Date: Sun, 5 Apr 2015 17:56:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH v5 0/3]  Improve MTD dynamic partitioning support
Message-ID: <20150406005609.GF2677@norris-Latitude-E6410>
References: <1428012912-17551-1-git-send-email-dehrenberg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428012912-17551-1-git-send-email-dehrenberg@chromium.org>
Cc: Richard Weinberger <richard@nod.at>, gwendal@chromium.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 02, 2015 at 03:15:09PM -0700, Dan Ehrenberg wrote:
> The goal of this patchset is to make mtd dynamic partitioning work
> better.
> - First, a new config option is added to allow the master device to
>   coexist with partitions, which allows partitions to be created or
>   removed based on the master even if other partitions exist.
> - Second, to identify partitions and improve visibility, 
> - Third, remove overlap checks for partitions, which had a bug
>   in them and don't seem necessary since static partitions don't
>   have overlap checks.
> 
> This patchset has gone through a few iterations.
> 
> v1 is based on a different concept, where a separate partition is
> used as a master, and partitioning is simply made more flexible.
> 
> v2 switched to the model of the master coexisting with the partitions.
> 
> v3 brings back the patch to remove overlap checks, as testing
> discovered that the overlap checks were buggy. This version
> also makes some style improvements.
> 
> v4 fixes some style issues in the sysfs patch and adds documentation.
> 
> v5 cleans up some unused code in the third patch.

Pushed all to l2-mtd.git. Thanks!

Brian
