Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3VYa-0000XC-VR
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 16:42:13 +0000
Message-ID: <4F50F862.5030305@flatfrog.com>
Date: Fri, 2 Mar 2012 17:42:10 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Spurious ECC errors with mtd_subpagetest (OMAP3, NAND)
References: <4F50F2AB.10209@flatfrog.com>
In-Reply-To: <4F50F2AB.10209@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/02/2012 05:17 PM, Orjan Friberg wrote:
> Hi,
>
> When running the mtd_subpagetest I'm seeing more or less spurious ECC
> corrections.  I.e., one round may show 4 corrections and the next will
> show 7, only some of which are the same as the previous 4.

FWIW

* I'm seeing the same behaviour (i.e. transient ECC errors) when doing 
nanddump on a partition.
* mtd_oobtest fails on "verify failed at <varying address>", and "read 
past end of device".


-- 
Orjan Friberg
FlatFrog Laboratories AB
