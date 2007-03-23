Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUegj-0005Xu-G2
	for linux-mtd@lists.infradead.org; Fri, 23 Mar 2007 03:59:56 -0400
Message-ID: <46038887.6040301@nokia.com>
Date: Fri, 23 Mar 2007 09:57:59 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kmpark@infradead.org
Subject: Re: [PATCH/RFC] OneNAND simulator support
References: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
	<1174555734.17249.218.camel@sauron>
	<00f801c76cdd$164a9fb0$c7a3580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <00f801c76cdd$164a9fb0$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=ks_c_5601-1987; format=flowed
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

ext Kyungmin Park wrote:
> To Adrian,
> 
> After patch http://git.infradead.org/?p=mtd-
> 2.6.git;a=commitdiff;h=5bc399e9ef430efd5725b66aa2ad7ad2d81e372b;hp=81280d5879761
> f90b3a341d52371d03998730d8e
> 
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -854,7 +854,8 @@ static int onenand_transfer_auto_oob(str
>  			int n = ed - st;
>  			memcpy(buf, oob_buf + st, n);
>  			buf += n;
> -		}
> +		} else
> +			break;
>  	}
>  	return 0;
>  }
> @@ -1295,7 +1296,8 @@ static int onenand_fill_auto_oob(struct 
>  			int n = ed - st;
>  			memcpy(oob_buf + st, buf, n);
>  			buf += n;
> -		}
> +		} else
> +			break;
>  	}
>  	return 0;
>  }
> 
> It don't pass the oobtest since I assume oob passed at first, but oobtest don't
> do that.
> Basically I optimizeed it for JFFS2. 
> Do I revert it or do nothing? please give your opinion.


How about this: (NB I haven't tried it but maybe it works ;-)



--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -854,7 +854,8 @@ static int onenand_transfer_auto_oob(str
 			int n = ed - st;
 			memcpy(buf, oob_buf + st, n);
 			buf += n;
-		}
+		} else if (column == 0)
+			break;
 	}
 	return 0;
 }
@@ -1295,7 +1296,8 @@ static int onenand_fill_auto_oob(struct 
 			int n = ed - st;
 			memcpy(oob_buf + st, buf, n);
 			buf += n;
-		}
+		} else if (column == 0)
+			break;
 	}
 	return 0;
 }
