Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQWQF-0002hw-3r
 for linux-mtd@lists.infradead.org; Wed, 25 Feb 2015 07:30:19 +0000
Message-ID: <54ED79F1.4080300@codeaurora.org>
Date: Wed, 25 Feb 2015 09:29:53 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: fastmap support in ubinize?
References: <alpine.DEB.2.02.1502190954020.17631@lnxricardw1.se.axis.com>
 <CAFLxGvz24i87Y-phXizLUebBkkJWdhTiw6m_8xmF5b5_tSP87A@mail.gmail.com>
In-Reply-To: <CAFLxGvz24i87Y-phXizLUebBkkJWdhTiw6m_8xmF5b5_tSP87A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/19/2015 4:05 PM, Richard Weinberger wrote:
> On Thu, Feb 19, 2015 at 9:57 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
>>
>> Was flashmap support ever added to ubinize ? I can't see any reference to
>> it in the code, unless it is implicit somehow.
>
> No.
>
> I hope Tanya is allowed to share her code soon such that I can review it.

in the middle of getting legal approval. hoping it will be resolved soon.

> Adding fastmap to ubinize is not trivial as you can run into problems
> when your flash has bad blocks.
> i.e, If fastmap refers to PEB XY but PEB XY is bad. Then the flasher
> would have to be a) UBI aware and b) had to fixup the fastmap on-fly.
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
