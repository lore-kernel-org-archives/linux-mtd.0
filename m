Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQgxv-0001Vp-6H
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 17:41:15 +0000
Date: Thu, 20 Mar 2014 14:39:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: pxa3xx: Normalize ECC strength for ECC
 scheme selection
Message-ID: <20140320173922.GA1142@arch.cereza>
References: <1395071227-31909-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395071227-31909-2-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395071227-31909-2-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 17, Ezequiel Garcia wrote:
> @@ -1525,8 +1524,8 @@ KEEP_CONFIG:
>  		ecc_step = 512;
>  	}
>  
> -	ret = pxa_ecc_init(info, &chip->ecc, ecc_strength,
> -			   ecc_step, mtd->writesize);
> +	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * ecc_step) / 512,
> +			   mtd->writesize);

After a test report from Simon Guinot we found this normalization is horribly
wrong. It should be: (ecc_strength * 512) / ecc_step. I'll prepare a v2 and
make sure to test it properly this time!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
