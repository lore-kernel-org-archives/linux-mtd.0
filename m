Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTaPn-0001Gz-2k
 for linux-mtd@lists.infradead.org; Mon, 15 Sep 2014 17:50:18 +0000
Received: by mail-pa0-f47.google.com with SMTP id ey11so6923380pad.6
 for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2014 10:49:53 -0700 (PDT)
Date: Mon, 15 Sep 2014 10:49:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Subject: Re: [PATCH] libmtd: fix mtd_dev_present return value on legacy systems
Message-ID: <20140915174949.GC14832@ld-irv-0074>
References: <1410361000-4821-1-git-send-email-guido@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1410361000-4821-1-git-send-email-guido@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 10, 2014 at 11:56:40AM -0300, Guido Martínez wrote:
> On legacy systems, if "/proc/mtd" doesn't exist or gives a read error,
> mtd_dev_present returns -1 (since it calls legacy_dev_present), contrary
> to what's specified in the header file.
> 
> This causes checks like
> 
>   if (mtd_dev_present(n)) {
>     ...
>   }
> 
> to give false positives. Fix this by comparing the return value to 1.
> 
> Signed-off-by: Guido Martínez <guido@vanguardiasur.com.ar>

Pushed to mtd-utils.git. Thanks!

Brian
