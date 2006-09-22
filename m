Received: from roc.holo.8d.com ([64.254.227.115])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GQlqv-0005te-3A
	for linux-mtd@lists.infradead.org; Fri, 22 Sep 2006 15:18:05 +0100
Message-ID: <4513F01D.80608@8d.com>
Date: Fri, 22 Sep 2006 10:15:57 -0400
From: Raphael Assenat <raph@8d.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] cmx270-nand: Make CMDLINE_PARTS usable
References: <4507FE99.3030106@8d.com>
	<1158917790.24527.664.camel@pmac.infradead.org>
In-Reply-To: <1158917790.24527.664.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2006-09-13 at 08:50 -0400, Raphael Assenat wrote:
> 
>>This patch gives a name to the cmx270 nand mtd, making it possible to
>>use command line partitioning.
> 
> 
> Er, there _is_ no cmx270 nand board driver in my tree.
> 
Oh, sorry. My patch applies over the patch Mike Rapoport sent to the list on July 18
([PATCH] [MTD] CM-x270 NAND flash support), which I thought was already accepted. Was 
there anything wrong with it? Maybe you just missed it...

I also sent a patch to the list on July 21 which added NAND flash support for the cm-x255 
boards ([PATCH] Add support for NAND flash on cm-x255) but received no feedback. I can 
resend it if you wish.

(BTW, every time I send to the linux-mtd list my message is held for moderator approval 
for reason 'Message has a suspicious header'. Who should I contact for more information? 
I'd like to know exactly what header(s) is/are 'suspicious' and fix them if possible).

Best regards,

-- 
Raphael Assenat
8D Technologies Inc.
