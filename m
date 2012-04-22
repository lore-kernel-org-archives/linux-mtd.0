Received: from zose-mta14.web4all.fr ([88.190.236.157])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SM0hK-0001Vp-9r
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 17:35:44 +0000
Message-ID: <4F944165.4010400@tribudubois.net>
Date: Sun, 22 Apr 2012 19:35:33 +0200
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive number
 in case of unrecoverable error
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke>
In-Reply-To: <1335100568.28267.12.camel@brekeke>
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

On 22/04/2012 15:16, Artem Bityutskiy wrote:
> On Wed, 2012-04-11 at 22:54 +0200, Jean-Christophe DUBOIS wrote:
>> As per load_xattr_datum() comment:
>> 	rc<  0 : recoverable error, try again
>> 	rc = 0 : success
>> 	rc>  0 : Unrecoverable error, this node should be deleted.
>>
>> For now we were only returning negative number (so recoverable error).
>> But a CRC failure or some inconsitent data seems fatal enough to
>> consider the attribute instance (version) as lost.
>>
>> So this patch returns a positive number (1) when it detects an
>> unrecoverable error.
>>
>> Signed-off-by: Jean-Christophe DUBOIS<jcd@tribudubois.net>
> Looks sensible. But since I did not take your previous patch, you might
> want to check whether this patch is really independent.
I believe it is. At the moment the load_xttrr_datum() (and such) 
functions never return an unrecoverable error. All error code are 
negative (and therefore recoverable) which mean JFFS will not try to fix 
errors that are permanent. This also means there is some code in JFFS2 
that is never executed (the one that try to recover from unrecoverable 
errors).

Please note that this patch is more or less a "partial reverse" of the 
following patch (http://patchwork.ozlabs.org/patch/71147/) which was 
accepted in 2010-12-03. I am not sure this accepted patch was correct at 
the time. Granted, returning (positive) EIO might not have been a good 
idea but turning them in negative values was not necessarily the good 
solution.
>   Also, please,
> tell  whether this fixes a real-life bug or you are fixing a complaint
> of a static analysis tools or something like this?
>   And please, tell how
> you tested it.
>
> Thanks!
>
