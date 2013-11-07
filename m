Received: from smtp.codeaurora.org ([198.145.11.231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeTvB-0006vk-SG
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 18:03:10 +0000
Message-ID: <527BD5C2.8050903@codeaurora.org>
Date: Thu, 07 Nov 2013 20:02:42 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [mtd] possible bug in nandsim
References: <527B7CD1.1020105@codeaurora.org>
 <CAFLxGvx=8vcDzUcA6vG_84X8snYkDLBkyboQZmDTUdDgi3xccQ@mail.gmail.com>
 <20131107145848.GA32004@localhost>
In-Reply-To: <20131107145848.GA32004@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: pratibha@codeaurora.org, Richard Weinberger <richard.weinberger@gmail.com>,
 dedekind@oktetlabs.ru, fastcat@gmail.com, dedekind@infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ezequiel,

On 11/7/2013 4:58 PM, Ezequiel Garcia wrote:
> AFAIK Richard is right, the feature is just a non-persistent cache.
>
> However a patch was submitted (and never reviewed) recently to
> apparently add persistent behavior:
>
>    http://patchwork.ozlabs.org/patch/277974/
>
> Tanya: Can you test or review the patch and provide a formal
> Tested/Reviewed-by? I'd be interested in seeing that move forward :)
>
> Thanks!
>

This is exactly the behavior I need for my testing purposes! Thank you. 
At the moment I have that with my (ugly) fix. I will try to validate 
your patch and help it get integrated.

-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
