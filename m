Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwU9H-0003yh-3N
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 11:00:39 +0000
Message-ID: <54803EBF.9060609@codeaurora.org>
Date: Thu, 04 Dec 2014 13:00:15 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 02/35] UBI: Fix stale pointers in ubi->lookuptbl
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-3-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-3-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard

On 10/29/2014 2:45 PM, Richard Weinberger wrote:
> In some error paths the WL sub-system gives up on a PEB
> and frees it's ubi_wl_entry struct but does not set
> the entry in ubi->lookuptbl to NULL.
> Fastmap can stumble over such a stale pointer as it uses
> ubi->lookuptbl to find all PEBs.
>
> Fix this by setting the pointers to free'd ubi_wl_entry to NULL.

There are 2 more places:
tree_destroy() and protection_queue_destroy() where ubi_wl_entry is 
released. Both functions used on power down so all should be good as is, 
just wanted to make sure you didn't add ubi->lookuptbl[e2->pnum] = NULL 
there on purpose.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
