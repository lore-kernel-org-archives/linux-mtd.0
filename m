Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ks8jc-000316-Uo
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 04:20:45 +0000
From: David Brownell <david-b@pacbell.net>
To: Chen Gong <g.chen@freescale.com>
Subject: Re: [PATCH] [MTD] m25p80.c erase enhance (v2)
Date: Mon, 20 Oct 2008 21:20:40 -0700
References: <1224558909-4254-1-git-send-email-g.chen@freescale.com>
In-Reply-To: <1224558909-4254-1-git-send-email-g.chen@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200810202120.41193.david-b@pacbell.net>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Chen Gong <clumsycg@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 20 October 2008, Chen Gong wrote:
> -#define        OPCODE_BE               0xc7    /* Erase whole flash block */
> +#define        OPCODE_CHIP_ERASE       0xc7    /* Erase whole flash block */

Looks good to me, except that comment should be "Erase whole flash chip".  :)

Thanks.

- Dave
