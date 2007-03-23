From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>
References: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
	<1174555734.17249.218.camel@sauron>
	<00f801c76cdd$164a9fb0$c7a3580a@swcenter.sec.samsung.co.kr>
Subject: RE: [PATCH/RFC] OneNAND simulator support
Date: Fri, 23 Mar 2007 09:14:31 +0900
Message-ID: <00f901c76ce0$3cd75e90$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <00f801c76cdd$164a9fb0$c7a3580a@swcenter.sec.samsung.co.kr>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > On Thu, 2007-03-22 at 09:51 +0900, Kyungmin Park wrote:
> > > Hi,
> > > 
> > > This patch simulate various OneNAND flash chips for the MTD 
> > onenand layer.
> > > It's simple implementation, only basic operations.
> > > It don't support the recent changes in NANDSIM such as lazy 
> > block allocation,
> > > bitflip, and so on.
> > > 
> > > Any comments are welcome.
> > 
> > Did you run our nand-tests to make sure it is OK?
> > 
> 
> oobtest => passed (with revert patch, see below)
> pagetest=> passed
> subpagetest=> failed
> 
> At this time. it doesn't support subpage. I will check it.

subpagetest => passed

with small changes it can pass the subpagetest.

Before

+	case ONENAND_CMD_PROG:
+		src = ONENAND_MAIN_AREA(this, main_offset);
+		dest = ONENAND_CORE(flash) + offset;
+		if (memcmp(dest, ffchars, info->mtd.writesize) &&
+		    onenand_check_overwrite(dest, src, info->mtd.writesize))
+			printk(KERN_ERR "over-write happend at 0x%08x\n",
+			       offset);
+		memcpy(dest, src, info->mtd.writesize);
+		/* Fall through */

After

        case ONENAND_CMD_PROG:
                src = ONENAND_MAIN_AREA(this, main_offset);
                dest = ONENAND_CORE(flash) + offset;
                /* To handle partial write */
                for (i = 0; i < (1 << info->mtd.subpage_sft); i++) {
                        int off = i * this->subpagesize;
                        if (!memcmp(src + off, ffchars, this->subpagesize))
                                continue;
                        if (memcmp(dest + off, ffchars, this->subpagesize) &&
                            onenand_check_overwrite(dest + off, src + off, this-
>subpagesize))
                                printk(KERN_ERR "over-write happend at
0x%08x\n", offset);
                        memcpy(dest + off, src + off, this->subpagesize);
                }
                /* Fall through */

Thank you,
Kyungmin Park
