Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBCDn-0005QU-BI
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 00:54:07 +0000
Message-ID: <54B5BB9E.6040707@broadcom.com>
Date: Tue, 13 Jan 2015 16:43:10 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/3] mtd: implement common reboot notifier boilerplate
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
 <20150108015803.GR9759@ld-irv-0074>
In-Reply-To: <20150108015803.GR9759@ld-irv-0074>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Brian.  We only use NAND right now so don't have system to test 
NOR either.

Regards,
  Scott

On 15-01-07 05:58 PM, Brian Norris wrote:
> On Thu, Dec 04, 2014 at 06:36:06PM -0800, Brian Norris wrote:
>> cfi_cmdset_000{1,2}.c already implement their own reboot notifiers, and
>> we're going to add one for NAND. Let's put the boilerplate in one place.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> Pushed the first 2 (with a whitespace fixup) to l2-mtd.git. The third
> patch could use some testing, but I don't have an applicable system on
> me at the moment.
>
> Brian
>
