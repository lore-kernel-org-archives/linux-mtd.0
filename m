Message-ID: <4D86F295.8040409@codeaurora.org>
Date: Mon, 21 Mar 2011 12:09:17 +0530
From: Murali Nalajala <mnalajal@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V2 1/2] mtd: nand: Allow NAND chip ids to be included
	standalone.
References: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
	<1299570622.2754.4.camel@localhost>
	<4D766A2F.9080001@codeaurora.org>
In-Reply-To: <4D766A2F.9080001@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, Dima Zavin <dima@android.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/8/2011 11:11 PM, Murali Nalajala wrote:
> On 3/8/2011 12:50 AM, Artem Bityutskiy wrote:
>> On Tue, 2011-03-08 at 05:38 +0530, Murali Nalajala wrote:
>>> Lets non-standard NAND drivers take advantage of known NAND
>>> chip information.
>>>
>>> The initial development of msm nand driver, driver uses the supported
>>> NAND devices information as a hardcoded table. Remove the existing
>>> hardcoded supported flash device table and read the flash device
>>> information from the flash id table which are part of the mtd subsystem.
>>
>> Why this initial version should be upstream? Why wouldn't you make it
>> "standard" first?
>>
>
> Currently we are not fully using the MTD nand subsystem. That's the
> intention author has introduced "non-standard" here!!!
>
> Thanks,
> Murali N
>

Any reviews comments on this change?

Thanks,
Murali N

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
