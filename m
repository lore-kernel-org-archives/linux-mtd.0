Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSEhg-0001K9-1o
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 23:22:37 +0000
Date: Fri, 4 Oct 2013 18:02:58 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Subject: Re: [PATCH] mtd: phram: Make phram 64-bit compatible
Message-ID: <20131004220258.GA26731@logfs.org>
References: <524C4CF5.7060601@nsn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <524C4CF5.7060601@nsn.com>
Cc: Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 October 2013 18:42:29 +0200, Alexander Sverdlin wrote:
> 
> mtd: phram: Make phram 64-bit compatible
> 
> phram was 32-bit limited by design. Machines are growing up, but phram
> module is still useful. Update it. The patch is bigger than minimum,
> because simple_strtoul() is obsolete.
> 
> Tested on MIPS64 and compile-tested for PPC (32 bit).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Reviewed-by: Joern Engel <joern@logfs.org>

I quite like it.

Jörn

--
Antivirus is homeopathy for computers: This software was in contact with
malware in the past, so it’ll recognize other malware in the future.
$79
-- thegrugq
