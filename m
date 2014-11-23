Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsSIZ-00043x-1H
 for linux-mtd@lists.infradead.org; Sun, 23 Nov 2014 08:13:35 +0000
Message-ID: <54719716.9010100@codeaurora.org>
Date: Sun, 23 Nov 2014 10:13:10 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>			
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>			
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>			
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>			
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>			
 <545630E1.8020505@codeaurora.org>			
 <1415261234.958.171.camel@sauron.fi.intel.com>			
 <545B66BA.4090904@codeaurora.org>		
 <1415350722.958.286.camel@sauron.fi.intel.com>		
 <54627350.9080509@codeaurora.org>	
 <1415793323.22887.233.camel@sauron.fi.intel.com>	
 <5464A062.7040202@codeaurora.org>
 <1415885788.22887.326.camel@sauron.fi.intel.com>
In-Reply-To: <1415885788.22887.326.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at, jlauruhn@micron.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem/Richard

On 11/13/2014 3:36 PM, Artem Bityutskiy wrote:

>
> I explained how I see it above in this e-mail. In short: read all data
> often enough ("enough" is defined by your product), and you are done.
> All "NAND effects" lead to bit-flips, you fix bit-flips faster than they
> become hard errors, and you are done.
>

We decided to drop this solution and stay with "force scrub" all PEBs 
from time to time, triggered from userspace.
Thank you all for your inputs and comments! It was very helpful in 
coming to this decision.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
