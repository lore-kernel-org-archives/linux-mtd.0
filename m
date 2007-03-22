From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>, "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>
References: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
	<1174555734.17249.218.camel@sauron>
Subject: RE: [PATCH/RFC] OneNAND simulator support
Date: Fri, 23 Mar 2007 08:51:55 +0900
Message-ID: <00f801c76cdd$164a9fb0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1174555734.17249.218.camel@sauron>
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

 
> On Thu, 2007-03-22 at 09:51 +0900, Kyungmin Park wrote:
> > Hi,
> > 
> > This patch simulate various OneNAND flash chips for the MTD 
> onenand layer.
> > It's simple implementation, only basic operations.
> > It don't support the recent changes in NANDSIM such as lazy 
> block allocation,
> > bitflip, and so on.
> > 
> > Any comments are welcome.
> 
> Did you run our nand-tests to make sure it is OK?
> 

oobtest => passed (with revert patch, see below)
pagetest=> passed
subpagetest=> failed

At this time. it doesn't support subpage. I will check it.

To Adrian,

After patch http://git.infradead.org/?p=mtd-
2.6.git;a=commitdiff;h=5bc399e9ef430efd5725b66aa2ad7ad2d81e372b;hp=81280d5879761
f90b3a341d52371d03998730d8e

--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -854,7 +854,8 @@ static int onenand_transfer_auto_oob(str
 			int n = ed - st;
 			memcpy(buf, oob_buf + st, n);
 			buf += n;
-		}
+		} else
+			break;
 	}
 	return 0;
 }
@@ -1295,7 +1296,8 @@ static int onenand_fill_auto_oob(struct 
 			int n = ed - st;
 			memcpy(oob_buf + st, buf, n);
 			buf += n;
-		}
+		} else
+			break;
 	}
 	return 0;
 }

It don't pass the oobtest since I assume oob passed at first, but oobtest don't
do that.
Basically I optimizeed it for JFFS2. 
Do I revert it or do nothing? please give your opinion.

Thank you,
Kyungmin Park

[   11.687500] i = 0, offset = 2, readend = 32, free_end = 5, readcol = 14
[   11.695312] oobtest: error: verify failed at 0x00006c00
[   11.695312] i = 0, offset = 2, readend = 31, free_end = 5, readcol = 14
[   11.703125] oobtest: error: verify failed at 0x00007000
[   11.710937] i = 0, offset = 2, readend = 30, free_end = 5, readcol = 14
[   11.718750] oobtest: error: verify failed at 0x00007400
[   11.726562] i = 0, offset = 2, readend = 20, free_end = 5, readcol = 14
[   11.734375] oobtest: error: verify failed at 0x00007800
[   11.734375] i = 0, offset = 2, readend = 19, free_end = 5, readcol = 14
[   11.742187] oobtest: error: verify failed at 0x00007c00
[   11.750000] i = 0, offset = 2, readend = 18, free_end = 5, readcol = 14
[   11.757812] oobtest: error: verify failed at 0x00008000
