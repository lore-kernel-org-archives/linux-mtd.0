Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkvFZ-0000Tb-DY
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 13:31:23 +0000
Received: from [10.18.168.100] (unknown [185.23.60.4])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tlinder@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA41E13F655
 for <linux-mtd@lists.infradead.org>; Sun,  2 Nov 2014 13:30:59 +0000 (UTC)
Message-ID: <54563211.6070409@codeaurora.org>
Date: Sun, 02 Nov 2014 15:30:57 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
 <0D23F1ECC880A74392D56535BCADD7351C2D0438@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7351C2D0438@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/1/2014 12:55 AM, Jeff Lauruhn (jlauruhn) wrote:
> Hope I'm not over stepping here, but I thought I could help.  I'm a NAND AE.

Not at all. Thank you very much :)

>
> Are you using NAND or eMMC?

RAW NAND. eMMC is managed NAND so it handles this all for us :)

> If NAND why not use ECC to monitor for disturb?

We don't want just to monitor, we want to prevent cases where ecc cant 
be fixed. You said it yourself later on "BCH ECC will tell you if bits 
have changed and will correct up to 5". The goal is to prevent more then 
5 errors that can't be fixed.

NAND is a great storage unit, but you have to follow the rules.  Please 
refer to Micron datasheet MT29F2G08ABAEAH4 page 100.  NAND is made up of 
blocks(2048 in this case), each block has a number of pages.  The block 
is the smallest erasable unit and the only way to change 0's to 1's. 
Pages are the smallest programmable unit and can only change 1's to 0's. 
  P/E cycling (100,000 in this case) wears out the block.  We provide 
64bytes of spare area for BCH ECC and NAND management.  BCH ECC will 
tell you if bits have changed and will correct up to 5.
>
> Read disturb is a recoverable failure.  It doesn't affect the cells in the page you are reading it affects the cells on either side of the page you are reading.  P/E cycling for this device is 100,000.  You can program once and read many many times.
>
> Data retention is the loss of charge on the cells.  Technically you can only change a 0 to 1 by erasing the whole block.  However, data retention is the loss of charge in a cell over time. In this case data retention is 10 years.
> Data retention gets worse as temperature goes up.

Exactly! We're aware of all you described above. This is exactly why we 
need to handle both read disturb and data retention.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
