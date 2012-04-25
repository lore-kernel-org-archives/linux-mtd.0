Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN3py-0007I4-6r
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:08:58 +0000
Message-ID: <4F981385.70001@newsguy.com>
Date: Wed, 25 Apr 2012 08:08:53 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/7] mtd: nand: sanity checks of ecc strength in
 nand_scan_tail()
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-7-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE-LwD28wDS62pYCt-cmhVetm0-1OvvRXPZLH-vUfWcd7g@mail.gmail.com>
In-Reply-To: <CAN8TOE-LwD28wDS62pYCt-cmhVetm0-1OvvRXPZLH-vUfWcd7g@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/24/2012 09:09 PM, Brian Norris wrote:
> 
> I think you only need this last check (under ECC_HW_SYNDROME), since
> the ECC_HW and ECC_HW_OOB_FIRST cases necessarily fall through to
> ECC_HW_SYNDROME case. (Note the lack of 'break;' statements in the
> first two 'case's.)


Oops... you're right, I did miss that.  This should have been a much simpler
patch.  Thanks!

Mike
