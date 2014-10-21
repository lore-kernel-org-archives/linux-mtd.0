Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgVBk-0004Yd-Rn
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 08:53:09 +0000
Message-ID: <54461EDB.6020100@codeaurora.org>
Date: Tue, 21 Oct 2014 11:52:43 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V5] mtd: ubi: Extend UBI layer debug/messaging capabilities
References: <1413824221-31235-1-git-send-email-tlinder@codeaurora.org>
 <1413878186.7906.405.camel@sauron.fi.intel.com>
In-Reply-To: <1413878186.7906.405.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/21/2014 10:56 AM, Artem Bityutskiy wrote:
> On Mon, 2014-10-20 at 19:57 +0300, Tanya Brokhman wrote:
>> If there is more then one UBI device mounted, there is no way to
>> distinguish between messages from different UBI devices.
>> Add device number to all ubi layer message types.
>>
>> The R/O block driver messages were replaced by pr_* since
>> ubi_device structure is not used by it.
>>
>> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
>
> Pushed to linux-ubifs.git, thanks.
>
> You did not get indentations right, though, so I amended your patch.
> Also, some lines were split unnecessarily. My amendments are in the diff
> below. Please, take this into account for the similar UBIFS patch which
> you was going to send. Thank you!

Thanks Artem and sorry for the extra work for you. I was trying to find 
the balance between pleasing checkpatch and your request to have the 
message in the same line :)
Will be extra careful about the indentation next time (guess my editor 
needs re-configuration). Sorry about that.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
