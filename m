Received: from mga11.intel.com ([192.55.52.93])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5u39-0005PG-W7
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 07:15:41 +0000
Message-ID: <1331277476.22872.2.camel@sauron.fi.intel.com>
Subject: Re: [patch] Add encryption key parameter to compress/decompress
 functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 09 Mar 2012 09:17:56 +0200
In-Reply-To: <alpine.DEB.2.00.1202231628360.13720@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1329152067.22240.214.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1202231558400.13720@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202231628360.13720@eristoteles.iwoars.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-02-23 at 16:29 +0100, Joel Reardon wrote:
> This patch extends to interface for compression and decompression of data 
> nodes to take a cryptographic key
> as a parameter. If it is set to NULL, then the current behaviour persists. 
> If it is non-null, then it is taken
> as a pointer to an array of length UBIFSEC_KEYSIZE (=16 bytes) which 
> contains the key to use to encrypt
> the data node. Each data node should be encrypted with a separate key as 
> it uses the same initialization vector  (of 0).

This patch is also wrapped... Would you consider using git - commit your
patches, then git format-patch, then git send-email them - git tools
will take everything right. Use --dry-run with git send-email first to
check everything is right.

-- 
Best Regards,
Artem Bityutskiy
