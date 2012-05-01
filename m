Received: from zose-mta15.web4all.fr ([176.31.217.11])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPE7D-00066k-J7
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 14:31:44 +0000
Message-ID: <4F9FF3C5.9090002@tribudubois.net>
Date: Tue, 01 May 2012 16:31:33 +0200
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive number
 in case of unrecoverable error
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke> <4F944165.4010400@tribudubois.net>
 <1335362381.5114.17.camel@koala> <4F99B9A0.10605@tribudubois.net>
 <1335714286.1942.14.camel@koala> <4F9EFBF5.6080908@tribudubois.net>
 <1335874554.2095.7.camel@koala>
In-Reply-To: <1335874554.2095.7.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/05/2012 14:15, Artem Bityutskiy wrote:
> On Mon, 2012-04-30 at 22:54 +0200, Jean-Christophe DUBOIS wrote:
>> On 29/04/2012 17:44, Artem Bityutskiy wrote:
>>> On Thu, 2012-04-26 at 23:09 +0200, Jean-Christophe DUBOIS wrote:
>>>> Is this convincing enough?
>>> Sure, thanks.
>>>
>>>> You might think that the attibute corruption I am showing here is very
>>>> artificial but I can assure you that it does happen in the wild when you
>>>> get a power cut on your equipment while the GC was moving an attribute
>>>> node for example.
>>> This issue is for sure worth fixing.
>> So, will you accept this patch?
> No, I meant that I agree that there is an issue, but I think that it
> should be solved for all node types the same way. So I suggest to look
> at what happens when data nodes are corrupted, how JFFS2 picks the older
> node (if it does) and do it similarly for xattrs.

I just want to restate that this patch is just re-enabling a feature 
that was (wrongly I think) disabled a bit more than a year ago.

I will have a look at the other way you suggested but this might mean in 
the end a lot more restructuring of the JFFS2 code (at least the xattr 
part). As you seem to be very cautious about JFFS2 code change this will 
certainly mean a slow merge process. In the mean time the broken JFFS2 
xattr behavior will still be present.

JC
