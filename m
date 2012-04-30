Received: from zose-mta13.web4all.fr ([178.33.204.91])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SOxc2-0002VM-Us
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 20:54:27 +0000
Message-ID: <4F9EFBF5.6080908@tribudubois.net>
Date: Mon, 30 Apr 2012 22:54:13 +0200
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive number
 in case of unrecoverable error
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke> <4F944165.4010400@tribudubois.net>
 <1335362381.5114.17.camel@koala> <4F99B9A0.10605@tribudubois.net>
 <1335714286.1942.14.camel@koala>
In-Reply-To: <1335714286.1942.14.camel@koala>
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

On 29/04/2012 17:44, Artem Bityutskiy wrote:
> On Thu, 2012-04-26 at 23:09 +0200, Jean-Christophe DUBOIS wrote:
>> Is this convincing enough?
> Sure, thanks.
>
>> You might think that the attibute corruption I am showing here is very
>> artificial but I can assure you that it does happen in the wild when you
>> get a power cut on your equipment while the GC was moving an attribute
>> node for example.
> This issue is for sure worth fixing.
So, will you accept this patch?
> Just make sure xattr corruption is
> handled the same way as data node corruption is handled. I do not
> remember a lot of details anymore, but I wrote you the main idea in the
> previous e-mail.
I will look at the other patch to do the xattr integrity checking in the 
GC second phase scanning.

Regards

JC
>
