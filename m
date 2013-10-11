Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUhV9-00032V-Lo
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 18:31:52 +0000
Message-ID: <525843F6.8050907@newsguy.com>
Date: Fri, 11 Oct 2013 11:31:18 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] [RESEND] mtd: docg4: fix status polling loop
References: <1381425927-1881-1-git-send-email-mikedunn@newsguy.com>
 <20131011181615.GK23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131011181615.GK23337@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/11/2013 11:16 AM, Brian Norris wrote:
> Hi Mike,
> 
> On Thu, Oct 10, 2013 at 10:25:27AM -0700, Mike Dunn wrote:
>> The loop that polls the status register waiting for an operation to complete
>> foolishly bases the timeout simply on the number of loop iterations that have
>> ocurred.  When I increased the processor clock speed, timeouts started to appear
>> for long block erasure operations.  This patch measures the timeout using
>> jiffies.
>>
>> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
>> ---
>>
>> This is a rework of an earlier patch, based on Artem's recommendation to use
>> jiffies, not udelay() (thanks Artem).  I didn't mark it 'v2' because the rework
>> makes the original name of the patch inaccurate, so now it has a different name.
>>
>> This was originally sent a couple months ago... was probably a bad time.
> 
> Wow, this identical patch was sent as far back as May 31 and is being
> submitted for the 3rd time now :( I hope there will be fewer "bad times"
> like this in the future.


Thanks much Brian.  No big deal.  There's only one other user of this driver
that I'm aware of :(

Thanks also for volunteering to shoulder some of the mtd maintenance duties.
Good job!

Mike
