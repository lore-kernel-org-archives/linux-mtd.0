From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Artem Bityutskiy'" <dedekind@infradead.org>,
	<linux-mtd@lists.infradead.org>
References: <20070202164729.11475.8623.sendpatchset@localhost.localdomain>
Subject: RE: [PATCH] [JFFS2] use MTD_OOB_AUTO
Date: Mon, 5 Feb 2007 16:14:48 +0900
Message-ID: <003b01c748f5$55ae1d50$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <20070202164729.11475.8623.sendpatchset@localhost.localdomain>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

To David Woodhouse

Before commit this patch, please first merge the OneNAND tree. Since
current mtd tree don't have MTD_OOB_AUTO support in OneNAND.
I think It's right merge sequence.

> May you please try it on NAND and confirm it is OK?

Sorry, I don't have NAND chip.

> +
> +/* For historical reasons we use only 12 bytes for OOB clean 
> marker */ 
> +#define OOB_CM_SIZE 12
> +
> +const static struct jffs2_unknown_node oob_cleanmarker = {
> +	.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK),
> +	.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
> +	.totlen = cpu_to_je32(8)
> +};
>  

const static => static const

Thank you,
Kyungmin Park
