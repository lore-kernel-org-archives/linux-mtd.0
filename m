Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR9iB-0005m0-4S
 for linux-mtd@lists.infradead.org; Sat, 22 Mar 2014 00:22:59 +0000
Received: by mail-ig0-f174.google.com with SMTP id h18so2903725igc.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2014 17:22:02 -0700 (PDT)
Date: Fri, 21 Mar 2014 17:20:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: mtd: nand: fix GET/SET_FEATURES address on 16-bit devices
Message-ID: <20140322002007.GA29542@ld-irv-0074>
References: <1395439510-18860-1-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395439510-18860-1-git-send-email-davidm@egauge.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

(BTW, it's nice if $SUBJECT begins with the text '[PATCH]'. I actually
filter mail based on this!)

On Fri, Mar 21, 2014 at 04:05:10PM -0600, David Mosberger wrote:
> linux-next almost works out of the box for us except that GET_FEATURES
> and SET_FEATURES also need byte-addressing.

Thanks a lot for testing linux-next for this! Our recent fixes for x16
buswidths really haven't gotten wide testing.

> With the attached patch,
> our board boots fine (save for on-die ECC patch, which I'll submit
> separately).  The only oddity is that the devices is reported as being
> SLC, when it's most definitely not:
> 
> nand: 512MiB, SLC, page size: 2048, OOB size: 64

Hmm. What's the part number + vendor? (And the ID bytes, if possible?)

>    --david
> 
> 
> 
> GET_FEATURES and SET_FEATURES also need byte-addressing on 16-bit devices.
> 
> Signed-off-by: David Mosberger <davidm@egauge.net>
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 0747fef..29a23bb 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -925,7 +929,16 @@ static inline bool nand_is_slc(struct nand_chip *chip)
>   */
>  static inline int nand_opcode_8bits(unsigned int command)
>  {
> -	return command == NAND_CMD_READID || command == NAND_CMD_PARAM;
> +	switch (command) {
> +	case NAND_CMD_READID:
> +	case NAND_CMD_PARAM:
> +	case NAND_CMD_GET_FEATURES:
> +	case NAND_CMD_SET_FEATURES:
> +		return 1;
> +	default:
> +		break;
> +	}
> +	return 0;
>  }
>  
>  /* return the supported JEDEC features. */
> 

Patch looks good. I'll come back to this to test and apply for 3.15, I
hope (feel free to bug me if I don't reply back by 3.15-rc1). But:

Acked-by: Brian Norris <computersforpeace@gmail.com>

Brian
