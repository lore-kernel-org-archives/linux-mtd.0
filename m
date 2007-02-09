Subject: Re: [PATCH] [MTD] cs553x_nand.c: support partitions,
	cs553x_cleanup() fix (take 2)
From: David Woodhouse <dwmw2@infradead.org>
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
In-Reply-To: <20070104194114.53490a0d.indrek.kruusa@artecdesign.ee>
References: <20070104194114.53490a0d.indrek.kruusa@artecdesign.ee>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 14:14:28 +0000
Message-Id: <1171030468.29713.30.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-01-04 at 19:41 +0200, Indrek Kruusa wrote:
> @@ -186,6 +189,7 @@
>         int err = 0;
>         struct nand_chip *this;
>         struct mtd_info *new_mtd;
> +       char mtd_name[16] = "cs553x_nand_csX\0";
>  
>         printk(KERN_NOTICE "Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n", cs, mmio?"MM":"P", adr);
>  
> @@ -245,6 +249,9 @@
>                 goto out_ior;
>         }
>  
> +       mtd_name[14] = (char)(48 + cs);
> +       new_mtd->name = (char*)mtd_name;
> +
>         cs553x_mtd[cs] = new_mtd;
>         goto out;
>  
> @@ -273,12 +280,21 @@ 

Then they just end up all pointing to the same original memory. Don't
you need to allocate and strcpy?

-- 
dwmw2
