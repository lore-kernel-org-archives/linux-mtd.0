Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHha4-0001mD-L9
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 22:31:29 +0000
Received: by mail-pb0-f47.google.com with SMTP id rp16so5678390pbb.20
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 14:31:07 -0800 (PST)
Date: Sun, 23 Feb 2014 14:31:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2] mtd/ts5500: Add dependency
Message-ID: <20140223223100.GB16834@norris-Latitude-E6410>
References: <20140223103201.73f63642@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140223103201.73f63642@endymion.delvare>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 23, 2014 at 10:32:01AM +0100, Jean Delvare wrote:
> There is no point in displaying the TS5500-specific driver entries if
> TS5500 board support itself isn't enabled.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
> Changes in v2:
>  * Drop the dependency on X86, as suggested by Brian Norris.

Pushed to l2-mtd.git. Thanks!

Brian
