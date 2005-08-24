Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7spc-000076-30
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 06:50:18 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.120.114])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 24 Aug 2005 10:49:55 -0000
Message-ID: <430C50D3.5080808@gmail.com>
Date: Wed, 24 Aug 2005 12:49:55 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
References: <0ILP000HJ8JG7E@mmp1.samsung.com>
In-Reply-To: <0ILP000HJ8JG7E@mmp1.samsung.com>
Content-Type: multipart/mixed; boundary="------------060004020805030807080904"
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060004020805030807080904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

OK, sync read patch seems to work when applied directly to the kernel 
tree, e.g.
 > /usr/src/linux> patch -p1 < onenand-syncread_20050813.patch

BBM patch, e.g.
 > /usr/src/linux> patch -p1 < onenand-bbm_20050818.patch
runs through nearly successful. I get a rej in onenand_base.c, line 311 
(see attached file).
On line 315 you are looking for "return -EAGAIN;", but there's a "return 
-EIO;" -> patch fails.
I don't know what's wrong with line 319/320, the patch fails anyway... 
Same thing for line 326.


Is the following code valid (assuming patch has been run)?
 > ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);

 > if (ctrl & ONENAND_CTRL_ERROR) {
 > 	/* It maybe occur at initial bad block */
 > 	DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error = 0x%04x\n", 
ctrl);
 > 	/* Clear other interrupt bits for preventing ECC error */
 > 	interrupt &= ONENAND_INT_MASTER;
 > }

 > if (ctrl & ONENAND_CTRL_LOCK) {
 > 	DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error = 
0x%04x\n", ctrl);
 > 	return -EACCES;
 > }

 > if (interrupt & ONENAND_INT_READ) {
 > 	ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
 > 	if (ecc & ONENAND_ECC_2BIT_ALL) {
 > 		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error = 0x%04x\n", ecc);
 > 		return -EBADMSG;
 > 	}
 > }

1) interrupt &= ONENAND_INT_MASTER instead of return?
2) return -EACCES instead of return -EIO?

Bernhard

--------------060004020805030807080904
Content-Type: text/plain;
 name="onenand_base.c.rej"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="onenand_base.c.rej"

*************** static int onenand_wait(struct mtd_info 
*** 311,329 ****
  	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
  
  	if (ctrl & ONENAND_CTRL_ERROR) {
- 		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error = 0x%04x", ctrl);
- 		return -EAGAIN;
  	}
  
  	if (ctrl & ONENAND_CTRL_LOCK) {
- 		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error = 0x%04x", ctrl);
- 		return -EIO;
  	}
  
  	if (interrupt & ONENAND_INT_READ) {
  		ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
  		if (ecc & ONENAND_ECC_2BIT_ALL) {
- 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error = 0x%04x", ecc);
  			return -EBADMSG;
  		}
  	}
--- 311,331 ----
  	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
  
  	if (ctrl & ONENAND_CTRL_ERROR) {
+ 		/* It maybe occur at initial bad block */
+ 		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error = 0x%04x\n", ctrl);
+ 		/* Clear other interrupt bits for preventing ECC error */
+ 		interrupt &= ONENAND_INT_MASTER;
  	}
  
  	if (ctrl & ONENAND_CTRL_LOCK) {
+ 		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error = 0x%04x\n", ctrl);
+ 		return -EACCES;
  	}
  
  	if (interrupt & ONENAND_INT_READ) {
  		ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
  		if (ecc & ONENAND_ECC_2BIT_ALL) {
+ 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error = 0x%04x\n", ecc);
  			return -EBADMSG;
  		}
  	}

--------------060004020805030807080904--
