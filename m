Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPIW7-00049x-DN
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2011 18:41:27 +0000
Message-ID: <4EBECBA2.1030606@newsguy.com>
Date: Sat, 12 Nov 2011 11:40:18 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 04/16] mtd/docg3: fix BCH registers
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-5-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1320912342-30147-5-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/10/2011 12:05 AM, Robert Jarzmik wrote:
> -#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 1))
> +#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 0))


Minor nit:  why the 0, and not just (0x1048 + idx) ?

Mike
